*** Settings ***
Documentation      Case de test pilote par jeux de données (fichier AUTH_LoginUser.xlsx)
Force Tags         POEC-CA
Library            SeleniumLibrary
Resource           ../../../ressources/PageObjets/Variables/RES_VariableGlobalCA.resource
Resource           ../../../ressources/PageObjets/KeywordDefinition/Common.robot
Resource           ../../../ressources/PageObjets/KeywordFunctional/ListContratPageFunc.robot
Resource           ../../../ressources/PageObjets/Variables/VAR_ListContratPage.resource
Resource           ../../../ressources/PageObjets/KeywordDefinition/ContractDetailKwObject.robot


*** Test Cases ***
View_A_Contract_Established
    [Documentation]
    [Tags]    PP_30
    Opening_CA_with_url   ${urlCA}   ${browser}
    Login_by_identifiant_CA                   ${admin_acd}
    Go_To_Consulter_List_Contrat
    Check_Page_ListContrat_Display_By_User    ${admin_acd}
    Select_Number_Contract_Display            ${maxRowsChoosen}
    #View_Detail_Contract_By_Id_Row            ${id_row_chose}
    Verify_Infomation_Detail_Contract_By_Id   ${id_row_chose}
    Check_Header_Page_ContractDetail_Display
    Check_Title_Legend_Information_Contrat_Display