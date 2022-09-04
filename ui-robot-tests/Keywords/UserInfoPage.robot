*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py


*** Keywords ***
Validate User Information
    Validate Username
    Validate Firstname
    Validate Familyname
    Validate PhoneNumber

Validate Username
    ${TableUsername}    Get Text    ${UserNameValue}
    Should Be Equal As Strings    ${Username}   ${TableUsername}

Validate Firstname
    ${TableFirstname}    Get Text    ${FirstNameValue}
    Should Be Equal As Strings    ${FirstName}   ${TableFirstname}

Validate Familyname
    ${TableLastname}    Get Text    ${LastNameValue}
    Should Be Equal As Strings    ${FamilyName}   ${TableLastname}

Validate PhoneNumber
    ${TablePhoneNumber}    Get Text    ${PhonenumberValue}
    Should Be Equal As Strings    ${PhoneNumber}   ${TablePhoneNumber}

User Info Page Should Be Open
    Location Should Be    ${USERINFO URL}
    Title Should Be    User Information - Demo App

Logout
    Wait Until Element Is Visible  ${Logout}  timeout=5
    Click Element  ${Logout}
    Wait Until Element Is Visible  ${LoginLink}  timeout=5