<style>

	.active-border{border:1px solid #022102!Important;}
	.hovered1:hover,
	.hovered2:hover,
	.hovered3:hover,
	.hovered4:hover,
	.hovered5:hover{background:#d1fcd3 !important;border-color:#022102 !important; color:#022102 !important;}
	td{padding:5px!important;}
	table,tr,td{border:0px!important}
	.hovered1,.hovered3,.hovered4{background: #f1f1f1;}
	
	
	
	b.question{
		font-weight: bolder;
		border: 1px solid #283087;
		border-radius: 10px;
		padding: 5px 12px;
		font-family: sans-serif;
		background: #283087;
		color: #ffffff;
		margin-bottom:10px;
		margin-bottom: 15px;
		display: inline-flex;
		font-size:18px;
	}
	
	.card .card-block p {
    line-height: 1.4;
    font-family: Sans-serif;
	}
	
	.table {
    margin-bottom: 5px;
    margin-top: 5px;
	}
	
	.table label {
    line-height: 18px !important;
    font-size: 15px;
    font-family: sans-serif;}
	
	.btn.btn-danger, .btn.btn-success, .btn.btn-warning{
		font-weight:bold;
	}
	
</style>
<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-0  ">
<div class="card" style="border-radius:10px; border:1px solid gainsboro  ">

<div class="card-header"><h5>Page Active : 
<?php if($posisi == "1"){
	echo($data->nama_soal_1) ; 
} else {
	echo($data->nama_soal_2) ; 
}  ?>

</h5></div>




<div class="card-block" align="center">
<?php 
if($posisi == "1"){
	$jenis = 'Soal 1';
} else {
	$jenis = 'Soal 2';
}

$check_jawaban = select($pdo,"SELECT * FROM `data_jawaban` WHERE `kode_soal`='$kode' and `jenis_soal`='$jenis' ORDER BY `nomor` ASC  "); 
$check_jawaban->execute();
$row_jawaban = row($check_jawaban);
if($row_jawaban >= 1){
while($jawaban = fetch_obj($check_jawaban)){
$jawaban_ses = "";
if(!empty($session_jawaban[$jawaban->nomor])){
	$jawaban_ses = $session_jawaban[$jawaban->nomor];
	$click[] = "jawaban_".$jawaban->id."_".$jawaban_ses."_1";
} 
?> 
<div class="hidden_1 showing" id="page_<?php echo($jawaban->nomor) ;  ?>_1" align="left">
<div style="font-size : 18px; display:block !important; white-space:pre-wrap "> 
<b class="question">Soal No : <?php echo($jawaban->nomor) ;  ?></b> 
<?php echo($jawaban->soal) ;  ?>
</div>


<br />
<br />
<div class="row"> 
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-0   p-1 " align="left">

<?php if(!empty($jawaban->pilihan_a)){ ?> 
<div onclick="buttonAnswer('jawaban_<?php echo($jawaban->id) ;  ?>_a_1-1_<?php echo($jawaban->nomor) ;  ?>')" class="p-1"> <div style="border:1px solid gainsboro; padding:10px; border-radius:5px;" class="hovered1"><table class="table"> <tbody><tr> 
<td style="width : 25px;max-width:25px !important; padding-left:10px!important; padding-right:0px !important;"> 
 <input   onchange="active_btn_1('a','<?php echo($jawaban->nomor) ;  ?>')" type="radio" id="jawaban_<?php echo($jawaban->id) ;  ?>_a_1"  value="a"  name="soal_1_<?php echo($jawaban->nomor) ;  ?>"       />  </td>
<td >
<label style="width:100% !important; display:block !important; white-space:pre-wrap" for="jawaban_<?php echo($jawaban->id) ;  ?>_a_1"><?php echo ($jawaban->pilihan_a) ;  ?></label>   </td>
</tr> </tbody></table></div></div>
<?php } ?>
<?php if(!empty($jawaban->pilihan_b)){ ?> 
<div onclick="buttonAnswer('jawaban_<?php echo($jawaban->id) ;  ?>_b_1-1_<?php echo($jawaban->nomor) ;  ?>')" class="p-1"> <div style="border:1px solid gainsboro; padding:10px; border-radius:5px;" class="hovered2"><table class="table"> <tbody><tr> 
<td style="width : 25px;max-width:25px !important; padding-left:10px!important; padding-right:0px !important;"> 
 <input   onchange="active_btn_1('b','<?php echo($jawaban->nomor) ;  ?>')" type="radio" id="jawaban_<?php echo($jawaban->id) ;  ?>_b_1"  value="b"  name="soal_1_<?php echo($jawaban->nomor) ;  ?>"       />  </td>
<td ><label style="width:100% !important; display:block !important; white-space:pre-wrap"  for="jawaban_<?php echo($jawaban->id) ;  ?>_b_1"><?php echo($jawaban->pilihan_b) ;  ?></label>   </td>
</tr> </tbody></table></div></div>
<?php } ?>
<?php if(!empty($jawaban->pilihan_c)){ ?> 
<div onclick="buttonAnswer('jawaban_<?php echo($jawaban->id) ;  ?>_c_1-1_<?php echo($jawaban->nomor) ;  ?>')" class="p-1"> <div style="border:1px solid gainsboro; padding:10px; border-radius:5px;" class="hovered3"><table class="table"> <tbody><tr> 
<td style="width : 25px;max-width:25px !important; padding-left:10px!important; padding-right:0px !important;"> 
 <input   onchange="active_btn_1('c','<?php echo($jawaban->nomor) ;  ?>')" type="radio" id="jawaban_<?php echo($jawaban->id) ;  ?>_c_1"  value="c"   name="soal_1_<?php echo($jawaban->nomor) ;  ?>"       /> </td>
<td > <label style="width:100% !important; display:block !important; white-space:pre-wrap"  for="jawaban_<?php echo($jawaban->id) ;  ?>_c_1"><?php echo($jawaban->pilihan_c) ;  ?></label> </td>
</tr> </tbody></table></div></div>
<?php } ?>

</div>


<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-0  p-1 " align="left">

<?php if(!empty($jawaban->pilihan_d)){ ?> 
<div onclick="buttonAnswer('jawaban_<?php echo($jawaban->id) ;  ?>_d_1-1_<?php echo($jawaban->nomor) ;  ?>')" class="p-1"> <div style="border:1px solid gainsboro; padding:10px; border-radius:5px;" class="hovered4"><table class="table"> <tbody><tr> 
<td style="width : 25px;max-width:25px !important; padding-left:10px!important; padding-right:0px !important;"> 
 <input  onchange="active_btn_1('d','<?php echo($jawaban->nomor) ;  ?>')" type="radio" id="jawaban_<?php echo($jawaban->id) ;  ?>_d_1"  value="d"  name="soal_1_<?php echo($jawaban->nomor) ;  ?>"       />  </td>
<td >
<label style="width:100% !important; display:block !important; white-space:pre-wrap"  for="jawaban_<?php echo($jawaban->id) ;  ?>_d_1"><?php echo($jawaban->pilihan_d) ;  ?></label>   </td>
</tr> </tbody></table></div></div>
<?php } ?>
<?php if(!empty($jawaban->pilihan_e)){ ?> 
<div onclick="buttonAnswer('jawaban_<?php echo($jawaban->id) ;  ?>_e_1-1_<?php echo($jawaban->nomor) ;  ?>')" class="p-1"> <div style="border:1px solid gainsboro; padding:10px; border-radius:5px;" class="hovered5"><table class="table"> <tbody><tr> 
<td style="width : 25px;max-width:25px !important; padding-left:10px!important; padding-right:0px !important;"> 
 <input    onchange="active_btn_1('e','<?php echo($jawaban->nomor) ;  ?>')" type="radio" id="jawaban_<?php echo($jawaban->id) ;  ?>_e_1"  value="e"  name="soal_1_<?php echo($jawaban->nomor) ;  ?>"       />  </td>
<td ><label style="width:100% !important; display:block !important; white-space:pre-wrap"  for="jawaban_<?php echo($jawaban->id) ;  ?>_e_1"><?php echo($jawaban->pilihan_e) ;  ?></label>   </td>
</tr> </tbody></table></div></div>
<?php } ?>


</div>


</div>  

</div> 
<?php 
}
}  
 
?>



<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-0  " style="padding:10px; ">
<a class="btn btn-danger" onclick="back_page_1()" style="color:white !Important" > Kembali </a> 
<a class="btn btn-warning" onclick="tandai_1()" style="color:white !Important" > Tandai </a> 
<a class="btn btn-success" onclick="next_page_1()" style="color:white !Important" > Simpan </a>  <br />
</div>


</div>
</div>

</div>


