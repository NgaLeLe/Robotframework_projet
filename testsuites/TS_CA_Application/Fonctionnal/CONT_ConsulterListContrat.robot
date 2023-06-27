*** Settings ***
Documentation      Case de test pilote par jeux de données (fichier AUTH_LoginUser.xlsx)
Force Tags         POEC-CA
Library            SeleniumLibrary
Resource           ../../../ressources/PageObjets/Variables/RES_VariableGlobalCA.resource
Resource           ../../../ressources/PageObjets/KeywordDefinition/Common.robot
Resource           ../../../ressources/PageObjets/KeywordFunctional/ListContratPageFunc.robot


*** Test Cases ***
ConsultListEstablishedContract
    [Documentation]
    [Tags]    PP_30
    Opening_CA_with_url   ${urlCA}   ${browser}
    Login_by_identifiant_CA     ${admin_acd}
    Go_To_Consulter_List_Contrat
    Check_Page_ListContrat_Display_By_User    ${admin_acd}
    Select_Number_Contrat_Display    8