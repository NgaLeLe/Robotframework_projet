*** Settings ***
Documentation      Definition the keyword for Page List_Contrat_etablis
Library            SeleniumLibrary
Resource           ./Common.robot
Resource           ../Locators/ContractDetailPage.resource


*** Keywords ***
Check_Header_Page_ContractDetail_Display
    [Documentation]    verify title of page display
    Check_Header_Page_Display    ${div_header}   ${header_txt}