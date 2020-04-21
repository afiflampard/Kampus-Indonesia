<?php 
$check_notif = select($pdo,"SELECT * FROM `notifikasi` WHERE `user_id`='$user_id' and `read`='No' ORDER BY `id` DESC  "); 
$check_notif->execute();
$row_notif_all = row($check_notif);


$check_notif = select($pdo,"SELECT * FROM `notifikasi` WHERE `user_id`='$user_id' and `read`='No' ORDER BY `id` DESC LIMIT 10 "); 
$check_notif->execute();
$row_notif = row($check_notif);
?>


<nav class="navbar header-navbar pcoded-header" header-theme="themelight6">
<div class="navbar-wrapper">
  <div class="navbar-logo"  style="background: <?php echo($master->background) ;  ?>!important" >
	  <a class="mobile-menu waves-effect waves-light" id="mobile-collapse" href="#!">
		  <i class="ti-menu"></i>
	  </a>
	  <div class="mobile-search waves-effect waves-light">
		  <div class="header-search">
			  <div class="main-search morphsearch-search">
				  <div class="input-group">
					  <span class="input-group-addon search-close"><i class="ti-close"></i></span>
					  <input type="text" class="form-control" placeholder="Enter Keyword">
					  <span class="input-group-addon search-btn"><i class="ti-search"></i></span>
				  </div>
			  </div>
		  </div>
	  </div>
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
		  <li class="header-notification">
			  
			<a href="#!">
				<i class="ti-bell"></i>
				<span class="badge bg-c-pink"></span>
			</a>
			
				<ul class="show-notification"  style="max-height:350px !Important; overflow:auto;" >
				<li>
					<h6>Notifications</h6>
					<label class="label label-danger">New</label>
				</li>
				
				
<?php 
if($row_notif >= 1){
while($notif = fetch_obj($check_notif)){
?> 

<li>
<div class="media">
	<div class="media-body"> 
		<p class="notification-msg">
			<?php echo($notif->text) ;  ?>
		</p>
		<span class="notification-time">Kredit : <?php echo uang($notif->kredit) ;  ?> - Debet : <?php echo(uang($notif->debet)) ;  ?></span>
	</div>
</div>
</li>
 
  
  
<?php 
}
} else {
	?> 
<li>
<div class="media">
	<div class="media-body">
		<h5 class="notification-user">Tidak Ada Notifikasi Terbaru</h5> 
	</div>
</div>
</li>
	<?php 
}   
?>
</ul>
		
		
		
		
		</li>
		  <li class="user-profile header-notification">
			<a href="#!">
				<img src="../crop.php?img=<?php echo($user->foto) ;  ?>&w=100&h=100"  style="border-radius:100% !important; "   class="img-radius" alt="User-Profile-Image">
				<span><?php echo($user->nama) ;  ?></span>
				<i class="ti-angle-down"></i>
			</a>
			<ul class="show-notification profile-notification">
				 
			<li> 
			  <a href="?show=pengaturan_profile" >
               <i class="ti-settings"></i>  Profile Saya
              </a>  
			</li>
			
			<li>			
              <a href="?show=pengaturan_password" >
                <i class="ti-settings"></i>  Pengaturan Password
              </a>  
			</li>
			<li>
              <a href="?show=history" >
               <i class="ti-reload"></i>  Riwayat 
              </a>  
			   
			</li>
			<li>
              <a href="?show=deposit_baru" >
               <i class="ti-credit-card"></i>  Deposit Coin
              </a>  
			   
			</li>
			<li>
              <a href="?show=komplain" >
               <i class="ti-write"></i>  Saran Dan Komplain
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



