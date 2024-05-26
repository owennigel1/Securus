# from django.shortcuts import render

# Create your views here.
# myapp/views.py

# calculator/views.py

from django.http import JsonResponse
import firebase_admin
from firebase_admin import credentials, firestore
from datetime import datetime
import yfinance as yf
import numpy as np
import pandas as pd
import cvxpy as cp


# Set up Firebase credentials and initialize the app
cred = credentials.Certificate("/Users/owennigel/desktop/serviceAccountKey.json") #NEED TO CHANGE THE CREDENTIAL
firebase_admin.initialize_app(cred)

db = firestore.client()



def calculate_retirement(request):
    if request.method == 'GET':
        try:
            # Retrieve data from Firestore
            doc = db.collection('user').document('john')

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
            
            
            #Robo-adviser algo
            # List of ETF tickers
            etfs = ['SPY', 'EFA', 'IEMG', 'AGG', 'LQD', 'GLD']

            # Download historical price data
            data = yf.download(etfs, start='2020-01-01', end='2023-01-01')['Adj Close']

            # Calculate daily returns
            returns = data.pct_change().dropna()

            # Calculate mean returns and covariance matrix
            mean_returns = returns.mean()
            cov_matrix = returns.cov()

            # Number of assets
            num_assets = len(etfs)

            # Define the optimization problem
            weights = cp.Variable(num_assets)
            expected_return = mean_returns.values @ weights
            risk = cp.quad_form(weights, cov_matrix.values)
            risk_aversion = 1  # Adjust this parameter to change the trade-off between risk and return

            # Objective function: maximize the Sharpe ratio
            objective = cp.Maximize(expected_return - risk_aversion * cp.norm(risk, 2))
            constraints = [cp.sum(weights) == 1, weights >= 0]

            # Solve the problem
            problem = cp.Problem(objective, constraints)
            problem.solve()

            # Get the optimal weights
            optimal_weights = weights.value

            # Create a DataFrame to display the results
            portfolio = pd.DataFrame({
                'ETF': etfs,
                'Weight': optimal_weights
            })

       
            user_data = doc.get().to_dict()
            
            #income
            income = user_data.get('assets',{}).get('income',5000)
            savings = user_data.get('assets',{}).get('savings',20000)
            
            #breakdown 4 dashboard items
            need = income*0.5
            wants = income*0.3
            savings = income*0.1
            investments = income*0.1
            
        
            #age and time related
            today = datetime.today()
            dob = datetime.strptime(user_data.get('DOB',"1000-01-01"),"%Y-%m-%d")
            retirement_age = user_data.get('expected_retirement_age', 0)
            current_age = today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))
            years_until_retirement = retirement_age - current_age
            years_in_retirement = 85-retirement_age
            
            #expenses
            expenses_before_adjustment = sum(user_data.get('expenses', {}).values())
            expenses_after_adjustment = expenses_before_adjustment*0.8*(1.03**years_until_retirement)
            monthly_investment = 0.1 * income
            initial_retirement_asset = fv(0.01,years_in_retirement,income*12,savings,0) + fv(0.07,years_in_retirement,monthly_investment*12,0,1)
            expenses_after_adjustment_yearly = expenses_after_adjustment*12
            balance=0
            
            # # Calculate the expected return of the optimized portfolio
            # optimized_return = np.dot(mean_returns.values, optimal_weights)
            # optimized_return
            
            count=0
            first = 1
            age_money_run_out = 0
            a = initial_retirement_asset
            b = expenses_after_adjustment_yearly
            for i in range(years_in_retirement):
                count+=1
                balance = a - b
                if balance<0 and first:
                    first = 0
                    age_money_run_out = current_age + count
                a = balance
                b *= 1.03
            
            if age_money_run_out==0:
                money_run_out_bool = 0
            else:
                money_run_out_bool = 1
                
            
                
            
                
            

            # Store the result back in Firestore
            doc_ref = db.collection('user').document('john')
            doc_ref.update({'current_age': current_age})
            doc_ref.update({'years_until_retirement': years_until_retirement})
            doc_ref.update({'years_in_retirement':years_in_retirement})
            doc_ref.update({'total_expenses': expenses_before_adjustment})
            doc_ref.update({'total_expenses_after_adjustment': expenses_after_adjustment})
            doc_ref.update({'initial_retirement_assets': initial_retirement_asset})
            doc_ref.update({'balance': balance})
            doc_ref.update({'need': need})
            doc_ref.update({'wants': wants})
            doc_ref.update({'savings': savings})
            doc_ref.update({'investmenst': investments})
            doc_ref.update({'money_run_out_bool': money_run_out_bool})
            doc_ref.update({'age_money_run_out': age_money_run_out})
            
            
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
                'balance': balance,
                'portfolio': portfolio.to_dict(orient='records'),
                'need': need,
                'wants': wants,
                'savings': savings,
                'investments': investments,
                'money_run_out_bool': money_run_out_bool,
                'age_money_run_out': age_money_run_out
            })
                
            return JsonResponse({'results': results}, status=200)
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=400)