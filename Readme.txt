pip install robotframework robotframework-requests robotframework-browser pyYaml
rfbrowser init
> robot --variablefile config/env_stage.py --variablefile config/testData.yml tests/*
==============================================================================
Api & Ui
==============================================================================
Api & Ui.Api
==============================================================================
Api & Ui.Api.Customer Api
==============================================================================
Scenario: Create Active Customer Record Via API                       | PASS |
------------------------------------------------------------------------------
Scenario: Retrieve Account Metadata Details Via GET                   | PASS |
------------------------------------------------------------------------------
Scenario: Ingest Heavy Structural Record Sets Via Bulk POST           | PASS |
------------------------------------------------------------------------------
Api & Ui.Api.Customer Api                                             | PASS |
3 tests, 3 passed, 0 failed
==============================================================================
Api & Ui.Api.Data Driven Payloads
==============================================================================
Scenario: Overwrite Base Data Fields Dynamically and Assert Modifi... | PASS |
------------------------------------------------------------------------------
Api & Ui.Api.Data Driven Payloads                                     | PASS |
1 test, 1 passed, 0 failed
==============================================================================
Api & Ui.Api                                                          | PASS |
4 tests, 4 passed, 0 failed
==============================================================================
Api & Ui.Ui
==============================================================================
Api & Ui.Ui.Login Ui
==============================================================================
Scenario: Successful Platform Authentication Via UI                   | PASS |
------------------------------------------------------------------------------
Api & Ui.Ui.Login Ui                                                  | PASS |
1 test, 1 passed, 0 failed
==============================================================================
Api & Ui.Ui                                                           | PASS |
1 test, 1 passed, 0 failed
==============================================================================
Api & Ui                                                              | PASS |
5 tests, 5 passed, 0 failed
==============================================================================
Output:  C:\Users\pvmrm\Documents\workspace\RobotFramework_Tutorial\RobotFramework_API-UI\output.xml
Log:     C:\Users\pvmrm\Documents\workspace\RobotFramework_Tutorial\RobotFramework_API-UI\log.html
Report:  C:\Users\pvmrm\Documents\workspace\RobotFramework_Tutorial\RobotFramework_API-UI\report.html