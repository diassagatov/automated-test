*** Settings ***
Documentation    Complete test flow: Sign up -> Login -> Logout -> Purchase
Library         SeleniumLibrary
Resource        ../resources/variables.robot
Resource        ../resources/keywords.robot

*** Test Cases ***
Complete User Flow Test
    [Documentation]    Complete end-to-end test flow for Demo Blaze website
    [Tags]    complete    e2e    flow
    
    # Step 1: Open website
    Open Demo Blaze Website
    
    # Step 2: Sign up new user
    Log    Starting User Sign Up
    Navigate To Sign Up
    Fill Sign Up Form    ${NEW_USERNAME}    ${NEW_PASSWORD}
    Sleep    2s
    Alert Should Be Present    Sign up successful.
    Sleep    2s
    
    # Step 3: Login with new user
    Log    Starting User Login
    Navigate To Log In
    Fill Log In Form    ${NEW_USERNAME}    ${NEW_PASSWORD}
    Verify User Is Logged In
    
    # Step 4: Navigate to product and add to cart
    Log    Starting Product Purchase
    Search For Product    ${PRODUCT_NAME}
    Add Product To Cart
    
    # Step 5: Navigate to cart
    Navigate To Cart
    Verify Product In Cart    ${PRODUCT_NAME}
    
    # Step 6: Place order
    Place Order
    Fill Order Form    Test User    Test Country    Test City    1234567890123456    12    2025
    Verify Order Success
    
    # Step 7: Logout
    Log    Starting User Logout
    Log Out User
    Verify User Is Logged Out
    
    Log    Complete user flow test finished successfully
    
    # Close browser
    Close All Browsers
