<?php
session_start();
include("../../a_con.php");
require_once("../data_user.php");


error_reporting(0);
$wheres = " `status_bukti`='Diterima' and status='Terkirim' ";
$orders = " `id` DESC ";


if(!empty($_GET['filter'])){
	$wheres = $_GET['filter'];
}  

$aColumns = array('nama_penerima','nama_buku','total','alamat','kurir','resi','id');
$sIndexColumn = "id";
$sTable = "invoice_buku";
include("master_filter.php");

?>
	


