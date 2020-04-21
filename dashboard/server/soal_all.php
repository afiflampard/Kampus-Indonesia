<?php
session_start();
include("../../a_con.php");
require_once("../data_user.php");


error_reporting(0);

//echo($kode_akses_string) ; 

$wheres = "`id`<>'-1' and active='Yes' ";
$orders = " `id` DESC ";


if(!empty($_GET['filter'])){
	$wheres = $_GET['filter'];
}  

					
$aColumns = array('judul', 'harga','kategori','waktu_twk','waktu_tiu','waktu_tkp','lulus_twk','lulus_tiu','lulus_tkp','soal_twk','soal_tiu','soal_tkp','id');
$sIndexColumn = "id";
$sTable = "data_soal";
include("master_filter.php");

?>
	


