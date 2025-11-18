from pypdf import PdfWriter, PdfReader

stamp = PdfReader("watermark.pdf").pages[0]

writer = PdfWriter(clone_from="DeepCompression.pdf")

for page in writer.pages:
    page.merge_page(stamp, over=False)
    
writer.write("watermarker.pdf")
writer.close()