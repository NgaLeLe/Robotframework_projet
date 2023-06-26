*** Settings ***
Library    SoapLibrary
Library    OperatingSystem
Resource    ../../ressources/WS_GlobalVariables.resource


*** Variables ***



*** Test Cases ***
#  afficher le type de card données dans la request
# Attention: fichier xml ne contient pas balise xml dans 1e ligne

Afficher_type_card
    [Documentation]    Pseudo-code  \
    ...   Creer Client Soap
    ...   Envoyer le fichier XML
    ...   Recuperer la réponse et afficher la balise Typecard
    ...   Sauve-garder la reponse dans un fichier
    [Tags]    Get_Info_Card
    #comment verifie wsld qui est bonne
    TRY
        Create SOAP Client      ${wsdl}
        ${reponse}              Call SOAP Method With XML   ${CURDIR}/CardTypeRequest.xml
        ${typeCard}             Get Data From XML By Tag    ${reponse}      GetCardTypeResult
        Log   ${typeCard}
        Save XML To File        ${reponse}                  ${CURDIR}/      CardTypeRequestResponse
    EXCEPT
        Log                     "WSDL ne fonctionne pas"
    END


Afficher_type_card_with_new_number_card
    [Documentation]    Pseudo-code  \
    ...   Baser sur test_case  Afficher_type_card
    ...   Modifier le fichier XML request avec nouvelle carte
    ...   Donnees modifiées doit être forme dictionnaire
    ...   Envoyer le nv request
    ...   Recuperer la réponse et afficher la balise Typecard
    ...   Sauve-garder la reponse dans un fichier
    [Tags]    Get_Info_Card

    TRY
        Create SOAP Client      ${wsdl}
        ${reponse}              Call SOAP Method With XML   ${CURDIR}/CardTypeRequest.xml
        ${typeCard}             Get Data From XML By Tag    ${reponse}      GetCardTypeResult
        Log   ${typeCard}
        Save XML To File        ${reponse}                  ${CURDIR}      CardTypeRequestResponse
        # modifier
        ${nvCardNumber}         Create Dictionary    smar:CardNumber=6250941006528599
        Log                     ${nvCardNumber}
        Edit XML Request        ${CURDIR}/CardTypeRequest.xml   ${nvCardNumber}    CardTypeRequestGen

        ${reponse}              Call SOAP Method With XML   ${CURDIR}/CardTypeRequestGen.xml
        ${typeCard}             Get Data From XML By Tag    ${reponse}      GetCardTypeResult
        Log   ${typeCard}
        Save XML To File        ${reponse}                  ${CURDIR}      CardTypeRequestGenResponse

    EXCEPT
        Log                     "WSDL ne fonctionne pas"
    END


Afficher_type_card_using_keyword
    ${Status}       Init_Client_Soap    ${wsdl}
    IF  ${Status}
        Log    Client created
        Get_Type_Card_Save_Answer_Xml   CardTypeRequest
    ELSE
        Log  Not created
    END


*** Keywords ***
Get_Type_Card_Save_Answer_Xml
    [Documentation]
    [Arguments]    ${name_file_request}


    ${reponse}              Call SOAP Method With XML   ${CURDIR}/${name_file_request}.xml
    ${typeCard}             Get Data From XML By Tag    ${reponse}      GetCardTypeResult
    Log   ${typeCard}
    ${name_file_answer}     Catenate     ${name_file_request}[:-1]   Reponse
    Save XML To File        ${reponse}                  ${CURDIR}      ${name_file_answer}


Modify_Number_Card_TypeCardRequest
    [Arguments]    ${nvCardNumber}
    ${nvCardNumber}         Create Dictionary    smar:CardNumber=6250941006528599
    Log                     ${nvCardNumber}
    Exit XML Request        ${CURDIR}/CardTypeRequest.xml   ${nvCardNumber}    CardTypeRequestGen


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
