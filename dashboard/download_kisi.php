<?php 
session_start();
require_once("../a_con.php");
require_once("data_user.php");

if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 


$check_kisi = select($pdo,"SELECT * FROM `data_tutorial_soal` WHERE `id`='$id'  "); 
$check_kisi->execute();
$row_kisi = row($check_kisi);
if($row_kisi >= 1){
	$kisi = fetch_obj($check_kisi); 
	$kode = $kisi->kode_soal;
	
	$check_kisi = select($pdo,"SELECT * FROM `data_soal` WHERE `kode_soal`='$kode' "); 
	$check_kisi->execute();
	$row_kisi = row($check_kisi);
	if($row_kisi >= 1){
		$soal = fetch_obj($check_kisi); 
		$harga = $soal->harga;
		
		if((in_array($kode,$kode_akses)) or ($soal->harga <= 0)){
			
					
		$path = "../kisi_kisi/";
		$filename = $path.$kisi->file;

        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename="'.basename($filename).'"');
        header('Pragma: public'); 
		flush();  
		readfile($filename);
        exit;
		

		} else {echo("Anda Tidak Di Izinkan Membuka Kisi Kisi Ini . Silahkan Membeli Terlebih Dahulu") ; }
		
	}   else {echo("Soal Tidak Ditemukan") ; }
} else {echo(" Kisi Kisi Tidak Ditemukan") ; }
} else {echo(" Parameter Kosong ") ; }
?>