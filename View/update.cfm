    <!-- Update Section -->
    <section id="update" class="container content-section text-center">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2">
                <h2>Find and update user</h2>

                <div class="row">
                    <div class="col-lg-10 form-group has-success has-feedback">
                      <label class="control-label sr-only" for="inputSuccess5">Hidden label</label>
                      <input type="text" name="searchUpdate" class="form-control" id="querySearch" aria-describedby="inputSuccess5Status">
                      <span style="margin-right: 10px;" class="glyphicon glyphicon-search form-control-feedback" aria-hidden="true"></span>
                      
                    </div>

                      <div class="col-lg-2 btn-group" role="group">
                        <button id="btnSearch" type="button" class="btn btn-default">Search</button>
                      </div>
                </div>
                
                <br>

                
              <form id="updateForm" method="POST" action="/Controller/updateF.cfm" enctype="multipart/form-data" class="form-horizontal">
                  <div class="form-group">
                    <label for="Picture" class="col-sm-2 control-label">Picture</label>
                    <div class="col-sm-8">
                      <input type="text" name="picture" class="form-control" id="picture">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="UserUpdate" class="col-sm-2 control-label">User</label>
                    <div class="col-sm-8">
                      <input type="text" name="userUpdate" class="form-control" id="userUpdate" placeholder="User">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="NameUpdate" class="col-sm-2 control-label">Name</label>
                    <div class="col-sm-8">
                      <input type="text" name="nameUpdate" class="form-control" id="nameUpdate" placeholder="Name">
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="NameUpdate" class="col-sm-2 control-label">Balance</label>
                    <div class="col-sm-8">
                      <input type="numeric" name="balanceUpdate" class="form-control" id="balanceUpdate">
                    </div>
                  </div>

                  <div class="form-group">
                    <label for="NameUpdate" class="col-sm-2 control-label">status</label>
                    <div class="col-sm-8 col-md-pull-3">
                      
                        <div class="form-groupd">
                          <input type="checkbox" id="isadmin" name="isadmin" >
                          <label for="isadmin" >is Admin</label>
                        </div>
                    </div>
                  </div>

                    <input type="hidden" name="idUpdate" class="form-control" id="idUpdate" placeholder="User">

                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-default">Update</button>
                    </div>
                  </div>
                </form>

            </div>
        </div>
    </section>