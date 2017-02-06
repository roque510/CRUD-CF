(function($) {
    "use strict";
	
	// Options for Message
	//----------------------------------------------
  var options = {
	  'btn-loading': '<i class="fa fa-spinner fa-pulse"></i>',
	  'btn-success': '<i class="fa fa-check"></i>',
	  'btn-error': '<i class="fa fa-remove"></i>',
	  'msg-success': 'All Good! Redirecting...',
	  'msg-error': 'Wrong login credentials!',
	  'useAJAX': true,
  };

	// Login Form
	//----------------------------------------------
	// Validation
  /*$("#login-form").validate({
  	rules: {
      lg_username: "required",
  	  lg_password: "required",
    },
  	errorClass: "form-invalid"
  });*/

  $("#updateForm").on('submit', function (e){

    let validate = true;
    if($("#userUpdate").val() == ""){
      validate = false;
    }
    
    e.preventDefault();
    if(validate)
    $.ajax({
      type: 'post',
            url: '/Controller/updateF.cfm',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",            
            success: function (data) {
              if(data[3])
                swal("Success","User updated","success");
              else
                swal("oops..","Sorry we can´t update this user.","error")

            },
            error: function (e){
              swal("not working");
            }

    });//ajax
  else
    swal("opps...","Sorry you cant leave your username in blank! please try again.","error")

  });

  $("#querySearch").keypress(function (e) {
 var key = e.which;
 if(key == 13)  // the enter key code
  {
    $("#btnSearch").click();
    return false;  
  }
});  

  $("#btnSearch").on('click', function(e){
var code = $("#querySearch").val();
    e.preventDefault();
          $.ajax({
              
            type: 'post',
            url: '/Controller/update.cfm',
            data: {query: code}, 
            dataType: "json",            
            success: function (data) {

              let cubes = data[3]["DATA"];
              if (cubes.length === 0) {
                  $("#idUpdate").val(" ");
                  $("#userUpdate").val(" ");
                  $("#nameUpdate").val(" ");
                  $("#isadmin").prop('checked', false);
                  $("#balanceUpdate").val(" ");

                  swal({title: "oops.",text: "Sorry... user not found", type: "info"})
              }
              else
                for(var i = 0; i < cubes.length; i++) {                
                  $("#idUpdate").val(cubes[i][0]);
                  $("#userUpdate").val(cubes[i][1]);
                  $("#nameUpdate").val(cubes[i][3]);
                  
                  if(cubes[i][5]  == true){
                    
                    $("#isadmin").prop('checked', true);                    
                  }
                  else{
                    
                    $("#isadmin").prop('checked', false);
                  }


                  $("#balanceUpdate").val(cubes[i][6]);
                  $("#picture").val(cubes[i][7]);
                }


            },
            error: function (e){
             swal(data[1]);
            }
          });


  });

    $("#searchDelete").keypress(function (e) {
 var key = e.which;
 if(key == 13)  // the enter key code
  {
    $("#btnsearchDelete").click();
    return false;  
  }
}); 

  $("#btnsearchDelete").on('click', function(e){
    var code = $("#searchDelete").val();
    e.preventDefault();
          $.ajax({
              
            type: 'post',
            url: '/Controller/update.cfm',
            data: {query: code}, 
            dataType: "json",            
            success: function (data) {
              $("#deleteContainer").empty();
              let cubes = data[3]["DATA"];
              if (cubes.length === 0) {
                  

                  swal({title: "oops.",text: "Sorry... user not found", type: "info"})

              }
              else
                for(var i = 0; i < cubes.length; i++) {
                  
                  $("#deleteContainer").append('<div class="media col-md-8"><div class="media-left"><a href="#"><img class="media-object" src="https://d30y9cdsu7xlg0.cloudfront.net/png/17241-200.png" style="width:64px; height:64px;" alt="64x64"></a></div><div style="text-align: left;" class=" media-body"><h4 class="media-heading">'+cubes[i][1]+'</h4>Nombre completo del usuario es : '+cubes[i][3]+'</div></div><button id="btndel" type="button"  idUsr="'+ cubes[i][0]+'" class="btn btndel btn-default btn-lg col-md-4"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Delete</button>');
                  
                }


            },
            error: function (e){
             swal(data[1]);
            }
          });
  });

  $("#deleteContainer").on('click', 'button', function(e){
    var code = $("#deleteContainer").children("button").attr("idUsr");
    e.preventDefault();
    $.ajax({
      type: 'POST',
      url: '/Controller/delete.cfm',
      data: {query: code}, 
      dataType: "json",            
      success: function (data) {
        $("#deleteContainer").empty();
              if(data[3])
                swal("Success","User deleted","success");
              else
                swal("oops..","Sorry we can´t update this user.","error")


      },
      error: function (e){
        swal(data[1]);
      }

    });
  });

 $("#readRefresh").on('click', function (e) {
  let pic = "https://d30y9cdsu7xlg0.cloudfront.net/png/17241-200.png";
    e.preventDefault();
          $.ajax({
              
            type: 'post',
            url: '/Controller/read.cfm',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",            
            success: function (data) {
              
              $("#readBody").empty();    
              let cubes = data[3]["DATA"];
              for(var i = 0; i < cubes.length; i++) {
                
                $("#readBody").append('<div class="media"><div class="media-left"><a href="#"><img class="media-object" src="'+ cubes[i][7] +'" onerror="this.onerror=null;this.src=`https://d30y9cdsu7xlg0.cloudfront.net/png/17241-200.png`;"  style="width:64px; height:64px; border:2pt solid white;" alt="64x64"></a></div><div style="text-align: left;" class=" media-body"><h4 class="media-heading heading-read ">'+ cubes[i][1] +'</h4>Nombre completo del usuario es : <strong class="name-read">'+ cubes[i][3] +'</strong></div></div>');
  }


              
             }

             ,
            error: function (e){
             swal(data[1]);
            }
          });
 });

 $("#user").on("keypress", function(e){
    $('#user').parent().removeClass("has-error");
    $('#user').parent().addClass("has-success has-feedback");
    $('#userErrorInput').removeClass("sr-only");
    $('#userErrorInput').removeClass("glyphicon-remove");
    $('#userErrorInput').addClass("glyphicon-ok");
 });

  $("#pwdForm").on("keypress", function(e){
    $('#pwdForm').parent().removeClass("has-error");
    $('#pwdForm').parent().addClass("has-success has-feedback");
    $('#pwdErrorInput').removeClass("sr-only");
    $('#pwdErrorInput').removeClass("glyphicon-remove");
    $('#pwdErrorInput').addClass("glyphicon-ok");
 });

   $("#nameForm").on("keypress", function(e){
    $('#nameForm').parent().removeClass("has-error");
    $('#nameForm').parent().addClass("has-success has-feedback");
    $('#nameErrorInput').removeClass("sr-only");
    $('#nameErrorInput').removeClass("glyphicon-remove");
    $('#nameErrorInput').addClass("glyphicon-ok");
 });

  // Create Submission
 $("#createForm").on('submit', function (e) {
  let validation = true;
  if ($.trim($('#user').val()) == "") { 
    $('#user').parent().addClass("has-error has-feedback");
    $('#userErrorInput').removeClass("sr-only");
    $('#userErrorInput').removeClass("glyphicon-ok");
    $('#userErrorInput').addClass("glyphicon-remove");

    validation = false;

  }
  if ($.trim($('#pwdForm').val()) == "") {
    $('#pwdForm').parent().addClass("has-error has-feedback");
    $('#pwdForm').parent().addClass("has-error has-feedback");
    $('#pwdErrorInput').removeClass("sr-only");
    $('#pwdErrorInput').addClass("glyphicon-remove");
    validation = false;

  } 
    if ($.trim($('#nameForm').val()) == "") {
    $('#nameForm').parent().addClass("has-error has-feedback");
    $('#nameForm').parent().addClass("has-error has-feedback");
    $('#nameErrorInput').removeClass("sr-only");
    $('#nameErrorInput').addClass("glyphicon-remove");
    validation = false;

  } 

          e.preventDefault();
          if(validation)
          $.ajax({
              
            type: 'post',
            url: '/Controller/create.cfm',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",            
            success: function (data) {
              $('#user').parent().removeClass("has-error");
              $('#pwdForm').parent().removeClass("has-error");
              $('#nameForm').parent().removeClass("has-error");
              $('#user').parent().removeClass("has-success");
              $('#pwdForm').parent().removeClass("has-success");
              $('#nameForm').parent().removeClass("has-success");


              document.getElementById("createForm").reset();
              swal({
                title: data[0],
                text: data[1],
                type: data[2]
              })
             },
            error: function (e){
             swal(data[1]);
            }
          });
        else
          swal("Warning","Please make sure you leave no blank spaces","warning")

        });


//Sign-Out
 $(".sign-out").on('click', function(e) {

        e.preventDefault();

          $.ajax({
              
            type: 'post',
            url: '/Controller/signOut.cfm',
            success: function (data) {
                            swal({
                title: 'Good bye!',
                text: "Have a nice Day",
                type: "success",
                timer: 1000
              }).then(
                function () {},
                // handling the promise rejection
                function (dismiss) {
                  if (dismiss === 'timer') {
                    location.reload();
                  }
                }
              )
            },
            error: function (e){
             swal("!? Something went wrong...");
            }
          });

 });
  
	// Login Submission
 $("#login-form").on('submit', function (e) {

          e.preventDefault();

          $.ajax({
              
            type: 'post',
            url: '/Controller/loginU.cfm',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",
            //beforeSend: function() {
            //$('#response').html("<img src='img/loading.gif' />");
            //$('#modal1').openModal();
            //},  
            success: function (data) {

             //$('#modal1').closeModal();
              swal({
                title: data[0],
                text: data[1],
                type: data[2],
                timer: 2000,
                showConfirmButton: false,
              }).then(
                function () {},
                // handling the promise rejection
                function (dismiss) {
                  if (dismiss === 'timer') {
                    location.reload();
                  }
                }
              )
             
             
              


            },
            error: function (e){
             swal(e);
            }
          });

        });
	
	// Register Form
	//----------------------------------------------
	// Validation
  /*$("#register-form").validate({
  	rules: {
      reg_username: "required",
  	  reg_password: {
  			required: true,
  			minlength: 5
  		},
   		reg_password_confirm: {
  			required: true,
  			minlength: 5,
  			equalTo: "#register-form [name=reg_password]"
  		},
  		reg_email: {
  	    required: true,
  			email: true
  		},
  		reg_agree: "required",
    },
	  errorClass: "form-invalid",
	  errorPlacement: function( label, element ) {
	    if( element.attr( "type" ) === "checkbox" || element.attr( "type" ) === "radio" ) {
    		element.parent().append( label ); // this would append the label after all your checkboxes/labels (so the error-label will be the last element in <div class="controls"> )
	    }
			else {
  	  	label.insertAfter( element ); // standard behaviour
  	  }
    }
  });*/

  // Form Submission
  $("#register-form").submit(function() {
  	remove_loading($(this));
		
		if(options['useAJAX'] == true)
		{
			// Dummy AJAX request (Replace this with your AJAX code)
		  // If you don't want to use AJAX, remove this
  	//  dummy_submit_form($(this));
		
		  // Cancel the normal submission.
		  // If you don't want to use AJAX, remove this
  	  return false;
		}
  });

	// Forgot Password Form
	//----------------------------------------------
	// Validation
  /*$("#forgot-password-form").validate({
  	rules: {
      fp_email: "required",
    },
  	errorClass: "form-invalid"
  });*/
  
	// Form Submission
  $("#forgot-password-form").submit(function() {
  	remove_loading($(this));
		
		if(options['useAJAX'] == true)
		{
			// Dummy AJAX request (Replace this with your AJAX code)
		  // If you don't want to use AJAX, remove this
  	  //dummy_submit_form($(this));
		
		  // Cancel the normal submission.
		  // If you don't want to use AJAX, remove this
  	  return false;
		}
  });

	// Loading
	//----------------------------------------------
  function remove_loading($form)
  {
  	$form.find('[type=submit]').removeClass('error success');
  	$form.find('.login-form-main-message').removeClass('show error success').html('');
  }

  function form_loading($form)
  {
    $form.find('[type=submit]').addClass('clicked').html(options['btn-loading']);
  }
  
  function form_success($form)
  {
	  $form.find('[type=submit]').addClass('success').html(options['btn-success']);
	  $form.find('.login-form-main-message').addClass('show success').html(options['msg-success']);
  }

  function form_failed($form)
  {
  	$form.find('[type=submit]').addClass('error').html(options['btn-error']);
  	$form.find('.login-form-main-message').addClass('show error').html(options['msg-error']);
  }

	// Dummy Submit Form (Remove this)
	//----------------------------------------------
	// This is just a dummy form submission. You should use your AJAX function or remove this function if you are not using AJAX.
 /* function dummy_submit_form($form)
  {
  	if($form.valid())
  	{
  		form_loading($form);
  		
  		setTimeout(function() {
  			form_success($form);
  		}, 2000);
  	}
  }*/
	
})(jQuery);