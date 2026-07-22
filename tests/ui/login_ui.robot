*** Settings ***
Resource          ../../steps/ui_steps/login_ui_steps.resource
Test Teardown     Close Browser    ALL

*** Test Cases ***
Scenario: Successful Platform Authentication Via UI
    [Tags]    UI    Smoke
    Given the user navigates to the portal
    When the user submits valid enterprise credentials
    Then the application dashboard should load successfully