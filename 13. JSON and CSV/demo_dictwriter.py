import requests
from bs4 import BeautifulSoup
import csv

url = "https://books.toscrape.com/"

response = requests.get(url, timeout=10)
response.raise_for_status()

soup = BeautifulSoup(response.text, "html.parser")

products = soup.select("article.product_pod")

books = list()

for product in products[:10]:
    title = product.select_one("h3 a").get("title")
    price = product.select_one(".price_color").get_text(strip=True)
    books.append({"title": title, "price": price})
    
with open("books.csv", "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(
        f,
        fieldnames=["title", "price"]
    )

    writer.writeheader()
    writer.writerows(books)