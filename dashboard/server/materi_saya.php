<?php
session_start();
include("../../a_con.php");
require_once("../data_user.php");


error_reporting(0);

//echo($kode_akses_string) ; 


$wheres = " `harga`<='0' or `kode` IN ('" . implode( "', '" , $kode_akses ) . "')";
$orders = " `id` DESC ";


if(!empty($_GET['filter'])){
	$wheres = $_GET['filter'];
}  

					
$aColumns = array('tanggal','judul', 'kategori','harga','id','kode');
$sIndexColumn = "id";
$sTable = "materi";
include("master_filter.php");

?>
	


