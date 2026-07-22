*** Settings ***
Resource    ../../resources/api_clients/CustomerClient.resource
Library     Collections

*** Variables ***
${API_RESPONSE}    ${EMPTY}

*** Keywords ***
a new client payload is requested for "${customer_name}"
    ${response}=    Execute Customer Creation POST    ${customer_name}    ${token}
    Set Suite Variable    ${API_RESPONSE}    ${response}

the operational service confirms record creation
    Should Be Equal As Integers    ${API_RESPONSE.status_code}    200
    ${response_json}=    Set Variable    ${API_RESPONSE.json()}
    Should Be Equal As Strings    ${response_json['data']['name']}    Acme Corp

# --- New Step Definitions Handling YAML Test Data ---

the system queries for account details using configuration data
    # ${get_user_params} is automatically loaded as a dictionary from testData.yml
    ${response}=    Execute Get Customer Details    ${get_user_params}    ${token}
    Set Suite Variable    ${API_RESPONSE}    ${response}

the response payload matches the requested query parameters
    Should Be Equal As Integers    ${API_RESPONSE.status_code}    200
    ${response_json}=    Set Variable    ${API_RESPONSE.json()}

    # Postman Echo places query parameters inside the 'args' block
    Should Be Equal As Strings    ${response_json['args']['id']}    ${get_user_params['id']}
    Should Be Equal As Strings    ${response_json['args']['include_profile']}    ${get_user_params['include_profile']}

a bulk payload is transmitted containing complete enterprise data
    # ${large_payload} is a deeply nested dictionary loaded straight from testData.yml
    ${response}=    Execute Large Data Submission POST    ${large_payload}    ${token}
    Set Suite Variable    ${API_RESPONSE}    ${response}

the data repository verifies structural integrity of the complex data
    Should Be Equal As Integers    ${API_RESPONSE.status_code}    200
    ${response_json}=    Set Variable    ${API_RESPONSE.json()}

    # Validate deep properties within the nested JSON payload echo
    Should Be Equal As Strings    ${response_json['data']['metadata']['environment']}    Staging
    Should Be Equal As Integers    ${response_json['data']['departments'][0]['headcount']}    142

    # Validate list items
    List Should Contain Value     ${response_json['data']['tags']}    performance-tested