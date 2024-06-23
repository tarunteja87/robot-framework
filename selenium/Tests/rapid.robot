*** Settings ***
Documentation    Job posting Automation

Library    SeleniumLibrary
Library    resource.py

*** Test Cases ***

open tags generator
    [Documentation]        open tags website and create tags
    SeleniumLibrary.Open Browser        https://rapidtags.io/generator    chrome
    
    ${title_tag}        resource.Get Title
    #Input Text    xpath = //input[@id='searchInput']    ${title_tag}
    Wait Until Page Contains Element    xpath=//input[@id='searchInput']    timeout=30s
    Sleep    5s
    Click Element    //button[@id='agree']

    Input Text      xpath=//input[@id='searchInput']    ${title_tag}
    Sleep    3s
    Click Element    css=button > i.icon-search
    Sleep     5s
    
    Click Button    xpath=//button[@class='copy']
    #Click    "COPY TAGS"
    Execute JavaScript    document.querySelector('button.copy').click()
    #Execute JavaScript    document.querySelector('button.copy').click()
    Sleep    5s

    SeleniumLibrary.Close Browser