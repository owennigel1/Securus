# employees/urls.py

from django.urls import path
from .views import add_employee, get_employees

urlpatterns = [
    path('add/', add_employee, name='add_employee'),
    path('list/', get_employees, name='get_employees'),
]