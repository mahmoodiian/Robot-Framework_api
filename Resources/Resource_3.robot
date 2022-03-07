*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Resource  CommonFunctionality.robot

*** Variables ***
${base_url}  https://reqres.in
${url}  /api/register

*** Keywords ***
Request
    [Arguments]  ${email}
    ${json}  Create Dictionary  email=${email}
    ${response}  POST Request  ${base_url}  ${url}  ${json}
    [Return]  ${response}
