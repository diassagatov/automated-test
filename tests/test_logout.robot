*** Settings ***
Documentation    Test case for user logout functionality
Library         SeleniumLibrary
Resource        ../resources/variables.robot
Resource        ../resources/keywords.robot

*** Test Cases ***
User Logout Test
    [Documentation]    Verify that a logged-in user can successfully log out from Demo Blaze
    [Tags]    logout    authentication
    
    # Open the website
    Open Demo Blaze Website
    
    # Log in first
    Navigate To Log In
    Fill Log In Form    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify User Is Logged In
    
    # Log out
    Log Out User
    
    # Verify user is logged out
    Verify User Is Logged Out
    
    # Close browser
    Close All Browsers
