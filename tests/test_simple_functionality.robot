*** Settings ***
Documentation    Simple and reliable test suite for Demo Blaze website
Library         SeleniumLibrary
Resource        ../resources/variables.robot
Resource        ../resources/keywords.robot

*** Test Cases ***
Demo Blaze Homepage Test
    [Documentation]    Test basic homepage functionality
    [Tags]    homepage    basic
    
    # Open website
    Open Demo Blaze Website
    
    # Verify page title
    Title Should Be    www.demoblaze.com
    
    # Verify main navigation elements
    Element Should Be Visible    id:login2
    Element Should Be Visible    id:signin2
    Element Should Be Visible    id:cartur
    
    # Verify navigation links
    Element Should Be Visible    xpath://a[contains(text(), 'Home')]
    Element Should Be Visible    xpath://a[contains(text(), 'Contact')]
    Element Should Be Visible    xpath://a[contains(text(), 'About us')]
    
    # Verify product categories are present
    Element Should Be Visible    xpath://a[contains(text(), 'Phones')]
    Element Should Be Visible    xpath://a[contains(text(), 'Laptops')]
    Element Should Be Visible    xpath://a[contains(text(), 'Monitors')]
    
    Log    Homepage test completed successfully
    
    # Close browser
    Close All Browsers

Demo Blaze Product Display Test
    [Documentation]    Test product display functionality
    [Tags]    products    display
    
    # Open website
    Open Demo Blaze Website
    
    # Verify products are displayed on homepage
    Element Should Be Visible    xpath://h4[contains(text(), 'Samsung galaxy s6')]
    Element Should Be Visible    xpath://h4[contains(text(), 'Nokia lumia 1520')]
    Element Should Be Visible    xpath://h4[contains(text(), 'Nexus 6')]
    
    # Test clicking on a product
    Click Element    xpath://a[contains(@href, 'prod.html?idp_=1')]
    Sleep    3s
    
    # Verify product details page loads
    Element Should Be Visible    xpath://h2[contains(text(), 'Samsung galaxy s6')]
    Element Should Be Visible    xpath://a[contains(text(), 'Add to cart')]
    
    Log    Product display test completed successfully
    
    # Close browser
    Close All Browsers

Demo Blaze Modal Test
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
    
    # Close modal by clicking outside or close button
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
    
    Log    Modal test completed successfully
    
    # Close browser
    Close All Browsers
