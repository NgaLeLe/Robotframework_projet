*** Settings ***
Documentation      Definition the keyword for page AcceuilProfilPage
Library            SeleniumLibrary
Resource           ../Locators/AcceuilByProfilPage.resource
Resource           ../Variables/VAR_AcceuilByProfilPage.resource

*** Variables ***
#parametres pour keywords
${mess_bienvenue}       Bienvenue sur l'application Crédit Auto



*** Keywords ***
Check_Message_Welcome_CA
    [Documentation]    verify element "bienvenue" is displayed
    ...  verify contain text "Bienvenue"
    #Wait Until Element Is Visible    ${div_bienvenue}
    #Page Should Contain    ${mess_bienvenue}
    Wait Until Page Contains     ${mess_bienvenue}


Check_Name_Identifiant_Display_Menu
    [Documentation]    verify username is displayed in menu
    ...  with argument Dictionary     {username:xxx, pswd: yyy}
    [Arguments]    ${identifiant}
    Check_Name_User_Display_By_Name    ${identifiant}[user]    ${div_i_username}


Check_Name_Identifiant_Display_Page
    [Documentation]    verify username is displayed in his page
    ...  with argument Dictionary     {username:xxx, pswd: yyy}
    [Arguments]    ${identifiant}
    Check_Name_User_Display_By_Name    ${identifiant}[user]    ${div_b_username}


Check_Name_User_Display_By_Name
    [Arguments]    ${username}   ${div_username}
    #Element Text Should Be    ${div_username}   ${username}
    Log Many        ${div_username}   ${username}

    Element Should Contain     ${div_username}  ${username}


Check_Menu_By_User
    [Documentation]    verify menu of profil user is display
    [Arguments]    ${identifiant}

    IF    '${identifiant}[user]' == "acd"
        #list de lien doivent etre vérifier
        Verify_Element_Menu_Visible   @{listFonc_acd}
    END
    IF    '${identifiant}[user]' == "gcd"
        Verify_Element_Menu_Visible   @{listFonc_gcd}
    END
    IF    '${identifiant}[user]' == "rcd"
        Verify_Element_Menu_Visible   @{listFonc_rcd}
    END
    IF    '${identifiant}[user]' == "lcd"
         Verify_Element_Menu_Visible   @{listFonc_lcd}
    END


Verify_Element_Menu_Visible
    [Documentation]    verify list of link of user displayed
    [Arguments]     @{list_fonc}
    FOR    ${link}  IN   @{list_fonc}
        Element Should Be Visible   ${link}
    END

Deconnexion_CA
    [Documentation]    user click button Deconnexion
    Click Link    ${btn_deconnexion}


Go_To_Consulter_List_Contrat
    Click Element       ${lnk_consulter_liste_credit}