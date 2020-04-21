<?php
session_start();


include("../../a_con.php");
$upload_dir = '../../galery/';

if (!empty($_FILES))  { 

$w = "640";
$width = "640";

$h = "360";
$height = "360";

$time = time("sihdmy");
$tmp_names = $_FILES["file"]["tmp_name"];
$names = $time.$_FILES["file"]["name"];


$im = explode(".", ($names));
foreach($im as $new) {
	$ext = trim($new);
}



$extensionList = array("bmp", "jpg", "gif", "png", "jpeg","BMP","PNG","JPEG","JPG","GIF","Jpeg","Png","Gif","Bmp","Jpg");
if (in_array($ext, $extensionList)) {

	
list($w, $h) = getimagesize($_FILES["file"]["tmp_name"]);
  /* calculate new image size with ratio */
  $ratio = max($width/$w, $height/$h);
  $h = ceil($height / $ratio);
  $x = ($w - $width / $ratio) / 2;
  $w = ceil($width / $ratio);
  /* new file name */
  $path = $upload_dir.$names;
  /* read binary data from image file */
  $imgString = file_get_contents($_FILES["file"]["tmp_name"]);
  /* create image from string */
  $image = imagecreatefromstring($imgString);
  $tmp = imagecreatetruecolor($width, $height);
  imagecopyresampled($tmp, $image,
    0, 0,
    $x, 0,
    $width, $height,
    $w, $h);
  /* Save image */
  switch ($_FILES["file"]['type']) {
    case 'image/jpeg':
      imagejpeg($tmp, $path, 100);
      break;
    case 'image/png':
      imagepng($tmp, $path, 0);
      break;
    case 'image/gif':
      imagegif($tmp, $path);
      break;
    default:
      exit;
      break;
  }
  
  /* cleanup memory */
  

  imagedestroy($image);
  imagedestroy($tmp);

$filesname = $names;
$check_loc = select($pdo,"SELECT * FROM `galery` WHERE `foto`='$filesname'  "); 
$check_loc->execute();
$row_loc = row($check_loc);

if($row_loc <= 0){
eksekusi($pdo,"INSERT INTO `galery`(`foto`) VALUES('$filesname') ");
}


		 
	 
	 
	
}
}

?>

