*** Variables ***
${BASE_URL}              https://www.demoblaze.com
${BROWSER}               Chrome
${IMPLICIT_WAIT}         10
${PAGE_LOAD_TIMEOUT}     30

# Remote Execution (BrowserStack)
${USE_BROWSERSTACK}              True
${BROWSERSTACK_USERNAME}         diassagatov_LcB1nj
${BROWSERSTACK_ACCESS_KEY}       nuPZvU9EM9xuax4YpHyb
${BROWSERSTACK_OS}               Windows
${BROWSERSTACK_OS_VERSION}       11
${BROWSERSTACK_BROWSER}          Chrome
${BROWSERSTACK_BROWSER_VERSION}  latest
${BROWSERSTACK_PROJECT}          Demo Blaze RF
${BROWSERSTACK_BUILD}            Local development build
${BROWSERSTACK_SESSION}          Robot Framework run

# Test Data
${VALID_USERNAME}        testuser123
${VALID_PASSWORD}        testpass123
${NEW_USERNAME}          newuser456
${NEW_PASSWORD}          newpass456
${PRODUCT_NAME}          Samsung galaxy s6
${CART_PRODUCT}          Nokia lumia 1520
