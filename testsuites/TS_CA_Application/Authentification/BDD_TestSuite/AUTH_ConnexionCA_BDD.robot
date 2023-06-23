*** Settings ***
Documentation      Case de test in for
Force Tags         POEC-CA
Library            SeleniumLibrary


*** Variables ***


*** Test Cases ***
    [Documentation]     BDD cas de test
    ...  She cannot use the old password anymore


User can change password

    Given a user has a valid account
    When she changes her password
    Then she can log in with the new password
    And she cannot use the old password anymore


#chaque phrase doit être implément par un *** Keywords ***
*** Keywords ***
a user has a valid account
    Log    "A user has a valid account"

she changes her password
    Log    "She changes her password"

she can log in with the new password
    Log    "She can log in with the new password"

she cannot use the old password anymore
    Log    'She cannot use the old password anymore"