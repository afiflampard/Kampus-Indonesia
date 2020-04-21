<?php
session_start();
include("../../a_con.php");
require_once("../data_user.php");

$mini = "No";
if(!empty($_GET['mini'])){ 
$mini = in($_GET['mini']); 
}
 


error_reporting(0);
$wheres = " `user_id`='$user_id' and mini='$mini' ";
$orders = " `id` DESC ";


if(!empty($_GET['filter'])){
	$wheres = $_GET['filter'];
}  


$aColumns = array( 'date','judul', 'start', 'stop', 'poin_1', 'poin_2', 'poin_3',  'total_poin','lulus_1', 'lulus_2', 'lulus_3',  'kelulusan', 'keterangan','id','kode_soal');
$sIndexColumn = "id";
$sTable = "user_jawab";
include("master_filter.php");

?>
	


