*** Settings ***
Documentation      Definition the keyword for Page User's Login
Library            SeleniumLibrary
Resource           ../KeywordDefinition/LoginKwObject.robot
Resource           ../Locators/LoginPage.resource


*** Variables ***
${mess_invalide}        Identifiants invalides


*** Keywords ***
Login_CA
    [Documentation]    user enter username to input identifiant, password
    ...                user click button 'Se connecter'
    [Arguments]        ${username_str}   ${password_str}
    Input Text      ${txt_username}   ${username_str}
    Input Text      ${txt_password}   ${password_str}
    Click Button    ${btn_connecter}


Message error identifant display
    [Documentation]    verify message "Identifiants invalides" display
    Element Should Be Enabled   ${div_id_invalid}
    Page Should Contain         ${mess_invalide}

Login_CA_All_Users
    FOR  ${key}  IN  @{list_ident_Ok}
        Log    ${key}
        Login_CA    ${key}[user]  ${key}[pswd]
        Check_Message_Welcome_CA
        Check_Name_User_Display    ${key}[user]
        Check_Menu_User_Display    ${key}[user]
        Deconnexion_CA
    END
