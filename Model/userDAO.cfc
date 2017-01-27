<cfcomponent> 

<cffunction name="getUsr"> 
	<cfquery result="qryResult" name="usrQuery" datasource="crud" > 
		SELECT *
		FROM users where Id = 0
	</cfquery> 
	<cfreturn qryResult> 
</cffunction>

<cffunction name="checkLogin" returntype="numeric"> 
<cfargument name="User" type="string" required="true">
<cfargument name="pwd" type="string" required="true">
  <cfscript>
    var hashed = '';
    hashed = hash( pwd, 'SHA-1', 'UTF-8' );
  </cfscript> 
	<cfquery result="qryResult" name="usrQuery" datasource="crud" > 
		SELECT 1 FROM users WHERE user='#User#' AND password='#hashed#' LIMIT 1
	</cfquery> 
	<cfreturn qryResult.RecordCount> 
</cffunction> 

</cfcomponent>