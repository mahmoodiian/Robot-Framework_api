*** Settings ***
Documentation  Add User To reqres.in
Resource  ../Resources/Resource_4.robot
Force Tags  POST


*** Variables ***
${name}  david
${job}  leader
${email}  ${name}@gmail.com


*** Test Cases ***
Add User
    ${response}  Request  ${name}  ${job}  ${email}
    ${key_name}  ${key_email}  ${key_id}  ${key_id}  ${createdAt}  Get Data  ${response}

    Status Should Be  201  ${response}
    Should Be Equal  ${key_name}  ${name}
    Should Be Equal  ${key_email}  ${email}
    Length Should Be  ${key_id}  3
    Convert To Integer  ${key_id}

    Log To Console  output: ${createdAt}
    Log  output: ${createdAt}
