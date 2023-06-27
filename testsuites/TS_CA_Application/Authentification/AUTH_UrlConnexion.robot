*** Settings ***
Documentation      Exercices Robot Framework - Selenium
Library            SeleniumLibrary
Resource           ../../../ressources/PageObjets/Variables/RES_VariableGlobalCA.resource
Resource            ../../../ressources/PageObjets/Locators/AcceuilPage.resource

*** Variables ***
#${urlCAInvalide}    http://credit-auto.qsiconseil.m


*** Test Cases ***
AUTH - Connexion CA via URL valide
    [Documentation]    Open navigateur et lance URL
    ...  faut avoir driver du navigateur utilisé
    ...  Lancement de l’application via l’URL fournit par l’administrateur
    [Tags]    PP-12, AUTH_VAL

    Open Browser     ${urlCA}    ${browser}

    Element Should Be Visible    ${lnk_Acceuil}
    Element Should Be Visible    ${lnk_CreditCA}
    Element Should Be Visible    ${btn_AccessCA}
    Page Should Contain Element  ${btn_AccessCA}
    Capture Page Screenshot

    Close All Browsers


AUTH - Connexion CA via URL invalide
    [Documentation]    Lancement de l’application via l’URL invalide - saisir manuellement
    ...  le test est passé et faut traiter l'exception
    [Tags]    PP-12, AUTH_INVAL

    TRY
        Open Browser   #${urlCAInvalide}    ${browser}
    EXCEPT
        Log    "Exception récupere"
        Capture Page Screenshot
        Close All Browsers
    END


