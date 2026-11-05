import requests
data = {'name': 'Alice', 'age': 25}

print(requests.get("https://httpbin.org/get", params = data).json())

print(requests.post("https://httpbin.org/post", data = data).json())

print(requests.post("https://httpbin.org/post", json = data).json())
