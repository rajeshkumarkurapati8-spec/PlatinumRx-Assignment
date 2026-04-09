# Script for string manipulation

def remove_duplicates(s):
    result = ""

    for ch in s:
        if ch not in result:
            result += ch

    return result


# Test
print(remove_duplicates("programming"))  # progamin
print(remove_duplicates("aabbcc"))      # abc