from firebase_func import *
from datetime import datetime

def calculate_age(DOB):
        dob = datetime.strptime(DOB, "%Y-%m-%d")
        today = datetime.today()
        age = today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))
        return age

def RoR(name):
    expense = FirebaseRead("expense", name)["expenses"]
    retirementTotalExpenses = 0.8 * sum(expense[key] for key in expense)

    userInfo = FirebaseRead("user", name)

    lifeExpectancy = 85
    expectedRetirementAge = userInfo["expectedRetirementAge"]
    currentAge = calculate_age(userInfo["DOB"])
    yearsToRetirement = expectedRetirementAge - currentAge
    yearsInRetirement = lifeExpectancy - expectedRetirementAge

    





