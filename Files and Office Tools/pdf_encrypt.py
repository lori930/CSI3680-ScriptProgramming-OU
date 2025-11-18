from pypdf import PdfReader, PdfWriter
reader = PdfReader("DeepCompression.pdf")
writer = PdfWriter()

for page in reader.pages:
    writer.add_page(page)
    
writer.encrypt('csi3680', algorithm='AES-256')

with open("encrypted-DC.pdf", 'wb') as f:
    writer.write(f)