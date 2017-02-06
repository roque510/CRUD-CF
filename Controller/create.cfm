    <cfinclude template="/Model/userDAO.cfc" />
    <cfscript>
        user = form.user;
        pwd = form.pwd;
        name = form.name;
        title = "oh Oh...";
        text = "This username already exist please choose another one.";
        type = "error";
        result = 0;
        exist = getUsrRowCount(user);
        if(!exist)
        result = addUsr(user,pwd,name);

    </cfscript>

    <cfif result IS True>
    <cfscript>
        title = "Excelent!";
        text = name & " was successfully added.";
        type = "success";
    </cfscript>
    
    
    </cfif>




    <cfset faq = ArrayNew(1)>
    <cfset ArrayAppend(faq, title)>
    <cfset ArrayAppend(faq, text)>
    <cfset ArrayAppend(faq, type)>



    <cfset json = SerializeJSON(faq) />
    <cfoutput>#json#</cfoutput>
    


