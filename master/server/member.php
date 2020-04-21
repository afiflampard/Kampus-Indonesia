<?php
session_start();
include("../../a_con.php");
require_once("../data_user.php");


error_reporting(0);
$wheres = " `id`<>'-1' ";
$orders = " `id` DESC ";


if(!empty($_GET['filter'])){
	$wheres = $_GET['filter'];
}  

					
$aColumns = array('nama','user_id','password','email', 'telepon','wa','kategori_tryout','id');
$sIndexColumn = "id";
$sTable = "user";
include("master_filter.php");

?>
	


