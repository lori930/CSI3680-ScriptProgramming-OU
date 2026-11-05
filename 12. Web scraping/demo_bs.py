import requests
from bs4 import BeautifulSoup

url = "https://lori930.github.io/example.html"

response = requests.get(url, timeout=10)
response.raise_for_status()

soup = BeautifulSoup(response.text, "html.parser")

print(soup.title)
print(soup.title.get_text())
print(type(soup.title))