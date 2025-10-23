*** Settings ***
Documentation    Final working test suite for Demo Blaze website
Library         SeleniumLibrary
Resource        ../resources/variables.robot
Resource        ../resources/keywords.robot

*** Test Cases ***
Demo Blaze Website Basic Test
    [Documentation]    Test basic website functionality
    [Tags]    basic    homepage
    
    # Open website
    Open Demo Blaze Website
    
    # Verify page loads
    Title Should Be    STORE
    
    # Verify main elements are present
    Element Should Be Visible    id:login2
    Element Should Be Visible    id:signin2
    Element Should Be Visible    id:cartur
    
    # Verify navigation elements
    Element Should Be Visible    xpath://a[contains(text(), 'Home')]
    Element Should Be Visible    xpath://a[contains(text(), 'Contact')]
    Element Should Be Visible    xpath://a[contains(text(), 'About us')]
    
    # Verify product categories
    Element Should Be Visible    xpath://a[contains(text(), 'Phones')]
    Element Should Be Visible    xpath://a[contains(text(), 'Laptops')]
    Element Should Be Visible    xpath://a[contains(text(), 'Monitors')]
    
    Log    Basic website test completed successfully
    
    # Close browser
    Close All Browsers

Demo Blaze Modal Functionality Test
    [Documentation]    Test modal functionality
    [Tags]    modal    ui
    
    # Open website
    Open Demo Blaze Website
    
    # Test sign up modal
    Click Element    id:signin2
    Sleep    2s
    Element Should Be Visible    id:sign-username
    Element Should Be Visible    id:sign-password
    Element Should Be Visible    xpath://button[contains(text(), 'Sign up')]
    
    # Close modal
    Press Keys    None    ESC
    Sleep    1s
    
    # Test login modal
    Click Element    id:login2
    Sleep    2s
    Element Should Be Visible    id:loginusername
    Element Should Be Visible    id:loginpassword
    Element Should Be Visible    xpath://button[contains(text(), 'Log in')]
    
    # Close modal
    Press Keys    None    ESC
    Sleep    1s
    
    Log    Modal functionality test completed successfully
    
    # Close browser
    Close All Browsers

Demo Blaze Product Navigation Test
    [Documentation]    Test product navigation
    [Tags]    products    navigation
    
    # Open website
    Open Demo Blaze Website
    
    # Test clicking on a product link
    Click Element    xpath://a[contains(@href, 'prod.html?idp_=1')]
    Sleep    3s
    
    # Verify product page loads
    Element Should Be Visible    xpath://h2[contains(text(), 'Samsung galaxy s6')]
    Element Should Be Visible    xpath://a[contains(text(), 'Add to cart')]
    
    # Go back to home
    Click Element    xpath://a[contains(text(), 'Home')]
    Sleep    2s
    
    Log    Product navigation test completed successfully
    
    # Close browser
    Close All Browsers
