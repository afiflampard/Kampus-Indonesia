<?php 
session_start();
$_SESSION['user_id']=''; 
$_SESSION['password']=''; 

require_once("../a_con.php");

if(isset($_POST['forgot'])){
	 
	 $email = in($_POST['email']);
	 
	$check_user = select($pdo,"SELECT * FROM `user` WHERE `email`='$email' "); 
	$check_user->execute();
	$row_user = row($check_user);
	if($row_user >= 1){
		$u = fetch_obj($check_user);
		$nama = $u->nama;
		$kode_ref = $u->kode_referral;
		$pesan_tambahan = $email_settings->register;
		$url = $site."/login.php?verification=".$kode_ref;
		$pesan = '<br> Berikut Adalah Link Verifikasi Anda. <br> <a class="" href="'.$url.'" style="padding:10px; padding-left:15px; padding-right:15px; background: #19803e; border-radius:3px; color:white;;border:0px;"  > Klik Disini </a>   ';
		
		$data = sendsms($email,$nama,$pesan."<br>".$pesan_tambahan,"Forgot Password");
		if($data == "ok"){
		$alert = "success";
		$respon = " Kami Sudah Mengirimkan Link Verifikasi Ke Alamat Email Anda . Silahkan Periksa Email Anda. Terima Kasih ";
		} else {
		$alert = "warning";
		$respon = "Kami Melihat Sistem Gagal Mengirim Email Ke Alamat Email Anda . Pastikan Alamat Email Anda Valid / Jaringan Internet Anda Stabil. Jika tidak akun anda tidak dapat diaktifkan. Terima Kasih";		
		}
		
		
	}  else {
		$alert = "danger";
		$respon = "Email Ini Tidak Terdaftar";
	}
	 
} 

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title><?php echo($master->name) ;  ?></title>
  
   <link rel="shortcut icon" href="../image/favicon.png" />

	<link rel="stylesheet" href="../master/assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="../master/assets/vendors/iconfonts/puse-icons-feather/feather.css">
  <link rel="stylesheet" href="../master/assets/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="../master/assets/vendors/css/vendor.bundle.addons.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../master/assets/css/style.css">
  <!-- endinject -->
</head>

<body>

  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper auth-page">
      <div class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
        <div class="row w-100">
          <div class="col-lg-4 mx-auto">
		  
            <div class="auto-form-wrapper">
			
				<div class="" align="center" style="padding-bottom:30px;">
					<img src="../image/logo.png" style="max-width : 50%;" />
				</div>
				
		  <?php  if(!empty($alert)){ ?>
			  <div  style="font-size : 14px !important;" class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
			  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
			  <strong  style="font-size : 14px !important;">Respon !</strong> <?php echo($respon) ;  ?> 
		  </div> <?php }  ?>			
		  
			<form method="post" enctype="multipart/form-data"> 
                <div class="form-group">
                  <label class="label">Masukkan Email Anda</label>
                  <div class="input-group">
                    <input type="email" name="email" class="form-control" placeholder="Email Anda">
                    <div class="input-group-append">
                      <span class="input-group-text">
                        <i class="mdi mdi-check-circle-outline"></i>
                      </span>
                    </div>
                  </div>
                </div>
				
                <div class="form-group">
                  <button name="forgot" class="btn btn-primary submit-btn btn-block">Kirim Link Verifikasi </button>
                </div> 
                <div class="text-block text-center my-3">
                  <span class="text-small font-weight-semibold">Not a member ?</span>
                  <a href="login.php" class="text-black text-small">Login Sekarang</a>
                </div>
              </form>
            </div> 
            <p class="footer-text text-center">copyright © 2018 Bootstrapdash. All rights reserved.</p>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="../master/assets/vendors/js/vendor.bundle.base.js"></script>
  <script src="../master/assets/vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="../master/assets/js/off-canvas.js"></script>
  <script src="../master/assets/js/hoverable-collapse.js"></script>
  <script src="../master/assets/js/misc.js"></script>
  <script src="../master/assets/js/settings.js"></script>
  <script src="../master/assets/js/todolist.js"></script>
  <!-- endinject -->
</body>

</html>