*** Settings ***
Documentation      Definition the keyword for Page List_Contrat_etablis
Library            SeleniumLibrary
Resource           ../Locators/ListContratPage.resource
Resource           ../Variables/VAR_ListContratPage.resource


*** Keywords ***
Check_Title_ListContrat_Display
    [Documentation]    verify title of page display
    Element Should Contain    ${div_header}   ${title_ListContrat}


Select_Number_Contrat_Display
    [Documentation]    User click selectbox Nombres de lignes \
    ...   select number of lines in list
    [Arguments]    ${number_lines}
    Select From List By Value     ${select_maxRow}      ${number_lines}
