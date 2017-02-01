    <cfinclude template="/Model/userDAO.cfc" />
    <cfscript>
        title = "oh Oh...";
        text = "User was not added to database, please check with an administrator of this webpage.";
        type = "error";

        result = readUsers();

    </cfscript>





    <cfset faq = ArrayNew(1)>
    <cfset ArrayAppend(faq, title)>
    <cfset ArrayAppend(faq, text)>
    <cfset ArrayAppend(faq, type)>
    <cfset ArrayAppend(faq, result)>



    <cfset json = SerializeJSON(faq) />
    <cfoutput>#json#</cfoutput>
    