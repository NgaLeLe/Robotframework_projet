*** Settings ***
Library    SoapLibrary
Library    OperatingSystem
Resource    ../../ressources/WebServices/WS_CommonKw.robot
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
        Log   ${CURDIR}
        ${reponse}              Call SOAP Method With XML   ${path_request_dir}/CardTypeRequest.xml
        ${typeCard}             Get Data From XML By Tag    ${reponse}      GetCardTypeResult
        Log   ${typeCard}
        Save XML To File        ${reponse}                 ${path_reponse_dir}/      CardTypeRequestResponse
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
    ...   Sauvegarder la reponse dans un fichier
    [Tags]    Get_Info_Card

    TRY
        Create SOAP Client      ${wsdl}
        ${reponse}              Call SOAP Method With XML   ${path_request_dir}/CardTypeRequest.xml
        ${typeCard}             Get Data From XML By Tag    ${reponse}      GetCardTypeResult
        Log   ${typeCard}
        Save XML To File        ${reponse}                  ${path_reponse_dir}/      CardTypeRequestResponse
        # modifier
        ${nvCardNumber}         Create Dictionary    smar:CardNumber=6250941006528599
        Log                     ${nvCardNumber}
        Edit XML Request        ${path_request_dir}/CardTypeRequest.xml   ${nvCardNumber}    CardTypeRequestGen

        ${reponse}              Call SOAP Method With XML   ${path_request_dir}/CardTypeRequestGen.xml
        ${typeCard}             Get Data From XML By Tag    ${reponse}      GetCardTypeResult
        Log   ${typeCard}
        Save XML To File        ${reponse}                  ${path_reponse_dir}/     CardTypeRequestGenResponse

    EXCEPT
        Log                     "WSDL ne fonctionne pas"
    END


Afficher_type_card_using_keyword
    ${Status}       Init_Client_Soap    ${wsdl}
    IF  ${Status}
        Log    Client created
        Get_Type_Card_Save_Answer_Xml   CardTypeRequest
        ${fileRequestNew}   Modify_Number_Card_TypeCardRequest    CardTypeRequest   5425233430109903
        Log    ${fileRequestNew}
        Get_Type_Card_Save_Answer_Xml   ${fileRequestNew}
    ELSE
        Log  Not created
    END



