*** Settings ***
Documentation  Invalid Register To reqres.in
Resource  ../Resources/Resource_3.robot
Force Tags  POST

*** Variables ***
${email}  sydney@fife

*** Test Cases ***
Register User
    ${response}  Request  ${email}

    Status Should Be  400  ${response}
