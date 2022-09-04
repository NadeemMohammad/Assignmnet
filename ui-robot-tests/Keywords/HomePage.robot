*** Settings ***
Library    SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py
Resource   Common.robot
Resource   LoginPage.robot
Resource   RegisterPage.robot


*** Keywords ***
Go To Login Page
    Click Element    ${LoginLink}
    Login Page Should Be Open

Go To Registration Page
    Wait Until Element Is Visible    ${RegisterLink}    timeout=5
    Click Link     ${RegisterLink}
    Registration Page Should Be Open

Home Page Should Be Open
    Wait Until Element Is Visible  ${LoginLink}  timeout=5
    Title Should Be    index page - Demo App