*** Settings ***
Documentation      Page Objet: Home page's profil user
Library            SeleniumLibrary


*** Variables ***
${div_b_username}    xpath://body[@id='page-top']/div[2]/div/pre/b
${div_i_username}    xpath://div[@id='navbarNavDropdown']/div[2]/i
${div_bienvenue}     xpath://body[@id='page-top']/div/h4
${btn_deconnexion}   id:lnkDeconnexion

#acd, gcd
${lnk_verifierAdmis}             id:lnkVerifierAdmissibilite
${lnk_consulter_liste_credit}    id:lnkConsulterListeCredit
#acd, gcd
${lnk_simulation}                id:lnkSimulation
#acd, rcd
${lnk_recherche_contrat}         id:lnkRechercherContrat
#acd, gcd, rcd
${lnk_liste_credit}              id:lnkListeCredit
#acd, rcd
${lnk_rapport_production}        id:lnkRapportProduction
#acd, lcd
${lnk_emmetttrer_conditions}     id:lnkEmmettreConditions
${lnk_taux}                      id:lnkTaux
${lnk_conditions_loueurs}        id:lnkListeConditionsLoueurs

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
        Element Should Be Visible    ${lnk_liste_credit}
    END
    IF    '${username_val}' == "rcd"
        Element Should Be Visible    ${lnk_recherche_contrat}
        Element Should Be Visible    ${lnk_simulation}
        Element Should Be Visible    ${lnk_liste_credit}
    END
    IF    '${username_val}' == "lcd"
         Element Should Be Visible    ${lnk_emmetttrer_conditions}
    END


Click Button Logout
    [Documentation]    user click button Deconnexion
    Click Link    ${btn_deconnexion}