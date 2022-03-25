*** Settings ***
Documentation         Fungtionality test login
Resource              ../Resources/keywordLogin.robot
Suite Setup            Open Browser Chrome
Suite Teardown         Close Browser

*** Variables ***
&{username}    Empty=${empty}        validUser=admin    invalidUser=abctestuhuk21
&{passwd}      Empty=${empty}        validPass=admin    invalidPass=ahahahhaha1

*** Test Cases ***
Login with empty username and password
    [Tags]    Negative Test
    Go to page demoblaze
    Click button Log In
    Input username            ${username.Empty}
    Input passwords           ${passwd.Empty}
    Click buttons Log In
    Verify failed Log In

Login with wrong username and password
    [Tags]    Negative Test
    Go to page demoblaze
    Click button Log In
    Input username            ${username.invalidUser}
    Input passwords           ${passwd.Empty}
    Click buttons Log In
    Verify failed Log In

Login with valid username and wrong password
    [Tags]    Negative Test
    Go to page demoblaze
    Click button Log In
    Input username            ${username.validUser}
    Input passwords           ${passwd.invalidPass}
    Click buttons Log In
    Verify failed Log In wrong password

Login with valid username and valid password
    [Tags]    Positive Test
    Go to page demoblaze
    Click button Log In
    Input username            ${username.validUser}
    Input passwords           ${passwd.validPass}
    Click buttons Log In
    Verify user success Log In