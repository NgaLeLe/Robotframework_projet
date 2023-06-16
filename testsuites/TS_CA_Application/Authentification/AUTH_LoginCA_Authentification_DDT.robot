*** Settings ***
Documentation      Case de test pilote par jeux de données (fichier AUTH_LoginUserDDT.xlsx)
...                il gère des cas valides et invalides
Force Tags         POEC-CA

Library            SeleniumLibrary
Library            DataDriver  file=AUTH_LoginUserDDT.xlsx  encoding=utf-8

Resource           ../../../ressources/VariableGlobalCA.resource
Resource           ../../../ressources/CommonKeyword.robot
Resource           ../../../ressources/PageObjets/KeywordDefinationFiles/AcceuilByProfilPage.robot
Resource           ../../../ressources/PageObjets/KeywordDefinationFiles/LoginPage.robot
#pour modele DDT, install libraire robotframework-datadriver[XLS]

#Setup - precondition - action au debut et à la fin d'execution des CdTs
Suite Setup      Open CA    ${url_CA}  ${browser}
Suite Teardown   Close Browser
Test Template    VerificationAuthentification
#Test template: utiliser comme CdT générique -> il faut bien que il est bien défini dans keyword

*** Variables ***


*** Test Cases ***
LoginCAValideCA by ${User}   using   ${User} and ${Password}
    [Documentation]    Se connecter piloter par DDT (Data Driven)
    ...  afin d'aller page du profil correspondant
    [Tags]    PP-17, AUTH-Login-multiusers



*** Keywords ***
VerificationAuthentification
    [Documentation]    user login and verify his username and his menu is displayed
    ...                if user invalid and/or password invalid, message invalid display in page Login
    ...  Pseudo-code
    ...  1. aller page Login (click btn Access CA)
    ...  2. se connecter avec les identifiants
    ...  3. Si user valid: verifier nom du utilisateur presente and verifier son menu
    ...  4. Si user invalid: verifier message invalid presente

    [Arguments]    ${User}   ${Password}
    # aller page Login
    Click Link    ${btn_AccessCA}
    Wait Until Element Is Visible    ${btn_connecter}
    #user se connecte par ses identifiants
    Login By Username And Password   ${User}   ${Password}
    Wait Until Element Is Visible    ${div_bienvenue}
    #
    Verify Name User Display    ${User}
    Verify Menu User Display    ${User}
    Capture Page Screenshot    
    Logout CA


