<?php 
$link = "image/";
 
$url=$link.$_GET['img'];
$tmp_names =$link.$_GET['img'];
 



$extensionList = array("bmp", "jpg", "gif", "png", "jpeg","webp");
$pecah = explode(".", $url);

foreach($pecah as $new) {
	$new = trim($new);
	$ekstensi = strtolower($new);
}



$height = $_GET['h'];
$width =$_GET['w'];


if (in_array($ekstensi, $extensionList))
{

list($w, $h) = getimagesize($url);
  /* calculate new image size with ratio */
  $ratio = max($width/$w, $height/$h);
  $h = ceil($height / $ratio);
  $x = ($w - $width / $ratio) / 2;
  $w = ceil($width / $ratio);
  /* new file name */
  /* read binary data from image file */
  $imgString = $url;
  /* create image from string */

  switch ($ekstensi) {
    case 'jpeg':
	$image = imagecreatefromjpeg($imgString);
	break;
    case 'jpg':
	$image = imagecreatefromjpeg($imgString);
	break;
    case 'png':
	$image = imagecreatefrompng($imgString);
	break;
    case 'gif':
	$image = imagecreatefromgif($imgString);
	break;
	default:
      exit;
      break;
  }
  
  
  

$tmp = imagecreatetruecolor($width, $height);
imagealphablending($tmp, false);
imagesavealpha($tmp, true);

  imagecopyresampled($tmp, $image,
    0, 0,
    $x, 0,
    $width, $height,
    $w, $h);
  /* Save image */
  
  switch ($ekstensi) {
    case 'jpeg':
    header('Content-Type: image/jpeg');
      imagejpeg($tmp);
      break;
    case 'jpg':
    header('Content-Type: image/jpeg');
      imagejpeg($tmp);
      break;
    case 'png':
    header('Content-Type: image/png');
      imagepng($tmp);
      break;
    case 'gif':
    header('Content-Type: image/gif');
      imagegif($tmp);
      break;
    default:
      exit;
      break;
  }
  
}  


?>