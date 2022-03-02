*** Settings ***
Documentation  Get Data from gorest.co.in
Resource  ../Resources/Resource_1.robot
Force Tags  GET


*** Test Cases ***
Get Data
    ${response}  Request
    ${key_data}  ${key_page_int}  Get Data  ${response}

    Status Should Be  200  ${response}
    Should Be Equal  ${key_page_int}  1
    Should Be Empty  ${key_data}