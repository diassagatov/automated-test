*** Settings ***
Documentation    Test case for user sign up functionality
Library         SeleniumLibrary
Resource        ../resources/variables.robot
Resource        ../resources/keywords.robot

*** Test Cases ***
User Sign Up Test
    [Documentation]    Verify that a new user can successfully register on Demo Blaze
    [Tags]    signup    registration
    
    # Open the website
    Open Demo Blaze Website
    
    # Navigate to sign up
    Navigate To Sign Up
    
    # Fill sign up form
    Fill Sign Up Form    ${NEW_USERNAME}    ${NEW_PASSWORD}
    
    # Handle alert and verify success
    Alert Should Be Present    Sign up successful.
    
    # Close browser
    Close All Browsers
