*** Variables ***
#parametres pour keywords
${username_str}
${password_str}

&{ident1}    user=acd    pswd=acial!acd2018
&{ident2}    user=rcd    pswd=acial!rcd2018
&{ident3}    user=lcd    pswd=acial!acd2018
&{ident4}    user=gcd    pswd=acial!gcd2018
@{list_ident_Ok}    ${ident1}   ${ident2}   ${ident3}   ${ident4}

&{ident5}    user=acd    pswd=acial!rcd2018
&{ident6}    user=rcd    pswd=acial!2018
&{ident7}    user=lcd    pswd=None
&{ident8}    user=gcd    pswd=gcd
@{list_ident_Ko}    ${ident5}   ${ident6}   ${ident7}   ${ident8}