*** Settings ***
Documentation    Complete test suite for Demo Blaze website automation
Library         SeleniumLibrary
Resource        ../resources/variables.robot
Resource        ../resources/keywords.robot

*** Test Cases ***
Complete Demo Blaze Test Suite
    [Documentation]    Complete end-to-end test suite for Demo Blaze website
    [Tags]    complete    e2e
    
    # Test 1: User Sign Up
    Log    Starting User Sign Up Test
    Navigate To Sign Up
    Fill Sign Up Form    ${NEW_USERNAME}    ${NEW_PASSWORD}
    Alert Should Be Present    Sign up successful.
    
    # Test 2: User Login
    Log    Starting User Login Test
    Navigate To Log In
    Fill Log In Form    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify User Is Logged In
    
    # Test 3: Product Purchase
    Log    Starting Product Purchase Test
    Search For Product    ${PRODUCT_NAME}
    Add Product To Cart
    Navigate To Cart
    Verify Product In Cart    ${PRODUCT_NAME}
    Place Order
    Fill Order Form    Test User    Test Country    Test City    1234567890123456    12    2025
    Verify Order Success
    
    # Test 4: User Logout
    Log    Starting User Logout Test
    Log Out User
    Verify User Is Logged Out
    
    Log    All tests completed successfully
