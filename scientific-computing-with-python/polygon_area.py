class Rectangle:
    def __init__(self, width: int, height: int) -> None:
        self.width: int = width
        self.height: int = height

    def set_width(self, width: int):
        self.width = width

    def set_height(self, height: int):
        self.height = height

    def get_area(self):
        return self.width * self.height

    def get_perimeter(self):
        return 2 * self.width + 2 * self.height

    def get_diagonal(self) -> float:
        return (self.width**2 + self.height**2) ** 0.5

    def get_picture(self):
        if max(self.width, self.height) > 50:
            return "Too big for picture."

        out = ""
        for _ in range(self.height):
            out += ("*" * self.width) + "\n"
        return out

    def get_amount_inside(self, other):
        amount_horizontal = int(self.width / other.width)
        amount_vertical = int(self.height / other.height)
        return amount_horizontal * amount_vertical

    def __str__(self) -> str:
        return f"Rectangle(width={self.width}, height={self.height})"


class Square(Rectangle):
    def __init__(self, side: int) -> None:
        super().__init__(side, side)

    def set_side(self, side: int):
        self.width = side
        self.height = side

    set_width = set_side
    set_height = set_side

    def __str__(self) -> str:
        return f"Square(side={self.width})"

if __name__ == "__main__":
    rect = Rectangle(10, 5)
    print(rect.get_area())
    rect.set_height(3)
    print(rect.get_perimeter())
    print(rect)
    print(rect.get_picture())

    sq = Square(9)
    print(sq.get_area())
    sq.set_side(4)
    print(sq.get_diagonal())
    print(sq)
    print(sq.get_picture())

    rect.set_height(8)
    rect.set_width(16)
    print(rect.get_amount_inside(sq))
