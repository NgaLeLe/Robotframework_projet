*** Settings ***
Documentation      Definition the common keyword
Library            SeleniumLibrary
Resource           ../Locators/LoginPage.resource


*** Variables ***
#parametres pour keywords
${username_str}
${password_str}
${mess_invalide}        Identifiants invalides


*** Keywords ***
Login By Username And Password
    [Documentation]    enter username, enter password
    ...   click button Se connecter
    [Arguments]        ${username_str}   ${password_str}
    Input Text      ${txt_username}   ${username_str}
    Input Text      ${txt_password}   ${password_str}
    Click Button    ${btn_connecter}


Message error identifant display
    [Documentation]    verify message "Identifiants invalides" display
    Element Should Be Enabled   ${div_id_invalid}
    Page Should Contain         ${mess_invalide}

