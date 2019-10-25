# Description: Script orders the three parts of the matchrule.
# Version: 0.5
# Author: MiMi

from pyperclip import copy

def order_matchrule(matchrule, indices):
    """General: Prints a string in order of *args.
        Works only for oneline matchrules.
        Parameters: *args takes three indices in the order the result is wanted."""
    
    mr = matchrule.split("|")
    res = []
    print(indices)
    try:
        if len(indices) <= 3:
            for i in indices:
                res.append(mr[int(i)])
    except:      
        print("Too much arguments only three indices required (0, 1, 2).")
    mr_result = "|".join(res)    
    print(mr_result)
    copy(mr_result)
    

while True:
    matchrule = input("Enter the matchrule: ")
    indices = tuple(input("Enter the three indices without any spaces: "))
    print(indices)
    order_matchrule(matchrule, indices)
