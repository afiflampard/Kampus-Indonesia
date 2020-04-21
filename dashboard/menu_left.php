<?php 
$kategori_soal = array('PKN STAN REGULER',
'DIII STAN TUGAS BELAJAR',
'DIV STAN TUGAS BELAJAR',
'PERGURUAN TINGGI KEDINASAN',
'CPNS UMUM');
?>

<nav class="pcoded-navbar">
<div class="sidebar_toggle"><a href="#"><i class="icon-close icons"></i></a></div>
<div class="pcoded-inner-navbar main-menu">
	<div class="">


	<div class="main-menu-header">
		<img class="img-40 img-radius"  src="../crop.php?img=<?php echo($user->foto) ;  ?>&w=100&h=100"  style="border-radius:100%; " alt="User-Profile-Image">
		<div class="user-details">
			<span><?php echo($user->nama) ;  ?></span>
			<span id="more-details">Expired Access Date <br> <?php echo($user->batas_login) ;  ?><i class="ti-angle-down"></i></span>
		</div>
	</div>

	<div class="main-menu-content">
		<ul>
			<li class="more-details">
				<a href="?show=pengaturan_profile"><i class="ti-settings"></i>Pengaturan Profile</a>
				<a href="?show=pengaturan_password"><i class="ti-settings"></i>Pengaturan Password</a>
				<a href="logout.php"><i class="ti-layout-sidebar-left"></i>Logout</a>
			</li>
		</ul>
	</div>
</div>


	
		  
<div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">Dashboard </div>

<ul class="pcoded-item pcoded-left-item">
<li dropdown-icon="style3" subitem-icon="style7" >
<a  href="index.php">
<span class="pcoded-micon"><i class="ti-home"></i><b>FC</b></span>
  <span class="pcoded-mtext" data-i18n="nav.form-components.main">Dashboard</span><span class="pcoded-mcaret"></span>
</a>
</li>

 
 

		 


<div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">Feature </div>
<ul class="pcoded-item pcoded-left-item"> 



<?php foreach($kategori_soal as $kategori){
if($kategori == $user->kategori_tryout){
?>
  <li class="pcoded-hasmenu" dropdown-icon="style3" subitem-icon="style7">
	<a class="waves-effect waves-dark" data-toggle="collapse" href="#f3" aria-expanded="false" aria-controls="ui-basic">
	 <span class="pcoded-micon"><i class="ti-layers"></i><b>D</b></span>
	  <span class="pcoded-mtext" data-i18n="nav.dash.main"> <?php echo($kategori) ;  ?> </span><span class="pcoded-mcaret"></span>
	</a>
		<ul class="pcoded-submenu"> 
		
		 <li class="" dropdown-icon="style3" subitem-icon="style7">
		  <a class="waves-effect waves-dark" href="?show=soal_saya&kategori=<?php echo($kategori) ;  ?>">
		  <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
		  <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Tryout Biasa
		  </span>
		  <span class="pcoded-mcaret"></span></a>
		</li> 
		
		
		 <li class="" dropdown-icon="style3" subitem-icon="style7">
		  <a class="waves-effect waves-dark" href="?show=soal_saya_mini&kategori=<?php echo($kategori) ;  ?>">
		  <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
		  <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Tryout Mini
		  </span>
		  <span class="pcoded-mcaret"></span></a>
		</li> 


		<li class="" dropdown-icon="style3" subitem-icon="style7">
		  <a class="waves-effect waves-dark" href="?show=soal_free">
		  <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
		  <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Tryout Gratis
		  </span>
		  <span class="pcoded-mcaret"></span></a>
		</li> 
		
	  </ul> 
  </li>
<?php } } ?>
 
 
 
 
 
  <li class="pcoded-hasmenu" dropdown-icon="style3" subitem-icon="style7">
	<a class="waves-effect waves-dark" data-toggle="collapse" href="#f3" aria-expanded="false" aria-controls="ui-basic">
	 <span class="pcoded-micon"><i class="ti-bar-chart"></i><b>D</b></span>
	  <span class="pcoded-mtext" data-i18n="nav.dash.main">Peringkat Nasional</span><span class="pcoded-mcaret"></span>
	</a>
		<ul class="pcoded-submenu"> 
		<?php $check_kategori_soal = select($pdo,"SELECT * FROM `kategori_soal` "); 
		$check_kategori_soal->execute();
		$row_kategori_soal = row($check_kategori_soal);
		if($row_kategori_soal >= 1){
			while($k = fetch_obj($check_kategori_soal)){
				?> 
				 
		<li class="" dropdown-icon="style3" subitem-icon="style7">
		  <a class="waves-effect waves-dark" href="?show=peringkat_nasional&kategori=<?php echo($k->nama) ;  ?>">
		  <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
		  <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Peringkat - <?php echo($k->nama) ;  ?>
		  </span>
		  <span class="pcoded-mcaret"></span></a>
		</li> 
		 
		
				<?php 
			}
		}  
		 ?>
		 <li class="" dropdown-icon="style3" subitem-icon="style7">
		  <a class="waves-effect waves-dark" href="?show=peringkat_nasional&kategori=Soal Gratis">
		  <span class="pcoded-micon"><i class="ti-angle-right"></i></span>
		  <span class="pcoded-mtext" data-i18n="nav.basic-components.alert">Peringkat - Tryout Gratis
		  </span>
		  <span class="pcoded-mcaret"></span></a>
		</li> 
	  </ul> 
  </li>
 
 
 
 
 
