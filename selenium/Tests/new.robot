*** Settings ***
Documentation    Job posting Automation

Library    SeleniumLibrary
Library    resource.py
Library    Browser


*** Keywords ***

Click At Coordinates
    [Arguments]    ${x_coord}    ${y_coord}
    Execute JavaScript    window.scrollTo(${x_coord}, ${y_coord})

*** Variables ***


*** Test Cases ***


open chrome Browser
    [Documentation]    Open Chrome Browser and open vthetechee login page
    SeleniumLibrary.Open Browser            https://vthetechee.com/ind-vthe    chrome    pause_on_failure=False
    Maximize Browser Window
    ${screen resolution}    Get Window Size
    Log To Console    ${screen resolution}
    Log    ${screen resolution}

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

Save draft
    Click Element    //button[@aria-label='Save draft']
    Sleep    2s
    ${check}    Get Element Attribute     css=button[aria-label="Saved"]       aria-disabled
    
    Should Be Equal    ${check}    true
Edit with elementor
    #edit with elementor
    Click Button    id=elementor-switch-mode-button
    Sleep    15s
    
select html
    
    Click At Coordinates    79    360
    Click Element    xpath=//*[@id="elementor-panel-category-favorites"]/div/div/button
    Click Element At Coordinates    xpath=//*[@id="elementor-panel-category-favorites"]/div/div    79    360
    Sleep    10s

Select text area
    
    Press Key     class=ace_text-input    \\22
    #Press Key     //input[@id='components-form-token-input-0']     \\22
    Sleep    10s

Publish post
    Click Button    id=elementor-panel-saver-button-publish
    Sleep    10
    




