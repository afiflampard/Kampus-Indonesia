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


$aColumns = array('date','text','debet','kredit','id');
$sIndexColumn = "id";
$sTable = "notifikasi";
include("master_filter.php");

?>
	


