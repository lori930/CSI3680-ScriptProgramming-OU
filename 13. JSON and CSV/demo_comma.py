import csv

row = 'Alice,"Rochester, Michigan"'

print(row.split(","))
print(next(csv.reader([row])))