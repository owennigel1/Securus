# from django.shortcuts import render

# Create your views here.
# myapp/views.py

from django.http import JsonResponse
from google.cloud import datastore
import os

# Set up Firebase credentials and initialize the app
cred = credentials.Certificate("/Users/owennigel/desktop/serviceAccountKey.json") #NEED TO CHANGE THE CREDENTIAL
firebase_admin.initialize_app(cred)

# Initialize Datastore client
datastore_client = datastore.Client()

def calculate(request):
    if request.method == 'GET':
        try:
            num1 = float(request.GET.get('num1'))
            num2 = float(request.GET.get('num2'))
            operation = request.GET.get('operation')
            
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
            
            # Store calculation result in Datastore
            key = datastore_client.key('Calculation')
            entity = datastore.Entity(key=key)
            entity.update({
                'num1': num1,
                'num2': num2,
                'operation': operation,
                'result': result
            })
            datastore_client.put(entity)
            
            return JsonResponse({'result': result})
        except (ValueError, TypeError):
            return JsonResponse({'error': 'Invalid input'}, status=400)
