<?php 
if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 

$check_u = select($pdo,"SELECT * FROM `user` WHERE `id`='$id' "); 
$check_u->execute();
$row_u = row($check_u);
if($row_u >= 1){
$member = fetch_obj($check_u); 
$userx = $member->user_id;



if(isset($_POST['edit'])){

$email = in($_POST['email']);
$nama = in($_POST['nama']); 
$telepon = in($_POST['telepon']);
$whatsapp = in($_POST['whatsapp']);
$kategori_tryout = in($_POST['kategori_tryout']);
$batas_login = in($_POST['batas_login']);
  

eksekusi($pdo,"UPDATE `user` SET `nama`='$nama',`email`='$email',`telepon`='$telepon',`kategori_tryout`='$kategori_tryout',`batas_login`='$batas_login' WHERE `user_id`='$userx' ");

?> 
<script>  document.location.href="?show=member";   </script>  
<?php 

}




?>

 
<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">

<div class="card">
<div class="card-header"><h5>Edit Profile <?php echo($member->nama) ;  ?></h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data"> 
	
	
	 
	
	<span> Nama </span> 
	<input type="text" required class="form-control" name="nama" value="<?php echo($member->nama) ;  ?>" placeholder="Masukkan Nama Anda"    />
	<br />

	<span> Email </span> 
	<input type="text" required class="form-control" name="email" value="<?php echo($member->email) ;  ?>" placeholder="Masukkan Alamat Email Anda "    />
	<br />

	<span> Telepon </span> 
	<input type="text" required class="form-control" name="telepon" value="<?php echo($member->telepon) ;  ?>" placeholder="Masukkan Nomor Telepon Anda "    />
	<br />

	<span> Whatsapp  </span> 
	<input type="text" required class="form-control" name="whatsapp" value="<?php echo($member->wa) ;  ?>" placeholder="Masukkan Nomor Whatsapp Anda"    />
	<br />

	<span> Akses Tryout  </span> 
	<select type="text" required class="form-control" id="kategori" name="kategori_tryout"  placeholder=""   >
		<option>PKN STAN REGULER</option>
		<option>DIII STAN TUGAS BELAJAR</option>
		<option>DIV STAN TUGAS BELAJAR</option>
		<option>PERGURUAN TINGGI KEDINASAN</option>
		<option>CPNS UMUM</option>
	</select>
	<br />
	<script>  $('#kategori').val('<?php echo($user->kategori_tryout) ;  ?>')  </script> 

	<span> Masa Aktif  </span> 
	<input type="date" required class="form-control" name="batas_login" value="<?php echo($member->batas_login) ;  ?>" placeholder="Masukkan Asal Sekolah Terakhir Anda"    />
	<br />
 
	<br /> 
	
	<button type="submit" name="edit" class="btn btn-success" >Edit Data Profile</button>  

	



</form>
	
</div>
</div>
</div>
</div>


</div>




<?php } else {?> <script>  document.location.href="?show=member";   </script>   <?php } ?>
<?php } else {?> <script>  document.location.href="?show=member ";   </script>   <?php } ?>
