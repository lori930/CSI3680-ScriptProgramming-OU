import openpyxl

excel = openpyxl.load_workbook('example.xlsx')
print(type(excel))