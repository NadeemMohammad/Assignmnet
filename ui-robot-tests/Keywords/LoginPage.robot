*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py


*** Keywords ***
Input Username
    Input Text    ${LoginUsernameInputBox}    ${LoginUsername}

Input Password
    Input Text    ${LoginPasswordInputBox}    ${LoginPassword}

Submit Credentials
    Click Element    ${LoginButton}

Login Page Should Be Open
    Location Should Be    ${LOGIN URL}
    Title Should Be    Log In - Demo App

