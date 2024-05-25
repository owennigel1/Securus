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

def add_calculation(request):
    if request.method == 'POST':
        try:
            num1 = float(request.POST.get('num1'))
            num2 = float(request.POST.get('num2'))
            operation = request.POST.get('operation')
            
            if operation == 'add':
                result = num1 + num2
            elif operation == 'subtract':
                result = num1 - num2
            elif operation == 'multiply':
                result = num1 * num2
            elif operation == 'divide':
                result = num1 / num2
            else:
                return JsonResponse({'error': 'Invalid operation'}, status=400)
            
            # Store calculation result in Firestore
            doc_ref = db.collection('calculations').document()
            doc_ref.set({
                'num1': num1,
                'num2': num2,
                'operation': operation,
                'result': result
            })
            
            return JsonResponse({'result': result})
        except (ValueError, TypeError):
            return JsonResponse({'error': 'Invalid input'}, status=400)

def get_calculations(request):
    if request.method == 'GET':
        calculations_ref = db.collection('calculations')
        docs = calculations_ref.stream()
        calculations = [{'id': doc.id, 'data': doc.to_dict()} for doc in docs]
        return JsonResponse({'calculations': calculations}, status=200)
