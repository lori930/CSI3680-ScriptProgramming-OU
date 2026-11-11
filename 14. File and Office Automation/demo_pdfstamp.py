from pypdf import PdfWriter, PdfReader

stamp = PdfReader('watermark.pdf').pages[0]
writer = PdfWriter(clone_from='Articles/2026-ICLR-Hilbert.pdf')
for page in writer.pages:
    page.merge_page(stamp, over=True) # false for watermark

writer.write("stamp.pdf")
writer.close()