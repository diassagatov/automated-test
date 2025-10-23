*** Settings ***
Documentation    Test case for product purchase functionality
Library         SeleniumLibrary
Resource        ../resources/variables.robot
Resource        ../resources/keywords.robot

*** Test Cases ***
Product Purchase Test
    [Documentation]    Verify that a logged-in user can successfully purchase a product
    [Tags]    purchase    ecommerce    cart
    
    # Open the website
    Open Demo Blaze Website
    
    # Log in first
    Navigate To Log In
    Fill Log In Form    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify User Is Logged In
    
    # Navigate to product and add to cart
    Search For Product    ${PRODUCT_NAME}
    Add Product To Cart
    
    # Navigate to cart and verify product
    Navigate To Cart
    Verify Product In Cart    ${PRODUCT_NAME}
    
    # Place order
    Place Order
    Fill Order Form    Test User    Test Country    Test City    1234567890123456    12    2025
    Verify Order Success
    
    # Close browser
    Close All Browsers
