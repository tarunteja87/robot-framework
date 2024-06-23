import json
from selenium import webdriver
from selenium.webdriver.common.by import By





with open('D:\Robot framework\selenium\Tests\input.json') as file:
    data = json.load(file)
    Company_name = data.get('Company')
    Role = data.get('Role')
    Location = data.get('Location')
    Skills = data.get('skills')
    Qualification = data.get('Qualification')
    Salary = data.get('Salary')
   
def get_title():
    title = f"{Company_name} is hiring for {Role} | Apply now"
    return title


print(Company_name)
def Click_copy():
    driver = webdriver.Chrome()  # Replace with your browser driver
    button = driver.find_element(By.CLASS_NAME, "copy")
    driver.execute_script("arguments[0].click();", button)
