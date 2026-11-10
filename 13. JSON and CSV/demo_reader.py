import csv

with open("data.csv", newline="", encoding="utf-8") as f:
    reader = csv.reader(f)
    rows = list(reader)

print(rows[0])
print(rows[1][1])
print(type(rows[1][2]))