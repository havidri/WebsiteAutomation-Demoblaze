*** Settings ***
Documentation             A resource file with reusable keywords and variables.
Library                   SeleniumLibrary

*** Variables ***
${waiatProductVisible}        id:tbodyid
${chooseProduct}              //*[contains(text(),'Samsung galaxy s6')]
${btn_addToCart}              //*[@onclick='addToCart(1)']
${cartPages}                  id:cartur
${waitVisibleProduct}         //*[contains(text(),'Products')]
${verifyCartVisible}          //*[contains(text(),'Samsung galaxy s6')]
${getTextPrice}               id:totalp
${btn_PlaceOrder}             //button[contains(text(),'Place Order')]
${waitVisiblePlaceOrder}      id:orderModalLabel
${btn_Purchase}               //*[@onclick='purchaseOrder()']
${wiatSuccessPurchase}        //*[contains(text(),'Thank you for your purchase!')]
${verifyPageContain}          Samsung galaxy s6
${verifyVisiblePrice}         //*[@class="price-container"]
${verifyInformationSuccess}   id:more-information
${verifyGetTextSuccess}       //*[@class='lead text-muted ']
${btn_ok}                     //button[contains(text(),'OK')]
${deleteItem}                 //*[contains(text(),'Delete')]

*** Keywords ***
Open Browser Chrome
    Open Browser                          browser=chrome
    Maximize Browser Window

Go to page demoblaze
    Go To                                  https://www.demoblaze.com/index.html
    Title Should Be                        STORE

Click item product 1
    Wait Until Element Is Visible           ${waiatProductVisible}
    Sleep                                   3
    Click Element                           ${chooseProduct}

Click button Add to Cart
    Wait Until Element Is Visible           ${btn_addToCart}
    Click Element                           ${btn_addToCart}

Click button Cart
    Click Element                            ${cartPages}
    Wait Until Element Is Visible            ${waitVisibleProduct}

Verify Page Cart and total price
    Wait Until Element Is Visible            ${verifyCartVisible}
    Element Should Be Visible                ${verifyCartVisible}
    Get Text                                 ${getTextPrice}

Click button Place Order
    Click Element                            ${btn_PlaceOrder}
    Wait Until Element Is Visible            ${waitVisiblePlaceOrder}

Input order name
    [Arguments]  ${order_name}
    Input Text                               id:name           ${order_name}

Input country
    [Arguments]  ${country}
    Input Text                               id:country        ${country}

Input city
    [Arguments]  ${city}
    Input Text                               id:city           ${city}

Input credit card
    [Arguments]  ${creditCard}
    Input Text                               id:card            ${creditCard}

Input month
    [Arguments]  ${month}
    Input Text                               id:month            ${month}

Input year
    [Arguments]  ${year}
    Input Text                               id:year              ${year}

Click button purchace
    Click Element                            ${btn_Purchase} 
    Wait Until Element Is Visible            ${wiatSuccessPurchase}

Verify Detail Product is shown
    Page Should Contain                      ${verifyPageContain}
    Element Should Be Visible                ${verifyVisiblePrice}
    Element Should Be Visible                ${verifyInformationSuccess}

Verify alert succes add product
    Handle Alert                              ACCEPT

Verify success purchace
    Get Text                                  ${verifyGetTextSuccess}

Click button OK
    Click Element                             ${btn_ok}

Click delete item product
    Click Element                            ${deleteItem}

Verify success delete item
    Element Should Not Be Visible            ${verifyCartVisible}