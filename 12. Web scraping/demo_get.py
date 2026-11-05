import requests

params = {"name": "John", "age": 30}

response = requests.get(
    "https://httpbin.org/get",
    params=params,
    timeout=10
)

response.raise_for_status()

print(response.url)
print(response.json()["args"])