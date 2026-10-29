text = "  Aaron, Bo, Caro  "

print(text.strip())
print(text.split(","))
print(text.replace("Bo", "Devin"))

names = [name.strip() for name in text.split(",")]
print(names)
print(", ".join(names))