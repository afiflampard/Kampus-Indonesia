<?php
session_start();
include("../../a_con.php");
require_once("../data_user.php");


error_reporting(0);
$wheres = " `id`<>'-1' ";
$orders = " `id` DESC ";


if(!empty($_GET['kategori'])){
	$wheres = " `kategori` ='".$_GET['kategori']."' ";
}  

if(!empty($_GET['kode'])){
	$wheres .= " and `kode_soal` ='".$_GET['kode']."' ";
}  


$aColumns = array('ranking','nama','asal_sekolah','`group`','jurusan','kemenkeu','keterangan_poin','total_poin','lulus','id');
$sIndexColumn = "id";
$sTable = "ranking";
include("master_filter.php");

?>
	


