*** Settings ***
Documentation    Job posting Automation

Library    SeleniumLibrary
Library    resource.py
Library    Browser


*** Variables ***

${para}     The Last Mile Analytics & Quality Team in Hyderabad is looking for a Transportation Quality Specialist who will act as the first level of support for address resolution, geocode correction maps edits, driver support and static route management in Last Mile along with other operational issues and activities related to Transportation process and optimization.

*** Test Cases ***


open tags generator
    [Documentation]        open tags website and create tags
    SeleniumLibrary.Open Browser        https://rapidtags.io/generator    chrome
    #Execute Javascript        window.open('https://rapidtags.io/generator','_blank')
    
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
open chrome Browser
    [Documentation]    Open Chrome Browser and open vthetechee login page
    SeleniumLibrary.Open Browser            https://vthetechee.com/ind-vthe    chrome
    SeleniumLibrary.Set Window Size        1920    1080

login
    [Documentation]    Login to vthetechee.com
    Input Text            id=user_login    Bhanu
    Input Password        id=user_pass     Tarunteja87@@
    Click Button          id=wp-submit
    Sleep    5s
    Wait Until Page Contains    Howdy 

Create a new post
    [Documentation]   Create a new post
    Click Element          id=wp-admin-bar-new-content

Add title
    [Documentation]    Add title to the post
    ${title}    resource.Get Title
    Input Text    class=wp-block-post-title    ${title}
    
Settings
    [Documentation]    dropdown tags save draft
    #click the menu Option
    ${button_state} =    Get Element Attribute    css=button[aria-label="Settings"]    aria-pressed
    ${element} =    Get WebElement     xpath=//button[@aria-label="Settings"]
    Run Keyword If    '${button_state}' == 'false'    Click Element    css=button[aria-label="settings"]
    #Click Element  ${element}
    Sleep    5s
    
    #select vidhey
    Select From List By Value    id=inspector-select-control-1    3

    #select categories 
    #need to implement cat
    #Input Text    id=components-form-token-input-0   text
    

    Click Element    id=components-form-token-input-0
    Press Key     //input[@id='components-form-token-input-0']     \\22
    


    #${handler}    Get Window Handles
    #Switch Window    ${handler[0]}
    Sleep    10s

    ###save draft
    Click Element    //button[@aria-label='Save draft']
    Sleep    2s
    ${check}    Get Element Attribute     css=button[aria-label="Saved"]       aria-disabled
    
    Should Be Equal    ${check}    true

    #edit with elementor
    Click Button    id=elementor-switch-mode-button
    Sleep    5s

    #click add template
    Select Frame    id=elementor-preview-iframe

    Click Element    css=div[title="Add Template"]

    Sleep    5sec

    Unselect Frame
Select Template   
    Click Element    xpath=//*[@id="elementor-template-library-header-menu"]/div[3]
Insert Template
    Sleep    10s
    Click Button    xpath=//*[@id="elementor-template-library-templates-container"]/div[1]/div[5]/button 
    #elementor-template-library-templates-container > div:nth-child(1) > div.elementor-template-library-template-controls.elementor-template-library-local-column-5 > button
    Execute Javascript     document.querySelector("#elementor-template-library-templates-container > div:nth-child(1) > div.elementor-template-library-template-controls.elementor-template-library-local-column-5 > button")

    Click Element    /html/body/div[10]/div/div[2]/div[1]/div/div[3]/div[1]/div[5]/button

    Sleep    30s
select role
    Click Element    /html/body/div/div/div/div[1]/main/article/div/div/div/div[1]/section/div[5]/div/div[2]/section[1]/div[5]/div[2]/div[2]/div[2]/div[2]/h2

Write post
    
    Input Text    xpath=//*[@id="elementor-control-default-c11349"]    testing
open Quil Bot
    [Documentation]            open quillbot parapher in new Tab
    Execute Javascript        window.open('https://quillbot.com/paraphrasing-tool')

    #paste some thing in parapraser
    Input Text    id=paraphraser-input-box      ${para}
    ${handler}    Get Window Handles
    Switch Window    ${handler[0]}


    Sleep    50s

