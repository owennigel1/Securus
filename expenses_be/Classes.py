class Expense:
    def __init__(self):
        self.categories = {
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
        }

    def add_expense(self, category, amount):
        if category in self.categories:
            self.categories[category] += amount
        else:
            print(f"Category '{category}' not found.")

    def get_total_expense(self):
        return sum(self.categories.values())

    def get_category_expense(self, category):
        if category in self.categories:
            return self.categories[category]
        else:
            print(f"Category '{category}' not found.")
            return 0.0

    def get_expense_summary(self):
        return self.categories

    def __str__(self):
        summary = "\n".join([f"{category}: ${amount:.2f}" for category, amount in self.categories.items()])
        total = self.get_total_expense()
        return f"Expense Overview:\n{summary}\nTotal: ${total:.2f}"
    
class Income:
    singapore_tax_brackets = [
        (0, 20000, 0),
        (20001, 30000, 2),
        (30001, 40000, 3.5),
        (40001, 80000, 7),
        (80001, 120000, 11.5),
        (120001, 160000, 15),
        (160001, 200000, 18),
        (200001, 240000, 19),
        (240001, 280000, 19.5),
        (280001, 320000, 20),
        (320001, 500000, 23),
        (500001, 1000000, 24),
        (1000001, float('inf'), 24),
    ]

    def __init__(self, amount=0.0):
        self.amount = {"amount": amount}
        self.cpf_deduction = 0.0
        self.tax = 0.0
        self.calculate_final_income()

    def set_amount(self, amount):
        if amount < 0:
            raise ValueError("Amount cannot be negative.")
        self.amount["amount"] = amount
        self.calculate_final_income()

    def get_amount(self):
        return self.amount

    def update_amount(self, amount):
        if amount < 0:
            raise ValueError("Amount cannot be negative.")
        self.amount["amount"] += amount
        self.calculate_final_income()

    def calculate_final_income(self):
        gross_income = self.amount["amount"]
        self.cpf_deduction = gross_income * 0.20
        taxable_income = gross_income - self.cpf_deduction
        self.tax = self.calculate_tax(taxable_income)
        self.amount["amount"] = gross_income - self.cpf_deduction - self.tax

    def calculate_tax(self, income):
        tax = 0.0
        remaining_income = income
        
        for lower, upper, rate in self.singapore_tax_brackets:
            if remaining_income > upper:
                tax += (upper - lower + 1) * rate / 100
            else:
                tax += (remaining_income - lower + 1) * rate / 100
                break

        return tax

    def __str__(self):
        return (f"Income after CPF and Tax: ${self.amount['amount']:.2f}, "
                f"CPF Deduction: ${self.cpf_deduction:.2f}, "
                f"Tax: ${self.tax:.2f}")


    