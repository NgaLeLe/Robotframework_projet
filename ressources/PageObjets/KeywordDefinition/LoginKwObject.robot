*** Settings ***
Documentation      Definition the keyword for Page User's Login
Library            SeleniumLibrary
Resource           ../Locators/LoginPage.resource
#Resource            ../Variables/VAR_LoginPage.resource
#Resource            ./AcceuilByProfilKwObject.robot


*** Keywords ***
Login_by_identifiant_CA
    [Documentation]    user enter username to input identifiant, password
    ...                user click button 'Se connecter'
    [Arguments]        ${identifiant}
    Log                ${identifiant}[user]
    Log                ${identifiant}[pswd]
    Login_by_user_pswd_CA    ${identifiant}[user]    ${identifiant}[pswd]


Message_error_identifant_display
    [Documentation]    verify message "Identifiants invalides" display
    Element Should Be Enabled   ${div_id_invalid}
    Page Should Contain         ${mess_invalide}


Check_page_login_display
    [Documentation]   verify button se_connecter is displayed
    Wait Until Element Is Visible    ${btn_connecter}


Login_by_user_pswd_CA
    [Arguments]        ${username_str}   ${password_str}
    Input Text      ${txt_username}   ${username_str}
    Input Text      ${txt_password}   ${password_str}
    Click Button    ${btn_connecter}