*** Settings ***
Documentation      Definition the keyword for Page Acceuil of application CA
Library            SeleniumLibrary
Resource           ../Locators/AcceuilPage.resource


*** Keywords ***
Acces_To_CA
    [Documentation]    Click btn Access CA pour aller à la page Login
    #Wait Until Element Is Visible    ${btn_AccessCA}
    Click Element    ${btn_AccessCA}


Page_Acceuil_Display
    Wait Until Element Is Visible    ${btn_AccessCA}


Check_Btn_Access_Display
     Element Should Be Visible    ${btn_AccessCA}
     Element Should Contain         ${btn_AccessCA}    Accès Crédit Auto


Check_Icons_Acceuil_CA_Display
    Element Should Be Visible    ${lnk_Acceuil}
    Element Should Be Visible    ${lnk_CreditCA}
    # verify le text est correct
    Element Should Contain       ${lnk_Acceuil}   Accueil
    Element Should Contain      ${lnk_CreditCA}   Crédit Auto

