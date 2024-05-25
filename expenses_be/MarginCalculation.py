from firebase_func import *

def Margin(name):
    incomeSegments = {needs:0.5, wants:0.3, savings:0.1, investments:0.1}
    
    expenses = FirebaseRead("expenses", name)
    income = FirebaseRead("income", name)
    for key in incomeSegments:
        incomeSegments[key] *= income

    needs_categories = ["insurance", "bills", "food", "transport", "personal care", "education"]
    wants_categories = ["services", "shopping", "travel", "entertainment"]

    needs = sum(expenses[key] for key in needs_categories if key in expenses)
    wants = sum(expenses[key] for key in wants_categories if key in expenses)
    savings = (income - needs - wants)/2
    investments = (income - needs - wants)/2

    


