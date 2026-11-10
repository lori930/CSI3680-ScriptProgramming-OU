import requests

data = {"name": "Alice", "age": 30}

response = requests.post(
    "https://httpbin.org/post",
    json=data, # The json= parameter automatically serializes a compatible Python object and sets the JSON Content-Type.
    timeout=10
)
response.raise_for_status()

print(response.json()["json"])
