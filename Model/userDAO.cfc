<cfcomponent> 

<cffunction name="isAdmin"> 
	<cfargument name="user" type="string" required="true">

	<cfquery result="qryResult" name="usrQuery" datasource="crud" >
			SELECT status FROM users WHERE user='#User#'
	</cfquery> 
	<cfreturn usrQuery["status"]> 
</cffunction>

<cffunction name="addUsr"> 
	<cfargument name="user" type="string" required="true">
	<cfargument name="pwd" type="string" required="true">
	<cfargument name="name" type="string" required="true">
	<cfscript>
		var hashed = '';
    	hashed = hash( pwd, 'SHA-1', 'UTF-8' );
	</cfscript>

	<cfquery result="qryResult" name="usrQuery" datasource="crud" >
			INSERT INTO users(User,Password,Name) VALUES('#user#','#hashed#','#name#')
	</cfquery> 
	<cfreturn qryResult.RecordCount> 
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

<cffunction name="readUsers">
		<cfquery result="qryResult" name="allUsers" datasource="crud" >
			SELECT * FROM users
		</cfquery> 

	<cfreturn allUsers> 

</cffunction>

<cffunction name="getUsr"> 
	<cfargument name="user" type="string" required="true">


	<cfquery result="qryResult" name="usrQuery" datasource="crud" maxrows="1" >
			SELECT * FROM users where user like "%#user#%"
	</cfquery> 
	<cfreturn usrQuery > 
</cffunction> 

<cffunction name="getUsrRowCount"> 
	<cfargument name="user" type="string" required="true">


	<cfquery result="qryResult" name="usrQuery" datasource="crud" maxrows="1" >
			SELECT * FROM users where user = "#user#"
	</cfquery> 
	<cfreturn qryResult.RecordCount > 
</cffunction> 

<cffunction name="updateUsr"> 
	<cfargument name="id" type="string" required="true">
	<cfargument name="user" type="string" required="true">
	<cfargument name="name" type="string" required="true">
	<cfargument name="status" type="string" required="true">
	<cfargument name="balance" type="string" required="true">
	<cfargument name="picture" type="string" required="true">

	<cfquery result="qryResult" name="usrQuery" datasource="crud" maxrows="1" >
			UPDATE users SET `User` = "#user#",`name` = "#name#", `status` = "#status#", `balance` = "#balance#", `picture` = "#picture#" WHERE `Id` = "#id#";
	</cfquery> 
	<cfreturn qryResult.RecordCount > 
</cffunction> 

<cffunction name="delUsr"> 
	<cfargument name="id" type="string" required="true">


	<cfquery result="qryResult" name="usrQuery" datasource="crud" maxrows="1" >
			DELETE FROM users WHERE `Id` = "#id#";
	</cfquery> 
	<cfreturn qryResult.RecordCount > 
</cffunction> 

</cfcomponent>