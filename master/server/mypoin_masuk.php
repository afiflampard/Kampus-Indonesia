<?php
session_start();
include("../../a_con.php");
require_once("../data_user.php");


error_reporting(0);
$wheres = " `status`='Sedang Di Proses' ";
$orders = " `id` DESC ";


if(!empty($_GET['filter'])){
	$wheres = $_GET['filter'];
}  



$aColumns = array('nama_barang','user_id','alamat','penerima','id');
$sIndexColumn = "id";
$sTable = "data_bonus_permintaan";
include("master_filter.php");

?>
	


