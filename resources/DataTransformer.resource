*** Settings ***
Library     Collections

*** Keywords ***
Modify Base Payload With Data Table
    [Arguments]    ${base_dict}    @{data_table}
    ${mutated_payload}=    Copy Dictionary    ${base_dict}    deep=True

    # Get the total number of cell items passed in the table
    ${total_items}=    Get Length    ${data_table}

    # Loop through the list indices, stepping by 2 (Key, Value, Key, Value...)
    FOR    ${index}    IN RANGE    0    ${total_items}    2
        ${key}=      Set Variable    ${data_table[${index}].strip()}

        # Defensive check in case an odd number of arguments somehow slips through
        ${next_index}=    Evaluate    ${index} + 1
        IF    ${next_index} >= ${total_items}    BREAK

        ${value}=    Set Variable    ${data_table[${next_index}].strip()}

        # Apply updates based on keys
        IF    '${key}' == 'company'
            Set To Dictionary    ${mutated_payload}    company=${value}

        ELSE IF    '${key}' == 'metadata.environment'
            Set To Dictionary    ${mutated_payload['metadata']}    environment=${value}

        ELSE IF    '${key}' == 'active'
            ${boolean_val}=    Evaluate    False if "${value}".lower() == "false" else True
            Set To Dictionary    ${mutated_payload}    active=${boolean_val}
        END
    END

    RETURN    ${mutated_payload}