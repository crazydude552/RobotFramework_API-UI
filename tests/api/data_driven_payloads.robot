*** Settings ***
Resource    ../../steps/api_steps/data_driven_steps.resource

*** Test Cases ***
Scenario: Overwrite Base Data Fields Dynamically and Assert Modifications
    [Tags]    API    DataDriven    PayloadMutation
    When a customized payload is constructed and sent with values:
    ...    | company              | Global Tech Corp |
    ...    | metadata.environment | Production       |
    ...    | active               | false            |
    Then the payload execution response reflects our target values:
    ...    | company              | Global Tech Corp |
    ...    | metadata.environment | Production       |
    ...    | active               | false            |  