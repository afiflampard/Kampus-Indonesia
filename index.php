<?php 
session_start();
require_once("a_con.php");

if(!empty($_GET['verification'])){ 
$v = in($_GET['verification']); 
$check_u = select($pdo,"SELECT * FROM `user` WHERE `kode_referral`='$v' and `active`='No'  "); 
$check_u->execute();
$row_u = row($check_u);
if($row_u >= 1){
	$alert = "success";
	$respon = "Selamat. Akun Anda Sudah Kami Aktifkan . Pastikan Anda Selalu Mengingat User ID Dan Password Anda . ";
	eksekusi($pdo,"UPDATE `user` SET `active`='Yes' WHERE  `kode_referral`='$v'   ");	
} 
}
?>



<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="<?php echo($master->description) ;  ?>">
  <meta name="author" content="Creative Tim">
  <title><?php echo($master->name) ;  ?></title>
  <!-- Favicon -->
  <link href="image/favicon.png" rel="icon" type="image/png">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="assets/vendor/nucleo/css/nucleo.css" rel="stylesheet">
  <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- Argon CSS -->
  <link type="text/css" href="assets/css/argon.css?v=1.0.1" rel="stylesheet">
  <!-- Docs CSS -->
  <link type="text/css" href="assets/css/docs.min.css" rel="stylesheet">
</head>

<body>
  <header class="header-global">
    <nav id="navbar-main" class="navbar navbar-main navbar-expand-lg navbar-transparent navbar-light headroom">
      <div class="container">
        <a class="navbar-brand mr-lg-5" href="<?php echo($site) ?>/">
          <img src="image/<?php echo($master->logo) ;  ?>">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
		
        <div class="navbar-collapse collapse" id="navbar_global">
          <div class="navbar-collapse-header">
            <div class="row"> 
              <div class="col-6 collapse-close">
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbar_global" aria-controls="navbar_global" aria-expanded="false" aria-label="Toggle navigation">
                  <span></span>
                  <span></span>
                </button>
              </div>
            </div>
          </div> 
		  
		  
          <ul class="navbar-nav align-items-lg-center ml-lg-auto">
            <li class="nav-item d-none d-lg-block ml-lg-4">
              <a href="<?php echo($site) ?>/register" target="_blank" class="btn btn-neutral btn-icon">
                <span class="btn-inner--icon">
                  <i class="fa fa-cloud-download mr-2"></i>
                </span>
                <span class="nav-link-inner--text">Register</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
 



 
 
 
 
 
 <main>
    <div class="position-relative">
      <!-- Hero for FREE version -->
      <section class="section section-lg section-hero section-shaped">
        <!-- Background circles -->
        <div class="shape shape-style-1 shape-primary">
          <span class="span-150"></span>
          <span class="span-50"></span>
          <span class="span-50"></span>
          <span class="span-75"></span>
          <span class="span-100"></span>
          <span class="span-75"></span>
          <span class="span-50"></span>
          <span class="span-100"></span>
          <span class="span-50"></span>
          <span class="span-100"></span>
        </div>
		
		
			<?php 
			
			if(!empty($_GET['show'])){ 
				$show = "form/".in($_GET['show']).".php"; 
				require_once($show);
			}else {
				require_once("form/home.php");
			}
			
			?>

	 </section>
    </div>
</main>	
	
	
<?php  if(!empty($alert)){ ?>
<div id="alerts" style="position:fixed; margin:0px !important; z-index:999999999; bottom:15px; left:15px; max-width:100%; white-space:normal !Important;" 
class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" onclick="close_alert();" style="margin-left: 10px; cursor:pointer;">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>		

  
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/popper/popper.min.js"></script>
  <script src="assets/vendor/bootstrap/bootstrap.min.js"></script>
  <script src="assets/vendor/headroom/headroom.min.js"></script>
  <!-- Optional JS -->
  <script src="assets/vendor/onscreen/onscreen.min.js"></script>
  <script src="assets/vendor/nouislider/js/nouislider.min.js"></script>
  <script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
  <!-- Argon JS -->
  <script src="assets/js/argon.js?v=1.0.1"></script>
</body>

</html>