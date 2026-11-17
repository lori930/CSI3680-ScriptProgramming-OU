from PIL import Image 

test_img = Image.open('OU.jpg')
crop_img = test_img.crop((400, 70, 655, 950))
copy_img = test_img.copy()

width, height = test_img.size
step_w, step_h = crop_img.size 

for x in range(0, width, step_w):
    for y in range(0, height, step_h):
        print(x, y)
        copy_img.paste(crop_img, (x, y))

copy_img.save('tiled_OU.jpg') 