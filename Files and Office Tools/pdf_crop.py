from pypdf import PdfReader, PdfWriter

reader = PdfReader("DeepCompression.pdf")
writer = PdfWriter()

writer.add_page(reader.pages[0])
writer.add_page(reader.pages[1]).rotate(90)
page_3 = reader.pages[2]
page_3.mediabox.upper_right = (page_3.mediabox.right / 2, page_3.mediabox.top / 2)
writer.add_page(page_3)

with open("DC_crop.pdf", 'wb') as f:
    writer.write(f)