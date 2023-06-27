*** Settings ***
Documentation      Case de test pilote par jeux de données (fichier AUTH_LoginUserDDT.xlsx)
...                il gère des cas valides et invalides
Force Tags         POEC-CA

Library            SeleniumLibrary
Library            DataDriver  file=AUTH_LoginUserDDT.xlsx  encoding=utf-8

Resource           ../../../ressources/PageObjets/Variables/RES_VariableGlobalCA.resource
# Resource           ../../../ressources/CommonKeyword.robot
#Resource           ../../../ressources/PageObjets/Locators/AcceuilPage.resource
#Resource           ../../../ressources/PageObjets/Locators/LoginPage.resource
#Resource           ../../../ressources/PageObjets/Locators/AcceuilByProfilPage.resource
Resource           ../../../ressources/PageObjets/KeywordDefinition/Common.robot
#pour modele DDT, install libraire robotframework-datadriver[XLS]

#Setup - precondition - action au debut et à la fin d'execution des CdTs
Suite Setup      Opening_CA_with_url    ${url_CA}  ${browser}
Suite Teardown   Close_Browser
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
    #Acces_To_CA
    Check_page_login_display
    #user se connecte par ses identifiants
    Login_by_user_pswd_CA    ${User}   ${Password}
    
    Check_Message_Welcome_CA
    #
    ${var_identifiant}      Create Dictionary    user=${User}    pswd=${Password}
    Check_Name_Identifiant_Display_Page     ${var_identifiant}
    Check_Menu_User_Display                 ${var_identifiant}
    Capture Page Screenshot    
    Close_Application_CA
    Acces_To_CA

