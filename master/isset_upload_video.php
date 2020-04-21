<?php
require_once("../a_con.php"); 

$upload_dir = '../video/';
$u = "";
$target_dir = "../video/" ;


if(!empty($_FILES['file'])){
$target_file = $target_dir .$u.basename($_FILES["file"]["name"]);
 
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
 
$ex = strtolower($imageFileType);
		
if($ex <> "mp4" ){
	$uploadOk = 0;
}


$file = basename($_FILES["file"]["name"]);
$name = basename($_FILES["file"]["name"]);


		
if ($uploadOk == 1) {
    if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
		eksekusi($pdo,"INSERT INTO `list_video` (`video`) VALUES ('$name') ");
		echo("Video Dimasukkan") ; 
	} 
}  else {
	echo("Data Tidak Ditemukan") ; 
}

 
} else {
	echo("File Tidak Ditemukan") ; 
}


?>





