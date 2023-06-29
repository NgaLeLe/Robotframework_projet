*** Settings ***
Documentation      Definition the keyword functionnal for Page User's Login
Library            SeleniumLibrary
Resource           ../KeywordDefinition/ListContratKwObject.robot
Resource           ./AcceuilByProfilPageFunc.robot
Resource           ../KeywordDefinition/Common.robot


*** Keywords ***
Check_Page_ListContrat_Display_By_User
    [Documentation]    verify title of page display
    [Arguments]    ${identifiant}
    Check_Username_Display_Menu    ${identifiant}
    Check_Header_Page_Display        ${div_header}   ${title_ListContrat}


Select_Number_Contract_Display
    [Documentation]    User click selectbox Nombres de lignes \
    ...   select number of lines in list
    ...   table of contrat display with nb of rows chosen
    [Arguments]    ${number_lines}
    Select_Value_Combo_MaxRow    ${number_lines}
    Verify_Number_Rows_Table    ${number_lines}


View_Detail_Contract_By_Id_Row
    [Documentation]    User click icon View on row of Contract to seeing his detail
    [Arguments]    ${id_row_view}

    Click_Icon_View_Detail_Contract      ${id_row_view}



Verify_Infomation_Detail_Contract_By_Id
    [Documentation]    get info of contract in id_row \
    ...     user click icon view in this row
    ...     verify info's contract display exactly
    [Arguments]    ${id_row_view}
    ${contract}     Get_Info_Contract_By_NbRow      ${id_row_view}
    Log    ${contract}[name]

    View_Detail_Contract_By_Id_Row   ${id_row_view}




