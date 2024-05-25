# calculator/urls.py

from django.urls import path
from .views import add_calculation, get_calculations

urlpatterns = [
    path('add/', add_calculation, name='add_calculation'),
    path('list/', get_calculations, name='get_calculations'),
]
