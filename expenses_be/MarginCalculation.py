from firebase_func import *

def Margin(name):
    expectedIncomeSegments = {"needs": 0.5, "wants": 0.3, "savings": 0.1, "investments": 0.1}
    actualIncomeSegments = {"needs": 0.0, "wants": 0.0, "savings": 0.0, "investments": 0.0}
    Margin = {"needs": 0.0, "wants": 0.0, "savings": 0.0, "investments": 0.0}
    Status = {"needs": None, "wants": None, "savings": None, "investments": None}
    
    expense = FirebaseRead("user", name)["expenses"]
    income = FirebaseRead("user", name)["assets"]["income"]
    
    for key in expectedIncomeSegments:
        expectedIncomeSegments[key] *= income

    needs_categories = ["insurance", "bills", "food", "transport", "personal care", "education"]
    wants_categories = ["services", "shopping", "travel", "entertainment"]

    actualIncomeSegments["needs"] = sum(expense[key] for key in needs_categories if key in expense)
    actualIncomeSegments["wants"] = sum(expense[key] for key in wants_categories if key in expense)
    remaining_income = income - actualIncomeSegments["needs"] - actualIncomeSegments["wants"]
    actualIncomeSegments["savings"] = remaining_income / 2
    actualIncomeSegments["investments"] = remaining_income / 2

    for key in expectedIncomeSegments:
        Margin[key] = actualIncomeSegments[key] - expectedIncomeSegments[key]

    for key in Margin:
        if Margin[key] > 0:
            if key in ("needs", "wants"):
                Status[key] = 0  # Overspending
            elif key in ("savings", "investments"):
                Status[key] = 1  # Exceeding saving/investment targets
        else:
            if key in ("needs", "wants"):
                Status[key] = 1  # Within Budget
            elif key in ("savings", "investments"):
                Status[key] = 0  # Not meeting saving/investment targets

    category_percentages = {category: (expense[category] / income) * 100 if income != 0 else 0 for category in expense}
    sorted_categories = sorted(category_percentages.items(), key=lambda x: x[1], reverse=True)

    recommendations = [{"category": category, "percentage": percentage} for category, percentage in sorted_categories]

    print(Margin)
    print(Status)
    print(recommendations)

    return Margin, Status, recommendations


Margin("john")