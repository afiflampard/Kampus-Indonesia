<?php
session_start();
include("../../a_con.php");
require_once("../data_user.php");
$kode_ref = $user->kode_referral;


error_reporting(0);
$wheres = " `referral`='$kode_ref' ";
$orders = " `id` DESC ";




$aColumns = array('nama','gelar','sekolah','jurusan','`group`','id');
$sIndexColumn = "id";
$sTable = "user";
include("master_filter.php");

?>
	


