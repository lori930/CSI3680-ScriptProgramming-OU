import requests

url = "https://lori930.github.io/example"
response = requests.get(url, timeout=10)
response.raise_for_status()

with open("page.html", "wb") as f:
    f.write(response.content)