*** Settings ***
Documentation      Definition the common keyword - actions communes dans l'application
Library            SeleniumLibrary
Resource           ../KeywordFunctional/LoginPageFunc.robot
Resource           ./AcceuilByProfilKwObject.robot


*** Keywords ***
Opening_CA_with_url
    [Documentation]    Open browser with URL
    [Arguments]    ${urlCA}   ${browser}

    Open Browser    ${urlCA}   ${browser}
    Wait Until Element Is Visible    ${btn_AccessCA}
    Maximize Browser Window
    Acces_To_CA


Opening_CA
    [Documentation]    Open browser
    [Arguments]    ${browser}
    Open Browser  about:blank  browser=${browser}
    Maximize Browser Window

Go_To_URL
    [Arguments]    ${urlCA}
    Go To    ${urlCA}

Close_Browser_CA
    Close Browser


Close_Application_CA
    Deconnexion_CA



