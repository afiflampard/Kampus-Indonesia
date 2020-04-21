<?php
$u = date('ymdhis').rand(0,999);
$target_dir = "../image/";
if(!empty($_FILES['image'])){
$uploadOk = 1;
$ex = strtolower(pathinfo(basename($_FILES["image"]["name"]),PATHINFO_EXTENSION));
$nm = $u.".".$ex;
$target_file = $target_dir .$nm;
 


if($ex != "jpg" && $ex != "png" && $ex != "bmp" && $ex != "jpeg" ) {
	$uploadOk = 0;
}

if ($uploadOk == 1) {
	if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
		$image = $nm;
    }  
}
}

?>