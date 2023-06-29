*** Settings ***
Documentation      Definition the keyword for Page Acceuil of application CA
Library            SeleniumLibrary
Resource           ../Locators/MenuBar.resource

*** Keywords ***
Click_menu_credit
    Click Element    ${me_credit}

