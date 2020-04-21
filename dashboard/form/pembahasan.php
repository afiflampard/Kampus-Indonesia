<?php 
if(!empty($_GET['kode'])){ 
$kode = in($_GET['kode']); 




$check_data = select($pdo,"SELECT * FROM `data_soal` WHERE `kode_soal`='$kode' LIMIT 1"); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
$data =fetch_obj($check_data); 
$kode = $data->kode_soal;

$w1 = $data->waktu_1;
$w2 = $data->waktu_2;
$w3 = $data->waktu_3;
 
 
$no_1 = 1;
$no_2 = 1;
$no_3 = 1;


$max_1 = $data->soal_1;
$max_2 = $data->soal_2;
$max_3 = $data->soal_3;


  

  



$waktu_soal = $data->waktu_1+$data->waktu_2+$data->waktu_3;
$total_soal = $data->nama_soal_1." : ".$data->soal_1;
if(!empty($data->nama_soal2)){ $total_soal .= $data->nama_soal_2." : ".$data->soal_2; } 
if(!empty($data->nama_soal3)){ $total_soal .= $data->nama_soal_3." : ".$data->soal_3; } 

?>






<form method="post" enctype="multipart/form-data"> 
<div class="" style="min-height:500px;background: white; padding-bottom:20px !important; padding:10px;  ">
<div class="" style="padding:10px; "align="center">
<h5> Total Waktu : <?php echo($waktu_soal) ;  ?> Menit </h5> 
</div>

<ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
<li class="nav-item">
<a class="nav-link  active "  style="font-size : 18px !important; font-weight : bold;"  id="tab_soal_1-tab" data-toggle="tab" href="#tab_soal_1" role="tab" aria-controls="tab_soal_1" aria-selected="true"><?php echo($data->nama_soal_1) ;  ?></a>
</li>
<?php if(!empty($data->nama_soal_2)){?> 
<li class="nav-item">
<a class="nav-link" id="tab_soal_2-tab"	style="font-size : 18px !important; font-weight : bold;" data-toggle="tab" href="#tab_soal_2" role="tab" aria-controls="tab_soal_2" aria-selected="false"><?php echo($data->nama_soal_2) ;  ?></a>
</li>
<?php }  ?>


<?php if(!empty($data->nama_soal_3)){?> 
<li class="nav-item">
<a class="nav-link" id="tab_soal_3-tab"style="font-size : 18px !important; font-weight : bold;" data-toggle="tab" href="#tab_soal_3" role="tab" aria-controls="tab_soal_3" aria-selected="false"><?php echo($data->nama_soal_3) ;  ?></a>
</li>
<?php }  ?>

</ul>


	<div class="tab-content" id="myTabContent" style="padding:10px;">
	<div class="tab-pane fade show active" id="tab_soal_1" role="tabpanel" aria-labelledby="tab_soal_1-tab">
	<div class="row">
		
		
		<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-1  ">
<div class="card" style="border-radius:10px; border:1px solid gainsboro  ">

<div class="card-header"><h5>
Page Active : <?php echo($data->nama_soal_1) ;  ?></h5></div>

 
<div class="card-block" align="center">
<?php 
$check_jawaban = select($pdo,"SELECT * FROM `data_jawaban` WHERE `kode_soal`='$kode' and `jenis_soal`='Soal 1' ORDER BY `nomor` ASC  "); 
$check_jawaban->execute();
$row_jawaban = row($check_jawaban);
if($row_jawaban >= 1){
while($jawaban = fetch_obj($check_jawaban)){
$tepat = "Tidak Ada Jawaban Yang Tepat";
$nil = 0;
$nilai_a = $jawaban->nilai_a;
$nilai_b = $jawaban->nilai_b;
$nilai_c = $jawaban->nilai_c;
$nilai_d = $jawaban->nilai_d;
$nilai_e = $jawaban->nilai_e;

$benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";

if($nilai_a >= 0){ if($nil < $nilai_a){ $benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";$nil = $nilai_a; $benar_a="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_a; }  } 
if($nilai_b >= 0){ if($nil < $nilai_b){ $benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";$nil = $nilai_b; $benar_b="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang  <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_b; }  } 
if($nilai_c >= 0){ if($nil < $nilai_c){ $benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";$nil = $nilai_c; $benar_c="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang  <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_c; }  } 
if($nilai_d >= 0){ if($nil < $nilai_d){ $benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";$nil = $nilai_d; $benar_d="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang  <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_d; }  } 
if($nilai_e >= 0){ if($nil < $nilai_e){ $benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";$nil = $nilai_e; $benar_e="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang  <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_e; }  } 
?> 

<div class="hidden_1 showing" id="page_<?php echo($jawaban->nomor) ;  ?>_1" align="left">
<div style="font-size : 18px; display:block !important; white-space:pre-wrap "> 

<b>Soal No : <?php echo($jawaban->nomor) ;  ?>  </b><br>
<?php echo($jawaban->soal) ;  ?>
</div>

<br />
<br />
<div class="row"> 
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1   p-1 " align="left">


<?php if(!empty($jawaban->pilihan_a)){ ?> 
<div  style="word-break:break-all !important; white-space:pre-wrap; padding:10px; margin-bottom:10px;  <?php echo($benar_a) ;  ?>">
<?php echo($jawaban->pilihan_a) ;   ?> 
</div>

<?php } ?>
<?php if(!empty($jawaban->pilihan_b)){ ?> 
<div  style="word-break:break-all !important; white-space:pre-wrap; padding:10px; margin-bottom:10px;  <?php echo($benar_b) ;  ?>">
<?php echo($jawaban->pilihan_b) ;   ?> 
</div>


<?php } ?>
<?php if(!empty($jawaban->pilihan_c)){ ?> 
<div  style="word-break:break-all !important; white-space:pre-wrap; padding:10px; margin-bottom:10px;  <?php echo($benar_c) ;  ?>">
<?php echo($jawaban->pilihan_c) ;   ?> 
</div>
<?php } ?>

</div>


<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  p-1 " align="left">
<?php if(!empty($jawaban->pilihan_d)){ ?> 
<div  style="word-break:break-all !important; white-space:pre-wrap; padding:10px; margin-bottom:10px;  <?php echo($benar_d) ;  ?>">
<?php echo($jawaban->pilihan_d) ;   ?> 
</div>
<?php } ?>


<?php if(!empty($jawaban->pilihan_e)){ ?> 
<div  style="word-break:break-all !important; white-space:pre-wrap; padding:10px; margin-bottom:10px;  <?php echo($benar_e) ;  ?>">
<?php echo($jawaban->pilihan_e) ;   ?> 
</div>
<?php } ?>
</div>
</div>  



<div class=" p-1 " style="background: white; margin-top: 20px;" >
<b  style="font-size : 20px !important" > Pembahasan </b> <br />
<pre style="white-space:pre-line !important; overflow:hidden !important;word-break:break-all !important; width:100%; padding:0px; overflow:hidden; height:auto !important;margin:0px !important; font-family : inherit !important;"><?php echo($jawaban->pembahasan) ;  ?></pre> 
<span  style="color:blue !important;" ><?php echo($tepat) ;  ?> </span> <br />

<?php 
if($row_k >= 1){
include("pembahasan_video.php");
}  
?>
</div>



</div> 
<?php 
}
}  

?>



<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  " style="padding:10px; ">
<a class="btn btn-danger" onclick="back_page_1()" style="color:white !Important" > Kembali </a>  
<a class="btn btn-primary" onclick="next_page_1()" style="color:white !Important" > Selanjutnya </a>  <br />
</div>


</div>
</div>

</div>



<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1  ">
<div class="card" style="border-radius:10px; border:1px solid gainsboro  ">

<div class="card-header"><h5>
Page Active : <?php echo($data->nama_soal_1) ;  ?></h5></div>

 
<div class="card-block" align="center" style="padding:10px !Important;">
<div class="row" >
<?php 
	for ($i = 1; $i <= $max_1; $i++) {
		?> 
		
		<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-2 p-1    " style="padding:3px !Important;">
			<a id="no_<?php echo($i) ;  ?>_1" onclick="go_page_1('<?php echo($i) ;  ?>')" class="btn btn-primary" style="width : 100%; color:white !important; padding:3px !Important; text-align:center; padding-top:7px !important; padding-bottom:7px !important;" > <?php echo($i) ;  ?> </a>  
		</div>
		
		<?php 
	} 
?>
</div>
 

		


</div>
</div>
</div>


		
		
	</div>		
	</div>

	<?php if(!empty($data->nama_soal_2)){?> 
	<div class="tab-pane fade" id="tab_soal_2" role="tabpanel" aria-labelledby="tab_soal_2-tab">
	<div class="row">

<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-1  ">
<div class="card" style="border-radius:10px; border:1px solid gainsboro  ">

<div class="card-header"><h5>
Page Active : <?php echo($data->nama_soal_2) ;  ?></h5></div>

 
<div class="card-block" align="center">
<?php 
$check_jawaban = select($pdo,"SELECT * FROM `data_jawaban` WHERE `kode_soal`='$kode' and `jenis_soal`='Soal 2' ORDER BY `nomor` ASC  "); 
$check_jawaban->execute();
$row_jawaban = row($check_jawaban);
if($row_jawaban >= 1){
while($jawaban = fetch_obj($check_jawaban)){
$tepat = "Tidak Ada Jawaban Yang Tepat";
$nil = 0;
$nilai_a = $jawaban->nilai_a;
$nilai_b = $jawaban->nilai_b;
$nilai_c = $jawaban->nilai_c;
$nilai_d = $jawaban->nilai_d;
$nilai_e = $jawaban->nilai_e;
$benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";

if($nilai_a >= 0){ if($nil < $nilai_a){ $benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";$nil = $nilai_a; $benar_a="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_a; }  } 
if($nilai_b >= 0){ if($nil < $nilai_b){ $benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";$nil = $nilai_b; $benar_b="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang  <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_b; }  } 
if($nilai_c >= 0){ if($nil < $nilai_c){ $benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";$nil = $nilai_c; $benar_c="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang  <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_c; }  } 
if($nilai_d >= 0){ if($nil < $nilai_d){ $benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";$nil = $nilai_d; $benar_d="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang  <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_d; }  } 
if($nilai_e >= 0){ if($nil < $nilai_e){ $benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";$nil = $nilai_e; $benar_e="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang  <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_e; }  } 

?> 
<div class="hidden_2 showing" id="page_<?php echo($jawaban->nomor) ;  ?>_2" align="left">
<div style="font-size : 18px; display:block !important; white-space:pre-wrap "> 

<b>Soal No : <?php echo($jawaban->nomor) ;  ?>  </b><br>
<?php echo($jawaban->soal) ;  ?>

</div>

<br />
<br />

<div class="row"> 
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1   p-1 " align="left">


<?php if(!empty($jawaban->pilihan_a)){ ?> 
<div  style="word-break:break-all !important; white-space:pre-wrap; padding:10px; margin-bottom:10px;  <?php echo($benar_a) ;  ?>">
<?php echo($jawaban->pilihan_a) ;   ?> 
</div>

<?php } ?>
<?php if(!empty($jawaban->pilihan_b)){ ?> 
<div  style="word-break:break-all !important; white-space:pre-wrap; padding:10px; margin-bottom:10px;  <?php echo($benar_b) ;  ?>">
<?php echo($jawaban->pilihan_b) ;   ?> 
</div>


<?php } ?>
<?php if(!empty($jawaban->pilihan_c)){ ?> 
<div  style="word-break:break-all !important; white-space:pre-wrap; padding:10px; margin-bottom:10px;  <?php echo($benar_c) ;  ?>">
<?php echo($jawaban->pilihan_c) ;   ?> 
</div>
<?php } ?>

</div>


<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  p-1 " align="left">
<?php if(!empty($jawaban->pilihan_d)){ ?> 
<div  style="word-break:break-all !important; white-space:pre-wrap; padding:10px; margin-bottom:10px;  <?php echo($benar_d) ;  ?>">
<?php echo($jawaban->pilihan_d) ;   ?> 
</div>
<?php } ?>


<?php if(!empty($jawaban->pilihan_e)){ ?> 
<div  style="word-break:break-all !important; white-space:pre-wrap; padding:10px; margin-bottom:10px;  <?php echo($benar_e) ;  ?>">
<?php echo($jawaban->pilihan_e) ;   ?> 
</div>
<?php } ?>
</div>
</div>  



<div class=" p-1 " style="background: white; margin-top: 20px;" >
<b  style="font-size : 20px !important" > Pembahasan </b> <br />
<pre style="white-space:pre-line !important; overflow:hidden !important;word-break:break-all !important; width:100%; padding:0px; overflow:hidden; height:auto !important;margin:0px !important; font-family : inherit !important;"><?php echo($jawaban->pembahasan) ;  ?></pre> 
<span  style="color:blue !important;" ><?php echo($tepat) ;  ?> </span> <br />

<?php 
if($row_k >= 1){
include("pembahasan_video.php");
}  
?>
</div>



</div> 
<?php 
}
} else {
echo("Kosong") ; 
}  

?>



<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  " style="padding:10px; ">
<a class="btn btn-danger" onclick="back_page_2()" style="color:white !Important" > Kembali </a>  
<a class="btn btn-primary" onclick="next_page_2()" style="color:white !Important" > Selanjutnya </a>  <br />
</div>


</div>
</div>

</div>



<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1  ">
<div class="card" style="border-radius:10px; border:1px solid gainsboro  ">

<div class="card-header"><h5>
Page Active : <?php echo($data->nama_soal_2) ;  ?></h5></div>

 
<div class="card-block" align="center" style="padding:10px !Important;">
<div class="row" >
<?php 
	for ($i = 1; $i <= $max_2; $i++) {
		?> 
		
		<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 col-12 p-1    " style="padding:3px !Important;">
			<a id="no_<?php echo($i) ;  ?>_2" onclick="go_page_2('<?php echo($i) ;  ?>')" class="btn btn-primary" style="width : 100%; color:white !important; padding:3px !Important; text-align:center; padding-top:7px !important; padding-bottom:7px !important;" > <?php echo($i) ;  ?> </a>  
		</div>
		
		<?php 
	} 
?>

</div>
 

		


</div>
</div>
</div>


	</div>
	</div>
	<?php } ?>

	<?php if(!empty($data->nama_soal_3)){?> 
	<div class="tab-pane fade" id="tab_soal_3" role="tabpanel" aria-labelledby="tab_soal_3-tab">
	<div class="row">

<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-1  ">
<div class="card" style="border-radius:10px; border:1px solid gainsboro  ">

<div class="card-header"><h5>
Page Active : <?php echo($data->nama_soal_3) ;  ?></h5></div>

 
<div class="card-block" align="center">
<?php 
$check_jawaban = select($pdo,"SELECT * FROM `data_jawaban` WHERE `kode_soal`='$kode' and `jenis_soal`='Soal 3' ORDER BY `nomor` ASC  "); 
$check_jawaban->execute();
$row_jawaban = row($check_jawaban);
if($row_jawaban >= 1){
while($jawaban = fetch_obj($check_jawaban)){
$tepat = "Tidak Ada Jawaban Yang Tepat";
$nil = 0;
$nilai_a = $jawaban->nilai_a;
$nilai_b = $jawaban->nilai_b;
$nilai_c = $jawaban->nilai_c;
$nilai_d = $jawaban->nilai_d;
$nilai_e = $jawaban->nilai_e;
$benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";

if($nilai_a >= 0){ if($nil < $nilai_a){ $benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";$nil = $nilai_a; $benar_a="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_a; }  } 
if($nilai_b >= 0){ if($nil < $nilai_b){ $benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";$nil = $nilai_b; $benar_b="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang  <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_b; }  } 
if($nilai_c >= 0){ if($nil < $nilai_c){ $benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";$nil = $nilai_c; $benar_c="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang  <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_c; }  } 
if($nilai_d >= 0){ if($nil < $nilai_d){ $benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";$nil = $nilai_d; $benar_d="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang  <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_d; }  } 
if($nilai_e >= 0){ if($nil < $nilai_e){ $benar_a = ""; $benar_b = ""; $benar_c = ""; $benar_d = ""; $benar_e = "";$nil = $nilai_e; $benar_e="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang  <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_e; }  } 

?> 
<div class="hidden_3 showing" id="page_<?php echo($jawaban->nomor) ;  ?>_3" align="left">
<div style="font-size : 18px; display:block !important; white-space:pre-wrap "> 
<b>Soal No : <?php echo($jawaban->nomor) ;  ?>  </b><br>
<?php echo($jawaban->soal) ;  ?>
</div>


<br />
<br />

<div class="row"> 
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1   p-1 " align="left">


<?php if(!empty($jawaban->pilihan_a)){ ?> 
<div  style="word-break:break-all !important; white-space:pre-wrap; padding:10px; margin-bottom:10px;  <?php echo($benar_a) ;  ?>">
<?php echo($jawaban->pilihan_a) ;   ?> 
</div>

<?php } ?>
<?php if(!empty($jawaban->pilihan_b)){ ?> 
<div  style="word-break:break-all !important; white-space:pre-wrap; padding:10px; margin-bottom:10px;  <?php echo($benar_b) ;  ?>">
<?php echo($jawaban->pilihan_b) ;   ?> 
</div>


<?php } ?>
<?php if(!empty($jawaban->pilihan_c)){ ?> 
<div  style="word-break:break-all !important; white-space:pre-wrap; padding:10px; margin-bottom:10px;  <?php echo($benar_c) ;  ?>">
<?php echo($jawaban->pilihan_c) ;   ?> 
</div>
<?php } ?>

</div>


<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  p-1 " align="left">
<?php if(!empty($jawaban->pilihan_d)){ ?> 
<div  style="word-break:break-all !important; white-space:pre-wrap; padding:10px; margin-bottom:10px;  <?php echo($benar_d) ;  ?>">
<?php echo($jawaban->pilihan_d) ;   ?> 
</div>
<?php } ?>


<?php if(!empty($jawaban->pilihan_e)){ ?> 
<div  style="word-break:break-all !important; white-space:pre-wrap; padding:10px; margin-bottom:10px;  <?php echo($benar_e) ;  ?>">
<?php echo($jawaban->pilihan_e) ;   ?> 
</div>
<?php } ?>
</div>
</div>  


<div class=" p-1 " style="background: white; margin-top: 20px;" >
<b  style="font-size : 20px !important" > Pembahasan </b> <br />
<pre style="white-space:pre-line !important; overflow:hidden !important;word-break:break-all !important; width:100%; padding:0px; overflow:hidden; height:auto !important;margin:0px !important; font-family : inherit !important;"><?php echo($jawaban->pembahasan) ;  ?></pre> 
<span  style="color:blue !important;" ><?php echo($tepat) ;  ?> </span> <br />

<?php 
if($row_k >= 1){
include("pembahasan_video.php");
}  
?>
</div>


</div> 
<?php 
}
}  

?>



<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  " style="padding:10px; ">
<a class="btn btn-danger" onclick="back_page_3()" style="color:white !Important" > Kembali </a>  
<a class="btn btn-primary" onclick="next_page_3()" style="color:white !Important" > Selanjutnya </a>  <br />
</div>


</div>
</div>

</div>



<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1  ">
<div class="card" style="border-radius:10px; border:1px solid gainsboro  ">

<div class="card-header"><h5>
Page Active : <?php echo($data->nama_soal_3) ;  ?></h5></div>

 
<div class="card-block" align="center" style="padding:10px !Important;">
<div class="row" >
<?php 
	for ($i = 1; $i <= $max_3; $i++) {
		?> 
		
		<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 col-12 p-1    " style="padding:3px !Important;">
			<a id="no_<?php echo($i) ;  ?>_3" onclick="go_page_3('<?php echo($i) ;  ?>')" class="btn btn-primary" style="width : 100%; color:white !important; padding:3px !Important; text-align:center; padding-top:7px !important; padding-bottom:7px !important;" > <?php echo($i) ;  ?> </a>  
		</div>
		
		<?php 
	} 
?>

</div>
 
		


</div>
</div>
</div>



	</div>
	</div>
	
	<?php } ?>
	 
</div>






</div>
</form>




<?php require_once("try_script_pembahasan.php"); ?>

 
<?php } else {?> <script>  document.location.href="?show=soal_saya&kategori=<?php echo($user->kategori_tryout) ;  ?>";   </script>   <?php } ?>
<?php } else {?> <script>  document.location.href="?show=soal_saya&kategori=<?php echo($user->kategori_tryout) ;  ?>";   </script>   <?php } ?>

