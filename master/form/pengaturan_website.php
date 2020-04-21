<?php 
if($user->level == "master"){

if(isset($_POST['clear'])){
$password = in($_POST['password']);
if($master->password == $password){
	
eksekusi($pdo,"delete from buku_master"); 
eksekusi($pdo,"delete from data_soal");
eksekusi($pdo,"delete from data_jawaban");
eksekusi($pdo,"delete from data_saran");
eksekusi($pdo,"delete from data_tutorial_soal");
eksekusi($pdo,"delete from faq_panduan");
eksekusi($pdo,"delete from faq");
eksekusi($pdo,"delete from faq_category");
eksekusi($pdo,"delete from invoice_buku");
eksekusi($pdo,"delete from invoice");
eksekusi($pdo,"delete from kategori_soal");
eksekusi($pdo,"delete from kategori");
eksekusi($pdo,"delete from list_video");
eksekusi($pdo,"delete from list_image");
eksekusi($pdo,"delete from ranking");
eksekusi($pdo,"delete from riwayat_bonus");
eksekusi($pdo,"delete from user_jawab");
eksekusi($pdo,"delete from user");


$alert = "success";
$respon = "Database Sudah Di Bersihkan ";

}  else {
	$alert = "danger";
	$respon = "Maaf. Password Salah";
	
}
}




if(isset($_POST['edit'])){
$name = in($_POST['name']);
$description = in($_POST['description']);


$harga_poin = in($_POST['harga_poin']); 
$telepon = in($_POST['telepon']);
$whatsapp = in($_POST['whatsapp']);
$telegram = in($_POST['telegram']); 
$aktif_video = in($_POST['aktif_video']); 
 $tokopedia = in($_POST['tokopedia']);
 $shopee = in($_POST['shopee']);
 $bukalapak = in($_POST['bukalapak']);
 $lazada = in($_POST['lazada']);
 $background = in($_POST['background']);
 
 
     

eksekusi($pdo,"UPDATE `master` SET `aktif_video`='$aktif_video',`name`='$name',`description`='$description',`harga_poin`='$harga_poin', 
`telepon`='$telepon', `whatsapp`='$whatsapp', `telegram`='$telegram' , `tokopedia`='$tokopedia' 
, `shopee`='$shopee' , `bukalapak`='$bukalapak' , `lazada`='$lazada', `background`='$background'  ");

require_once("isset_image.php");
if(!empty($image)){
eksekusi($pdo,"UPDATE `master` SET `logo`='$image'  ");
} 


$alert ="success";
$respon ="Data Website Sudah Di Edit";
          

}
?>

<div class="row">
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1    p-1 ">
<div class="card">
<div class="card-header"><h5> Edit Website</h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data"> 
	<?php  if(!empty($alert)){ ?>
		<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
		<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Respon !</strong> <?php echo($respon) ;  ?> 
	</div> <?php }  ?>			
	

	<label> Logo </label> 
	<input type="file"   class="form-control" name="image"  placeholder="Masukkan Data"    />
	<br />
	
	<label> Background Header </label> 
	<input type="color" required class="form-control"  value="<?php echo($master->background) ;  ?>"   name="background"  placeholder=""    />
	<br />
	
	
	<label> Nama Website </label> 
	<input type="text" required class="form-control" name="name"  value="<?php echo($master->name) ;  ?>"    placeholder="Masukkan Data"    />
	<br />
	
	<label> Description </label> 
	<textarea  required class="form-control" style="height: 200px;" name="description" ><?php echo($master->description) ;  ?></textarea>
	<br />
	
	<label> Biaya Register </label> 
	<input type="number" required class="form-control" name="harga_poin"  value="<?php echo($master->harga_poin) ;  ?>"    placeholder="Masukkan Data"    />
	<br />
	
	<label> Aktifkan Fitur Premium </label> 
	<select required class="form-control" name="aktif_video"  placeholder="Masukkan Data"    >
	<option <?php if($master->aktif_video == "Yes"){echo(" selected ") ; }  ?> >Yes</option>
	<option <?php if($master->aktif_video == "No"){echo(" selected ") ; }  ?>>No</option>
	</select>
	<br /> 
	
	<label> Telepon </label> 
	<input type="text" required class="form-control" name="telepon"  value="<?php echo($master->telepon) ;  ?>"    placeholder="Masukkan Data"    />
	<br />
	<label> URL Group Whatsapp </label> 
	<input type="url" required class="form-control" name="whatsapp"  value="<?php echo($master->whatsapp) ;  ?>"    placeholder="Masukkan Data"    />
	<br />
	
	<label> URL Group Telegram </label> 
	<input type="url" required class="form-control" name="telegram"  value="<?php echo($master->telegram) ;  ?>"    placeholder="Masukkan Data"    />
	<br />  
	
	<label> URL Marketplace Tokopedia </label> 
	<input type="url"  class="form-control" name="tokopedia"  value="<?php echo($master->tokopedia) ;  ?>"    placeholder="Masukkan Data"    />
	<br />  
	
	
	<label> URL Marketplace Shopee </label> 
	<input type="url"  class="form-control" name="shopee"  value="<?php echo($master->shopee) ;  ?>"    placeholder="Masukkan Data"    />
	<br />  
	
	
	<label> URL Marketplace Bukalapak </label> 
	<input type="url"  class="form-control" name="bukalapak"  value="<?php echo($master->bukalapak) ;  ?>"    placeholder="Masukkan Data"    />
	<br />  
	
	
	<label> URL Marketplace Lazada </label> 
	<input type="url"  class="form-control" name="lazada"  value="<?php echo($master->lazada) ;  ?>"    placeholder="Masukkan Data"    />
	<br />  
	
	
	 
	<button type="submit" name="edit" class="btn btn-success" >Edit Data Website</button>  
	
</form>

</div>
</div>
</div>
</div>

<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 ">
<div class="card">
<div class="card-header"><h5> Bersihkan Database</h5></div>


<div class="card-block"><div class="table-responsive">
	
	<form method="post" enctype="multipart/form-data"> 
		
		<span> Masukkan Password </span> 
		<input type="password" required class="form-control" name="password" value="" placeholder="Konfirmasi Password "    />
		<br />
		<button type="submit" name="clear" class="btn btn-success" >Bersihkan Databasse</button> 
	</form>
	
</div>
</div>
</div>
</div>


</div>




<?php } else {
	?> 
	<h5> Tidak Ada akses</h5> 
	 
	<?php 
} ?>