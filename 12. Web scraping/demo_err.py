import requests

try:
    response = requests.get(
        "https://httpbin.org/status/404",
        timeout=10
    )
    response.raise_for_status()

except requests.exceptions.RequestException as err:
    print(f"Request failed: {err}")

else:
    print("Request successful!")