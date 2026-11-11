from pathlib import Path
from pypdf import PdfWriter

with PdfWriter() as writer:
    for pdf in sorted(Path("Articles").glob("*.pdf")):
        # print(type(pdf))
        writer.append(str(pdf))

    writer.write("merged.pdf")