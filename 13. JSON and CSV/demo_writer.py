import csv

rows = [
    ["name", "age"],
    ["Alice", 25],
    ["Bob", 30]
]

with open("roster.csv", "w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerows(rows)
    