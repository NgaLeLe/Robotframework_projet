*** Settings ***
Documentation      Definition the common keyword
Library            SeleniumLibrary
Resource           ../Locators/AcceuilByProfilPage.resource

*** Variables ***
#parametres pour keywords
${mess_bienvenue}       Bienvenue sur l'application Crédit Auto
${username_val}


*** Keywords ***
Wait Until Message Welcome CA Display
    [Documentation]    verify element "bienvenue" is displayed
    ...  verify contain text "Bienvenue"
    Wait Until Element Is Visible    ${div_bienvenue}
    Page Should Contain    ${mess_bienvenue}


Verify Name User Display
    [Documentation]    verify username is displayed in menu
    ...  verify username in
    [Arguments]    ${username_val}
    Element Text Should Be   ${div_b_username}   ${username_val}
    Element Text Should Be   ${div_i_username}   ${username_val}


Verify Menu User Display
    [Documentation]    verify menu of profil user is display
    [Arguments]    ${username_val}

    IF    '${username_val}' == "acd"
        Element Should Be Visible    ${lnk_verifierAdmis}
        Element Should Be Visible    ${lnk_consulter_liste_credit}
        Element Should Be Visible    ${lnk_simulation}
        Element Should Be Visible    ${lnk_recherche_contrat}
        Element Should Be Visible    ${lnk_liste_credit}
        Element Should Be Visible    ${lnk_rapport_production}
        Element Should Be Visible    ${lnk_emmetttrer_conditions}
        Element Should Be Visible    ${lnk_taux}
        Element Should Be Visible    ${lnk_conditions_loueurs}
    END
    IF    '${username_val}' == "gcd"
        Element Should Be Visible    ${lnk_verifierAdmis}
        Element Should Be Visible    ${lnk_simulation}
        Element Should Be Visible    ${lnk_consulter_liste_credit}
    END
    IF    '${username_val}' == "rcd"
        Element Should Be Visible    ${lnk_recherche_contrat}
        Element Should Be Visible    ${lnk_rapport_production}
        Element Should Be Visible    ${lnk_liste_credit}
    END
    IF    '${username_val}' == "lcd"
         Element Should Be Visible    ${lnk_emmetttrer_conditions}
    END


Logout CA
    [Documentation]    user click button Deconnexion
    Click Link    ${btn_deconnexion}