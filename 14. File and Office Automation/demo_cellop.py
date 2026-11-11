import openpyxl
from openpyxl.styles import Font

excel = openpyxl.load_workbook('workout.xlsx')
ws = excel['1RM']

# Cell formatting
ws["A1"].font = Font(bold=True)

ws = excel['BS Program']
ws['C2'] = '=PRODUCT(A2:B2)'
ws['B9'] = '=PRODUCT(B8, 0.9)'
excel.save('workout_copy.xlsx')