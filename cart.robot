#1. Shopping cart functionality
#    Add multiple products
#    Remove products from the shopping cart
#    Check the contents of the shopping cart


*** Settings ***
Library    Selenium2Library

*** Test Cases ***
Add multiple products
    Successful login
    Close Browser

*** Keywords ***
Successful login
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    locator=id=user-name    text=standard_user
    Input Password    locator=id=password    password=secret_sauce
    #Click Button    locator=id=login-button
    Click Button    //*[@id="login-button"]
    Page Should Contain Element    //*[@id="shopping_cart_container"] 
    Click Button    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Button    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Button    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Should Contain    class:shopping_cart_badge    3
    Click Element    //*[@id="shopping_cart_container"]
    ${count_items}=    Get Element Count    class:cart_item
    Should Be Equal As Numbers    ${count_items}    3
    Click Button    //*[@id="remove-sauce-labs-backpack"]
    Click Button    //*[@id="remove-sauce-labs-bolt-t-shirt"]
    ${count_items}=    Get Element Count    class:cart_item
    Should Be Equal As Numbers    ${count_items}    1
    Sleep    3s
    Close Browser
