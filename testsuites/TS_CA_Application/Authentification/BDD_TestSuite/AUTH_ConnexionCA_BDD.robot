*** Settings ***
Documentation      Case de test in for
Force Tags         POEC-CA
Library            SeleniumLibrary
Resource           ../../../../ressources/PageObjets/KeywordDefinition/Common.robot
Resource           ../../../../ressources/PageObjets/KeywordDefinition/AcceuiKwObject.robot
Resource           ../../../../ressources/PageObjets/Variables/RES_VariableGlobalCA.resource


*** Test Cases ***
    [Documentation]     BDD cas de test
    ...  When l'URL lancé dans le navigateur
    ...  Then page Acceuil CA est affiché
    ...  Given un utilisateur non connecté à CA
    ...  And l'icone "Accès Crédit Auto disponible" au centre de la page
    ...  And les icônes "Crédit Auto", "Accueil" sont disponibles dans le Bandeau Menu


Connexion CA via URL Valide
    [Tags]  PP-12

    Given   Un utilisateur non connecté à CA
    When    URL lancé dans le navigateur
    Then    Page Acceuil CA est affiché
    And     Icone Accès CA disponible au centre de la page
    And     Icones Crédit Auto and Accueil dans le Bandeau Menu


#chaque phrase doit être implément par un *** Keywords ***
*** Keywords ***
Un utilisateur non connecté à CA
    Log    "user non connecter"
    Opening_CA    ${browser}

URL lancé dans le navigateur
    Go_To_URL    ${url_CA}

Page Acceuil CA est affiché
    Page_Acceuil_Display

Icone Accès CA disponible au centre de la page
    Check_Btn_Access_Display

Icones Crédit Auto and Accueil dans le Bandeau Menu
    Check_Icons_Acceuil_CA_Display