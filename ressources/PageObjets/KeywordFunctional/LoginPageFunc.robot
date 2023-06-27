*** Settings ***
Documentation      Definition the keyword functionnal for Page User's Login
Library            SeleniumLibrary
Resource           ../KeywordDefinition/LoginKwObject.robot
Resource           ../KeywordDefinition/AcceuiKwObject.robot
Resource           ./AcceuilByProfilPageFunc.robot
Resource           ../Variables/VAR_LoginPage.resource


*** Variables ***
${mess_invalide}        Identifiants invalides


*** Keywords ***
Login_CA_All_Users
    [Documentation]    User login by his identifiant, \
    ...   his page is displayed with task
    FOR  ${key}  IN  @{list_ident_Ok}
        # Log    ${key}
        Login_by_identifiant_CA                ${key}
        Check_Message_Welcome_CA
        Check_Name_Identifiant_Display_Menu    ${key}
        Check_Name_Identifiant_Display_Page    ${key}
        Check_Menu_User_Display                ${key}
        Deconnexion_CA
        Acces_To_CA
    END


Login_CA_Users_Invalids
    [Documentation]    User login with identifiant invalid \
    ...   message's error is display
     FOR  ${key}  IN  @{list_ident_Ko}
        Log    ${key}
        Login_by_identifiant_CA             ${key}
        Message_error_identifant_display
    END