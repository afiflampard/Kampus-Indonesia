<?php
require_once("../a_con.php"); 

$upload_dir = '../image/';
$u =  date('ymdhis');
$target_dir = "../image/" ;



if(!empty($_FILES['file'])){
	
$target_file = $target_dir .$u.basename($_FILES["file"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
 
$ex = strtolower($imageFileType);
		
if($ex != "jpg" && $ex != "png" && $ex != "bmp" && $ex != "jpeg" ) {
	$uploadOk = 0;
}


$file = $u.basename($_FILES["file"]["name"]);
$name = $u.basename($_FILES["file"]["name"]);


		
if ($uploadOk == 1) {
    if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
		eksekusi($pdo,"INSERT INTO `list_image` (`image`) VALUES ('$name') ");
	} 
} 

}  


?>





