from selenium import webdriver
import time

driver = webdriver.Chrome()
# driver = webdriver.Firefox()

try:
    driver.get("https://www.selenium.dev/")
    print(driver.title)
    # time.sleep(3)
finally:
    driver.quit()