
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


               <div class="col-md-12" style="border-bottom:#000 solid 1px">
               </div>


             </div>
             <!-- Table row -->
             <div class="row pl-5 pr-5 my-3">
              <div class="col-12 table-responsive">
                <p style="text-align:center;font-size:14px;color:#000;font-weight:bold;"> Report of Other Asset Between <?php echo $from_date?> to <?php echo $end_date?> </p>





                <table id="test_table" class="table table-bordered table-hover test_table_report"
                >
                <thead>
                  <tr>
                   <th>SL NO</th>
                   <th>Acc. Head</th>
                   <th>Code</th>
                   <th>Challan No</th>
                   <th>Asset Purpose</th>
                   <th>Asset Ref</th>
                   <th>Paid By</th>
                   <th>Per Amount</th>
                   <th>Qty</th>
                   <th>Total Paid</th>
                   <th>Date</th>
                   <th>Operator</th>

                 </tr>
               </thead>
               <tbody>
                <?php
                $i=1;
                $total_amount=0;

                foreach($asset as $key => $value1)
                {

                  $total_amount+=$value1['total_paid'];

                  $paid_by="";


                  if($value1['paid_by']==1){
                    $paid_by="Cash";
                  }elseif ($value1['paid_by']==2) {
                    $paid_by="Check";
                  }else
                  {
                    $paid_by="Bkash";
                  }

                  ?>
                  <tr>
                   <td><?=$i++?></td>
                   <td><?=$value1['acc_head_title']?></td>
                   <td><?=$value1['acc_head_code']?></td>
                   <td><?=$value1['challan_no']?></td>
                   <td><?=$value1['income_expense_purpose']?></td>
                   <td><?=$value1['inc_exp_ref']?></td>
                   <td><?=$paid_by?></td>

                   <td><?=$value1['per_amount']?></td>
                   <td><?=$value1['qty']?></td>
                   <td><?=$value1['total_paid']?></td>
                   <td><?=date('d-m-Y h:i:s a', strtotime($value1['created_at']))?></td>

                   <td><?=$value1['operator_name']?></td>


            <!--  <td>
             <a href="admin/com_payment_details/<?=$value1['id']?>">Payment Details</a>
           </td> -->
         </tr> 
         <?php

       }

       ?>

     </tbody>

     <tfoot>
       <tr>
         <td colspan="3"></td>
         <td><?=number_format($total_amount,2,'.', '')?></td>
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
