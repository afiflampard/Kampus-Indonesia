<?php 
header("Content-type:application/json");
require_once('../a_con.php');
$no = array();
$res = array();


$r = "error";
$message = "Maaf. Terjadi Kesalahan Saat Mengirim Respon Ke Server ";
$data = array();


$kabupaten = "";
if(!empty($_GET['kabupaten'])){ 
$kabupaten = in($_GET['kabupaten']); 
}
 


$check_p = select($pdo,"SELECT * FROM z_kabupaten WHERE kabupaten='$kabupaten' "); 
$check_p->execute();
$row_p = row($check_p);
if($row_p >= 1){
	$p = fetch_obj($check_p); 
	$kota_tujuan = $p->id;
	require_once("check_ongkir.php");

if($kurir <> ""){
	$d = $kurir;
	$r = "success";
}
	
	

 
 
}



 
$res['data'] = $d;
$res['response'] = $r;
$res['message'] = $message;
$res= json_encode($res);
echo($res);

?>