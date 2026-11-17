from PIL import Image

img = Image.open("OU.jpg")

print(img.size)
print(img.mode)
print(img.format)

img.convert("RGB").save("OU.png")