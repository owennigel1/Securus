# from django.shortcuts import render

# Create your views here.
# myapp/views.py

# calculator/views.py

from django.http import JsonResponse
import firebase_admin
from firebase_admin import credentials, firestore
import os
from Classes import *
from datetime import datetime


# Set up Firebase credentials and initialize the app
cred = credentials.Certificate("/Users/owennigel/desktop/serviceAccountKey.json") #NEED TO CHANGE THE CREDENTIAL
firebase_admin.initialize_app(cred)

db = firestore.client()



def calculate_retirement(request):
    if request.method == 'GET':
        try:
            # Retrieve data from Firestore
            users_ref = db.collection('users')
            docs = users_ref.stream()

            results = []
            
            def fv(rate, nper, pmt, pv=0, when=0):
                """
                Calculate the future value of an investment.

                :param rate: The interest rate per period.
                :param nper: The number of periods.
                :param pmt: The payment amount per period.
                :param pv: The present value (optional, default is 0).
                :param when: When payments are due (0 = end of period, 1 = beginning of period) (optional, default is 0).
                :return: The future value of the investment.
                """
                if when not in (0, 1):
                    raise ValueError("Parameter 'when' must be 0 (end of period) or 1 (beginning of period)")

                if rate == 0:
                    fv_value = pv + pmt * nper
                else:
                    fv_value = pv * (1 + rate)**nper + pmt * (1 + rate * when) * ((1 + rate)**nper - 1) / rate
                
                return fv_value

            for doc in docs:
                user_data = doc.to_dict()
                
                #income
                income = user_data.get('assets',{}).get('income',0)
                savings = user_data.get('assets',{}).get('savings',0)
                
         
                #age and time related
                today = datetime.today()
                dob = datetime.strptime(user_data.get('DOB',"1000-01-01"))
                retirement_age = user_data.get('expectedRetirementAge', 0)
                current_age = today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))
                years_until_retirement = retirement_age - current_age
                years_in_retirement = 85-retirement_age
                
                #expenses
                expenses_before_adjustment = sum(user_data.get('expenses', {}).values())
                expenses_after_adjustment = expenses_before_adjustment*0.8*(1.03^years_until_retirement)
                monthly_investment = 1500 ###Calculate this
                initial_retirement_asset = -fv(0.01,years_in_retirement,income*12,savings,0)-fv(0.07,years_in_retirement,monthly_investment*12,0,1)
                expenses_after_adjustment_yearly = expenses_after_adjustment*12
                
                for i in range(retirement_age-current_age):
                    balance = initial_retirement_asset - expenses_after_adjustment_yearly
                    initial_retirement_asset = balance
                    expenses_after_adjustment_yearly *= 1.03
                
                

                # Store the result back in Firestore
                doc_ref = db.collection('users').document(doc.id)
                doc_ref.update({'current_age': current_age})
                doc_ref.update({'years_until_retirement': years_until_retirement})
                doc_ref.update({'years_in_retirement':years_in_retirement})
                doc_ref.update({'total_expenses': expenses_before_adjustment})
                doc_ref.update({'total_expenses_after_adjustment': expenses_after_adjustment})
                doc_ref.update({'initial_retirement_assets': initial_retirement_asset})
                doc_ref.update({'balance': balance})
                
                results.append({
                    'id': doc.id,
                    'current_age': current_age,
                    'retirement_age': retirement_age,
                    'years_until_retirement': years_until_retirement,
                    'years_in_retirement': years_in_retirement,
                    'transport': user_data.get('expenses', {}).get('transport'),
                    'food': user_data.get('expenses', {}).get('food'),
                    'entertainment': user_data.get('expenses',{}).get('entertainment'),
                    'shopping': user_data.get('expenses', {}).get('shopping'),
                    'education': user_data.get('expenses', {}).get('education'),
                    'travel': user_data.get('expenses', {}).get('travel'),
                    'services': user_data.get('expenses', {}).get('services'),
                    'personal care': user_data.get('expenses', {}).get('personal care'),
                    'bills': user_data.get('expenses', {}).get('bills'),
                    'insurance': user_data.get('expenses', {}).get('insurance'),
                    'expenses before adjustment': expenses_before_adjustment,
                    'initial retirement expense': expenses_after_adjustment,
                    'initial retirement assets': initial_retirement_asset,
                    'balance': balance
                })
                

            return JsonResponse({'results': results}, status=200)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=400)
                