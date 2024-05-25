# from django.shortcuts import render

# Create your views here.
# myapp/views.py

# calculator/views.py

from django.http import JsonResponse
import firebase_admin
from firebase_admin import credentials, firestore
import os

# Set up Firebase credentials and initialize the app
cred = credentials.Certificate("/Users/owennigel/desktop/serviceAccountKey.json") #NEED TO CHANGE THE CREDENTIAL
firebase_admin.initialize_app(cred)

db = firestore.client()

def add_employee(request):
    if request.method == 'POST':
        try:
            name = request.POST.get('name')
            position = request.POST.get('position')
            basic_salary = float(request.POST.get('basic_salary'))
            allowances = float(request.POST.get('allowances'))

            total_salary = basic_salary + allowances

            # Store employee data in Firestore
            doc_ref = db.collection('employees').document()
            doc_ref.set({
                'name': name,
                'position': position,
                'basic_salary': basic_salary,
                'allowances': allowances,
                'total_salary': total_salary
            })
            
            return JsonResponse({'message': 'Employee added successfully', 'total_salary': total_salary}, status=201)
        except (ValueError, TypeError):
            return JsonResponse({'error': 'Invalid input'}, status=400)

def get_employees(request):
    if request.method == 'GET':
        employees_ref = db.collection('employees')
        docs = employees_ref.stream()
        employees = [{'id': doc.id, 'data': doc.to_dict()} for doc in docs]
        return JsonResponse({'employees': employees}, status=200)