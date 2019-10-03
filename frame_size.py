from pyperclip import paste, copy

frame = {'1':'100x100mm',
         '2':'100x171mm',
         '3':'100x242mm',
         '4':'100x314mm',
         '5':'100x385mm'}


while True:
    key = input("Frame size ('exit' to quit): ")
    if key.lower() == "exit":
        break
    try:
        copy(frame[key])
    except KeyError:
        print("Wrong key use (1, 2, 3, 4, 5).")
        continue
