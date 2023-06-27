*** Settings ***
Documentation      Definition the keyword functionnal for Page User's Login
Library            SeleniumLibrary
Resource           ../KeywordDefinition/ListContratKwObject.robot
Resource           ./AcceuilByProfilPageFunc.robot


*** Keywords ***
Check_Page_ListContrat_Display_By_User
    [Documentation]    verify title of page display
    [Arguments]    ${identifiant}
    Check_Username_Display_Menu    ${identifiant}
    Check_Title_ListContrat_Display

