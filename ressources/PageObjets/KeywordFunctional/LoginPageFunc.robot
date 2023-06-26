*** Settings ***
Documentation      Definition the keyword functionnal for Page User's Login
Library            SeleniumLibrary
Resource           ../KeywordDefinition/LoginKwObject.robot
Resource           ../KeywordDefinition/AcceuiKwObject.robot
Resource           ../Locators/LoginPage.resource
Resource           ./AcceuilByProfilPageFunc.robot


*** Variables ***
${mess_invalide}        Identifiants invalides


*** Keywords ***
Login_CA_All_Users
    FOR  ${key}  IN  @{list_ident_Ko}
        Log    ${key}
        Login_by_identifiant_CA    ${key}
        Check_Message_Welcome_CA
        Check_Name_User_Display    ${key}
        Check_Menu_User_Display    ${key}
        Deconnexion_CA
        Acces_To_CA
    END


Login_CA_Users_Invalids
     FOR  ${key}  IN  @{list_ident_Ko}
        Log    ${key}
        Login_by_identifiant_CA    ${key}
        Message_error_identifant_display
    END