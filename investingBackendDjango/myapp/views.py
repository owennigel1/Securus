from django.shortcuts import render

# Create your views here.
# myapp/views.py

from django.shortcuts import render
from .models import MyModel

def index(request):
    items = MyModel.objects.all()
    return render(request, 'index.html', {'items': items})
