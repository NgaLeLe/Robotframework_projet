*** Settings ***
Documentation      Definition the keyword for Page Acceuil of application CA
Library            SeleniumLibrary
Resource           ../Locators/AcceuilPage.resource



*** Keywords ***
Acces_To_CA
    [Documentation]    Click btn Access CA pour aller à la page Login
    Wait Until Element Is Visible    ${btn_AccessCA}
    Click Element    ${btn_AccessCA}



