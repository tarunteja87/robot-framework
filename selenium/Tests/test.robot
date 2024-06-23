*** Settings ***
Documentation        This is to automate job Postings in Vthetechee.com
Library              SeleniumLibrary    timeout=0:00:10
Library    Browser

*** Variables ***



*** Test Cases ***
open chrome browser
    [Documentation]        this test opens the chrome browser
    [Tags]                 step1    open     browser
    #initilize selenium
    Set Selenium Speed     .2s
    Set Selenium Timeout   10s
    #opening chrome browser
    Log                    opening chrome browser
    SeleniumLibrary.Open Browser           https://vthetechee.com/ind-vthe/    edge
    #Set full screen
    Set Window Size    1920    1080
Login 
    [Documentation]        Login to vthetechee
    Input Text            id=user_login    teja
    Input Password        id=user_pass     Tarunteja87@@
    Click Button          id=wp-submit
    Wait Until Page Contains    Howdy 
   

Create new Post
    [Documentation]    Create New Postings
    Click Element          id=wp-admin-bar-new-content
    Sleep                  15s
Create Title
    [Documentation]    Create Title

Open New Window
    Execute Javascript     window.open("https://eliteskillup.com")
    Sleep                  15s

    ${quilbot}        SeleniumLibrary.Get Title
    Set Suite Variable    ${com}    ${quilbot}
    Log To Console    ${quilbot}
    Log To Console   ${com}
    Sleep                  15s

Switch Mainn window
    Switch Window     MAIN
    Sleep                  15s

switch window
    SeleniumLibrary.Press Keys    NONE    CONTROL+TAB 
    Log To Console   ${com}
    Sleep    15s
    SeleniumLibrary.Close Browser




*** Keywords ***