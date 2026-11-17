from PIL import Image

img = Image.open("OU.jpg")

img.rotate(90).save('OU-r90.png')
img.rotate(6).save('OU-r6.png')
img.rotate(6, expand=True).save('OU-r6expand.png')
print(img.rotate(6, expand=True).size)
img.transpose(Image.Transpose.FLIP_LEFT_RIGHT).save('OU-horizontalflip.png')
img.transpose(Image.Transpose.FLIP_TOP_BOTTOM).save('OU-verticalflip.png')