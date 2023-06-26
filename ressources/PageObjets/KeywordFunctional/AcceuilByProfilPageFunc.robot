*** Settings ***
Documentation      Definition the keyword functionnal for Page Acceuil by User
Library            SeleniumLibrary
Resource           ../KeywordDefinition/AcceuilByProfilKwObject.robot
Resource           ../Locators/AcceuilByProfilPage.resource
Resource           ../Variables/VAR_AcceuilByProfilPage.resource


*** Keywords ***
Check_Menu_User_Display
    [Documentation]    verify menu of profil user is display
    [Arguments]    ${identifiant}

    Check_Menu_By_User  ${identifiant}