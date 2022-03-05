*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Resource  CommonFunctionality.robot

*** Variables ***
${base_url}  https://reqres.in
${url}  /api/users
${name_path}  $.name
${job_path}  $.job

*** Keywords ***
Request
    [Arguments]  ${name}  ${job}
    ${body}  Create Dictionary  name=${name}  job=${job}
    ${response}  POST Request  ${base_url}  ${url}  ${body}
    [Return]  ${response}

Get Data
    [Arguments]  ${response}
    ${body_res}  Set Variable  ${response.json()}
    ${key_name}  Get Value From Json  ${body_res}  ${name_path}
    ${key_job}  Get Value From Json  ${body_res}  ${job_path}
    [Return]  ${key_name[0]}  ${key_job[0]}
