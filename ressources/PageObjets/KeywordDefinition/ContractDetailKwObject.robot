*** Settings ***
Documentation      Definition the keyword for Page List_Contrat_etablis
Library            SeleniumLibrary
Resource           ./Common.robot
Resource           ../Locators/ContractDetailPage.resource


*** Keywords ***
Check_Header_Page_ContractDetail_Display
    [Documentation]    verify the header of Contract details page is displayed
    Check_Header_Page_Display    ${div_header}      ${header_txt}


Check_Title_Legend_Information_Contrat_Display
    [Documentation]    verify the title of Contract detail section is correct
    Element Text Should Be       ${div_title_box}   ${title_view_txt}