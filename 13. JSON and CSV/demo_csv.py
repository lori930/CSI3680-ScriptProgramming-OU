import csv

# Write CSV
with open("cats.csv", "w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerow(["name", "age"])
    writer.writerow(["Capri", 4])
    

# Read CSV
with open("cats.csv", newline="", encoding="utf-8") as f:
    reader = csv.reader(f)

    for row in reader:
        print(row)