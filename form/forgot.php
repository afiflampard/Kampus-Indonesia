<?php 

if(isset($_POST['forgot'])){
	 
	 $email = in($_POST['email']);
	 
	$check_user = select($pdo,"SELECT * FROM `user` WHERE `email`='$email' "); 
	$check_user->execute();
	$row_user = row($check_user);
	if($row_user >= 1){
		$u = fetch_obj($check_user);
		$nama = $u->nama;
		$user_id = $u->user_id;
		$password = $u->password;
		$kode_ref = $u->kode_referral;
		
		
		$pesan_tambahan = $email_settings->forgot;
		$pesan = '<div class=""  style="background: #f9f9f9; padding:10px;" >
		<table  style="width : 100%; margin:0px !important; " >
			<thead>
			<tr  style="background: #f9f9f9; " > 
				<th  style="border:1px solid gainsboro; padding:5px;"> Email</th>
				<th  style="border:1px solid gainsboro; padding:5px;"> User ID</th>
				<th  style="border:1px solid gainsboro; padding:5px;"> Password </th>
			</tr>
			</thead>
			<tbody>
			<tr>  
				<td  style="border:1px solid gainsboro; padding:5px;"> '.$email.' </td>
				<td  style="border:1px solid gainsboro; padding:5px;"> '.$user_id.' </td>
				<td  style="border:1px solid gainsboro; padding:5px;"> '.$password.' </td>
			</tr>
			</tbody>
		</table> 
		</div> ';
		
		$data = sendsms($email,$nama,$pesan." <br> ".$pesan_tambahan,"Forgot Password");
		if($data == "ok"){
		$alert = "success";
		$respon = "Kami Sudah Mengirimkan Kode Authentication Anda Ke Alamat Email Yang Terdaftar. Silahkan Periksa Email Anda. ";
		} else {
		$alert = "warning";
		$respon = "Kami Melihat Sistem Gagal Mengirim Email Ke Alamat Email Anda . Pastikan Alamat Email Anda Valid / Jaringan Internet Anda Stabil.  Terima Kasih";		
		}
		
		
		 
	}  else {
		$alert = "danger";
		$respon = "Email Ini Tidak Terdaftar";
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
			<span class="input-group-text"><i class="fa fa-envelope"></i></span>
		  </div>
		  <input class="form-control" placeholder="Masukkan Email Anda" name="email" type="text">
		</div>
	  </div>
	  
	  <div class="custom-control custom-control-alternative custom-checkbox">
		<input class="custom-control-input" id=" customCheckLogin" type="checkbox">
		<label class="custom-control-label" for=" customCheckLogin"><span>Remember me</span></label>
	  </div>
	  <div class="text-center">
		<button type="submit" name="forgot" class="btn btn-primary my-4">Send Password</button>
	  </div>
	</form>
  </div>
</div>
<div class="row mt-3">
  <div class="col-6">
	<a href="<?php echo($site) ?>/login" class="text-white"><small>Login Now</small></a>
  </div>
  <div class="col-6 text-right">
	<a href="<?php echo($site) ?>/register" class="text-white"><small>Create new account</small></a>
  </div>
</div>
</div>
</div>
</div>


