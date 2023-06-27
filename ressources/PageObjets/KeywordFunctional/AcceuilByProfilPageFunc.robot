*** Settings ***
Documentation      Definition the keyword functionnal for Page Acceuil by User
Library            SeleniumLibrary
Resource           ../KeywordDefinition/AcceuilByProfilKwObject.robot


*** Keywords ***
Check_Menu_User_Display
    [Documentation]    verify menu of profil user is display
    [Arguments]    ${identifiant}

    Check_Menu_By_User  ${identifiant}


Check_Username_Display_Menu
    [Documentation]    verify name of user is display in banner Menu
    [Arguments]    ${identifiant}

    Check_Name_Identifiant_Display_Menu    ${identifiant}


Check_Username_Display_In_Page
    [Documentation]    verify name of user is display in his page
    [Arguments]    ${identifiant}

    Check_Name_Identifiant_Display_Page    ${identifiant}


