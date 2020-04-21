<?php
session_start();
include("../../a_con.php");
require_once("../data_user.php");


error_reporting(0);
$wheres = " `status_bukti`='Diterima' ";
$orders = " `id` DESC ";


if(!empty($_GET['filter'])){
	$wheres = $_GET['filter'];
}  



$aColumns = array('date','expired','judul','invoice','koin','total_pembayaran','bukti','id');
$sIndexColumn = "id";
$sTable = "invoice";
include("master_filter.php");

?>
	


