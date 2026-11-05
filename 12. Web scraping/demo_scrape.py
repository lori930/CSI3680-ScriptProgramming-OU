import requests
from bs4 import BeautifulSoup

url = "https://books.toscrape.com/"

response = requests.get(url, timeout=10)
response.raise_for_status()

soup = BeautifulSoup(response.text, "html.parser")

books = soup.select("article.product_pod")

for book in books[:5]:
    title = book.select_one("h3 a").get("title")
    price = book.select_one(".price_color").get_text(strip=True)

    print(title, price)