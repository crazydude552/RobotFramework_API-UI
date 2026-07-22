*** Settings ***
Resource    ../../resources/api_clients/CustomerClient.resource
Resource    ../../resources/DataTransformer.resource
Library     Collections

*** Variables ***
${DATA_DRIVEN_RESPONSE}    ${EMPTY}

*** Keywords ***
a customized payload is constructed and sent with values:
    [Arguments]    @{fields_table}
    ${custom_payload}=    Modify Base Payload With Data Table    ${large_payload}    @{fields_table}
    ${response}=    Execute Large Data Submission POST    ${custom_payload}    ${token}
    Set Suite Variable    ${DATA_DRIVEN_RESPONSE}    ${response}

the payload execution response reflects our target values:
    [Arguments]    @{expected_table}
    Should Be Equal As Integers    ${DATA_DRIVEN_RESPONSE.status_code}    200
    ${response_json}=    Set Variable    ${DATA_DRIVEN_RESPONSE.json()}

    ${total_items}=    Get Length    ${expected_table}

    FOR    ${index}    IN RANGE    0    ${total_items}    2
        ${key}=      Set Variable    ${expected_table[${index}].strip()}

        ${next_index}=    Evaluate    ${index} + 1
        IF    ${next_index} >= ${total_items}    BREAK

        ${value}=    Set Variable    ${expected_table[${next_index}].strip()}

        IF    '${key}' == 'company'
            Should Be Equal As Strings    ${response_json['data']['company']}    ${value}
        ELSE IF    '${key}' == 'metadata.environment'
            Should Be Equal As Strings    ${response_json['data']['metadata']['environment']}    ${value}
        ELSE IF    '${key}' == 'active'
            ${expected_bool}=    Evaluate    False if "${value}".lower() == "false" else True
            IF    ${expected_bool}
                Should Be True    ${response_json['data']['active']}
            ELSE
                Should Be False    ${response_json['data']['active']}
            END
        END
    END