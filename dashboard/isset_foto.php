<?php
$u = date('ymdhis');
$target_dir = "../image/";
if(!empty($_FILES['foto'])){
$target_foto = $target_dir .$u.basename($_FILES["foto"]["name"]);
$uploadOk = 1;
$ex = strtolower(pathinfo($target_foto,PATHINFO_EXTENSION));
 
if(($ex == "png") or($ex == "jpeg") or($ex == "jpg") or($ex == "bmp")){

	if (move_uploaded_file($_FILES["foto"]["tmp_name"], $target_foto)) {
		$foto = $u.basename($_FILES["foto"]["name"]);
	}  
}
}

?>
