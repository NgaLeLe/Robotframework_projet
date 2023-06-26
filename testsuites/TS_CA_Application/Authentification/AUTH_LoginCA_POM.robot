*** Settings ***
Documentation      Case de test pilote par jeux de données (fichier AUTH_LoginUser.xlsx)
Force Tags         POEC-CA
Library            SeleniumLibrary
Resource            ../../../ressources/PageObjets/Variables/RES_VariableGlobalCA.resource
Resource            ../../../ressources/PageObjets/KeywordFunctional/LoginPageFunc.robot
Resource           ../../../ressources/PageObjets/KeywordDefinition/Common.robot

*** Variables ***


*** Test Cases ***
 AUTH_VerificationIdentifiantsOK
    [Documentation]    Pseudo-code Case de Test AuthentificationOK
    ...  Appel Kw commun de connexion
    ...  Appel Kw fonctionnel de login avec Identifiants OK
    ...  Appel Kw commun de cloture
    [Tags]    PP-25, AUTH-Login-Valid-DDT
    Opening_CA_with_url   ${urlCA}   ${browser}
    Login_CA_All_Users
    Close_Browser_CA


AUTH_VerificationIdentifiantsKO
    [Documentation]    Pseudo-code Case de Test AuthentificationKO
    ...  Appel Kw commun de connexion
    ...  Appel Kw fonctionnel de login avec IdentifiantsKO
    [Tags]    PP-25, AUTH-Login-Invalid-DDT
    Opening_CA_with_url   ${urlCA}   ${browser}
    Login_CA_Users_Invalids
    Close_Browser_CA
