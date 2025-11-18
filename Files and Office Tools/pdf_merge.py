from pypdf import PdfWriter

merger = PdfWriter()
for pdf in ['DeepCompression.pdf', 'watermark.pdf', 'nsca_training_load_chart.pdf']:
    merger.append(pdf)
    
# merger.write('merged_pdf.pdf')
# merger.close()

with open("merged_pdf2.pdf", 'wb') as f:
    merger.write(f)