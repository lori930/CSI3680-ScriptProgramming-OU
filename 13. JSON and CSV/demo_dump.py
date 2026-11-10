import json

# Python dictionary
data = {"name": "Capri", "isCat": True, "miceCaught": 0, "felineIQ": None}

# Write the dictionary to a file in JSON format
with open("cats.json", "w") as file:
    json.dump(data, file)