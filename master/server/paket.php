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


$aColumns = array('nama_paket','harga', 'kode_soal','id');
$sIndexColumn = "id";
$sTable = "paket_poin";
include("master_filter.php");

?>
	


