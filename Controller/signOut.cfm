
<cflock timeout=20 scope="Session" type="Exclusive">
<cfset StructDelete(Session, "user")>
</cflock>