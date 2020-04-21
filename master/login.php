<?php 
require_once("../a_con.php");

if(isset($_POST['login'])){
	 
	$user_id = in($_POST['user_id']);
	$password = in($_POST['password']);
	
	$check_user = select($pdo,"SELECT * FROM `admin` WHERE `user_id`='$user_id' and `password`='$password' "); 
	$check_user->execute();
	$row_user = row($check_user);
	if($row_user >= 1){

		$expire = time() + 60*60*24*7;
		setcookie("master_user_id",$user_id,$expire);
		setcookie("master_password",$password,$expire);

		
	?> 
		<script>  document.location.href="index.php";   </script>  
		<?php 
	}  else {
		$alert = "danger";
		$respon = "Password Salah";
	}
	 
} 

?>




<!DOCTYPE html>
<html lang="en">
<head>
<title><?php echo($master->name) ;  ?></title> 
<link rel="shortcut icon" href="../image/favicon.png" />
<!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="CodedThemes">
<meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
<meta name="author" content="CodedThemes">
<!-- Favicon icon --> 
<!-- Google font-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
  <style>
	   body{font-family:poppins !important;}
	 
  </style>    <!-- Required Fremwork -->
<link rel="stylesheet" type="text/css" href="<?php echo($site) ?>/dashboard/assets/css/bootstrap/css/bootstrap.min.css">
<!-- themify-icons line icon -->
<link rel="stylesheet" type="text/css" href="<?php echo($site) ?>/dashboard/assets/icon/themify-icons/themify-icons.css">
<!-- ico font -->
<link rel="stylesheet" type="text/css" href="<?php echo($site) ?>/dashboard/assets/icon/icofont/css/icofont.css">
<!-- Style.css -->
<link rel="stylesheet" type="text/css" href="<?php echo($site) ?>/dashboard/assets/css/style.css">
</head>

<body class="fix-menu">
<!-- Pre-loader start -->
<div class="theme-loader">
<div class="ball-scale">
	<div class='contain'>
		<div class="ring"><div class="frame"></div></div>
		<div class="ring"><div class="frame"></div></div>
		<div class="ring"><div class="frame"></div></div>
		<div class="ring"><div class="frame"></div></div>
		<div class="ring"><div class="frame"></div></div>
		<div class="ring"><div class="frame"></div></div>
		<div class="ring"><div class="frame"></div></div>
		<div class="ring"><div class="frame"></div></div>
		<div class="ring"><div class="frame"></div></div>
		<div class="ring"><div class="frame"></div></div>
	</div>
</div>
</div>
<!-- Pre-loader end -->








    <section class="login  text-center bg-primary common-img-bg"  style="margin:0px !important; overflow:auto !important; " >
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<!-- Authentication card start -->
				<div class="login-card card-block auth-body mr-auto ml-auto">
					<form class="md-float-material" method="post" enctype="multipart/form-data"> 
					
					
					
                            <div class="text-center">
                                <img src="../image/<?php echo($master->logo) ;  ?>"  style="height: 30px;"  alt="logo.png">
                            </div>
                            <div class="auth-box card">
                                <div class="card-block">
                                    <div class="row m-b-20">
                                        <div class="col-md-12">
                                            <h3 class="text-center">Sign In</h3>
                                        </div>
                                    </div>
								</div>
								
									
									<?php  if(!empty($alert)){ ?>
										<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
										<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
										<strong>Respon !</strong> <?php echo($respon) ;  ?> 
									</div> <?php }  ?>			
									
                                    <div class="form-group form-primary">
                                        <input type="text" name="user_id" class="form-control"  placeholder="Masukkkan User ID Admin"  required=""> 
                                    </div>
                                    <div class="form-group form-primary">
                                        <input type="password" name="password" class="form-control" placeholder="Masukkkan Password Admin" required=""> 
                                    </div>
									<br />
									
                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                            <button type="submit" name="login" class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">Sign in</button>
                                        </div>
                                    </div>
                                    <hr/>
                                    
                                </div>
                            </div>
     
	 
	 
	 
 					 </form>
				</div>
			</div>
		</div>
	</div>
</section>





<script type="text/javascript" src="<?php echo($site) ?>/dashboard/assets/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo($site) ?>/dashboard/assets/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="<?php echo($site) ?>/dashboard/assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="<?php echo($site) ?>/dashboard/assets/js/bootstrap/js/bootstrap.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="<?php echo($site) ?>/dashboard/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
<!-- modernizr js -->
<script type="text/javascript" src="<?php echo($site) ?>/dashboard/assets/js/modernizr/modernizr.js"></script>
<script type="text/javascript" src="<?php echo($site) ?>/dashboard/assets/js/modernizr/css-scrollbars.js"></script>
<script type="text/javascript" src="<?php echo($site) ?>/dashboard/assets/js/common-pages.js"></script>
</body>

</html>
