<?php 
if($user->level == "master"){

$id = "";
if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 
}

$check_bank = select($pdo,"SELECT * FROM `admin`  WHERE `id`='$id' "); 
$check_bank->execute();
$row_bank = row($check_bank);
if($row_bank >= 1){
$data = fetch_obj($check_bank); 




if(isset($_POST['new'])){

$user_id = in($_POST['user_id']);
$nama = in($_POST['nama']);
$password = in($_POST['password']);
    

$check_bank = select($pdo,"SELECT * FROM `admin` WHERE `user_id`='$user_id' and id<>'$id'  "); 
$check_bank->execute();
$row_bank = row($check_bank);
if($row_bank >= 1){
	$alert = "danger";
	$respon = "Maaf. Data Ini Sudah Ada Sebelumnya";
}  else {
	eksekusi($pdo,"UPDATE `admin`  SET `nama`='$nama',`user_id`='$user_id',`password`='$password'  WHERE id='$id'  ");
	?> 
	<script>  document.location.href="?show=pengaturan_admin";   </script>  
	<?php 
	
}
} 

 ?>

 
<div class="row">
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1   p-1 ">
<div class="card">
<div class="card-header"><h5>Tambah Admin</h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data">  		
	
	<span> Nama </span> 
	<input type="text" required class="form-control" name="nama" value="<?php echo($data->nama) ;  ?>" placeholder=""    />
	<br />
	
	<span> User ID </span> 
	<input type="text" required class="form-control" name="user_id" value="<?php echo($data->user_id) ;  ?>" placeholder=""    />
	<br />
	
	<span> Password </span> 
	<input type="text" required class="form-control" name="password" value="<?php echo($data->password) ;  ?>" placeholder=""    />
	<br />
	
	<br />
	<button type="submit" name="new" class="btn btn-success" >Edit Admin Baru</button>  

</form>

</div>
</div>
</div>
</div>
</div>






<?php } else {?> <script>  document.location.href="?show=pengaturan_admin";   </script>   <?php } ?>

<?php } else {?> 
<h4> Tidak Ada Akses</h4>  
<?php } ?>