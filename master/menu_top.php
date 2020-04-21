<nav class="navbar header-navbar pcoded-header" header-theme="themelight6">
<div class="navbar-wrapper">
  <div class="navbar-logo" style="background: <?php echo($master->background) ;  ?>!important" >
	  <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
		  <i class="ti-menu"></i>
	  </a> 
	  <a href="index.php">
	    <img src="../image/<?php echo($master->logo) ;  ?>" class="img-fluid" style="max-height: 40px;  max-width:80%; width : auto !important;" />
	  </a>
	  <a class="mobile-options waves-effect waves-light">
		  <i class="ti-more"></i>
	  </a>
  </div>

  <div class="navbar-container container-fluid">
	  <ul class="nav-left">
		  <li>
			  <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
		  </li> 
		  <li>
			  <a href="#!" onclick="javascript:toggleFullScreen()" class="waves-effect waves-light">
				  <i class="ti-fullscreen"></i>
			  </a>
		  </li>
	  </ul>
	  <ul class="nav-right">
		  
		  <li class="user-profile header-notification">
			<a href="#!">
				<img src="../crop.php?img=img.png&w=100&h=100"  style="border-radius:100% !important; "   class="img-radius" alt="User-Profile-Image">
				<span><?php echo($user->nama) ;  ?></span>
				<i class="ti-angle-down"></i>
			</a>
			<ul class="show-notification profile-notification">
				  
			<li>			
              <a href="?show=pengaturan_password" >
                <i class="ti-settings"></i>  Pengaturan Password
              </a>  
			</li>  
				<li>
					<a href="logout.php">
						<i class="ti-layout-sidebar-left"></i> Logout
					</a>
				</li>
			</ul>
		</li>
	  </ul>
  </div>
</div>
</nav>



