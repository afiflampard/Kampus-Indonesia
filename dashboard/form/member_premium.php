<?php 
	$check_inv = select($pdo,"SELECT * FROM `invoice_premium` WHERE `user_id`='$user_id'  "); 
	$check_inv->execute();
	$row_inv = row($check_inv);
	if($row_inv >= 1){
		$data = fetch_obj($check_inv); 
		$inv = $data->invoice;
		require_once("member_premium_invoice.php");
		
	}  else {
		require_once("member_premium_daftar.php");
	}
	
?>