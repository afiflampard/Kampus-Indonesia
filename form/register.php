<?php 

if(!empty($_SESSION['r'])){
	$r = $_SESSION['r'];  
} else {
	$r = "Admin";
}



if(isset($_POST['daftar'])){
	$user_id = in($_POST['user_id']);
	$password = in($_POST['password']);
	$email = in($_POST['email']);
	$nama = in($_POST['nama']);
	$telepon = in($_POST['telepon']);
	$whatsapp = in($_POST['whatsapp']);
	$return = "true";
	$kode_ref = generate(20);
	$kategori_tryout = in($_POST['kategori_tryout']);
	 
	
	$check_email = select($pdo,"SELECT * FROM `user` WHERE `email`='$email' "); 
	$check_email->execute();
	$row_email = row($check_email);
	if($row_email >= 1){
		$return = "false";
		$alert = "danger";
		$respon = "Email Ini Sudah Terdaftar Sebelumnya";
	}  
	
	
	$check_email = select($pdo,"SELECT * FROM `user` WHERE `user_id`='$user_id' "); 
	$check_email->execute();
	$row_email = row($check_email);
	if($row_email >= 1){
		$alert = "danger";
		$respon = "User ID Ini Sudah Ada. Coba Lagi";
	$return = "false";
	}  
	

	if($return == "true"){
		eksekusi($pdo,"INSERT INTO `user`
		( `user_id`, `password`, `email`, `nama`, `telepon`, `wa`, `kategori_tryout`) VALUES 
		('$user_id','$password','$email','$nama','$telepon','$whatsapp','$kategori_tryout') ");
	
		$alert = "success";
		$respon = "Selamat Akun Anda Sudah Kami Buat. Silahkan Login ";		
		$name_web = $master->name;
		$harga = $master->harga_poin;
		
		$unik = 1;
		$check_unik = select($pdo,"SELECT MAX(`kode_unik`) as kode_unik FROM invoice WHERE status='Menunggu Pembayaran' "); 
		$check_unik->execute();
		$row_unik = row($check_unik);
		if($row_unik >= 1){
			$u = fetch_obj($check_unik); 
			$unik = $u->kode_unik + 1;
		}  
		
		$total = $harga+$unik;
		
		$invoice = "INV-".date('Ymdhis').rand(0,99);
		eksekusi($pdo,"INSERT INTO `invoice`
		(`judul`, `total`,  `kode_unik`, `total_pembayaran`, `status`, `user_id`, `date`, `invoice`) VALUES 
		('Pendaftaran Member $name_web','$harga','$unik','$total','Menunggu Pembayaran','$user_id','$date','$invoice') ");
		
		
	} 
}

?>
		<div class="container pt-lg-md">
        <div class="row justify-content-center">
          <div class="col-lg-5">
		  <div class="" align="center">
			<i class="fa fa-edit"  style="font-size : 80px; color:white;" >  </i>
		</div>
		
            <div class="card bg-secondary shadow border-0">
              <div class="card-body"> 
			  <form method="post" enctype="multipart/form-data"> 
				
				 <h4> Daftar Akun Baru</h4> 
				<p> Lengkapi Formulir Dengan Benar</p>    
				  
							<div class="input-group">
								<input type="text" class="form-control" name="email" placeholder="Your Email Address">
								<span class="md-line"></span>
							</div> <br />
							 
					
							<div class="input-group">
								<input type="text" name="user_id" class="form-control" placeholder="User ID" required="">
							</div>  <br />
							
							
							<div class="input-group">
								<input type="text" name="password" class="form-control" placeholder="Password Login" required="">
							</div>  <br />
							
							
							<div class="input-group">
								<input type="text" name="nama" class="form-control"placeholder="Nama Anda" required="">
							</div>  <br />
							
							
							<div class="input-group">
								<input type="text" name="whatsapp" class="form-control" placeholder="Whatsapp Anda " required="">    
							</div>  <br />
							
							
							<div class="input-group">
								<input type="text" name="telepon" class="form-control" placeholder="Telepon " required="">     
							</div>   <br />
							
							
							<div class="input-group">
								<select type="text"  class="form-control" name="kategori_tryout" required="">   
									<option>PKN STAN REGULER</option>
									<option>DIII STAN TUGAS BELAJAR</option>
									<option>DIV STAN TUGAS BELAJAR</option>
									<option>PERGURUAN TINGGI KEDINASAN</option>
									<option>CPNS UMUM</option>
								</select>
							</div>   
							
				  
                  <div class="text-center">
                    <button type="submit" name="daftar" class="btn btn-primary my-4">Daftar Sekarang</button>
                  </div>
                </form>
              </div>
            </div>
            <div class="row mt-3">
              <div class="col-6">
                <a href="<?php echo($site) ?>/forgot" class="text-white"><small>Forgot password?</small></a>
              </div>
              <div class="col-6 text-right">
                <a href="<?php echo($site) ?>/login" class="text-white"><small>Login Now</small></a>
              </div>
            </div>
          </div>
        </div>
      </div>
	  
		
		