*** Settings ***
Documentation      Definition the common keyword
Library            SeleniumLibrary
Resource           ../Locators/AcceuilPage.resource
Resource           ../../CommonKeyword.robot


*** Keywords ***
Go To Page Login
    [Documentation]    Click btn Access CA pour aller à la page Login
    [Arguments]   ${btn_AccessCA}

   Go To Page    ${btn_AccessCA}


