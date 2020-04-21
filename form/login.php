<?php   
if(isset($_POST['login'])){
	$user_id = in($_POST['user_id']);
	$password = in($_POST['password']); 
	 	
	$check_user = select($pdo,"SELECT * FROM `user` WHERE `user_id`='$user_id' and `password`='$password' "); 
	$check_user->execute();
	$row_user = row($check_user);
	if($row_user >= 1){
		$u = fetch_obj($check_user);  
		$expire = time() + 60*60*24*7;
		setcookie("user_id",$user_id,$expire);
		setcookie("password",$password,$expire);

		$user_id = in($_COOKIE['user_id']);
		$password = in($_COOKIE['password']);
		
		?> 
		<script>  document.location.href="<?php echo($site) ?>/dashboard/index.php";   </script>  
		<?php 
		  
		
		
	}  else {
		$alert = "danger";
		$respon = "Password Salah";
	}
}
?>

<div class="container pt-lg-md">
<div class="row justify-content-center">
<div class="col-lg-5">
<div class="" align="center">
<i class="fa fa-lock"  style="font-size : 80px;color:white;" >  </i>
</div>

<div class="card bg-secondary shadow border-0">
  <div class="card-body"> 
	<form method="post" enctype="multipart/form-data"> 
	  <div class="form-group mb-3">
		<div class="input-group input-group-alternative">
		  <div class="input-group-prepend">
			<span class="input-group-text"><i class="fa fa-github"></i></span>
		  </div>
		  <input class="form-control" placeholder="User ID " name="user_id" type="text">
		</div>
	  </div>
	  <div class="form-group">
		<div class="input-group input-group-alternative">
		  <div class="input-group-prepend">
			<span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
		  </div>
		  <input class="form-control" placeholder="Password" name="password" type="password">
		</div>
	  </div>
	  <div class="custom-control custom-control-alternative custom-checkbox">
		<input class="custom-control-input" id=" customCheckLogin" type="checkbox">
		<label class="custom-control-label" for=" customCheckLogin"><span>Remember me</span></label>
	  </div>
	  <div class="text-center">
		<button type="submit" name="login" class="btn btn-primary my-4">Sign in</button>
	  </div>
	</form>
  </div>
</div>
<div class="row mt-3">
  <div class="col-6">
	<a href="<?php echo($site) ?>/forgot" class="text-white"><small>Forgot password?</small></a>
  </div>
  <div class="col-6 text-right">
	<a href="<?php echo($site) ?>/register" class="text-white"><small>Create new account</small></a>
  </div>
</div>
</div>
</div>
</div>


