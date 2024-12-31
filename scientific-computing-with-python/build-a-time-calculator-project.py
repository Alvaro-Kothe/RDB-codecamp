WEEKDAYS = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
def add_time(start, duration, weekday=None):
    time, ampm = start.split()
    hour, minutes = map(int, time.split(":"))
    durh, durm = map(int, duration.split(":"))
    if ampm == "PM" and hour < 12:
        hour += 12
    elif ampm == "AM" and hour == 12:
        hour = 0
    
    newm = minutes + durm
    newh = hour
    if newm >= 60:
        newm -= 60
        newh += 1
    
    elapsed_days, newh = divmod(newh + durh, 24)

    if newh > 12:
        newampm = "PM"
        newh -= 12
    elif newh == 12:
        newampm = "PM"
    elif newh == 0:
        newampm = "AM"
        newh = 12
    else:
        newampm = "AM"
    
    new_time = f"{newh}:{newm:02} {newampm}"

    if weekday is not None:
        weekday = weekday.title()
        wk = WEEKDAYS.index(weekday)
        new_weekday = WEEKDAYS[(wk + elapsed_days) % 7]
        new_time += ", " + new_weekday

    if elapsed_days > 1:
        new_time += " (%d days later)" % elapsed_days
    elif elapsed_days == 1:
        new_time += " (next day)"

    return new_time

print(add_time('3:00 PM', '3:10'))
print(add_time('6:30 PM', '205:12'))
print(add_time('11:43 PM', '24:20', 'tueSday'))
print(add_time('11:55 AM', '3:12'))