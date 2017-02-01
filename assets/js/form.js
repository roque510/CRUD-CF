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
    
    e.preventDefault();
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
                  $("#statusUpdate").val(" ");
                  $("#balanceUpdate").val(" ");

                  swal({title: "oops.",text: "Sorry... user not found", type: "info"})
              }
              else
                for(var i = 0; i < cubes.length; i++) {                
                  $("#idUpdate").val(cubes[i][0]);
                  $("#userUpdate").val(cubes[i][1]);
                  $("#nameUpdate").val(cubes[i][3]);
                  $("#statusUpdate").val(cubes[i][5]);
                  $("#balanceUpdate").val(cubes[i][6]);
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
                  
                  $("#deleteContainer").append('<div class="media col-lg-8"><div class="media-left"><a href="#"><img class="media-object" src="https://placeholdit.imgix.net/~text?txtsize=15&txt=64%C3%9764&w=64&h=64" alt="64x64"></a></div><div style="text-align: left;" class=" media-body"><h4 class="media-heading">'+cubes[i][1]+'</h4>Nombre completo del usuario es : '+cubes[i][3]+'</div></div><button id="btndel" type="button"  idUsr="'+ cubes[i][0]+'" class="btn btndel btn-default btn-lg col-lg-4"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Delete</button>');
                  
                }


            },
            error: function (e){
             swal(data[1]);
            }
          });
  });

  $("#deleteContainer").on('click', 'button', function(e){
    alert($("#deleteContainer").children("button").attr("idUsr"));
  });

 $("#readRefresh").on('click', function (e) {
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
                
                $("#readBody").append('<div class="media"><div class="media-left"><a href="#"><img class="media-object" src="http://www.iconarchive.com/download/i81301/custom-icon-design/mono-business/users.ico" style="width:64px; height:64px; border:2pt solid white;" alt="64x64"></a></div><div style="text-align: left;" class=" media-body"><h4 class="media-heading heading-read ">'+ cubes[i][1] +'</h4>Nombre completo del usuario es : <strong class="name-read">'+ cubes[i][3] +'</strong></div></div>');
  }


              
             }

             ,
            error: function (e){
             swal(data[1]);
            }
          });
 });

  // Create Submission
 $("#createForm").on('submit', function (e) {

          e.preventDefault();

          $.ajax({
              
            type: 'post',
            url: '/Controller/create.cfm',
            cache: false,
            contentType: false,
            processData: false,
            data: new FormData(this),
            dataType: "json",            
            success: function (data) {
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
             swal(data[1]);
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