def arithmetic_arranger(problems, show_answers=False):
    if len(problems) > 5:
        return 'Error: Too many problems.'
    lines = ["", "", "", ""] if show_answers else ["", "", ""]
    is_first_input = True
    for problem in problems:
        lhss, op, rhss = problem.split()
        if op not in "+-":
            return "Error: Operator must be '+' or '-'."
        try:
            lhs = int(lhss)
            rhs = int(rhss)
            max_len = max(len(lhss), len(rhss))
            result = lhs + rhs if op == "+" else lhs - rhs
            result = str(result)
        except ValueError:
            return 'Error: Numbers must only contain digits.'
        
        if max_len > 4:
            return 'Error: Numbers cannot be more than four digits.'

        if not is_first_input:
            for i in range(len(lines)):
                lines[i] += " " * 4

        is_first_input = False
        total_len = max_len + 2
        lines[0] += " " * (total_len - len(lhss)) + lhss
        lines[1] += op + " " * (total_len - len(rhss) - 1) + rhss
        lines[2] += "-" * total_len
        if show_answers:
            lines[3] += " " * (total_len - len(result)) + result 
        
    return "\n".join(lines)

print(f'\n{arithmetic_arranger(["32 + 698", "3801 - 2", "45 + 43", "123 + 49"])}')