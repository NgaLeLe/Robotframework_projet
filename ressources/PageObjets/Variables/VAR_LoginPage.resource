*** Variables ***
#parametres pour keywords
${username_str}
${password_str}

&{admin_acd}    user=acd    pswd=acial!acd2018
&{resp_rcd}    user=rcd    pswd=acial!rcd2018
&{loue_lcd}    user=lcd    pswd=acial!acd2018
&{gest_gct}    user=gcd    pswd=acial!gcd2018
@{list_ident_Ok}    ${admin_acd}   ${resp_rcd}   ${loue_lcd}   ${gest_gct}

&{ident5}    user=acd    pswd=acial!rcd2018
&{ident6}    user=rcd    pswd=acial!2018
&{ident7}    user=lcd    pswd=None
&{ident8}    user=gcd    pswd=gcd
@{list_ident_Ko}    ${ident5}   ${ident6}   ${ident7}   ${ident8}