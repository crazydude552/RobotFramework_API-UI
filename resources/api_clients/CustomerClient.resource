*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Keywords ***
Execute Customer Creation POST
    [Arguments]    ${customer_name}    ${auth_token}
    ${headers}=    Create Dictionary    Authorization=Bearer ${auth_token}    Content-Type=application/json
    ${payload}=    Create Dictionary    name=${customer_name}    status=active    tier=enterprise
    ${response}=    POST    url=${BASE_URL_API}/post    headers=${headers}    json=${payload}    expected_status=any
    RETURN    ${response}

Execute Get Customer Details
    [Arguments]    ${query_params}    ${auth_token}
    ${headers}=    Create Dictionary    Authorization=Bearer ${auth_token}

    # Passing the params dictionary directly handles query string encoding (?id=USR-9982&include_profile=true)
    ${response}=    GET    url=${BASE_URL_API}/get    headers=${headers}    params=${query_params}    expected_status=any
    RETURN    ${response}

Execute Large Data Submission POST
    [Arguments]    ${large_json_data}    ${auth_token}
    ${headers}=    Create Dictionary    Authorization=Bearer ${auth_token}    Content-Type=application/json

    # We pass the entire nested dictionary structure directly into the json parameter
    ${response}=    POST    url=${BASE_URL_API}/post    headers=${headers}    json=${large_json_data}    expected_status=any
    RETURN    ${response}