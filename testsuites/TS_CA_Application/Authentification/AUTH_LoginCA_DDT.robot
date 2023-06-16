*** Settings ***
Documentation      Exercices Robot Framework - Selenium
Library            SeleniumLibrary
Resource            ../../../ressources/VariableGlobalCA.resource
Resource            ../../../ressources/PageObjets/pageAcceuilByProfil.resource

*** Variables ***
${username_val}     acd
${password_val}     acial!acd2018


*** Test Cases ***
Login CA by administrateur
    [Documentation]    Se connecter en tant que Administrateur afin d'aller page du profil Admin
    [Tags]    PP-15, AUTH-Login-Valid

    Open CA And Go To Page Login

    Login By Username And Password    ${username_val}      ${password_val}

    Wait Until Message Welcome CA Display

    Verify Name User Display    ${username_val}

    Verify Menu User Display    ${username_val}

    Logout CA And Close Browser


Login CA by DDT