*** Settings ***
Resource    ../Locators/AcceuilByProfilPage.resource
*** Variables ***
@{listFonc_acd}         ${lnk_verifierAdmis}   ${lnk_consulter_liste_credit}  ${lnk_simulation}  ${lnk_recherche_contrat}  ${lnk_liste_credit}  ${lnk_rapport_production}  ${lnk_emmetttrer_conditions}  ${lnk_taux}  ${lnk_conditions_loueurs}
@{listFonc_gcd}         ${lnk_verifierAdmis}   ${lnk_simulation}  ${lnk_consulter_liste_credit}
@{listFonc_rcd}         ${lnk_recherche_contrat}   ${lnk_liste_credit}   ${lnk_rapport_production}
@{listFonc_lcd}         ${lnk_emmetttrer_conditions}