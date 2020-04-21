<?php 
function sendsms($email,$nama,$pesan,$judul){
// Cara Penggunaan Email = 
// Buat Akun GMAIL . 
// Setelah Itu . Klik Link Di Bawah Ini 
// https://myaccount.google.com/lesssecureapps?utm_source=google-account&utm_medium=web 
// Aktifkan Fitur Aplikasi Tidak Aman 
// Isi Akun Gmail Dibawah Ini 
 
$email_pengirim = "";
$password_pengirim = "";
$nama_pengirim = ""; 


$data = "
<div class=''  style='width : 800px;padding:20px; max-width:100%; background: #f9f9f9; border:1px solid gainsboro ; ' >
	<h1> Pesan Dari - $nama_pengirim </h1> 
	<hr>
	<p> <b> Hai $nama  </b> </p>
	$pesan 
</div> ";




if((!empty($email_pengirim)) && (!empty($password_pengirim))){
include "classes/class.phpmailer.php";
$mail = new PHPMailer; 
$mail->IsSMTP();
$mail->SMTPSecure = 'tls'; 
$mail->Host = "smtp.gmail.com"; //host masing2 provider email
$mail->SMTPDebug = 2;
$mail->Port = 587;
$mail->SMTPAuth = true;
$mail->Username = $email_pengirim; //user email
$mail->Password = $password_pengirim; //password email 
$mail->SetFrom($email_pengirim,$nama_pengirim); //set email pengirim
$mail->Subject =  $judul ; //subyek email
$mail->AddAddress($email,$nama);  //tujuan email
$mail->MsgHTML($data);
if($mail->Send()){
	return "ok";
} else {
	return "Pesan gagal dikirim ke email - ".$email;
}
} else {
	return sendsms_demo($email,$nama,$pesan,$judul);
}
}








function sendsms_demo($email,$nama,$pesan,$judul){
$return = "no";
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL,"http://lapak-website.com/api/kirim_pesan_demo.php");
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS,"email=$email&nama=$nama&pesan=$pesan&judul=$judul");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$out = curl_exec($ch);
if(!empty($out)){
$result = json_decode($out);
$return = ($result->return) ; 
$message = $result->message; 
} else {
$return = "Pengiriman Ke Server Mail Lapak Website Gagal - Tidak Ada Respon";
}
return $return;
}

 
 
?>

