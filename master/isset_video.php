<?php
$u = date('ymdhis');
$target_dir = "../video/";
if(!empty($_FILES['video'])){
$target_video = $target_dir .$u.basename($_FILES["video"]["name"]);
$uploadOk = 1;
$ex = strtolower(pathinfo($target_video,PATHINFO_EXTENSION));
 
if(($ex == "mp4") or($ex == "flv") or($ex == "mpeg")){

	if (move_uploaded_file($_FILES["video"]["tmp_name"], $target_video)) {
		$video = $u.basename($_FILES["video"]["name"]);
	}  
}
}

?>
