<?php
$u = date('ymd');
$target_dir = "../materi/";
if(!empty($_FILES['file'])){
$target_file = $target_dir .$u.basename($_FILES["file"]["name"]);
$uploadOk = 1;
$ex = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
 
if($ex <> "php"){

	if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
		$file = $u.basename($_FILES["file"]["name"]);
	}  
}
}

?>
