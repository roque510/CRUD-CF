<h1 class="brand-heading">
<cfoutput>#session.user#</cfoutput>
</h1>
                                <p class="intro-text">On this web page you will be able to Create, Read, Update or Delete users registered here.</p>


                                <a href="#create" class="btn btn-circle page-scroll">
                                    <i class="fa fa-angle-double-down animated"></i>
                                </a>

<!---                                     <cfquery name="myQuery" datasource="test"> 
                                        SELECT * FROM usuarios where id = "1"
                                    </cfquery>

                                    <cfoutput query="myQuery">
                                        <h1>#encodeForHTML(myQuery.usuario)#</h1>
                                    </cfoutput> --->