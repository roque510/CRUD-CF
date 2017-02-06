    <!-- Create Section -->
    <section id="create" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>Create</h2>
                <form id="createForm" method="POST" action="/Controller/create.cfm" enctype="multipart/form-data">
                    <div class="form-group row">
                      <label for="userForm" class="col-2 col-form-label">User</label>
                      <input type="text" class="form-control" placeholder="Jsmith" name="user" id="user" aria-describedby="inputError2Status">
                      <span class="glyphicon glyphicon-ok form-control-feedback sr-only" id="userErrorInput"></span>
                      <span id="inputError2Status" class="sr-only">(error)</span>
                    </div>

                    <div class="form-group row">
                      <label for="pwdForm" class="col-2 col-form-label">Password</label>
                      <input class="form-control" type="password"  name="pwd" id="pwdForm">
                      <span class="glyphicon glyphicon-remove form-control-feedback sr-only" id="pwdErrorInput"></span>
                      <span id="inputError2Status" class="sr-only">(error)</span>    
                    </div>

                    <div class="form-group row">
                      <label for="nameForm" class="col-2 col-form-label">Name</label>
                      <input class="form-control" type="text" name="name" placeholder="Jhone Smith" id="nameForm">
                      <span class="glyphicon glyphicon-remove form-control-feedback sr-only" id="nameErrorInput"></span>
                      <span id="inputError2Status" class="sr-only">(error)</span>
                    </div>
                    <button type="submit" class="btn btn-primary">Create</button>
                </form>
            </div>
        </div>
    </section>