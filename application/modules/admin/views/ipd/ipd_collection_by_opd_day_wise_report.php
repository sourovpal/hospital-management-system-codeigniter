<?php $this->load->view('back/header_link'); ?>
<body class="light">
  <!-- Pre loader -->
  <?php $this->load->view('back/loader'); ?>

  <?php 
  $hos_logo=$this->session->userdata['logged_in']['hospital_logo'];
  $hos_head_report=$this->session->userdata['logged_in']['hospital_head_report'];
  ?>
  <div align="center"><button id="btn_print" onclick="print_page('app')" style="width: 80px;height: 50px;background-color: #759ddd; margin:0px">Print</button></div>
  <div id="app" style="color:#000;font-weight:bold;">


    <div class="section-wrapper">
      <div class="card my-3 no-b">
        <div class="card-body">
          <div class="container">
            <div class="">
             <div class="row pl-5 pr-5">
               <div class="col-md-2">
                  <img style="height: 110px;width: 110px;" src="uploads/hospital_logo/<?=$hos_logo?>" alt="">
               </div>       
               <div class="col-md-9">

                 <?=$hos_head_report?> 
               </div> 


               <hr style="width: 100%; border:0.5px solid #000"/>



             </div>
             <!-- Table row -->
             <div class="row pl-5 pr-5 my-3">
              <div class="col-12 table-responsive">
                <p style="text-align:center;font-size:14px;color:#000;font-weight:bold;"> Report of IPD Collection Between <?php echo $from_date?> to <?php echo $end_date?> </p>
                <table id="test_table" class="table table-bordered table-hover table-striped test_table_report">
                  <thead>
                    <tr>
                      <th>SL NO</th>
                      <th>Patient Name</th>
                      <th>IPD Patient ID</th>
                      <th>OPD Invoice ID</th>
                      <th>Total Amount</th>
                      <th>Due</th>
                      <th>Total Collection</th>
                      <th>Vat</th>
                      <th>Discount</th>
                      <th>Operator</th>

                      <th>Date</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php $i=1;
                    $total_col=0;
                    $total=0;
                    $total_discount=0;
                    $total_vat=0;

                    $due=0;
                    $total_due=0;
                    foreach ($ipd_collection_by_opd as $key => $value) {
// $value['due']=$value['total_amount']-($value['paid_amount']+$value['total_discount']);

                      $total_col+=$value['paid_amount'];

                      $total_discount+=$value['total_discount'];
                      $total_vat+=$value['vat'];
                      $total_due+=($value['total_amount']-$value['total_discount']+$value['vat'])-$value['paid_amount'];
                      ?>
                      <tr>
                        <td><?=$i?></td>
                        <td><?=$value['patient_name']?></td>
                        <td><?=$value['patient_info_id']?></td>
                        <td><?=$value['test_order_id']?></td>

                        <td align="right"><?=$value['total_amount']?></td>
                        <td align="right"><?=($value['total_amount']-$value['total_discount']+$value['vat'])-$value['paid_amount']?></td>
                        <td align="right"><?=$value['paid_amount']?></td>
                        <td align="right"><?=$value['vat']?></td>
                        <td align="right"><?=$value['total_discount']?></td>
                        <td align="right"><?=$value['operator_name']?></td>

                        <td><?=date('d M,Y h:i a',strtotime($value['created_at']))?></td>


                      </tr>

                      <?php $i++;

                    }?>


                  </tbody>
                  <tfoot>

                  </style>
                  <tr>
                    <td colspan="5"></td>
                    <td align="right">Total Due: <?php echo number_format($total_due,2,'.','')?> </td>
                    <td align="right">Total Col: <?php echo number_format($total_col,2,'.','')?> </td>
                    <td align="right">Total Vat: <?php echo number_format($total_vat,2,'.','')?> </td>

                    <td align="right">Total Dis: <?php echo number_format($total_discount,2,'.','')?> </td>
                    <td></td>
                    <td></td>


                  </tr>
                </tfoot>
              </table>

            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->


          <!-- /.row -->

          <!-- this row will not appear when printing -->
        </div>
      </div>
    </div>
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









 


