from openpyxl import Workbook


wb = Workbook()
ws = wb.active

ws.title = "Personal Record"

# Write values to cells
ws.append(["Barbell Lift", "Weight (lbs)"])
ws.append(["Squat", 230])
ws.append(["Deadlift", 225])

ws['A4'] = "Bench Press"
ws['B4'] = 130


# Create and remove sheets
ws = wb.create_sheet("Program")
ws = wb.create_sheet(index=0, title="Cover")

del wb["Program"]

# Save the changes
wb.save("training_summary.xlsx")