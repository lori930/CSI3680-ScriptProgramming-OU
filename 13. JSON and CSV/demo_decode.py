import json

# Read JSON from a file
with open("data.json", encoding="utf-8") as f:
    data = json.load(f)

print(data["name"])
print(type(data))

# Parse JSON from a string
json_text = '{"name": "Capri", "isCat": true}'

obj = json.loads(json_text)

print(obj["isCat"])
print(type(obj))