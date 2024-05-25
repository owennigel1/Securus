# employees/urls.py

from django.urls import path
from .views import calculate_retirement

urlpatterns = [
    path('calculate_retirement/', calculate_retirement, name='calculate_retirement')
]

