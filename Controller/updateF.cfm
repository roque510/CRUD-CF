    <cfinclude template="/Model/userDAO.cfc" />
    <cfscript>
        title = "oh Oh...";
        text = "User was not added to database, please check with an administrator of this webpage.";
        type = "error";
        isadmin = 0;

        

    </cfscript>

    <cfif IsDefined("Form.isadmin")> 
        <cfset isadmin="1"> 
    </cfif>

    <cfscript>
        result = updateUsr(FORM.idUpdate,FORM.userUpdate,FORM.nameUpdate,isadmin,FORM.balanceUpdate,FORM.picture);
    </cfscript>
	

    <cfset faq = ArrayNew(1)>
    <cfset ArrayAppend(faq, title)>
    <cfset ArrayAppend(faq, text)>
    <cfset ArrayAppend(faq, type)>
    <cfset ArrayAppend(faq, result)>



    <cfset json = SerializeJSON(faq) />
    <cfoutput>#json#</cfoutput>
