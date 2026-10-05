# This program says hello and asks for my name and age.
print("Hello!")
name = input("What is your name? ")
age = int(input("What is your age? ")) # convert input at the boundary

print(f"It's good to meet you, {name}!")
print(f"The length of your name is {len(name)}.")
print(f"You have {65 - age} years until retirement.")