<li class="" dropdown-icon="style3" subitem-icon="style7">
<a class="waves-effect waves-dark" href="?show=statistik">
<span class="pcoded-micon"><i class="fa fa-line-chart"></i><b>D</b></span>
<span class="pcoded-mtext" data-i18n="nav.dash.main">Statistik </span><span class="pcoded-mcaret"></span></a>
</li> 

 
</ul>
  
  
  
  
  
  
  
 
<div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">Lainnya </div>
<ul class="pcoded-item pcoded-left-item"> 
	    
  <li class="" dropdown-icon="style3" subitem-icon="style7">
	<a class="waves-effect waves-dark" href="?show=panduan">
	 <span class="pcoded-micon"><i class="ti-light-bulb"></i><b>D</b></span>
	  <span class="pcoded-mtext" data-i18n="nav.dash.main">Panduan</span><span class="pcoded-mcaret"></span>
	</a>
  </li>
   
   
  <li class="" dropdown-icon="style3" subitem-icon="style7">
	<a class="waves-effect waves-dark" href="?show=faq">
	  <span class="pcoded-micon"><i class="ti-help-alt"></i><b>D</b></span>
	  <span class="pcoded-mtext" data-i18n="nav.dash.main">Faq</span><span class="pcoded-mcaret"></span>
	</a>
  </li>
   


  <li class="" dropdown-icon="style3" subitem-icon="style7">
	<a class="waves-effect waves-dark" href="?show=saran">
	  <span class="pcoded-micon"><i class="ti-help-alt"></i><b>D</b></span>
	  <span class="pcoded-mtext" data-i18n="nav.dash.main">Bantuan</span><span class="pcoded-mcaret"></span>
	</a>
  </li>

  <li class="" dropdown-icon="style3" subitem-icon="style7">
	<a class="waves-effect waves-dark" href="?show=hubungi_kami">
	  <span class="pcoded-micon"><i class="fa fa-phone"></i><b>D</b></span>
	  <span class="pcoded-mtext" data-i18n="nav.dash.main">Hubungi Kami</span><span class="pcoded-mcaret"></span>
	</a>
  </li>
  <li class="" dropdown-icon="style3" subitem-icon="style7">
	<a class="waves-effect waves-dark" href="?show=materi">
	  <span class="pcoded-micon"><i class="fa fa-file"></i><b>D</b></span>
	  <span class="pcoded-mtext" data-i18n="nav.dash.main">Materi</span><span class="pcoded-mcaret"></span>
	</a>
  </li>
  <li class="" dropdown-icon="style3" subitem-icon="style7">
	<a class="waves-effect waves-dark" href="?show=buku">
	  <span class="pcoded-micon"><i class="ti-book"></i><b>D</b></span>
	  <span class="pcoded-mtext" data-i18n="nav.dash.main">Beli Buku</span><span class="pcoded-mcaret"></span>
	</a>
  </li>
  <li class="" dropdown-icon="style3" subitem-icon="style7">
	<a class="waves-effect waves-dark" href="?show=buku_invoice">
	  <span class="pcoded-micon"><i class="ti-book"></i><b>D</b></span>
	  <span class="pcoded-mtext" data-i18n="nav.dash.main">Invoice Buku</span><span class="pcoded-mcaret"></span>
	</a>
  </li>
  <li class="" dropdown-icon="style3" subitem-icon="style7">
	<a class="waves-effect waves-dark" href="?show=bimbel">
	  <span class="pcoded-micon"><i class="ti-map"></i><b>D</b></span>
	  <span class="pcoded-mtext" data-i18n="nav.dash.main">Daftar Bimbel</span><span class="pcoded-mcaret"></span>
	</a>
  </li>
  </ul>
	
	 
 

 
  
 
 
 
<div class="pcoded-navigatio-lavel" data-i18n="nav.category.navigation">Pengaturan </div>
<ul class="pcoded-item pcoded-left-item">
<li dropdown-icon="style3" subitem-icon="style7">
<a  href="?show=pengaturan_profile">
<span class="pcoded-micon"><i class="ti-settings"></i><b>FC</b></span>
<span class="pcoded-mtext" data-i18n="nav.form-components.main">Pengaturan Data Diri</span><span class="pcoded-mcaret"></span>
</a>
</li>

<li dropdown-icon="style3" subitem-icon="style7">
<a  href="?show=pengaturan_password">
<span class="pcoded-micon"><i class="ti-settings"></i><b>FC</b></span>
<span class="pcoded-mtext" data-i18n="nav.form-components.main">Pengaturan Password </span><span class="pcoded-mcaret"></span>
</a>
</li>

 
 
 


<li dropdown-icon="style3" subitem-icon="style7" >
<a  href="login.php">
<span class="pcoded-micon"><i class="ti-layout-sidebar-left"></i><b>FC</b></span>
<span class="pcoded-mtext" data-i18n="nav.form-components.main">Keluar</span><span class="pcoded-mcaret"></span>
</a>
</li>
</ul> 



  
   
</div>
</nav>



















