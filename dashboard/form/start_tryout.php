<?php 

if(!empty($_GET['kode'])){ 

$kode = in($_GET['kode']);  
$click = array();
$session_jawaban_1 = array();
$session_jawaban_2 = array();
$session_jawaban_3 = array();

if(!empty($_SESSION['jawaban_'.$kode."_1"])){
	$session_jawaban_1 = $_SESSION['jawaban_'.$kode."_1"] ;
} 
if(!empty($_SESSION['jawaban_'.$kode."_2"])){
	$session_jawaban_2 = $_SESSION['jawaban_'.$kode."_2"] ;
} 
if(!empty($_SESSION['jawaban_'.$kode."_3"])){
	$session_jawaban_3 = $_SESSION['jawaban_'.$kode."_3"] ;
} 


 


$check_data = select($pdo,"SELECT * FROM `data_soal` WHERE `kode_soal`='$kode' LIMIT 1"); 

$check_data->execute();

$row_data = row($check_data);

if($row_data >= 1){

$data =fetch_obj($check_data); 

$kode = $data->kode_soal;
$judul_soal = $data->judul;



$w1 = $data->waktu_1;

$w2 = $data->waktu_2;

$w3 = $data->waktu_3;



$check_jawab = select($pdo,"SELECT * FROM `user_jawab` WHERE `user_id`='$user_id' and `selesai`='Belum' and `kode_soal`='$kode' "); 

$check_jawab->execute();

$row_jawab = row($check_jawab);

if($row_jawab >= 1){

$jawab = fetch_obj($check_jawab); 

$id_jawab = $jawab->id;







$no_1 = 1;

$no_2 = 1; 



$max_1 = 0 ;

$max_2 = 0 ;

$max_3 = 0 ;



if($data->soal_1 >= 1){	$max_1 = $data->soal_1 ;  } 

if($data->soal_2 >= 1){	$max_2 = $data->soal_2 ;  } 

if($data->soal_3 >= 1){	$max_3 = $data->soal_3 ;  } 





$a = strtotime(date($jawab->stop));

$b = strtotime(date('Y-m-d H:i:s'));

$sisa = $a-$b;







if((isset($_POST['selesai'])) or ($sisa <= 0)){

	$jawaban_1 = array();

	$jawaban_2 = array();

	$jawaban_3 = array();

	

	if($max_1 >= 1){ for ($i = 1; $i <= $max_1; $i++) { $jawaban_1[$i] = ""; if(!empty($_POST["soal_1_$i"])){  $jawaban_1[$i] = $_POST["soal_1_$i"]; }  } }	

	if($max_2 >= 1){ for ($i = 1; $i <= $max_2; $i++) { $jawaban_2[$i] = ""; if(!empty($_POST["soal_2_$i"])){  $jawaban_2[$i] = $_POST["soal_2_$i"]; }  } }

	if($max_3 >= 1){ for ($i = 1; $i <= $max_3; $i++) { $jawaban_3[$i] = ""; if(!empty($_POST["soal_3_$i"])){  $jawaban_3[$i] = $_POST["soal_3_$i"]; }  } }

	

	

	$_SESSION['jawaban_1'] = $jawaban_1;

	$_SESSION['jawaban_2'] = $jawaban_2;

	$_SESSION['jawaban_3'] = $jawaban_3;



	

	$stop = date("Y-m-d H:i:s",mktime(date('H'), date('i'), date('s'), date("m"), date("d"), date("Y")));

	eksekusi($pdo,"UPDATE `user_jawab` SET `posisi`='finish',`stop`='$stop' WHERE `id`='$id_jawab'  ");

	

	?> 

	<script>  document.location.href="?show=finish&kode=<?php echo($kode) ;  ?>";   </script>  

	<?php 

}  







$waktu_soal = $data->waktu_1+$data->waktu_2+$data->waktu_3;

$total_soal = $data->nama_soal_1." : ".$data->soal_1;

if(!empty($data->nama_soal2)){ $total_soal .= $data->nama_soal_2." : ".$data->soal_2; } 

if(!empty($data->nama_soal3)){ $total_soal .= $data->nama_soal_3." : ".$data->soal_3; } 



$start_soal = $jawab->start." - ".$jawab->stop ;









?>

<style>
.show-on-xs{display:none;}

	@media(max-width:600px){
		.show-on-xs{display:block!important;}
		.hide-on-xs{display:none !important;}
		.fixed-xs *{
			font-size : 18px !important;
		}
		.fixed-xs{position:fixed; width : 100%; left:0px;;
		top:50px;
		z-index:99;
		padding:20px;
		background: white;
		}
		.mt-xs{margin-top:80px !Important;}
		
		.fixed-xs a, .fixed-xs a span{
			font-size : 20px !important;
		}
	}
</style>

<form method="post" enctype="multipart/form-data"> 


<div class="fixed-xs show-on-xs" style="padding:10px; "align="center">
<a style="font-size : 27px; font-weight : bold;"> Sisa Waktu  
<span style="font-size : 27px ; font-weight : bold; color:#f01479; " id="countdown" class="countdown">  <?php echo($waktu_soal) ;  ?> </span> </a> 
<h5> Total Waktu : <?php echo($waktu_soal) ;  ?> Menit </h5> 
</div>


<div class="mt-xs" style="min-height:500px;background: white; padding:10px;  padding-bottom:20px; ">



<?php require_once("page_tryout.php"); ?>

	

	

<div class="row">

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  " style="padding:10px;" align="center">

	
 <input type="checkbox" id="checkboxx" required class="" name="" value="" placeholder=""    />

	<label for="checkboxx" >Saya Yakin Telah Selesai</label>

	<br />

	<button type="submit" class="btn btn-success" id="selesai" style="color:white !Important; background-color:#1e2c7b; border-color:#1e2c7b; font-weight:bold;"  name="selesai">Saya Telah Selesai </button> 

</div>

</div>











</div>

</form>





<?php require_once("try_script.php"); ?>





<?php } else {?> <script>  document.location.href="?show=soal_start&kode=<?php echo($kode) ;  ?>";   </script>   <?php } ?>
 
<?php } else {?> <script>  document.location.href="?show=soal_saya&kategori=<?php echo($user->kategori_tryout) ;  ?>";   </script>   <?php } ?>
<?php } else {?> <script>  document.location.href="?show=soal_saya&kategori=<?php echo($user->kategori_tryout) ;  ?>";   </script>   <?php } ?>
