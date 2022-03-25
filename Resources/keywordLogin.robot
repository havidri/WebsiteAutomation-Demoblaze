*** Settings ***
Documentation          A resource file with reusable keywords and variables.
Library                SeleniumLibrary

*** Variables ***
${btn_login}                   id:login2
${wait_pageLogin}              id:logInModalLabel
${input_username}              id:loginusername
${input_password}              id:loginpassword
${btn_logins}                  //*[@onclick='logIn()']
${verify_FailedLogin}          Please fill out Username and Password.
${verify_WrongPassword}        Wrong password.
${wait_successLogin}           id:nameofuser
${verify_successLogin}         Welcome admin


*** Keywords ***
Open Browser Chrome
    Open Browser                          browser=chrome
    Maximize Browser Window

Go to page demoblaze
    Go To                                  https://www.demoblaze.com/index.html
    Title Should Be                        STORE

Click button Log In
    Click Element                          ${btn_login}
    Wait Until Element Is Visible          ${wait_pageLogin}

Input username
    [Arguments]    ${username}
    Input Text                             ${input_username}    ${username}

Input passwords
    [Arguments]    ${password}
    Input Text                             ${input_password}    ${password}

Click buttons Log In
    Click Element                          ${btn_logins}

Verify failed Log In
    Alert Should Be Present                ${verify_FailedLogin}

Verify failed Log In wrong password
    Alert Should Be Present                ${verify_WrongPassword}

Verify user success Log In
    Wait Until Element Is Visible          ${wait_successLogin}
    Page Should Contain                    ${verify_successLogin}