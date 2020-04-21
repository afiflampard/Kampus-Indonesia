<?php 
header("Content-type:application/json");
require_once('../a_con.php');
$no = array();
$result = array();


$response = "error";
$message = "Maaf. Terjadi Kesalahan Saat Mengirim Respon Ke Server ";
$data = array();


$provinsi = "";
if(!empty($_GET['provinsi'])){ 
$provinsi = in($_GET['provinsi']); 
}

$check_p = select($pdo,"SELECT * FROM z_provinsi WHERE provinsi='$provinsi' "); 
$check_p->execute();
$row_p = row($check_p);
if($row_p >= 1){
	$p = fetch_obj($check_p); 
	$id_p = $p->id;


		$check_data = select($pdo,"SELECT * FROM z_kabupaten WHERE id_provinsi = '$id_p'  "); 
		$check_data->execute();
		$row_data = row($check_data);
		if($row_data >= 1){
			while($db = fetch_obj($check_data)){
				$data[$db->id] = $db->kabupaten;
			}
		}  
	
		if(count($data) >= 1){
			$response = "success";
		} 
	

 
 
}



 
$result['data'] = $data;
$result['response'] = $response;
$result['message'] = $message;
$result = json_encode($result);
echo($result);

?>