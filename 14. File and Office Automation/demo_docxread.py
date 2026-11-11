from docx import Document

doc = Document("demo.docx")

for paragraph in doc.paragraphs:
    print(f"paragraph text: {paragraph.text}")
    
for run in doc.paragraphs[1].runs:
    print(f"run text: {run.text}, bold: {run.bold}, italic: {run.italic}")