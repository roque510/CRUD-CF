    <cfscript>
        user = form.user;
        pwd = form.pwd;
        name = form.name;
        valid = "yes";

    </cfscript>

    <cfset faq = ArrayNew(1)>
    <cfset ArrayAppend(faq, user)>
    <cfset ArrayAppend(faq, valid)>



    <cfset json = SerializeJSON(faq) />
    <cfoutput>#json#</cfoutput>

