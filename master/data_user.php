<?php 
$login = "";
$akses = array();

if((!empty($_COOKIE['master_user_id'])) and (!empty($_COOKIE['master_password']))){
	$return = "false";

	$user_id = in($_COOKIE['master_user_id']);
	$password = in($_COOKIE['master_password']);
	
	$check_master = select($pdo,"SELECT * FROM `admin` WHERE `user_id`='$user_id' and `password`='$password'  "); 
	$check_master->execute();
	$row_master = row($check_master);
	if($row_master >= 1){
	 $login = "yes";
	$user = fetch_obj($check_master); 
	
	
	}  else{
		?> 
		<script>  document.location.href="../";   </script>  
		<?php 
	}

		
	
	
	
}else {?> 
<script>  document.location.href="../";   </script>  
<?php }


?>

