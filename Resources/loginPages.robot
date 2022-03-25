*** Settings ***
Documentation              A resource file with reusable keywords and variables.
Library                    SeleniumLibrary

*** Keywords ***
Login with valid username and password
    Click Element                          id:login2
    Wait Until Element Is Visible          id:logInModalLabel
    Input Text                             id:loginusername    admin
    Input Text                             id:loginpassword    admin
    Click Element                          //*[@onclick='logIn()']