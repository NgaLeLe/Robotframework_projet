*** Settings ***
Documentation      Definition the common keyword
Library            SeleniumLibrary
Resource           ./PageObjets/Locators/AcceuilPage.resource
Resource           ./PageObjets/Locators/AcceuilByProfilPage.resource


*** Keywords ***
Open CA
    [Documentation]    Open browser with URL
    [Arguments]    ${urlCA}   ${browser}

    Open Browser    ${urlCA}   ${browser}
    Wait Until Element Is Visible    ${btn_AccessCA}
    Maximize Browser Window


Go To Page
     [Documentation]    User click on button or link or element to going to another page
    [Arguments]    ${element_clk}

    Click Element    ${element_clk}




