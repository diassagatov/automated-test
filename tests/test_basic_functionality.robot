*** Settings ***
Documentation    Basic functionality tests for Demo Blaze website
Library         SeleniumLibrary
Resource        ../resources/variables.robot
Resource        ../resources/keywords.robot

# ==============================================================================
# КОНФИГУРАЦИЯ ТЕСТОВ
# Открытие и закрытие браузера теперь управляются здесь (SETUP/TEARDOWN)
# ==============================================================================
Test Setup       Open Demo Blaze Website                 # Открывает браузер
Test Teardown    Close Browser And Report Status          # Закрывает и отправляет статус в BrowserStack

*** Test Cases ***
Website Loads Successfully
    [Documentation]    Verify that Demo Blaze website loads correctly
    [Tags]    basic    smoke
   
    # УДАЛЕНО: Open Demo Blaze Website (управляется Test Setup)
    
    # Verify page title (обновлено до 'STORE')
    Title Should Be    STORE
    
    # Verify main elements are present
    Element Should Be Visible    id:login2
    Element Should Be Visible    id:signin2
    Element Should Be Visible    id:cartur
    
    # УДАЛЕНО: Close All Browsers (управляется Test Teardown)

Navigation Elements Present
    [Documentation]    Verify that all navigation elements are present
    [Tags]    basic    navigation
    
    # УДАЛЕНО: Open Demo Blaze Website
    
    # Verify navigation elements
    Element Should Be Visible    xpath://a[contains(text(), 'Home')]
    Element Should Be Visible    xpath://a[contains(text(), 'Contact')]
    Element Should Be Visible    xpath://a[contains(text(), 'About us')]
    Element Should Be Visible    xpath://a[contains(text(), 'Cart')]
    
    # УДАЛЕНО: Close All Browsers

Product Categories Visible
    [Documentation]    Verify that product categories are visible
    [Tags]    basic    products
    
    # УДАЛЕНО: Open Demo Blaze Website
    
    # Verify product categories
    Element Should Be Visible    xpath://a[contains(text(), 'Phones')]
    Element Should Be Visible    xpath://a[contains(text(), 'Laptops')]
    Element Should Be Visible    xpath://a[contains(text(), 'Monitors')]
    
    # УДАЛЕНО: Close All Browsers