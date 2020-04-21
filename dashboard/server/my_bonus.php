<?php
session_start();
include("../../a_con.php");
require_once("../data_user.php");


$kode_ref = $user->kode_referral;
error_reporting(0);
$wheres = " `user_id`='$kode_ref' ";
$orders = " `id` DESC ";




$aColumns = array('date','`from`','keterangan','bonus','id');
$sIndexColumn = "id";
$sTable = "riwayat_bonus";
include("master_filter.php");

?>
	


