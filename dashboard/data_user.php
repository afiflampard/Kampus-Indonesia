<?php 
$login = "";



if((!empty($_COOKIE['user_id'])) and (!empty($_COOKIE['password']))){
	$return = "false";

	$user_id = in($_COOKIE['user_id']);
	$password = in($_COOKIE['password']);
	
	$check_master = select($pdo,"SELECT * FROM `user` WHERE `user_id`='$user_id' and `password`='$password'  "); 
	$check_master->execute();
	$row_master = row($check_master);
	if($row_master >= 1){
	$login = "yes";
	$user = fetch_obj($check_master); 
	

	}  else{
		echo("$user_id") ; 
		echo("$password") ; 
		
	}

	
	
	
}else {?> 
<script>  document.location.href="../";   </script>  
<?php } ?>

