*** Settings ***
Documentation    Exercices Robot Framework - Chapitre Keywords Standards

*** Variables ***
${Message_001}  le test est unr grand aventure
${Compteur}     50
${Total}        ${EMPTY}
${Nom}          Georges
${Prenom}       Orwell


*** Test Cases ***
Mon premier test
    [Documentation]   Utilisation du keyword Catenate
    ...   concatenation du plusieurs textes
     [Tags]      Test_1
    ${Message} =  Catenate   Mon nom est     ${Prenom}   ${Nom}
    Log  ${Message}


Mon deuxieme test
    [Documentation]   Utilisation du keyword should be Equal
    [Tags]      Test_2
    Log Many     ${Compteur}  ${Nom}  ${Prenom}
    Should Be Equal    ${Compteur}   50
    #Should Be Equal    ${Compteur}   25
    Should Not Be Equal   ${Compteur}   25
    Should Match Regexp    ${Message_001}  ^le


Mon troisieme test
    [Documentation]   Utilisation du keyword Should contain
    [Tags]      Test_3
    Log  ${Message_001}
    Should Contain    ${Message_001}     test
    Should Contain    ${Message_001}     dupont


Mon quatrieme test
    [Documentation]   Utilisation de l'instruction IF
    [Tags]      Test_4
    Log     ${Compteur}
    IF    ${Compteur} == 50
        Log    Compteur est egal à 50
    ELSE
        Log    Compteur est different de
    END


Mon cinquieme test
    [Documentation]   Utilisation de l'instruction LOOP
    [Tags]      Test_5
    # Boucle sur le Compteur
    FOR    ${index}     IN RANGE  1  11
        Log     ${index}
    END
    Log    Sorti de boucle

    #Boucle sur contenue de liste
    FOR    ${Animal}  IN   Chat   Chien   Leopard   Oiseau
        Log   ${Animal}
    END
    Log    Sorti de boucle


Mon sixieme test
    [Documentation]   Utilisation du keyword Create List
    [Tags]      Test_6
    # Chargement de la liste de véhicules
    @{MaListeVehicules}=    Create List    Voiture  Car  Bus  Avion   Bateau  Vélo  Train
    Log  ${MaListeVehicules}

    # Boucle sur contenue du liste

    FOR  ${Vehicule}  IN   @{MaListeVehicules}
        Log   ${Vehicule}
    END

    Log    Sortie de boucle


Mon septieme test
    [Documentation]   Utilisation du type Dictionaire
    [Tags]      Test_7
    &{MaDictionnaires} =    Create Dictionary   Marque=Ford     Puissance=150     Poids=2000    Modele=Focus
    Log  ${MaDictionnaires}

    #Lecture des valeurs des cles
    ${Result} =  Evaluate    ${MaDictionnaires}.get("Marque")
    ${Result} =  Evaluate    ${MaDictionnaires}.get("Puissance")
    ${Result} =  Evaluate    ${MaDictionnaires}.get("Poids")
    ${Result} =  Evaluate    ${MaDictionnaires}.get("Modele")




Mon huitieme test
    [Documentation]   Utilisation du Keyword and Contonue on Failure
    [Tags]      Test_8
    Log         ${Message_001}
    Run Keyword And Continue On Failure    Should Contain     ${Message_001}  dupont
    Run Keyword And Continue On Failure    Should Contain     ${Message_001}  test
    Log     ${Message_001}


Mon neuvieme test
    [Documentation]   Utilisation de l'instruction IF avec Keyword Fail
    [Tags]      Test_9
    Log    ${Compteur}
    IF    ${Compteur} == 49
        Log    Compteur est égal 49
    ELSE
        Log    Compteur est différent 49
        Fail    pas égal 49
        # ajoute le mess et status après le Tags
    END


