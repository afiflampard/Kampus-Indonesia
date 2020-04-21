<?php 
/* session_start();
$_SESSION['e_email'] = "indra.novhyta@gmail.com"; 
$_SESSION['e_name'] = "Indra Rani"; 
$_SESSION['e_message'] = "Ini Adalah Pesan Indra" ; 
 */
 
$ch = curl_init(); 

$to = $_SESSION['e_email'];
$from = "administrator@garudagenius.com";
$message = $_SESSION['e_pesan']; 
$name = $_SESSION['e_nama']; 



curl_setopt($ch, CURLOPT_URL, "https://api.mailjet.com/v3.1/send");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, "{\n    \"Messages\":[\n      {\n        \"From\": {\n          \"Email\": \"administrator@garudagenius.com\",\n          \"Name\": \"Garuda Genius\"\n        },\n        \"To\": [\n          {\n            \"Email\": \"$to\",\n            \"Name\": \"$name\"\n          }\n        ],\n        \"TemplateID\": 475014,\n        \"TemplateLanguage\": true,\n        \"Subject\": \"Informasi Dari Garuda Genius\",\n        \"Variables\": {\n    \"message\": \"$message\"\n    }\n      }\n    ]\n\t\n\t\n  }");
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_USERPWD, "e65dc25d29503e0b70dd8fa639c80f2c:e66545e0ae52b95f58da94cedf9a119d");

$headers = array();
$headers[] = "Content-Type: application/json";
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

$result = curl_exec($ch);
if (curl_errno($ch)) {
    $alert = "danger"; 
	$respon= curl_error($ch);
}

curl_close ($ch);

?>
