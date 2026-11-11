from pypdf import PdfReader

reader = PdfReader("Articles/2026-ICLR-Hilbert.pdf")

print(f"Pages: {len(reader.pages)}")

text = reader.pages[0].extract_text()
print(text[:500])


# Extract images from PDFs
# page_2 = reader.pages[1]

# for i, image_file in enumerate(page_2.images):
#     with open(f"{i}_{image_file.name}", "wb") as fp:
#         fp.write(image_file.data)