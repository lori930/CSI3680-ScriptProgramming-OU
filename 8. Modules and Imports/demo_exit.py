import sys
while True:
    print("Type exit to exit.")
    response = input()
    if response == "exit":
        print("You successfully ended the infinite loop!")
        sys.exit()
        # break
print("After the loop")
    