<base href="<?=base_url();?>">
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"> 
  <title>

  </title>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <link href="back_assets/money_receipt/css/google_api.css" rel="stylesheet"></link>

  <style>
    body{
     height: 700px!important;
     width: 550px!important;

     /* to centre page on screen*/
     margin:1px 0px;
     margin-left: auto;
     margin-right: auto;
     font-family:  serif;
   }
   .farhana-table-1-col-1{
    vertical-align: top;
  }
  .first-h1{
    font-size:18px;  
    color:#111111; 
    text-align: center; 
    font-weight: 600;
  }
  .first-p{
    font-size:15px;  
    color:#111111; 
    text-align: center; 
    margin-top: -13px;

  }
  .first-p-1{
    font-size:15px;  
    color:#111111!important; 
    text-align: center; 
    margin-top: -10px;
    /*font-family: 'BenchNine', sans-serif;*/

  }

  .farhana-table-2{
    width: 100%;
  }

  .table-1-col-1{
   width: 33%;
   text-align: center;
 }
 .table-1-col-1 p{

  font-weight: bold;
  text-align: center;
  font-size: 16px;
  text-decoration: underline;
}
.farhana-table-3 {
  margin:0 auto;
  width: 100%;
  margin-top: 10px;
  
}
.farhana-table-3 tr td{
  font-size: 12px;

}
.doctor-name{
  font-size: 10px;
}
.text-right{
  text-align: right;
}
.text-center{
  text-align: center;
}
.farhana-table-4 {

  width: 100%;
  margin:0 auto;
  margin-top: 10px;
  border-collapse: collapse;
  border:1px solid #111111;
  font-size: 12px;
  text-align: right !important;
}
.farhana-table-4 tr th{
  border: 1px solid #111111;
  border-collapse: collapse!important;
  text-align: center;
  padding: 2px;
  padding-left: 7px;
}
.farhana-table-4 tr th:nth-child(2){
  text-align: right;
  width: 55%;
}
.farhana-table-4 tr td:nth-child(2){
  text-align: right;
  width: 55%;
}
.farhana-table-4 tr td{
  border: 1px solid #111111;
  border-collapse: collapse!important;
  text-align: center;
  padding: 2px;
  padding-left: 7px;
}

.farhana-table-5{
  margin-top: -23px;
  width: 30%;
  margin-left: 342px;

}

.farhana-table-6{
  margin-top: 40px;
  width: 95%;
  margin:0 auto;

}
.farhana-table-5 tr td:nth-child(2){
  width: 25%!important;

}
.farhana-table-5 tr td:last-child{
 width: 25%!important;

}


.farhana-table-4-col-1{
  width: 30%;
}
.farhana-table-4-col-2{
  width: 50%;
}
.farhana-table-2-col-3{
  width: 22%;
}
.farhana-table-20 tr td{

  font-size: 10px;

}

.tranform-text{
  font-size: 35px !important;
  font-weight: bold;
  transform: rotate(-2deg);
  text-align: center;
  vertical-align: middle;
  width: 57%;
}
.unit-class{
  font-size:12px;
  padding: 0px 0px;
}
.delivery{
  font-size:10px;
}
.last-p{
  padding: 4px;
  font-size: 10px;
  border:1px solid #111111;
  border-radius: 13px;
  width: 163px;
  margin:5px 0px;
}
.print{
  font-size: 11px;
}
.authorize{
  font-size:13px;
  text-decoration: overline;
  text-align: right;
}




</style>

</head>

<?php 
$hos_logo=$this->session->userdata['logged_in']['hospital_logo'];
$hospital_title_eng_report=$this->session->userdata['logged_in']['hospital_title_eng_report'];
$hospital_title_ban_report=$this->session->userdata['logged_in']['hospital_title_ban_report'];
$address_report=$this->session->userdata['logged_in']['address_report'];
$others_report=$this->session->userdata['logged_in']['others_report'];
?>

