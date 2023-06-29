*** Variables ***
${title_ListContrat}        Liste des contrats établis

${div_header}           xpath://body[@id="page-top"]/div[1]/h3
${select_maxRow}        id:maxRows
${table}                xpath://*[@id="table-contrats"]
${table_contrat}        xpath://*[@id="table-contrats"]/tbody/tr[not(contains(@style,"display: none"))]
${tr_table}             xpath://*[@id="table-contrats"]/tbody/tr
${btn_voir_contrat}     /td[8]/a[1]/i
${btn_edit_contrat}     /td[8]/a[2]/i
${btn_delete_contrat}   /td[8]/a[3]/i