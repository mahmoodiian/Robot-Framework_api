*** Settings ***
Documentation  Add User Without Email To reqres.in
Resource  ../Resources/Resource_2.robot
Force Tags  POST


*** Variables ***
${name}  morpheus
${job}  leader


*** Test Cases ***
Add User
    ${response}  Request  ${name}  ${job}
    ${key_name}  ${key_job}  Get Data  ${response}

    Status Should Be  201  ${response}
    Should Be Equal  ${key_name}  ${name}
    Should Be Equal  ${key_job}  ${job}