<body style="color:#000; text-align: center;">


  <div style="  margin: 0 auto;" class="container">

    <div  class="row">

      <table class="farhana-table-1">
        <tr>
          <td class="farhana-table-1-col-1">
            <img height="60px" width="60px" src="uploads/hospital_logo/<?=$hos_logo?>">
          </td>
          <td>
           <h1 class="" style="margin-bottom: 2px; font-size: 16px; text-align: center;margin-left: 5px;">
             <?=$hospital_title_eng_report?>
           </h1>

           <h1 style="margin-top: 0px; font-size: 16px; text-align: center;margin-left: 5px;">
            <?=$hospital_title_ban_report?>
          </h1>

          <p class="first-p"><?=$address_report?></p>
          <p class="first-p-1"><?=$others_report?></p>
        </td>

      </tr>
    </table>


  </div>




  <table class="Farha-table-3">

    
    </tr>
    <tr><td style="text-align: left"><b>Patient Name:<?</b><label><?=$appointment_info[0]['patient_name']?></label></td><td class="text-center" > </label></td><td><b>UHID:<?</b><label><?=isset($uhid_info[0]['gen_id']) ? $uhid_info[0]['gen_id'] : "" ?></label></td>
    </tr>

    <tr><td style="text-align: left"><b>Sex:<?</b><label><?=$appointment_info[0]['gender']?>     .   .   <b>  </label>  Age: </b><label><?=$appointment_info[0]['age']?></label></td></label></td> <td class="text-center" >
      <td><b>Contact No:<?</b><label><?=$appointment_info[0]['mobile_no']?></label></td>

    </tr>

    <tr ><td colspan="2" style="text-align: left"><b>Day:<?</b><label><?=$day_info[0]['schedule_day']?><td style="text-align: left"><b>Patient Type:<?</b><label><?=$appointment_info[0]['patient_type']?><b> .      .   Serial: </b><label><?=$appointment_info[0]['serial_no']?></td>
    </tr>
    <tr><td colspan="2"><b><?/b><label><?=isset($room_info[0]['room_title']) ? $room_info[0]['room_title'] : "" ?></label></td><td><b><?</b><label><?=isset($room_info[0]['cabin_class_title']) ? $room_info[0]['cabin_class_title'] : "" ?></label> (<label><?=isset($room_info[0]['cabin_sub_class_title']) ? $room_info[0]['cabin_sub_class_title'] : "" ?>)</label></td></tr>
  <tr><td colspan="2"><b>Appointment Id:<?</b><label><?=$appointment_info[0]['appointment_gen_id']?></label></td> <td><b>Appoin Date & Time:<?</b><label><?=date("d-m-Y", strtotime($appointment_info[0]['appointment_date']))." ".date("h:i a", strtotime($appointment_info[0]['appointment_time']))?></label></td>
  </table>

  <table class="farhana-table-6">
    <tr>
     <td   class="table-0-col-0"></td>
     <td   class="table-1-col-1"><p>SERIAL TOKEN</p></td>
     <td   class="table-0-col-0"></td>
   </tr>
 </table>

 <table class="farhana-table-4">
  <tr>      
    <th class="farhana-table-4-2">
     Dcotor Name
   </th>

   <th >
    Doc. Category
  </th>

  <th >
    Amount
  </th>
</tr>
<tbody id="patient_ordered_test_table">

  <tr>
    <td><?=$appointment_info[0]['doc_name']?>(<?=$appointment_info[0]['doc_designation']?>)</td>
    <td align="right"><?=$appointment_info[0]['doc_cat']?></td>
    <td align="right"><?=$appointment_info[0]['total_amount']?></td>

  </tr>

</tbody>

</table>  


<div class="static-data">

  <div style=" padding-bottom:20px" >
   <table style="margin-top:30px;margin-left:70px">
     <tr>
      <td  class="tranform-text" ><span><label id="payment_status">

        <?php if (($appointment_info[0]['total_amount']-$appointment_info[0]['discount'])-$appointment_info[0]['total_paid'] == 0)
        {
          echo "Paid";
        } else
        {
          echo "Due";
        }
        ?> 

      </label></span></td></tr>

    </table>
    <table class="farhana-table-5" style="margin-top:-40px;margin-left:100px !important;width: 100%;margin-bottom:20px;">
      <tr>
        <td rowspan="6"></td>
        <td ><b>Total Amount </b></td>
        <td >  :<label id="total_amount"><?=$appointment_info[0]['total_amount']?></label></td>


      </tr>
      <tr>

        <td ><b>Dis(-) </b></td>
        <td >  :<label id="total_discount"><?=$appointment_info[0]['discount']?></label></td>


      </tr>
      <tr>

        <td ><b>Net Amount </b></td>
        <td >  :<label id="net_total"><?=($appointment_info[0]['total_amount'])-$appointment_info[0]['discount']?></label></td>


      </tr>
      <tr>

        <td ><b>Received Amount </b></td>
        <td >  :<label id="paid_amount"><?=$appointment_info[0]['total_paid']?></label></td>


      </tr>
      <tr>

        <td ><b>Due Amount </b></td>
        <td >  :<label id="due_amnt"><?=($appointment_info[0]['total_amount']-$appointment_info[0]['discount'])-$appointment_info[0]['total_paid']?></label></td>


      </tr>


    </table>

  </div>

</div>

</div>

</div>

<footer class="footer">

  <table class="farhana-table-6">
    <tr>
      <td class="print"><?php echo "Print Date: ".date('l jS \of F Y h:i:s A')?> <br> Developed By: Software Park Bd (01624794910)
      </td><br><br>
      <td class="authorize">Authorize Sig: <label id="booked_by"></label></td>
    </tr>
  </table>

</footer>

<!-- </div> -->



<!--=======  SCRIPTS =======-->
<script src="back_assets/money_receipt/js/jquery.min.js"></script>
<script src="back_assets/money_receipt/js/popper.min.js"></script>
<script src="back_assets/money_receipt/js/bootstrap.min.js"></script>


<script type="text/javascript">
 setTimeout(function() { 
  window.print();

}, 500);
</script>

</body>

</html>
