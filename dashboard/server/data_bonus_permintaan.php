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


$aColumns = array('nama_barang','alamat','penerima','status','id');
$sIndexColumn = "id";
$sTable = "data_bonus_permintaan";
include("master_filter.php");

?>
	


