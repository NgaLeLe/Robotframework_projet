*** Settings ***
Documentation    Exercices Robot Framework

*** Variables ***
${Message_001}  Mon premier test
${Compteur}     50
${Total}        ${EMPTY}


*** Test Cases ***
Mon premier test
    [Documentation]   Mon premier test
   Log  ${Message_001}


Mon deuxieme test
    [Documentation]   Mon deuxieme test
   Log  ${Compteur}


Mon troisieme test
    [Documentation]   Mon troisieme test
   Log  Mon troisieme test
   Log  ${Total}
