*** Settings ***
Documentation      Case de test: verify icons in menu are clickable
Force Tags         POEC-CA
Library            SeleniumLibrary
Resource           ../../../../ressources/PageObjets/KeywordDefinition/Common.robot
Resource           ../../../../ressources/PageObjets/KeywordDefinition/AcceuiKwObject.robot
Resource           ../../../../ressources/PageObjets/Variables/RES_VariableGlobalCA.resource


*** Test Cases ***
    [Documentation]     BDD cas de test \
    ...     Given un utilisateur se connecter par son profil
    ...     When page Acceuil du profil est affiché
    ...     Then les icônes de leurs fonctionnalités sont clickables


Icons In Menu are clickable
    [Tags]    PP-15

    Given   An user login by his profile
    When    Home Page of his profile is displayed
    Then    icons of its features are clickable


*** Keywords ***
An user login by his profile
    Opening_CA_with_url    ${url_CA}    ${browser}
    Login_by_identifiant_CA   ${admin_acd}


Home Page of his profile is displayed
    Check_HomePage_By_Profile_Display

Icons of its features are clickable
