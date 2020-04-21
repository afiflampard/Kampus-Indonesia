<?php
session_start();
include("../../a_con.php");
require_once("../data_user.php");


error_reporting(0);
$wheres = " `id`<>'-1' ";
$orders = " `id` DESC ";


if(!empty($_GET['kode'])){
	$wheres = "`kode_soal`= '".$_GET['kode']."'";
}  


					
$aColumns = array('file','id');
$sIndexColumn = "id";
$sTable = "data_tutorial_soal";
include("master_filter.php");

?>
	


