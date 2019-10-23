from pyperclip import copy

prompt = "Enter key ('q' to exit): "

socket_dic = {"s1": "Abmessungen (BxH): 76x81mm\nTiefe: 59mm",
              "s2": "Abmessungen (BxH): 76x163mm\nTiefe: 59mm",
              "w2": "Abmessungen (BxH): 154x81mm\nTiefe: 59mm",
              "w3": "Abmessungen (BxH): 231x81mm\nTiefe: 59mm",}

while True:
    key = input(prompt)
    if key.lower() == "q":
        break
    try:
        copy(socket_dic[key])
    except:
        print("Ivalid key try s1, s2, w2, w3")
