*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  ../Libraries/Functions.py
Resource  CommonFunctionality.robot

*** Variables ***
${base_url}  https://reqres.in
${url}  /api/users
${name_path}  $.name
${job_path}  $.job
${id_path}  $.id
${time_path}  $.createdAt

*** Keywords ***
Request
    [Arguments]  ${name}  ${job}  ${email}
    ${body}  Create Dictionary  name=${name}  job=${job}, email=${email}
    ${response}  POST Request  ${base_url}  ${url}  ${body}
    [Return]  ${response}

Get Data
    [Arguments]  ${response}
    ${body_res}  Set Variable  ${response.json()}
    ${key_name}  Get Value From Json  ${body_res}  ${name_path}
    ${key_job}  Get Value From Json  ${body_res}  ${job_path}
    ${key_job}  ${key_email}  get_email  ${key_job[0]}
    ${key_id}  Get Value From Json  ${body_res}  ${id_path}
    ${key_createdAt}  Get Value From Json  ${body_res}  ${time_path}
    ${createdAt}  convert_to_jdatetime  ${key_createdAt[0]}
    [Return]  ${key_name[0]}  ${key_email}  ${key_id[0]}  ${key_id[0]}  ${createdAt}
