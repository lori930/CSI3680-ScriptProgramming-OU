from selenium import webdriver
from selenium.webdriver.common.by import By
import time

# driver = webdriver.Chrome()
driver = webdriver.Firefox()

try:
    driver.get("https://www.selenium.dev/selenium/web/web-form.html")

    text_box = driver.find_element(By.NAME, "my-text")
    text_box.send_keys("CSI 3680")
    time.sleep(5)

    submit_button = driver.find_element(
        By.CSS_SELECTOR, "button"
    )
    submit_button.click()

    message = driver.find_element(By.ID, "message")
    print(message.text)
    time.sleep(5)
    

finally:
    driver.quit()