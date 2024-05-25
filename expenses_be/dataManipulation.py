from firebase_func import *
from Classes import *

if __name__ == "__main__":
    user = user()
    user.set_user_info("1990-01-01", 65)
    user.set_income_amount(10000)
    user.add_expense("transport", 300.0)
    user.add_expense("food", 900.0)
    user.add_expense("entertainment", 1000.0)
    user.add_expense("shopping", 1250.0)
    user.add_expense("education", 500.0)
    user.add_expense("travel", 1200.0)
    user.add_expense("services", 120.0)
    user.add_expense("personal care", 300.0)
    user.add_expense("bills", 1200.0)
    user.add_expense("insurance", 60.0)
    user.set_savings_amount(400000)
    print(user)
    print("User Info:", user.get_user_info())
    print("Income Info:", user.get_income_amount())
    print("Total Expense:", user.get_total_expense())
    print("Expense Summary:", user.get_expense_summary())
    print(f"User Age: {user.calculate_age()} years")
    print("Savings:", user.get_savings_amount())


# Insert data into Firestore
FirebaseInsert("user", "john", user.get_user_info())