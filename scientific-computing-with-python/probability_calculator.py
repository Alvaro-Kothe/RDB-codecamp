import copy
import random
from collections import Counter


class Hat:
    def __init__(self, **kwargs:int) -> None:
        self.contents: list[str] = [k for k, v in kwargs.items() for _ in range(v)]

    def draw(self, n: int):
        if n >= len(self.contents):
            contents = self.contents
            self.contents = []
            return contents
        indexes_to_remove = sorted(random.sample(range(len(self.contents)), k=n), reverse=True)
        return [self.contents.pop(i) for i in indexes_to_remove]


def experiment(hat: Hat, expected_balls: dict[str, int], num_balls_drawn: int, num_experiments: int):
    successes = 0
    for _ in range(num_experiments):
        hat_copy = copy.deepcopy(hat)
        drawn_counter = Counter(hat_copy.draw(num_balls_drawn))
        for color, amount in expected_balls.items():
            if drawn_counter[color] < amount:
                break
        else:
            successes += 1

    return successes / num_experiments


if __name__ == "__main__":
    hat = Hat(black=6, red=4, green=3)
    probability = experiment(hat=hat,
                            expected_balls={'red':2,'green':1},
                            num_balls_drawn=5,
                            num_experiments=2000)
    print(probability)
