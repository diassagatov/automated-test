*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Resource   variables.robot

*** Keywords ***
Open Demo Blaze Website
    [Documentation]    Opens the Demo Blaze website locally or on BrowserStack
    ${use_browserstack}=    Should Use Browserstack
    Run Keyword If    ${use_browserstack}    Open Browserstack Session
    ...    ELSE    Open Local Browser Session
    Maximize Browser Window
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}
    Set Selenium Timeout    ${PAGE_LOAD_TIMEOUT}

Open Local Browser Session
    [Documentation]    Opens a local browser session using Selenium
    Open Browser    ${BASE_URL}    ${BROWSER}    service_log_path=logs/chromedriver.log

Open Browserstack Session
    [Documentation]    Opens a remote BrowserStack session
    ${username}=    Get Env Or Default    BROWSERSTACK_USERNAME    ${BROWSERSTACK_USERNAME}
    ${access_key}=    Get Env Or Default    BROWSERSTACK_ACCESS_KEY    ${BROWSERSTACK_ACCESS_KEY}
    ${remote_url}=    Set Variable    https://${username}:${access_key}@hub-cloud.browserstack.com/wd/hub
    ${bstack_options}=    Create Dictionary    os=${BROWSERSTACK_OS}    osVersion=${BROWSERSTACK_OS_VERSION}    projectName=${BROWSERSTACK_PROJECT}
    ...    buildName=${BROWSERSTACK_BUILD}    sessionName=${BROWSERSTACK_SESSION}
    ${desired_caps}=    Create Dictionary    browserName=${BROWSERSTACK_BROWSER}    browserVersion=${BROWSERSTACK_BROWSER_VERSION}    bstack:options=${bstack_options}
    Open Browser    ${BASE_URL}    ${BROWSERSTACK_BROWSER}    remote_url=${remote_url}    desired_capabilities=${desired_caps}

Should Use Browserstack
    [Documentation]    Determines whether BrowserStack should be used for the run
    ${flag}=    Evaluate    str('${USE_BROWSERSTACK}').strip().lower() in ('true','1','yes')
    ${username}=    Get Env Or Default    BROWSERSTACK_USERNAME    ${BROWSERSTACK_USERNAME}
    ${access_key}=    Get Env Or Default    BROWSERSTACK_ACCESS_KEY    ${BROWSERSTACK_ACCESS_KEY}
    ${has_creds}=    Evaluate    bool('${username}'.strip()) and bool('${access_key}'.strip())
    ${use_browserstack}=    Evaluate    ${flag} and ${has_creds}
    [Return]    ${use_browserstack}

Get Env Or Default
    [Arguments]    ${name}    ${default}
    ${value}=    OperatingSystem.Get Environment Variable    ${name}    ${default}
    [Return]    ${value}

Close All Browsers
    [Documentation]    Closes all browser instances
    SeleniumLibrary.Close All Browsers

Navigate To Sign Up
    [Documentation]    Navigates to the sign up modal
    Click Element    id:signin2
    Wait Until Element Is Visible    id:sign-username

Navigate To Log In
    [Documentation]    Navigates to the log in modal
    Click Element    id:login2
    Wait Until Element Is Visible    id:loginusername

Fill Sign Up Form
    [Documentation]    Fills the sign up form with provided credentials
    [Arguments]    ${username}    ${password}
    Input Text    id:sign-username    ${username}
    Input Text    id:sign-password    ${password}
    Click Button    xpath://button[contains(text(), 'Sign up')]

Fill Log In Form
    [Documentation]    Fills the log in form with provided credentials
    [Arguments]    ${username}    ${password}
    Input Text    id:loginusername    ${username}
    Input Text    id:loginpassword    ${password}
    Click Button    xpath://button[contains(text(), 'Log in')]
    Sleep    2s

Verify User Is Logged In
    [Documentation]    Verifies that user is successfully logged in
    Wait Until Element Is Visible    id:nameofuser
    Element Should Contain    id:nameofuser    Welcome

Verify User Is Logged Out
    [Documentation]    Verifies that user is successfully logged out
    Wait Until Element Is Not Visible    id:nameofuser

Log Out User
    [Documentation]    Logs out the current user
    Click Element    id:logout2
    Wait Until Element Is Not Visible    id:nameofuser

Search For Product
    [Documentation]    Searches for a specific product
    [Arguments]    ${product_name}
    Click Link    ${product_name}
    Wait Until Element Is Visible    xpath://h2[contains(text(), '${product_name}')]

Add Product To Cart
    [Documentation]    Adds the current product to cart
    Click Button    xpath://a[contains(text(), 'Add to cart')]
    Alert Should Be Present    Product added

Navigate To Cart
    [Documentation]    Navigates to the shopping cart
    Click Element    id:cartur
    Wait Until Element Is Visible    xpath://h2[contains(text(), 'Products')]

Verify Product In Cart
    [Documentation]    Verifies that product is in the cart
    [Arguments]    ${product_name}
    Element Should Be Visible    xpath://td[contains(text(), '${product_name}')]

Place Order
    [Documentation]    Places an order for items in cart
    Click Button    xpath://button[contains(text(), 'Place Order')]
    Wait Until Element Is Visible    id:orderModal

Fill Order Form
    [Documentation]    Fills the order form with provided details
    [Arguments]    ${name}    ${country}    ${city}    ${card}    ${month}    ${year}
    Input Text    id:name    ${name}
    Input Text    id:country    ${country}
    Input Text    id:city    ${city}
    Input Text    id:card    ${card}
    Input Text    id:month    ${month}
    Input Text    id:year    ${year}
    Click Button    xpath://button[contains(text(), 'Purchase')]

Verify Order Success
    [Documentation]    Verifies that order was placed successfully
    Wait Until Element Is Visible    xpath://h2[contains(text(), 'Thank you for your purchase!')]
    Click Button    xpath://button[contains(text(), 'OK')]
