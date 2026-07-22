*** Settings ***
Library    Browser

*** Variables ***
${TXT_USERNAME}    id=username
${TXT_PASSWORD}    id=password
${BTN_LOGIN}       css=button[type="submit"]
${LBL_FLASH}       id=flash

*** Keywords ***
Open Login Page
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    viewport={'width': 1280, 'height': 720}
    New Page       ${BASE_URL_UI}/login

Fill Login Credentials
    [Arguments]    ${username}    ${password}
    Type Text      ${TXT_USERNAME}    ${username}
    Type Secret    ${TXT_PASSWORD}    $password

Submit Credentials
    Click          ${BTN_LOGIN}

Verify Flash Message Contains
    [Arguments]    ${expected_text}
    Get Text       ${LBL_FLASH}    contains    ${expected_text}