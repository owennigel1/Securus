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
    def __init__(self, amount=0.0):
        self.amount = {"amount":amount}

    def set_amount(self, amount):
        if amount < 0:
            raise ValueError("Amount cannot be negative.")
        self.amount["amount"] = amount

    def get_amount(self):
        return self.amount

    def update_amount(self, amount):
        if amount < 0:
            raise ValueError("Amount cannot be negative.")
        self.amount["amount"] += amount

    def __str__(self):
        return f"Income: ${self.amount:.2f}"


    