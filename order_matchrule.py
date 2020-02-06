# Description: Script orders the three parts of the matchrule.
# Version: 0.11
# Author: MiMi

from pyperclip import copy

def order_matchrule(matchrule, indices):
  """General: Orders a matchrule in given order of indices.
     Arguments: Matchrule is a string which gets split up into a list
     by a |.
     Indices is a number which represents the index of the array."""
    
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
