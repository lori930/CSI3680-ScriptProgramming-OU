import openpyxl

wb = openpyxl.load_workbook("workout.xlsx")

print(wb.sheetnames)

sheet = wb["1RM"]

print(sheet["A2"].value)
print(sheet.cell(row=2, column=1).value)

print(sheet.max_row)
print(sheet.max_column)