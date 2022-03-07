*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Resource  CommonFunctionality.robot

*** Variables ***
${base_url}  https://reqres.in
${url}  /api/users
${json_path}  ${CURDIR}/Json_Files/Base.json
${name_path}  $.name
${job_path}  $.job

*** Keywords ***
Request
    ${json}  Load Json From File  ${json_path}
    ${response}  POST Request  ${base_url}  ${url}  ${json}
    [Return]  ${response}

Get Data
    [Arguments]  ${response}
    ${body_res}  Set Variable  ${response.json()}
    Log  ${body_res}
    ${key_name}  Get Value From Json  ${body_res}  ${name_path}
    ${key_job}  Get Value From Json  ${body_res}  ${job_path}
    [Return]  ${key_name[0]}  ${key_job[0]}
