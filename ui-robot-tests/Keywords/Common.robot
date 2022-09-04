*** Settings ***
Documentation     A resource file with reusable keywords and variables.
Library           SeleniumLibrary
Resource          Homepage.robot

*** Variables ***
${SERVER}           localhost:8080
${BROWSER}          Firefox
${DELAY}            0.1
${LOGIN URL}        http://${SERVER}/login
${USERINFO URL}     http://${SERVER}/user


*** Keywords ***
Browser Driver manager
    ${driver_path}=    browserdriversync.Get Driver Path With Browser      ${BROWSER}
    Set Suite Variable    ${driver_path}

Opening Browser
    Open Browser    ${SERVER}    ${BROWSER}    executable_path=${driver_path}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Home Page Should Be Open