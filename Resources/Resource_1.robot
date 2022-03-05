*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Resource  CommonFunctionality.robot

*** Variables ***
${base_url}  https://gorest.co.in
${url}  /public/v1/posts/123/comments
${data_path}  $.data
${page_path}  $.meta.pagination.page

*** Keywords ***
Request
    ${response}  GET Request  ${base_url}  ${url}
    [Return]  ${response}

Get Data
    [Arguments]  ${response}
    ${body_res}  Set Variable  ${response.json()}
    ${key_data}  Get Value From Json  ${body_res}  ${data_path}
    ${key_page}  Get Value From Json  ${body_res}  ${page_path}
    ${key_page_int}  Convert To String  ${key_page[0]}
    [return]  ${key_data[0]}  ${key_page_int}
