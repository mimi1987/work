# Description: Script orders the three parts of the matchrule.
# Version: 0.1
# Author: MiMi

from pyperclip import copy

def order_matchrule(matchrule, *args):
    """General: Prints a string in order of *args.
        Works only for oneline matchrules.

        Parameters: *args takes three indexes in the order the result is wanted."""
    
    mr = matchrule.split("|")
    res = []
    try:
        if len(args) <= 3:
            for arg in args:
                res.append(mr[int(arg)])
    except:      
        print("Too much arguments only three indexes required (0, 1, 2).")
        matchrule = input("Enter the matchrule: ")
        args = input("Enter the three indexes without any spaces: ")
        order_matchrule(matchrule, *args)
    mr_result = "|".join(res)    
    print(mr_result)
    copy(mr_result)
    

while True:
    matchrule = input("Enter the matchrule: ")
    args = input("Enter the three indexes without any spaces: ")
    order_matchrule(matchrule, *args)

