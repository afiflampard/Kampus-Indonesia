<?php
session_start();
include("../../a_con.php");
require_once("../data_user.php");
error_reporting(0);

$wheres = " `user_id`='$user_id' ";
$orders = " `id` DESC ";


if(!empty($_GET['filter'])){
	$wheres = $_GET['filter'];
}  


$aColumns = array('date','expired','invoice','judul','kupon','total','kode_unik','total_pembayaran','koin','status','bukti','status_bukti','id');
$sIndexColumn = "id";
$sTable = "invoice";
include("master_filter.php");

?>
	


