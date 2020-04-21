<?php 
session_start();
$_SESSION['user_id']=''; 
$_SESSION['password']=''; 

require_once("../a_con.php");

if(isset($_POST['daftar'])){
	
	
	if(strlen($nomor_personal) <= 1){$nomor_personal = "00".$nomor_personal;  } else 
	if(strlen($nomor_personal) <= 2){$nomor_personal = "0".$nomor_personal;  } 
	 
	$user_id = in($_POST['user_id']);
	$password = in($_POST['password']);
	$nama = in($_POST['nama']);
	$user_name = in($_POST['username']);
	$nama2 = str_replace(' ','_',strtolower($nama));
	$user_name =  $nama2."@".$user_name.$nomor_personal;

	
	eksekusi($pdo,"INSERT INTO `user` (`user_id`,`password`,`nama`,`username`,`type`) VALUES ('$user_id','$password','$nama','$user_name','Personal') ");
	$_SESSION['user_id'] = $user_id; 
	$_SESSION['password'] = $password; 
	
	eksekusi($pdo,"UPDATE `master` SET `personal`=`personal`+1 ");
	
	?> 
	<script>  document.location.href="index.php";   </script>  
	<?php 
	
	
	
	
	
} 

?>


<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Reddex Message Team</title>
    <link rel="shortcut icon" href="../image/favicon.ico" />
	<link rel="stylesheet" href="assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="assets/vendors/iconfonts/puse-icons-feather/feather.css">
  <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
  <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.addons.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="assets/css/style.css">
</head>

<body>

  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper auth-page">
      <div class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
        <div class="row w-100">
          <div class="col-lg-4 mx-auto">
            <div class="auto-form-wrapper">
				<form method="post" enctype="multipart/form-data"> 
				<?php  if(!empty($alert)){ ?>
					<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
					<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Respon !</strong> <?php echo($respon) ;  ?> 
				</div> <?php }  ?>			
				
                <div class="form-group">
                  <label class="label">Name</label>
                  <div class="input-group">
                    <input type="text" name="nama" class="form-control" placeholder="Name">
                    <div class="input-group-append">
                      <span class="input-group-text">
                        <i class="mdi mdi-check-circle-outline"></i>
                      </span>
                    </div>
                  </div>
                </div>
				 <div class="form-group">
                  <label class="label">Username Domain</label>
                  <div class="input-group">
                    <input type="text" name="username" class="form-control" placeholder="Example : rdx">
                    <div class="input-group-append">
                      <span class="input-group-text">
                        <i class="mdi mdi-check-circle-outline"></i>
                      </span>
                    </div>
                  </div>
                </div>
				 <div class="form-group">
                  <label class="label">Username</label>
                  <div class="input-group">
                    <input type="text" name="user_id" class="form-control" placeholder="Username">
                    <div class="input-group-append">
                      <span class="input-group-text">
                        <i class="mdi mdi-check-circle-outline"></i>
                      </span>
                    </div>
                  </div>
                </div>
				
                <div class="form-group">
                  <label class="label">Password</label>
                  <div class="input-group">
                    <input type="password" name="password" class="form-control" placeholder="*********">
                    <div class="input-group-append">
                      <span class="input-group-text">
                        <i class="mdi mdi-check-circle-outline"></i>
                      </span>
                    </div>
                  </div>
                </div>
				
                <div class="form-group">
                  <button name="daftar" class="btn btn-primary submit-btn btn-block">Register Now</button>
                </div>

				
                <div class="text-block text-center my-3">
                  <span class="text-small font-weight-semibold">You Are a Member?</span>
                  <a href="assets/register.php" class="text-black text-small">Login To Your Account</a>
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
  <script src="assets/vendors/js/vendor.bundle.base.js"></script>
  <script src="assets/vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="assets/js/off-canvas.js"></script>
  <script src="assets/js/hoverable-collapse.js"></script>
  <script src="assets/js/misc.js"></script>
  <script src="assets/js/settings.js"></script>
  <script src="assets/js/todolist.js"></script>
  <!-- endinject -->
</body>

</html>