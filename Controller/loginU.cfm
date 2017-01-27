<cfinclude template="/Model/userDAO.cfc" />

<cfscript>
	Users = getUsr();
	validLogin = checkLogin(form.lg_username,form.lg_password);
	valid = "Sorry... incorrect Username or Password";
</cfscript>


<cfif validLogin IS True>
	<cfscript>
		valid = "Welcome " & FORM.lg_username;
	</cfscript>
		<!--- Set Session --->
	
		<cfset Session.user = FORM.lg_username>
	
	
</cfif>

<cfset faq = ArrayNew(1)>
<cfset ArrayAppend(faq, "Welcome "& form.lg_username)>
<cfset ArrayAppend(faq, valid)>



<cfset json = SerializeJSON(faq) />
<cfoutput>#json#</cfoutput>
