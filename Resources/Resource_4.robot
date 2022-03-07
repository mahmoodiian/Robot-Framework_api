*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  ../Libraries/Functions.py
Resource  CommonFunctionality.robot

*** Variables ***
${base_url}  https://reqres.in
${url}  /api/users
${json_path}  ${CURDIR}/Json_Files/Email.json
${name_path}  $.name
${job_path}  $.job
${email_path}  $.email
${id_path}  $.id
${time_path}  $.createdAt

*** Keywords ***
Request
    [Arguments]  ${name}  ${email}
    ${json}  Load Json From File  ${json_path}
    ${json}  Update Value To Json  ${json}  $.name  ${name}
    ${json}  Update Value To Json  ${json}  $.email  ${email}
    ${response}  POST Request  ${base_url}  ${url}  ${json}
    Log To Console  ${response.content}
    [Return]  ${response}

Get Data
    [Arguments]  ${response}
    ${body_res}  Set Variable  ${response.json()}
    ${key_name}  Get Value From Json  ${body_res}  ${name_path}
    ${key_job}  Get Value From Json  ${body_res}  ${job_path}
    ${key_email}  Get Value From Json  ${body_res}  ${email_path}
    ${key_id}  Get Value From Json  ${body_res}  ${id_path}
    ${key_createdAt}  Get Value From Json  ${body_res}  ${time_path}
    ${createdAt}  convert_to_jdatetime  ${key_createdAt[0]}
    [Return]  ${key_name[0]}  ${key_email[0]}  ${key_id[0]}  ${key_id[0]}  ${createdAt}
