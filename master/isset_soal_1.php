<?php
$u = date('ymdhis');
$target_dir = "file_soal/";
if(!empty($_FILES['soal_1'])){
$target_soal_1 = $target_dir .$u.basename($_FILES["soal_1"]["name"]);
$uploadOk = 1;
$ex = strtolower(pathinfo($target_soal_1,PATHINFO_EXTENSION));
 
if(($ex == "xls") or($ex == "csv") or($ex == "xlsx") or($ex == "csvx")){

	if (move_uploaded_file($_FILES["soal_1"]["tmp_name"], $target_soal_1)) {
		$soal_1 = $u.basename($_FILES["soal_1"]["name"]);
	}  
}
}

?>
