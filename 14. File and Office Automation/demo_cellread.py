import openpyxl

wb = openpyxl.load_workbook('workout.xlsx')
ws = wb['1RM']

for row in ws.iter_rows(min_row=2, values_only=True):
    print(row)
    
for cell in list(ws.columns)[1]:
    print(cell.value)
    
for cell in ws['A']:
    print(cell.value)