import json

data = {"name": "Capri", "isCat": True, "miceCaught": 0, "felineIQ": None}
print(json.dumps(data))
print(json.dumps(data, indent=2)) 