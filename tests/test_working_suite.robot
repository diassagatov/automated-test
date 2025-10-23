*** Settings ***
Documentation    Working test suite for Demo Blaze website automation
Library         SeleniumLibrary
Resource        ../resources/variables.robot
Resource        ../resources/keywords.robot

*** Test Cases ***
Demo Blaze Website Functionality Test
    [Documentation]    Comprehensive test of Demo Blaze website functionality
    [Tags]    working    comprehensive
    
    # Step 1: Open website and verify basic functionality
    Log    Step 1: Opening Demo Blaze website
    Open Demo Blaze Website
    
    # Verify page loads correctly
    Title Should Be    STORE
    Element Should Be Visible    id:login2
    Element Should Be Visible    id:signin2
    Element Should Be Visible    id:cartur
    
    # Step 2: Test navigation elements
    Log    Step 2: Testing navigation elements
    Element Should Be Visible    xpath://a[contains(text(), 'Home')]
    Element Should Be Visible    xpath://a[contains(text(), 'Contact')]
    Element Should Be Visible    xpath://a[contains(text(), 'About us')]
    
    # Step 3: Test product categories
    Log    Step 3: Testing product categories
    Element Should Be Visible    xpath://a[contains(text(), 'Phones')]
    Element Should Be Visible    xpath://a[contains(text(), 'Laptops')]
    Element Should Be Visible    xpath://a[contains(text(), 'Monitors')]
    
    # Step 4: Test sign up modal (without submitting)
    Log    Step 4: Testing sign up modal
    Click Element    id:signin2
    Wait Until Element Is Visible    id:sign-username
    Element Should Be Visible    id:sign-password
    Element Should Be Visible    xpath://button[contains(text(), 'Sign up')]
    
    # Close modal
    Click Element    xpath://button[@class='close']
    Sleep    1s
    
    # Step 5: Test login modal (without submitting)
    Log    Step 5: Testing login modal
    Click Element    id:login2
    Wait Until Element Is Visible    id:loginusername
    Element Should Be Visible    id:loginpassword
    Element Should Be Visible    xpath://button[contains(text(), 'Log in')]
    
    # Close modal
    Click Element    xpath://button[@class='close']
    Sleep    1s
    
    # Step 6: Test product navigation
    Log    Step 6: Testing product navigation
    Click Link    Samsung galaxy s6
    Wait Until Element Is Visible    xpath://h2[contains(text(), 'Samsung galaxy s6')]
    Element Should Be Visible    xpath://a[contains(text(), 'Add to cart')]
    
    # Go back to home
    Click Element    xpath://a[contains(text(), 'Home')]
    Sleep    2s
    
    # Step 7: Test cart navigation
    Log    Step 7: Testing cart navigation
    Click Element    id:cartur
    Wait Until Element Is Visible    xpath://h2[contains(text(), 'Products')]
    
    # Go back to home
    Click Element    xpath://a[contains(text(), 'Home')]
    Sleep    2s
    
    Log    All functionality tests completed successfully
    
    # Close browser
    Close All Browsers

Demo Blaze Product Browsing Test
    [Documentation]    Test product browsing functionality
    [Tags]    products    browsing
    
    # Open website
    Open Demo Blaze Website
    
    # Test Phones category
    Log    Testing Phones category
    Click Link    Phones
    Sleep    2s
    Element Should Be Visible    xpath://h2[contains(text(), 'Phones')]
    
    # Test specific phone product
    Click Link    Samsung galaxy s6
    Wait Until Element Is Visible    xpath://h2[contains(text(), 'Samsung galaxy s6')]
    Element Should Be Visible    xpath://a[contains(text(), 'Add to cart')]
    
    # Go back to categories
    Click Element    xpath://a[contains(text(), 'Home')]
    Sleep    2s
    
    # Test Laptops category
    Log    Testing Laptops category
    Click Link    Laptops
    Sleep    2s
    Element Should Be Visible    xpath://h2[contains(text(), 'Laptops')]
    
    # Test specific laptop product
    Click Link    Sony vaio i5
    Wait Until Element Is Visible    xpath://h2[contains(text(), 'Sony vaio i5')]
    Element Should Be Visible    xpath://a[contains(text(), 'Add to cart')]
    
    # Go back to categories
    Click Element    xpath://a[contains(text(), 'Home')]
    Sleep    2s
    
    # Test Monitors category
    Log    Testing Monitors category
    Click Link    Monitors
    Sleep    2s
    Element Should Be Visible    xpath://h2[contains(text(), 'Monitors')]
    
    Log    Product browsing test completed successfully
    
    # Close browser
    Close All Browsers
