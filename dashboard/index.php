<?php 
session_start();
require_once("../a_con.php");
require_once("data_user.php");
require_once("isset.php");


if(!empty($login)){
?>



<!DOCTYPE html>
<html lang="en">
<head>

<title><?php echo($master->name) ;  ?></title> 
<link rel="shortcut icon" href="../image/favicon.png" />

      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="description" content="CodedThemes">
      <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
      <meta name="author" content="CodedThemes">
     
	  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins"> 
      <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css"> 
	  <link rel="stylesheet" type="text/css" href="assets/icon/font-awesome/css/font-awesome.min.css">
	  
      <link rel="stylesheet" type="text/css" href="assets/css/style.css">
      <link rel="stylesheet" type="text/css" href="assets/css/jquery.mCustomScrollbar.css">
	  <script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>
	 
	<link href="<?php echo($site); ?>/dashboard/assets/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css" rel="stylesheet">
	<link href="<?php echo($site); ?>/dashboard/assets/jquery-datatable/responsive.css" rel="stylesheet">
	<script src="<?php echo($site); ?>/dashboard/assets/jquery-datatable/jquery.dataTables.js"></script>
	<script src="<?php echo($site); ?>/dashboard/assets/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js"></script>
	<script src="<?php echo($site); ?>/dashboard/assets/jquery-datatable/responsive.js"></script>
	<script src="all.js"></script>
</head>

	
<body>

    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="ball-scale">
            <div class='contain'>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">

                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
            </div>
        </div>
    </div>
  
  <!-- Pre-loader end -->
  <div id="pcoded" class="pcoded">
      <div class="pcoded-overlay-box"></div>
      <div class="pcoded-container navbar-wrapper">
		<?php require_once("menu_top.php"); ?>
		
          <div class="pcoded-main-container">
              <div class="pcoded-wrapper">
                  <?php require_once("menu_left.php"); ?>
				<div class="pcoded-content">
						 
				   
					  <div class="pcoded-inner-content">
                            <!-- Main-body start -->
                            <div class="main-body">
                                <div class="page-wrapper"   style="padding:0px !Important;" >
					
			<?php 
			$lengkap = "Yes";
			require_once("form/modal.php");
			$s = "";
			if(!empty($_GET['show'])){ 
			$s = in($_GET['show']); 
			}
			 
			
			if(($user->premium == "Yes") or ($s == "home_bukti")){
			if(!empty($_GET['show'])){ 
			$show = "form/".in($_GET['show']).".php"; 
			require_once($show);
			}else {
				require_once("form/home.php");
			}
			
			}else {
				require_once("form/home_bayar.php");
			}
			
			?>
			
			<div class="p-2 bg-light" align="right"  style="width : 100%;" >
				<small> Copyright @ <a class="" href="https://beli-website.com" ><small> https://beli-website.com</small>  </a> </small> 
			</div>
			</div>
			
			</div> 
			</div>
			</div>
            </div>
            </div>
        </div>
    </div>
	



<?php  if(!empty($alert)){ ?>
<div id="alerts" style="position:fixed; margin:0px !important; z-index:999999999; bottom:15px; left:15px; max-width:100%; white-space:normal !Important;" 
class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" onclick="close_alert();" style="margin-left: 10px; cursor:pointer;">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>		

  
	
	
<script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="assets/js/script.js"></script>
<script type="text/javascript " src="assets/js/SmoothScroll.js"></script>
<script src="assets/js/pcoded.min.js"></script>
<script src="assets/js/demo-12.js"></script>

<script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
var $window = $(window);
var nav = $('.fixed-button');
    $window.scroll(function(){
        if ($window.scrollTop() >= 200) {
         nav.addClass('active');
     }
     else {
         nav.removeClass('active');
     }
 });
</script>


</body>

</html>



<?php } ?>

