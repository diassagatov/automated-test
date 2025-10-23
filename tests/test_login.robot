*** Settings ***
Documentation    Test case for user login functionality
Library         SeleniumLibrary
Resource        ../resources/variables.robot
Resource        ../resources/keywords.robot

*** Test Cases ***
User Login Test
    [Documentation]    Verify that an existing user can successfully log in to Demo Blaze
    [Tags]    login    authentication
    
    # Open the website
    Open Demo Blaze Website
    
    # Navigate to log in
    Navigate To Log In
    
    # Fill log in form
    Fill Log In Form    ${VALID_USERNAME}    ${VALID_PASSWORD}
    
    # Verify user is logged in
    Verify User Is Logged In
    
    # Close browser
    Close All Browsers
