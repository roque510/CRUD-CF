<h1 class="brand-heading">Grayscale</h1>
                                <p class="intro-text">A free, responsive, one page Bootstrap theme.
                                    <br>Created by Start Bootstrap.</p>

                                    <cfquery name="myQuery" datasource="test"> 
                                        SELECT * FROM usuarios where id = "1"
                                    </cfquery>

                                    <cfoutput query="myQuery">
                                        <h1>#encodeForHTML(myQuery.usuario)#</h1>
                                    </cfoutput>
                                <a href="#about" class="btn btn-circle page-scroll">
                                    <i class="fa fa-angle-double-down animated"></i>
                                </a>

