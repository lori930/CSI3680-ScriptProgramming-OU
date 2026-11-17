from PIL import Image

with Image.open("OU.jpg") as img:
    print("Original size:", img.size)

    # resize(): exact dimensions, returns a new image
    resized = img.resize((300, 300))
    resized.save("resized-OU.jpg")

    # thumbnail(): preserves aspect ratio, modifies in place
    thumbnail = img.copy()
    thumbnail.thumbnail((300, 300))
    thumbnail.save("thumbnail-OU.jpg")

    print("Resized:", resized.size)
    print("Thumbnail:", thumbnail.size)
