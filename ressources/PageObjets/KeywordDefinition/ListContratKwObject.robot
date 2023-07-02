*** Settings ***
Documentation      Definition the keyword for Page List_Contrat_etablis
Library            SeleniumLibrary
Resource           ../Locators/ListContratPage.resource
Resource           ./Common.robot


*** Keywords ***
Check_Header_Page_ListContract_Display
    [Documentation]    verify title of page display
    Check_Header_Page_Display    ${div_header}   ${title_ListContrat}


Select_Value_Combo_MaxRow
    [Documentation]    User click selectbox Nombres de lignes \
    ...   select number of lines in list
    [Arguments]    ${number_lines}
    Select From List By Value     ${select_maxRow}      ${number_lines}


Verify_Number_Rows_Table
    [Documentation]     check number of rows in table with number chosen
    [Arguments]    ${number_lines}
    ${nb_row_display}       Get Element Count       ${table_contrat}
    Log     ${nb_row_display}
    IF     '${nb_row_display}' == '${number_lines}'
        Log    "Number of row is equal with nb chosen"
    ELSE
        Log    "Number of row is NOT equal with nb chosen"
    END


Click_Icon_View_Detail_Contract
    [Documentation]    From id's row selected
    [Arguments]     ${id_row_view}
    ${xpath_btn_voir}   Catenate_Xpath_Tr_With_Nbrow    ${id_row_view}   ${btn_voir_contrat}
    Click Element       ${xpath_btn_voir}


Catenate_Xpath_Tr_With_Nbrow
    [Documentation]    build xpath for icon's action in row  id_row of table
    [Arguments]      ${id_row}      ${xpath_btn}
    ${xpath_build}      Catenate   SEPARATOR=  ${tr_table}   [     ${id_row}   ]    ${xpath_btn}
    [Return]    ${xpath_build}


Get_Info_Contract_By_NbRow
    [Documentation]    get infomation of contract in row id_row choose
    [Arguments]    ${id_row}
    ${id}       Evaluate    ${id_row}+1
    ${name}     Get Table Cell     ${table}      ${id}   2
    ${achat}    Get Table Cell     ${table}      ${id}   3
    ${credit}   Get Table Cell     ${table}      ${id}   4
    ${date}     Get Table Cell     ${table}      ${id}   5
    ${duree}    Get Table Cell     ${table}      ${id}   6
    ${status}   Get Table Cell     ${table}      ${id}   7

    &{detailContract}   Create Dictionary      name=${name}   achat=${achat}      credit=${credit}   date=${date}      duree=${duree}
    [Return]    ${detailContract}