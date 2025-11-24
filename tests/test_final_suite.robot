*** Settings ***
Documentation    Final working test suite for Demo Blaze website
Library         SeleniumLibrary
Resource        ../resources/variables.robot
Resource        ../resources/keywords.robot

# ==============================================================================
# КОНФИГУРАЦИЯ ТЕСТОВ
# Открытие и закрытие браузера теперь управляются здесь (SETUP/TEARDOWN)
# ==============================================================================
Test Setup       Open Demo Blaze Website                 # Открывает браузер перед КАЖДЫМ тестом
Test Teardown    Close Browser And Report Status          # Закрывает и отправляет статус в BrowserStack

*** Test Cases ***
Demo Blaze Modal Functionality Test
    [Documentation]    Test modal functionality
    [Tags]    modal    ui
    
    # УДАЛЕНО: Open Demo Blaze Website (управляется Test Setup)
    
    # Test sign up modal
    Click Element    id:signin2
    Sleep    2s
    Element Should Be Visible    id:sign-username
    Element Should Be Visible    id:sign-password
    Element Should Be Visible    xpath://button[contains(text(), 'Sign up')]
    
    # Close modal
    Press Keys    None    ESC
    Sleep    1s
    
    # Test login modal
    Click Element    id:login2
    Sleep    2s
    Element Should Be Visible    id:loginusername
    Element Should Be Visible    id:loginpassword
    Element Should Be Visible    xpath://button[contains(text(), 'Log in')]
    
    # Close modal
    Press Keys    None    ESC
    Sleep    1s
    
    Log    Modal functionality test completed successfully
    
    # УДАЛЕНО: Close All Browsers (управляется Test Teardown)