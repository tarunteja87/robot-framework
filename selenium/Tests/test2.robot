*** Settings ***
Library        SeleniumLibrary

*** Test Cases ***
Open chrome Browser
    [Documentation]    Open Browser
    Open Browser    https://vthetechee.com/ind-vthe    chrome
    Sleep    10s


Open quilbot
    [Documentation]    Open quilbot in new TAB
    Execute Javascript    window.open('https://quillbot.com/paraphrasing-tool')
    ${title}    Get Title
    Log To Console    ${title}     
    ${t}    Execute Javascript    document.title
    Log To Console   ${t}
    Sleep    10s

Switch Tab 
    ${handlers}    Get Window Handles
    Switch Window    ${handlers[0]}    
    Sleep    15s

Switch Tab2
    ${handler}    Get Window Handles
    Switch Window    ${handler[1]}
    Sleep    10s