<?php
$u = date('ymdhis');
$target_dir = "file_soal/";
if(!empty($_FILES['soal_2'])){
$target_soal_2 = $target_dir .$u.basename($_FILES["soal_2"]["name"]);
$uploadOk = 1;
$ex = strtolower(pathinfo($target_soal_2,PATHINFO_EXTENSION));
 
if(($ex == "xls") or($ex == "csv") or($ex == "xlsx") or($ex == "csvx")){

	if (move_uploaded_file($_FILES["soal_2"]["tmp_name"], $target_soal_2)) {
		$soal_2 = $u.basename($_FILES["soal_2"]["name"]);
	}  
}
}

?>
