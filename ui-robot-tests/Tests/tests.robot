*** Settings ***
Suite Setup     Browser Driver manager
Library         ../browserdriversync.py
Resource        ../Keywords/Common.robot
Resource        ../Keywords/LoginPage.robot
Resource        ../Keywords/UserInfoPage.robot



*** Test Cases ***
Register User
    [documentation]  This test case verifies that the new user is able to register with his details in Demo app
    [tags]  Smoke

    Opening Browser
    Go To Registration Page
    Enter Username
    Enter Password
    Enter Firstname
    Enter Familyname
    Enter Phonenumber
    Click Register
    [Teardown]    Close Browser

Validate User Information
    [documentation]  This test case verifies that the user is able to successfully Login and verify his details and Logout from Demo app
    [tags]  Smoke

    Opening Browser
    Go To Login Page
    Input Username
    Input Password
    Submit Credentials
    User Info Page Should Be Open
    Validate User Information
    Logout
    [Teardown]    Close Browser