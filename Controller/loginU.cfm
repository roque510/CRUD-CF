<cfinclude template="/Model/userDAO.cfc" />

<cfscript>
	
	validLogin = checkLogin(form.lg_username,form.lg_password);

	valid = "Sorry... incorrect Username or Password";
	answer = "error";
	title = "oh OH..";
	adminVar = isAdmin(form.lg_username);
</cfscript>


<cfif validLogin IS True>
	<cfscript>
		title = "Greetings!";
		valid = "Welcome " & FORM.lg_username;
		answer = "success";
	</cfscript>
		<!--- Set Session --->
	
		<cfset Session.user = FORM.lg_username>
		
		<cfif adminVar IS True >
			<cfset Session.isAdmin = "True">
		<cfelse>
			<cfset Session.isAdmin = "False">
		</cfif>
		<!--- check if is admin --->
	
	
</cfif>

<cfset faq = ArrayNew(1)>
<cfset ArrayAppend(faq, title)>
<cfset ArrayAppend(faq, valid)>
<cfset ArrayAppend(faq, answer)>



<cfset json = SerializeJSON(faq) />
<cfoutput>#json#</cfoutput>

