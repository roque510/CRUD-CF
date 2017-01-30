    <!-- Create Section -->
    <section id="create" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>Create</h2>
                <form id="createForm" method="POST" action="/Controller/create.cfm" enctype="multipart/form-data">
                    <div class="form-group row">
                      <label for="userForm" class="col-2 col-form-label">User</label>
                      <div class=" center col-1">
                        <input class="form-control" type="text" name="user" placeholder="Jsmith" id="user">
                      </div>
                    </div>

                    <div class="form-group row">
                      <label for="pwdForm" class="col-2 col-form-label">Password</label>
                      <div class="col-5">
                        <input class="form-control" type="password"  name="pwd" id="pwdForm">
                      </div>
                    </div>

                    <div class="form-group row">
                      <label for="nameForm" class="col-2 col-form-label">Name</label>
                      <div class="col-5">
                        <input class="form-control" type="text" name="name" placeholder="Jhone Smith" id="nameForm">
                      </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Create</button>
                </form>
            </div>
        </div>
    </section>