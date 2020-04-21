<?php
session_start();
include("../../a_con.php");
require_once("../data_user.php");


error_reporting(0);

$wheres = " `harga`<='0' or `kode_soal` IN ('" . implode( "', '" , $kode_akses ) . "')";
$orders = " `id` DESC ";


if(!empty($_GET['filter'])){
	$wheres = $_GET['filter'];
}  

					
$aColumns = array('judul', 'harga','kategori','waktu','lulus','soal','id','kode_soal');
$sIndexColumn = "id";
$sTable = "data_soal_biasa";
include("master_filter.php");

?>
	


