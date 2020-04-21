<?php
$u = date('ymdhis');
$target_dir = "file_soal/";
if(!empty($_FILES['soal'])){
$target_soal = $target_dir .$u.basename($_FILES["soal"]["name"]);
$uploadOk = 1;
$ex = strtolower(pathinfo($target_soal,PATHINFO_EXTENSION));
 
if(($ex == "xls") or($ex == "csv") or($ex == "xlsx") or($ex == "csvx")){

	if (move_uploaded_file($_FILES["soal"]["tmp_name"], $target_soal)) {
		$soal = $u.basename($_FILES["soal"]["name"]);
	}  
}
}

?>
