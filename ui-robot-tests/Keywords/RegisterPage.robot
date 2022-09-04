*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/Testdata.py
Resource   LoginPage.robot


*** Keywords ***
Enter Username
    Input Text    ${UsernameInputBox}    ${Username}

Enter Password
    Input Text    ${PasswordInputBox}    ${Password}

Enter Firstname
    Input Text    ${FirstNameInputBox}    ${FirstName}

Enter Familyname
    Input Text    ${FamilyNameInputBox}    ${FamilyName}

Enter Phonenumber
    Input Text    ${PhoneNumberInputBox}    ${PhoneNumber}

Click Register
    Click Element    ${RegisterButton}
    Login Page Should Be Open

Registration Page Should Be Open
    Title Should Be    Register - Demo App