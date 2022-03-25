*** Settings ***
Documentation         Fungtionality test Orders Product
Library               FakerLibrary
Resource              ../Resources/keywordOrders.robot
Resource              ../Resources/loginPages.robot
Suite Setup            Open Browser Chrome
Suite Teardown         Close Browser

*** Test Cases ***
Order with user not login
    ${orderName}  FakerLibrary.First Name
    ${country}  FakerLibrary.Country
    ${city}  FakerLibrary.City
    ${creditCard}  FakerLibrary.Credit Card Number
    ${month}  FakerLibrary.Month_Name
    ${year}  FakerLibrary.Year
    Go to page demoblaze
    Click item product 1
    Click button Add to Cart
    Verify alert succes add product
    Click button Cart
    Verify Page Cart and total price
    Click button Place Order
    Input order name                ${orderName}
    Input country                   ${country}
    Input city                      ${city}
    Input credit card               ${creditCard}
    Input month                     ${month}
    Input year                      ${year}
    Click button purchace
    Verify success purchace
    
Order with user login
    ${orderName}  FakerLibrary.First Name
    ${country}  FakerLibrary.Country
    ${city}  FakerLibrary.City
    ${creditCard}  FakerLibrary.Credit Card Number
    ${month}  FakerLibrary.Month_Name
    ${year}  FakerLibrary.Year
    Go to page demoblaze
    Login with valid username and password
    Click item product 1
    Click button Add to Cart
    Verify alert succes add product
    Click button Cart
    Verify Page Cart and total price
    Click button Place Order
    Input order name                ${orderName}
    Input country                   ${country}
    Input city                      ${city}
    Input credit card               ${creditCard}
    Input month                     ${month}
    Input year                      ${year}
    Click button purchace
    Verify success purchace

Delete Product in Cart with user login
    Go to page demoblaze
    Login with valid username and password
    Click item product 1
    Click button Add to Cart
    Verify alert succes add product
    Click button Cart
    Verify Page Cart and total price
    Click delete item product

Delete Product in cart with user not login
    Go to page demoblaze
    Click item product 1
    Click button Add to Cart
    Verify alert succes add product
    Click button Cart
    Verify Page Cart and total price
    Click delete item product