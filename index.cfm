<cfinclude template="/Controller/functions.cfm">
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>CRUD - Welcome</title>

    <!-- Bootstrap Core CSS -->
    <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

    <!-- Theme CSS -->
    <link href="/assets/css/grayscale.min.css" rel="stylesheet">
    <link href="/assets/css/login.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/sweetalert2/6.3.2/sweetalert2.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">


    <!-- Navigation -->
    <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse">
                    Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">
                    <i class="fa fa-play-circle"></i> <span class="light">Start</span> CRUD
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
                <ul class="nav navbar-nav">
                    <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
 
                            <cfif StructKeyExists(session, "user")>
                                <li class="hidden">
                                    <a href="#page-top"></a>
                                </li>
                                <li>
                                    <a class="page-scroll" href="#create">Create</a>
                                </li>
                                <li>
                                    <a class="page-scroll" href="#read">Read</a>
                                </li>
                                <li>
                                    <a class="page-scroll" href="#update">Update</a>
                                </li>
                                <li>
                                    <a class="page-scroll" href="#delete">Delete</a>
                                </li>
                                <li>
                                    <a class="sign-out" href="#">Sign-out</a>
                                </li>
                                   
                            <cfelse>
                              
                            </cfif>


                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    


    <!-- Intro Header -->
    <header class="intro">
       <div class="intro-body">
           <div class="container">
               <div class="row">
                   <div class="col-md-8 col-md-offset-2">
                            <!-- Check Session -->
                            <cfif StructKeyExists(session, "user")>
                                <cfinclude template="/View/welcome.cfm"></cfinclude>

                                   
                            <cfelse>
                                <cfinclude template="/View/login.cfm"></cfinclude> 
                            </cfif>
                   </div>
               </div>
           </div>
       </div>
    </header>


    
        <cfif StructKeyExists(session, "user")>
            <cfinclude template="/View/create.cfm"></cfinclude> 
            <cfinclude template="/View/read.cfm"></cfinclude> 
            <cfinclude template="/View/update.cfm"></cfinclude> 
            <cfinclude template="/View/delete.cfm"></cfinclude>
        </cfif>  


    

        <!-- Footer -->
        <footer class="container">
            <div class="text-center">
                <h2>Copyright &copy; Your Website 2016</h2>
            </div>
            
             
                    <p>Feel free to email us to provide some feedback on our templates, give us suggestions for new templates and themes, or to just say hello!</p>
                    <p><a href="mailto:feedback@startbootstrap.com">feedback@startbootstrap.com</a>
                    </p>
                    <ul class="list-inline banner-social-buttons">
                        <li>
                            <a href="https://twitter.com/SBootstrap" class="btn btn-default btn-lg"><i class="fa fa-twitter fa-fw"></i> <span class="network-name">Twitter</span></a>
                        </li>
                        <li>
                            <a href="https://github.com/IronSummitMedia/startbootstrap" class="btn btn-default btn-lg"><i class="fa fa-github fa-fw"></i> <span class="network-name">Github</span></a>
                        </li>
                        <li>
                            <a href="https://plus.google.com/+Startbootstrap/posts" class="btn btn-default btn-lg"><i class="fa fa-google-plus fa-fw"></i> <span class="network-name">Google+</span></a>
                        </li>
                    </ul>
              
        </footer>

    
    <!-- jQuery -->
    <script src="/assets/vendor/jquery/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/assets/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Google Maps API Key - Use your own API key to enable the map feature. More information on the Google Maps API can be found at https://developers.google.com/maps/ -->
    

    <!-- Theme JavaScript -->
    <script src="/assets/js/grayscale.min.js"></script>
    <script src="/assets/js/form.js"></script>
    <script src="https://cdn.jsdelivr.net/sweetalert2/6.3.2/sweetalert2.min.js"></script>
    

</body>

</html>


