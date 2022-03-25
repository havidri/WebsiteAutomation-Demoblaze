*** Settings ***
Documentation          A resource file with reusable keywords and variables.
Library                SeleniumLibrary

*** Variables ***
${btn_signin}                id:signin2
${wait_singupPage}           id:signInModalLabel
${input_username}            id:sign-username
${input_password}            id:sign-password
${btn_singup}                //*[@onclick='register()']
${verify_failedSingup}       Please fill out Username and Password.
${verify_userExist}          This user already exist.
${verify_successSingup}      Sign up successful.

*** Keywords ***
Open Browser Chrome
    Open Browser                    browser=chrome
    Maximize Browser Window

Go to page demoblaze
    Go To                                  https://www.demoblaze.com/index.html
    Title Should Be                        STORE

Click button Sing Up
    Click Element                          ${btn_signin}
    Wait Until Element Is Visible          ${wait_singupPage}

Input username
    [Arguments]  ${input_usernames}
    Input Text                             ${input_username}      ${input_usernames}

Input passwords          
    [Arguments]        ${input_passwords}      
    Input Text                             ${input_password}     ${input_passwords}

Click buttons Sing Up
    Click Element                          ${btn_singup}

Verify failed singup
    Alert Should Be Present                ${verify_failedSingup}
    
Verify failed singup user already exist
    Alert Should Be Present                ${verify_userExist}

Verify success singup
    Alert Should Be Present                ${verify_successSingup}      
