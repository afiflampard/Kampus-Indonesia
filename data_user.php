<?php 
$login = "";
$kode_akses = array();
$kode_akses_string = "gratis";


if((!empty($_COOKIE['user_id'])) and (!empty($_COOKIE['password']))){
	$return = "false";

	$user_id = in($_COOKIE['user_id']);
	$password = in($_COOKIE['password']);
	
	$check_master = select($pdo,"SELECT * FROM `user` WHERE `user_id`='$user_id' and `password`='$password'  "); 
	$check_master->execute();
	$row_master = row($check_master);
	if($row_master >= 1){
	 $login = "yes";
	$user = fetch_obj($check_master); 
 
 
$check_akses = select($pdo,"SELECT * FROM `akses_user` WHERE `user_id`='$user_id' "); 
$check_akses->execute();
$row_akses = row($check_akses);
if($row_akses >= 1){
	while($akses = fetch_obj($check_akses)){
		$kode_akses[] = $akses->kode;
		$kode_akses_string .= "%".$akses->kode;
		
		
	}
}
  
if(!empty($login)){
$check_akses = select($pdo,"SELECT * FROM `akses_user` WHERE `user_id`='$user_id' "); 
$check_akses->execute();
$row_akses = row($check_akses);
if($row_akses >= 1){
	while($akses = fetch_obj($check_akses)){
		$kode_akses[] = $akses->kode;
		$kode_akses_string .= "%".$akses->kode;
	}
}  
}


$check_akses = select($pdo,"SELECT * FROM `data_soal` WHERE `harga`<=0 "); 
$check_akses->execute();
$row_akses = row($check_akses);
if($row_akses >= 1){
	while($akses = fetch_obj($check_akses)){
		
		$kode_akses[] = $akses->kode_soal;
		$kode_akses_string .= "%".$akses->kode_soal;
	}
}  

$check_akses = select($pdo,"SELECT * FROM `materi` WHERE `harga`<=0 "); 
$check_akses->execute();
$row_akses = row($check_akses);
if($row_akses >= 1){
	while($akses = fetch_obj($check_akses)){
		
		$kode_akses[] = $akses->kode;
		$kode_akses_string .= "%".$akses->kode;
	}
}  




	}  
}


?>

