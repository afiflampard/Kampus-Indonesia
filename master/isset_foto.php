<?php
$u = date('ymdhis');
$target_dir = "../image_materi/";
if(!empty($_FILES['image'])){
$target_image = $target_dir .$u.basename($_FILES["image"]["name"]);
$uploadOk = 1;
$ex = strtolower(pathinfo($target_image,PATHINFO_EXTENSION));
 
if(($ex == "png") or($ex == "jpeg") or($ex == "jpg") or($ex == "bmp")){

	if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_image)) {
		$image = $u.basename($_FILES["image"]["name"]);
	}  
}
}

?>
