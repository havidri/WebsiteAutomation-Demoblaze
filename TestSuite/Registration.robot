*** Settings ***
Documentation         Fungtionality test registration
Library               String
Resource              ../Resources/keywordRegister.robot
Suite Setup            Open Browser Chrome
Suite Teardown         Close Browser

*** Variables ***
&{username}    Empty=${empty}        validUsername=admin
&{passwd}      Empty=${empty}        validPassword=admin

*** Test Cases ***
Registration empty username and password
    [Tags]    Negative Test
    Go to page demoblaze
    Click button Sing Up
    Input username            ${username.Empty} 
    Input passwords           ${passwd.Empty}
    Click buttons Sing Up
    Verify failed singup

Registration valid username and empty password
    [Tags]    Negative Test
    Go to page demoblaze
    Click button Sing Up
    Input username            ${username.validUsername}
    Input passwords           ${passwd.Empty}
    Click buttons Sing Up
    Verify failed singup

Registration username and password registered
    [Tags]    Negative Test
    Go to page demoblaze
    Click button Sing Up
    Input username            ${username.validUsername}
    Input passwords           ${passwd.validPassword}
    Click buttons Sing Up
    Verify failed singup user already exist

Registration valid username and password valid
    [Tags]    Positive Test
    ${user.Unregistered}  Generate Random String  6   [LETTERS]
    Go to page demoblaze
    Click button Sing Up
    Input username            ${user.unRegistered}
    Input passwords           ${passwd.validPassword}
    Click buttons Sing Up
    Verify success singup
    