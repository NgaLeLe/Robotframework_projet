*** Settings ***
Documentation  Exercices Robot Framework - keyword specifique sans retour de valeur

*** Variables ***
${nom}          TRAN
${prenom}       Nga
${genre}        F
${appel_mess}        ${EMPTY}

*** Test Cases ***
Mon premier test: keyword spécifique
    [Documentation]   Essai  d'appel à un keyword spécifique
    [Tags]      Test_1
    # appel du keyword spécifique "Affichage du message de bienvenue"
    ${appel_mess} =  Affichage Message De Bienvenue    ${nom}   ${prenom}   ${genre}
    Log     ${appel_mess}
    ${appel_mess} =  Affichage Message De Bienvenue    XX  Fabrice  M
    Log     ${appel_mess}

*** Keywords ***
Affichage message de bienvenue
    [Arguments]     ${nom}      ${prenom}   ${genre}
    [Documentation]
    ...     Affichage du message de bienvenue au format "Bienvenue Madame / Monsieur"
    ...     + Nom
    ...     Parametres d'entree
    ...     Valeur de retour: aucune
    # Mise en forme du message de bienvenue
    # Keyword = fonction, il pass des valeurs par les paramètres ->
    # l'instruction IF verifie une condition s/chaine de charactères ->
    # mettre "" autour de param et valeur

    IF    '${genre}' = "F"
        ${Message_bienvenue} =  Catenate    Bienvenue Madame  ${nom}  ${prenom}
    ELSE
        ${Message_bienvenue} =  Catenate    Bienvenue Monsieur  ${nom}  ${prenom}
    END

    # Affichage du message de bienvenue
    Return From Keyword     ${Message_bienvenue}
