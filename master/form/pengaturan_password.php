<?php 


if(isset($_POST['change_password'])){
	$user_id_new = in($_POST['user_id_new']);
	$password_new = in($_POST['password_new']);
	$password_new_2 = in($_POST['password_new_2']);
	$password_old = in($_POST['password_old']);
	$id_user = $user->id;
	
	
	if((!empty($user_id_new)) and (!empty($password_new))){
	if($password_old == $user->password){
		if($password_new == $password_new_2){
			eksekusi($pdo,"UPDATE `admin` SET `password`='$password_new' ,`user_id`='$user_id_new' WHERE `id`='$id_user' ");
			
			$_SESSION['master_user_id']=$user_id_new; 
			$_SESSION['master_password']=$password_new; 
			
			
			
		} else {
			$alert = "danger";
			$respon = "Maaf . Password Baru 1 Tidak Sama Dengan Password Baru 2";
		}
	} else {
		$alert = "danger";
		$respon  = "Maaf . Password Lama Salah";
	}
	} else {
		$alert = "danger";
		$respon  = "Maaf . User ID Atau Password Masih Kosong";
	}

	
} 

?>
<div class="row">
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1    p-1 ">
<div class="card">
<div class="card-header"><h5>Edit Password</h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data"> 
	<?php  if(!empty($alert)){ ?>
		<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
		<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Respon !</strong> <?php echo($respon) ;  ?> 
	</div> <?php }  ?>			
	

	<label> New User ID </label> 
	<input type="text" required class="form-control" name="user_id_new"  value="<?php echo($user->user_id) ;  ?>"    placeholder="New User ID "    />
	<br />
	<label> New Password </label> 
	<input type="password" required class="form-control" name="password_new"   placeholder="New Password "    />
	<br />
	<label> New Password Confirmation</label> 
	<input type="password" required class="form-control" name="password_new_2"  placeholder="New Password Confirmation"    />
	<br />
	<label> Old Password Confirmation </label> 
	<input type="text" equired class="form-control" name="password_old"   placeholder="Old Password Confirmation"    />
	<br />
	
	<br /> 
	
	<button type="submit" name="change_password" class="btn btn-success" >Edit Password</button>  

</form>

</div>
</div>
</div>
</div>
</div>




