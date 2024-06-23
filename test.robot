*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Browser
    [Documentation]    Open the Browser
    Open Browser     http://google.com    chrome
    