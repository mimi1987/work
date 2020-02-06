# Description: Script orders the three parts of the matchrule.
# Version: 0.20
# Author: MiMi

from pyperclip import copy

def order_matchrule(matchrule, indices):
    """General: Prints a string in order of *args.
        Works only for oneline matchrules.
        Parameters: *args takes three indices in the order the result is wanted."""
    
    mr = matchrule.split("|")
    res = []
    try:
        if len(indices) == len(mr):
            for i in indices:
                res.append(mr[int(i)])
    except:      
        print("There must be as many indices as list elements!")
        
    mr_result = "|".join(res)    
    print(mr_result)
    copy(mr_result)
    

while True:
    matchrule = input("MATCHRULE: ")
    indices = tuple(input("INDICES (no spaces): "))
    order_matchrule(matchrule, indices)
