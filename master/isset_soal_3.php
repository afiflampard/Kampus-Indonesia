<?php
$u = date('ymdhis');
$target_dir = "file_soal/";
if(!empty($_FILES['soal_3'])){
$target_soal_3 = $target_dir .$u.basename($_FILES["soal_3"]["name"]);
$uploadOk = 1;
$ex = strtolower(pathinfo($target_soal_3,PATHINFO_EXTENSION));
 
if(($ex == "xls") or($ex == "csv") or($ex == "xlsx") or($ex == "csvx")){

	if (move_uploaded_file($_FILES["soal_3"]["tmp_name"], $target_soal_3)) {
		$soal_3 = $u.basename($_FILES["soal_3"]["name"]);
	}  
}
}

?>
