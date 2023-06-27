*** Settings ***
Library    SoapLibrary
Library    OperatingSystem
Resource    ../WS_GlobalVariables.resource


*** Keywords ***
Init_Client_Soap
    [Arguments]    ${url_soap}

    TRY
        Create SOAP Client      ${url_soap}
        Set Local Variable    ${status}   True
    EXCEPT
        Log    "Exception Creation client"
        Set Local Variable    ${status}    False
    END
    [Return]    ${status}


Get_Type_Card_Save_Answer_Xml
    [Documentation]
    [Arguments]    ${name_file_request}

    ${reponse}              Call SOAP Method With XML   ${path_request_dir}/${name_file_request}.xml
    ${typeCard}             Get Data From XML By Tag    ${reponse}      GetCardTypeResult
    Log   ${typeCard}
    ${name_file_answer}     Catenate   SEPARATOR=    ${name_file_request}   Reponse
    Save XML To File        ${reponse}                  ${path_reponse_dir}/     ${name_file_answer}


Modify_Number_Card_TypeCardRequest
    [Arguments]    ${name_file_request}  ${NumberCard_val}
    Log                     ${NumberCard_val}
    ${nvCardNumber}         Create Dictionary    smar:CardNumber=${NumberCard_val}
    Log                     ${nvCardNumber}

    ${newFile}              Catenate   SEPARATOR=  ${name_file_request}   New
    Edit XML Request        ${path_request_dir}/${name_file_request}.xml   ${nvCardNumber}    ${newFile}
    [Return]        ${newFile}
