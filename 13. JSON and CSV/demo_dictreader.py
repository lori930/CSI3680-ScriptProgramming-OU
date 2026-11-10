import csv

with open("data.csv", newline="", encoding="utf-8") as f:
    reader = csv.DictReader(f)

    for row in reader:
        print(row["product_name"], row["price"])