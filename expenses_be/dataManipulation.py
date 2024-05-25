from firebase_func import *
from Classes import *

if __name__ == "__main__":
    expense_data = {
        "transport": 100.0,
        "food": 200.0,
        "entertainment": 150.0,
        "shopping": 250.0,
        "education": 300.0,
        "travel": 400.0,
        "services": 120.0,
        "personal care": 80.0,
        "bills": 500.0,
        "insurance": 60.0
    }

if __name__ == "__main__":
    income = Income()
    income.set_amount(15000.0)

    # Insert data into Firestore
    FirebaseInsert("income", "owen", income.get_amount())
    FirebaseInsert("expense", "owen", expense_data)

FirebaseRead("expense", "owen")
FirebaseRead("income", "owen")