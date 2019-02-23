import webbrowser, tkinter, sys

# My App
class APP:
    def __init__(self):
        pass


# My Classes
class SAVE_WEBSITES:
    # Attributs
    def __init__(self):
        self.websites_to_open = []

    #Methods

        # Safe Websites in websites.txt
    def save_websites(self, *websites):
        try:
           with open("websites.txt", mode="a") as f:
               for website in websites:
                   f.write(website + "\n")
        except:
            print(f"Unexpected Error: {sys.exec_info()[1]}")

        # Add Websites to self.websites_to_open list
    def add_ws_to_list(self):
        try:
            with open("websites.txt", mode="r") as f:
                self.websites_to_open = f.readlines()
                # print(self.websites_to_open)
        except:
            print(f"Unexpected Error: {sys.exec_info()[1]}")

        return self.websites_to_open
    
    def open_websites(self):
        for website in self.websites_to_open:
            # print(website)
            webbrowser.open(website, new=0)

# Main Program

def main():
    startwork = SAVE_WEBSITES()
    startwork.add_ws_to_list()
    startwork.open_websites()

if __name__ == "__main__": main()

        
