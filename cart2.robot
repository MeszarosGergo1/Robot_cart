*** Settings ***
Library    Selenium2Library

*** Test Cases *** 
Test cart
    Successful login
    Add items to cart
    Check the number of elements    3
    Sleep    3s
    Close Browser

*** Keywords ***
Successful login
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    locator=id=user-name    text=standard_user
    Input Password    locator=id=password    password=secret_sauce
    Click Button    //*[@id="login-button"]
    Sleep    3s

Add items to cart
    Click Button    //*[@id="add-to-cart-sauce-labs-backpack"]
    Click Button    //*[@id="add-to-cart-sauce-labs-bike-light"]
    Click Button    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Should Contain    class:shopping_cart_badge    3
    Click Element    //*[@id="shopping_cart_container"]

Check the number of elements
    [Arguments]    ${expected_counts}
    ${count_items}=    Get Element Count    class:cart_item
    Should Be Equal As Numbers    ${count_items}    ${expected_counts}