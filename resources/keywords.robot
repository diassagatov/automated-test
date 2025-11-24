*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Library     Collections
Resource    variables.robot
# ... остальные импорты ...

*** Keywords ***
# ... существующие ключевые слова ...

# ==============================================================================
# НОВЫЕ КЛЮЧЕВЫЕ СЛОВА ДЛЯ ОБРАБОТКИ BROWSERSTACK И ОШИБОК
# ==============================================================================

Mark Test Status
    [Documentation]    Sends the test status (passed/failed) to BrowserStack.
    [Arguments]    ${status}    ${reason}
    # Используется BrowserStack Local Testing API через Execute Javascript
    ${command}=    Catenate
    ...    browserstack_executor: {"action": "setSessionStatus", "arguments": {"status": "${status}", "reason": "${reason}"}}
    Execute Javascript    ${command}

Handle Potential Alert
    [Documentation]    Tries to handle an alert without failing the test if none is present.
    # Используется для предотвращения UnexpectedAlertPresentException.
    # Обрабатывает алерт, если он есть, иначе игнорирует ошибку.
    Run Keyword And Ignore Error    Handle Alert    action=ACCEPT
    Run Keyword And Ignore Error    Alert Should Not Be Present

Close Browser And Report Status
    [Documentation]    Closes browser and reports test status to BrowserStack (if applicable).
    # Используется как Teardown для всех тестовых кейсов.
    ${use_browserstack}=    Should Use Browserstack
    
    # Отправка статуса в BrowserStack
    Run Keyword If     ${use_browserstack} and ${TEST_STATUS} == 'PASS'    Mark Test Status   passed   Test completed successfully.
    Run Keyword If     ${use_browserstack} and ${TEST_STATUS} == 'FAIL'    Mark Test Status   failed   Test failed: ${TEST_MESSAGE}

    # Завершение работы с браузером
    Close All Browsers

# ... остальные ключевые слова ...