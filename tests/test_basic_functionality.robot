*** Settings ***
Documentation    Basic functionality tests for Demo Blaze website
Library         SeleniumLibrary
Resource        ../resources/variables.robot
Resource        ../resources/keywords.robot

*** Test Cases ***
Website Loads Successfully
    [Documentation]    Verify that Demo Blaze website loads correctly
    [Tags]    basic    smoke
    
    # Open the website
    Open Demo Blaze Website
    
    # Verify page title
    Title Should Be    STORE
    
    # Verify main elements are present
    Element Should Be Visible    id:login2
    Element Should Be Visible    id:signin2
    Element Should Be Visible    id:cartur
    
    # Close browser
    Close All Browsers

Navigation Elements Present
    [Documentation]    Verify that all navigation elements are present
    [Tags]    basic    navigation
    
    # Open the website
    Open Demo Blaze Website
    
    # Verify navigation elements
    Element Should Be Visible    xpath://a[contains(text(), 'Home')]
    Element Should Be Visible    xpath://a[contains(text(), 'Contact')]
    Element Should Be Visible    xpath://a[contains(text(), 'About us')]
    Element Should Be Visible    xpath://a[contains(text(), 'Cart')]
    
    # Close browser
    Close All Browsers

Product Categories Visible
    [Documentation]    Verify that product categories are visible
    [Tags]    basic    products
    
    # Open the website
    Open Demo Blaze Website
    
    # Verify product categories
    Element Should Be Visible    xpath://a[contains(text(), 'Phones')]
    Element Should Be Visible    xpath://a[contains(text(), 'Laptops')]
    Element Should Be Visible    xpath://a[contains(text(), 'Monitors')]
    
    # Close browser
    Close All Browsers
