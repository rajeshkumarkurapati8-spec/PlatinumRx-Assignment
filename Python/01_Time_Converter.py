# Script for minutes conversion

def convert_minutes(minutes):
    hrs = minutes // 60
    mins = minutes % 60

    if hrs == 0:
        return f"{mins} minutes"
    elif mins == 0:
        return f"{hrs} hr"
    else:
        return f"{hrs} hr {mins} minutes"


# Test
print(convert_minutes(130))  # 2 hr 10 minutes
print(convert_minutes(110))  # 1 hr 50 minutes