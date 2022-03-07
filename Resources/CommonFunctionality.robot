*** Settings ***
Documentation  Common Functions Used In This Project
Library  RequestsLibrary

*** Keywords ***
POST Request
    [Arguments]  ${base_url}  ${url}  ${json}
    Create Session  mysession  ${base_url}
    ${header_req}  Create Dictionary  Accept=application/json  Content-Type=application/json
    ${response}  POST On Session  mysession  ${url}  json=${json}  headers=${header_req}  expected_status=anything
    [Return]  ${response}

GET Request
    [Arguments]  ${base_url}  ${url}
    Create Session  mysession  ${base_url}
    ${header_req}  Create Dictionary  Accept=aplication/json  Content-Type=aplication/json
    ${response}  GET On Session  mysession  ${url}  headers=${header_req}  expected_status=anything
    [Return]  ${response}
