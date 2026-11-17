from PIL import Image

img = Image.open("OU.jpg")

# crop 
cropped_img = img.crop((400, 70, 655, 950))
# cropped_img.save("cropped-OU.jpg")

# copy and paste
copy_img = img.copy()
copy_img.paste(cropped_img, (0, 100))
copy_img.paste(cropped_img, (1700,500))
copy_img.save("pasted-OU.jpg")