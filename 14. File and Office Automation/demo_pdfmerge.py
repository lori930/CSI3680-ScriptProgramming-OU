from pypdf import PdfWriter

with PdfWriter() as writer:

    for pdf in [
        "Articles/2026-CHASE-KDJudge.pdf",
        "Articles/2026-CHASE-MTMed3D.pdf",
        "Articles/2026-ICLR-Hilbert.pdf",
        "Articles/2026-IJCNN-Neighbor.pdf",
        "Articles/2026-MOST-LightAD.pdf"
    ]:
        writer.append(pdf)

    writer.write("merged_pdf.pdf")
