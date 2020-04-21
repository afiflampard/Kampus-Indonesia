<?php
session_start();
include("../../a_con.php");
require_once("../data_user.php");


error_reporting(0);
$wheres = " `id`<>'-1' ";
$orders = " `id` DESC ";

$mini = "No";
if(!empty($_GET['mini'])){ 
$mini = in($_GET['mini']); 
}
 


if(!empty($_GET['kategori'])){
	$wheres .= " and `kategori`='".$_GET['kategori']."' and mini='$mini' ";
}  else{
	$wheres .= " and `mini`='$mini' ";
}

					
$aColumns = array('judul', 'kategori','kategori_soal','waktu_1','waktu_2','waktu_3','lulus_1','lulus_2','lulus_3','soal_1','soal_2','soal_3','active','id');
$sIndexColumn = "id";
$sTable = "data_soal";
include("master_filter.php");

?>
	


