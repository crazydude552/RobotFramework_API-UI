*** Settings ***
Resource    ../../resources/page_objects/LoginPage.resource

*** Keywords ***
the user navigates to the portal
    Open Login Page

the user submits valid enterprise credentials
    # Target testing against a valid mock landing application form
    Fill Login Credentials    tomsmith    SuperSecretPassword!
    Submit Credentials

the application dashboard should load successfully
    Verify Flash Message Contains    You logged into a secure area! 