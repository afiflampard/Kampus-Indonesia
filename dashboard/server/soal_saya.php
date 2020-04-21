<?php
session_start();
include("../../a_con.php");
require_once("../data_user.php");


error_reporting(0);
$mini = "No";
if(!empty($_GET['mini'])){ 
$mini = in($_GET['mini']); 
}

 
$kategori_tryout = $user->kategori_tryout;
$wheres = "  `kategori_soal` = '$kategori_tryout' and mini='$mini' and active='Yes' ";
$orders = " `id` DESC ";


if(!empty($_GET['filter'])){
	$wheres = $_GET['filter'];
}  


$aColumns = array('judul', 'kategori','waktu_1','waktu_2','waktu_3','lulus_1','lulus_2','lulus_3','soal_1','soal_2','soal_3','id','kode_soal');
$sIndexColumn = "id";
$sTable = "data_soal";
include("master_filter.php");

?>
	


