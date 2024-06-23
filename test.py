from selenium import webdriver
import time

# Create a Chrome webdriver instance
driver = webdriver.Chrome()

# Navigate to a URL (e.g., Google)
driver.get("https://www.google.com")

# Find the search box element by its name attribute
search_box = driver.find_element("name", "q")

# Enter your search query (e.g., "eliteskillup")
search_box.send_keys("eliteskillup")

# Submit the search form
search_box.submit()

# Close the driver when done
time.sleep(5000)
driver.quit()


def Open_Chrome():
    from selenium import webdriver
    import time
    # Create a Chrome webdriver instance
    
    driver = webdriver.Chrome()
