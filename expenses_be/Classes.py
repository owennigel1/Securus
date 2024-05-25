from datetime import datetime

class user:
    singapore_tax_brackets_monthly = [
        (0, 1666.67, 0),             # 0 - 20000 / 12
        (1666.68, 2500, 2),          # 20001 - 30000 / 12
        (2500.01, 3333.33, 3.5),     # 30001 - 40000 / 12
        (3333.34, 6666.67, 7),       # 40001 - 80000 / 12
        (6666.68, 10000, 11.5),      # 80001 - 120000 / 12
        (10000.01, 13333.33, 15),    # 120001 - 160000 / 12
        (13333.34, 16666.67, 18),    # 160001 - 200000 / 12
        (16666.68, 20000, 19),       # 200001 - 240000 / 12
        (20000.01, 23333.33, 19.5),  # 240001 - 280000 / 12
        (23333.34, 26666.67, 20),    # 280001 - 320000 / 12
        (26666.68, 41666.67, 23),    # 320001 - 500000 / 12
        (41666.68, 83333.33, 24),    # 500001 - 1000000 / 12
        (83333.34, float('inf'), 24) # 1000001 - infinity / 12
    ]

    def __init__(self):
        self.user_info = {
            "DOB": "",
            "expected_retirement_age": 0,
            "expenses": {
                "transport": 0.0,
                "food": 0.0,
                "entertainment": 0.0,
                "shopping": 0.0,
                "education": 0.0,
                "travel": 0.0,
                "services": 0.0,
                "personal care": 0.0,
                "bills": 0.0,
                "insurance": 0.0
            },
            "assets": {
                "income": 0.0,
                "savings": 0.0
            },
            "cpf_deduction": 0.0,
            "tax": 0.0
        }
        self.calculate_final_income()

    def set_user_info(self, dob, expected_retirement_age):
        self.user_info["DOB"] = dob
        self.user_info["expected_retirement_age"] = expected_retirement_age

    def get_user_info(self):
        return self.user_info

    def add_expense(self, category, amount):
        if category in self.user_info["expenses"]:
            self.user_info["expenses"][category] += amount
        else:
            print(f"Category '{category}' not found.")

    def get_total_expense(self):
        return sum(self.user_info["expenses"].values())

    def get_category_expense(self, category):
        if category in self.user_info["expenses"]:
            return self.user_info["expenses"][category]
        else:
            print(f"Category '{category}' not found.")
            return 0.0

    def get_expense_summary(self):
        return self.user_info["expenses"]

    def set_income_amount(self, amount):
        if amount < 0:
            raise ValueError("Amount cannot be negative.")
        self.user_info["assets"]["income"] = amount
        self.calculate_final_income()

    def get_income_amount(self):
        return self.user_info["assets"]["income"]

    def update_income_amount(self, amount):
        if amount < 0:
            raise ValueError("Amount cannot be negative.")
        self.user_info["assets"]["income"] += amount
        self.calculate_final_income()

    def set_savings_amount(self, amount):
        if amount < 0:
            raise ValueError("Amount cannot be negative.")
        self.user_info["assets"]["savings"] = amount

    def get_savings_amount(self):
        return self.user_info["assets"]["savings"]

    def update_savings_amount(self, amount):
        if amount < 0:
            raise ValueError("Amount cannot be negative.")
        self.user_info["assets"]["savings"] += amount

    def calculate_final_income(self):
        gross_income = self.user_info["assets"]["income"]
        self.user_info["cpf_deduction"] = gross_income * 0.20
        taxable_income = gross_income - self.user_info["cpf_deduction"]
        self.user_info["tax"] = self.calculate_tax(taxable_income)
        self.user_info["assets"]["income"] = gross_income - self.user_info["cpf_deduction"] - self.user_info["tax"]

    def calculate_tax(self, income):
        tax = 0.0
        remaining_income = income
        
        for lower, upper, rate in self.singapore_tax_brackets_monthly:
            if remaining_income > upper:
                tax += (upper - lower + 1) * rate / 100
            else:
                tax += (remaining_income - lower + 1) * rate / 100
                break

        return tax

    def __str__(self):
        user_info = f"User(DOB: {self.user_info['DOB']}, Age: {self.calculate_age()}, Expected Retirement Age: {self.user_info['expected_retirement_age']})"
        income_info = f"Income after CPF and Tax: ${self.user_info['assets']['income']:.2f}, CPF Deduction: ${self.user_info['cpf_deduction']:.2f}, Tax: ${self.user_info['tax']:.2f}"
        savings_info = f"Savings: ${self.user_info['assets']['savings']:.2f}"
        expense_info = "\n".join([f"{category}: ${amount:.2f}" for category, amount in self.user_info['expenses'].items()])
        total_expense = self.get_total_expense()
        return f"{user_info}\n{income_info}\n{savings_info}\nExpense Overview:\n{expense_info}\nTotal: ${total_expense:.2f}"

# Example usage
if __name__ == "__main__":
    user = User()
    user.set_user_info("1990-01-01", 65)
    user.set_income_amount(100000)
    user.add_expense("food", 500)
    user.add_expense("transport", 300)
    user.set_savings_amount(5000)
    print(user)
    print("User Info:", user.get_user_info())
    print("Income Info:", user.get_income_amount())
    print("Total Expense:", user.get_total_expense())
    print("Expense Summary:", user.get_expense_summary())
    print(f"User Age: {user.calculate_age()} years")
    print("Savings:", user.get_savings_amount())
