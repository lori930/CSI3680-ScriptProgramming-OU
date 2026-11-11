from docx import Document

doc = Document()

doc.add_heading("Training Summary", 0)

doc.add_paragraph(
    "This report was automatically generated using Python."
)

doc.add_heading("Performance Records", level=1)

table = doc.add_table(rows=1, cols=2)
table.rows[0].cells[0].text = "Barbell Lifts"
table.rows[0].cells[1].text = "Weight (lbs)"

records = [
    ("Squat", 230),
    ("Deadlift", 225),
    ("Bench Press", 130)
]

for exercise, weight in records:
    cells = table.add_row().cells
    cells[0].text = exercise
    cells[1].text = str(weight)
    
    
doc.add_heading("Results", level=1)

# Styles 
# paragraph = doc.add_paragraph("Important result: ")
# paragraph.add_run("Passed").bold = True

doc.save("training_report.docx")