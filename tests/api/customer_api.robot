*** Settings ***
Resource    ../../steps/api_steps/customer_api_steps.resource

*** Test Cases ***
Scenario: Create Active Customer Record Via API
    [Tags]    API    Regression
    When a new client payload is requested for "Acme Corp"
    Then the operational service confirms record creation

Scenario: Retrieve Account Metadata Details Via GET
    [Tags]    API    Regression
    When the system queries for account details using configuration data
    Then the response payload matches the requested query parameters

Scenario: Ingest Heavy Structural Record Sets Via Bulk POST
    [Tags]    API    DataIngestion
    When a bulk payload is transmitted containing complete enterprise data
    Then the data repository verifies structural integrity of the complex data

    