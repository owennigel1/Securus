from firebase_func import *

def Margin(name):
    expectedIncomeSegments = {"needs":0.5, "wants":0.3, "savings":0.1, "investments":0.1}
    actualIncomeSegments = {"needs":0.0, "wants":0.0, "savings":0.0, "investments":0.0}
    Margin = {"needs":0.0, "wants":0.0, "savings":0.0, "investments":0.0}
    Status = {"needs":None, "wants":None, "savings":None, "investments":None}
    
    expense = FirebaseRead("expense", name)
    income = FirebaseRead("income", name)
    for key in expectedIncomeSegments:
        expectedIncomeSegments[key] *= income["amount"]

    needs_categories = ["insurance", "bills", "food", "transport", "personal care", "education"]
    wants_categories = ["services", "shopping", "travel", "entertainment"]

    actualIncomeSegments["needs"] = sum(expense[key] for key in needs_categories if key in expense)
    actualIncomeSegments["wants"] = sum(expense[key] for key in wants_categories if key in expense)
    actualIncomeSegments["savings"] = (income["amount"] - actualIncomeSegments["needs"] - actualIncomeSegments["wants"])/2
    actualIncomeSegments["investments"] = (income["amount"] - actualIncomeSegments["needs"] - actualIncomeSegments["wants"])/2

    for key in expectedIncomeSegments:
        Margin[key] = actualIncomeSegments[key] - expectedIncomeSegments[key]

    for key in Margin:
        if Margin[key]>0:
            if key in ("needs", "wants"):
                Status[key] = 0
            elif key in ("savings", "investments"):
                Status[key] = 1
        else:
            if key in ("needs", "wants"):
                Status[key] = 1
            elif key in ("savings", "investments"):
                Status[key] = 0

    print(Margin)
    print(Status)

    return Margin, Status

Margin("owen")
