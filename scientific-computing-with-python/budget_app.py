class Category:
    def __init__(self, category: str) -> None:
        self.category: str = category
        self.ledger: list[dict[str, float | str]] = []
        self.balance: float = 0

    def deposit(self, amount: float, description: str = ""):
        self.ledger.append({"amount": amount, "description": description})
        self.balance += amount

    def withdraw(self, amount: float, description: str = ""):
        if self.check_funds(amount):
            self.ledger.append({"amount": -amount, "description": description})
            self.balance -= amount
            return True

        return False

    def get_balance(self):
        return self.balance

    def transfer(self, amount: float, other: "Category"):
        if self.check_funds(amount):
            self.balance -= amount
            other.balance += amount
            self.ledger.append(
                {"amount": -amount, "description": f"Transfer to {other.category}"}
            )
            other.ledger.append(
                {"amount": amount, "description": f"Transfer from {self.category}"}
            )
            return True

        return False

    def check_funds(self, amount: float):
        return self.balance >= amount

    def __str__(self) -> str:
        out = self.category.center(30, "*")
        for transaction in self.ledger:
            description = transaction["description"][:23]

            out += f"\n{description:<23}{transaction['amount']:7.2f}"

        out += f"\nTotal: {self.balance:.2f}"
        return out



def create_spend_chart(categories: list[Category]):
    spent: list[float] = [
        -sum(min(0, trans["amount"]) for trans in cat.ledger)  # pyright: ignore[reportCallIssue, reportArgumentType]
        for cat in categories
    ]
    total_spent = sum(spent)
    spent_percentage = [int(100 * spent_amount / total_spent) for spent_amount in spent]
    categories_names = [cat.category.title() for cat in categories]
    out = "Percentage spent by category"

    for p in range(100, -10, -10):
        out += f"\n{p:>3}| "
        for perc_spent in spent_percentage:
            out += "o  " if perc_spent >= p else "   "

    out += "\n    " + "---" * len(categories) + "-"

    max_str_len = max(len(s) for s in categories_names)
    for i in range(max_str_len):
        out += "\n     "
        for s in categories_names:
            out += (s[i] if i < len(s) else " ") + "  "
    return out
