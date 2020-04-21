<?php 
$asal_kota = $master->id_kota;
$name_k = "";


if(empty($_SESSION['ongkir_'.$kota_tujuan])){
	
$courier = array('jne','pos','tiki','jnt') ;
foreach($courier as $k){
$curl = curl_init();
curl_setopt_array($curl, array(
  CURLOPT_URL => "http://pro.rajaongkir.com/api/cost",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => "origin=$asal_kota&originType=city&destination=$kota_tujuan&destinationType=city&weight=1&courier=$k",
  CURLOPT_HTTPHEADER => array(
    "content-type: application/x-www-form-urlencoded",
    "key: 7f2a37d576a1448fa9d1c370321315a5"
  ),
));



$response = curl_exec($curl);
$err = curl_error($curl);
curl_close($curl);


if (!$err) {
  $datas =  json_decode($response, true);
  if(!empty($datas['rajaongkir']['results'])){
  
  $result = $datas['rajaongkir']['results'];
  $costs = $result[0]['costs'];
  $type = $result[0]['code'];

  
  if(!empty( $result[0]['costs'])){
  
	foreach($costs as $c){
		$price=$c['cost'][0]['value'];
		if($price >= 1){
			$name_k .= "<option value='".strtoupper($type)."_".$c['service']."_".$price."'  >".strtoupper($type)." ".$c['service']." - Rp. ".uang($price)."</option>";
		}
	}
  }
  }
  
}
}

$kurir  = $name_k;  
$_SESSION['ongkir_'.$kota_tujuan] = $kurir; 
} else {
$kurir  = $_SESSION['ongkir_'.$kota_tujuan];
}


?>