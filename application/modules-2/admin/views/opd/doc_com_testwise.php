<?php $this->load->view('back/header_link'); ?>
<body class="light">
<!-- Pre loader -->
<?php $this->load->view('back/loader'); ?>
 
<div id="app">
    <aside class="main-sidebar fixed offcanvas shadow">
       <?php $this->load->view('back/sidebar'); ?> 
    </aside>
    <!--Sidebar End-->
  <div class="has-sidebar-left">
       <?php $this->load->view('back/navbar'); ?>   
  </div> 
    <div class="page has-sidebar-left height-full">
        <header class="blue accent-3 relative nav-sticky">
            <div class="container-fluid text-white">
                <div class="row p-t-b-10 ">
                    <div class="col">
                        <h4>
                            <i class="icon-box"></i>
                            <?= $page_title ?>
							
                        </h4>
                    </div>
                </div>
            </div>
        </header>
                    
        <div class="section-wrapper">

            <div class="card my-3 no-b">
            <div class="card-body">
             <div class="card-title">Date wise Doctor Commission Report</div>
<form method="POST" action="admin/doc_com_testwise_report" target="_blank">
   <div class="form-row">
                                        <div class="form-group col-md-3">
                                        <label for="inputEmail4" class="col-form-label">Start Date</label>
                                     <label for="inputEmail4" class="col-form-label">Start Date</label>
                      <div class="input-group ml-3">
                        <input type="text" name="start_date" id="date_of_birth" class="col-sm-8 date-time-picker form-control date_of_birth"
                               data-options='{"timepicker":false, "format":"Y-m-d"}' value=""/>
                        <span class="input-group-append">
                            <span class="input-group-text add-on white">
                                <i class="icon-calendar"></i>
                            </span>
                        </span>
                      </div>
                                    </div>
                        <div class="form-group col-md-3">
                                        <label for="inputEmail4" class="col-form-label">End  Date</label>
                                     <label for="inputEmail4" class="col-form-label">End Date</label>
                      <div class="input-group ml-3">
                        <input type="text" name="end_date" id="date_of_birth" class="col-sm-8 date-time-picker form-control date_of_birth"
                               data-options='{"timepicker":false, "format":"Y-m-d"}' value=""/>
                        <span class="input-group-append">
                            <span class="input-group-text add-on white">
                                <i class="icon-calendar"></i>
                            </span>
                        </span>
                      </div>
                                    </div>
				 <div class="form-group col-md-3">
                                        
                                     <label for="inputEmail4" class="col-form-label">Test List</label>
              <select class="custom-select select2" name="test_id">
                        <option value="0">All</option>

                        <?php foreach ($test_list as $key => $value) { ?>
                          
                          <option value="<?= $value['id'] ?>"><?= $value['sub_test_title'] ?></option>
                     
                     <?php   } ?>				 
                    </select> 
                                    </div>
                      <div class="form-group col-md-3"> 
                                                                <label for="inputEmail4" class="col-form-label"></label>
                                     <label for="inputEmail4" class="col-form-label"></label>
                      <div class="input-group ml-3">
          <button type="submit" class="btn btn-success">Submit</button>

                      </div>

                                    </div>

   </div>
</form> 
<hr/>
<hr/>
			 
		

                </div>
            </div>
<!-- cart one end -->



          </div>
          </div>
        </div>
    </div>
                
    <!-- /.right-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg shadow white fixed"></div>
</div>

<?php $this->load->view('back/footer_link');?>




</body>
</html>