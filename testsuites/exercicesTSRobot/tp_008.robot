*** Settings ***
Documentation   Exercices Robot Framework - travail avec fichier Excel, utilisation lib excellib
Library         ExcelLibrary
Library         Collections

*** Variables ***
${excelFile}        ressources/Voiture.xlsx
${sheetData}        Data
${ColMarque}        1
${ColPuissance}     2
${Marque}           ${EMPTY}
${Puissance}        ${EMPTY}
${NameOfColumn}
${NbOfRows}         0
@{ListVoiture}

*** Test Cases ***
Mon premier test
    [Documentation]   Lecture d'une ligne dans le fichier Excel
    [Tags]    test_l_1ine
    # Ouverture du fichier Excel
    Open Excel Document     ${excelFile}    doc_id=docExcel

    #Positionner sur l'onglet Data
    Get Sheet    ${sheetData}

    ${NameOfColumn} =  Read Excel Row    1

    #${NbOfRows} =  Evaluate    ${NbOfRows} - 1
    #Lire la premiere ligne de valeur (cellules A2, B2)
    ${Marque} =  Read Excel Cell    2  ${ColMarque}
    ${Puissance} =  Read Excel Cell    2  ${ColPuissance}

    #Afficher le contenue des cellules lues
    Log    ${Marque}
    Log    ${Puissance}
    Log    ${NameOfColumn}


    ${lingeVoiture} =  Read Excel Row    2


    #Fermer le fichier Excel
    Close Current Excel Document


Mon deuxiem test
    [Documentation]   Lecture des donnees  dans le fichier Excel
    [Tags]    test_read_data
    # Ouverture du fichier Excel
    Open Excel Document     ${excelFile}    doc_id=docExcel

    #Positionner sur l'onglet Data
    Get Sheet    ${sheetData}

    ${NbOfRows} =  Read Excel Column    1
    ${NbOfRows} =  Get Length    ${NbOfRows}

    Log    ${NbOfRows}

    @{ListVoiture} =  Create List

    #Boucle pour lire tous les lignes du fichier
    FOR    ${index}  IN RANGE  2  ${NbOfRows}+1
        ${Marque} =  Read Excel Cell    ${index}  ${ColMarque}
        ${Puissance} =  Read Excel Cell    ${index}  ${ColPuissance}

        #creer un dictionaire qui contient les infos d'une voiture
        &{voiture} =  Create Dictionary   marque=${Marque}  puissance=${Puissance}
        #Ajouter la dans la liste  ${ListVoiture}
        Append To List  ${ListVoiture}  ${voiture}
    END

    #Boucle pour afficher des voitures dans la liste
    FOR  ${voiture}  IN   @{ListVoiture}
        #Recupère la valeur du marque et de la puissance
        ${marque} =  Evaluate  ${voiture}.get("marque")
        ${puissance} =  Evaluate  ${voiture}.get("puissance")

        Log Many    ${marque}    ${puissance}
    END

    #Fermer le fichier Excel
    Close Current Excel Document
