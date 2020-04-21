<?php  
$id=  -1;
if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 
}

$check_data = select($pdo,"SELECT * FROM `data_buku` "); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
$data = fetch_obj($check_data); 




if(isset($_POST['new'])){
$judul = in($_POST['judul']);
$keterangan = str_replace("'",'"',$_POST['keterangan']);
$keterangan= str_replace("\n",'<br>',$keterangan);
$harga = in($_POST['harga']);
$shopee = in($_POST['shopee']);
$bukalapak = in($_POST['bukalapak']);
$tokopedia = in($_POST['tokopedia']);
$lazada = in($_POST['lazada']);

$image = "";


$check_k = select($pdo,"SELECT * FROM `data_buku` WHERE `judul`='$judul' and `id`<>'$id'  "); 
$check_k->execute();
$row_k = row($check_k);
if($row_k >= 1){
	$alert = "danger";
	$respon = "Maaf. Data Ini Sudah Ada ";
}  else {
	
	require_once("isset_image.php");
	
	eksekusi($pdo,"UPDATE `data_buku` SET  `judul`='$judul', `harga`='$harga', `keterangan`='$keterangan', `shopee`='$shopee', `tokopedia`='$tokopedia', `bukalapak`='$bukalapak', `lazada`='$lazada' WHERE `id`='$id' ");
	if(!empty($image)){
		eksekusi($pdo,"UPDATE `data_buku` SET  `image`='$image'  WHERE `id`='$id' ");	
	} 
	
	?> 
	<script>  document.location.href="?show=buku_list";   </script>  
	<?php 
	
}
}  

?>


<div class="row">
<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-1    p-1 ">
<div class="card">
<div class="card-header"><h5>Edit Data Buku</h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data"> 
	<?php  if(!empty($alert)){ ?>
		<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
		<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Respon !</strong> <?php echo($respon) ;  ?> 
	</div> <?php }  ?>			
	
	<span> Judul </span> 
	<input type="text" required class="form-control" name="judul" value="<?php echo($data->judul) ;  ?>" placeholder="Masukkan Judul Buku"    />
	<br />
	
	<span> Image </span> 
	<input type="file" class="form-control" name="image"   placeholder="Masukkan Judul Buku"    />
	<br />
	
	<span> Harga </span> 
	<input type="number" required class="form-control" name="harga" value="<?php echo($data->harga) ;  ?>" placeholder="Harga Buku"    />
	<br />
	 
	<span> Keterangan </span> 
	<textarea type="text" required class="form-control" name="keterangan" value="" placeholder="Keterangan Buku"   style="height: 200px"    ><?php echo str_replace("<br>","\n",$data->keterangan) ;  ?></textarea>
	<br />
	
	<span> Url Di Shopee </span> 
	<input type="url" class="form-control" name="shopee" value="<?php echo($data->shopee) ;  ?>" placeholder="http://"    />
	<br />
	 
	<span> Url Di Bukalapak </span> 
	<input type="url" class="form-control" name="bukalapak" value="<?php echo($data->bukalapak) ;  ?>" placeholder="http://"    />
	<br />
	 
	<span> Url Di Tokopedia </span> 
	<input type="url" class="form-control" name="tokopedia" value="<?php echo($data->tokopedia) ;  ?>" placeholder="http://"    />
	<br />
	 
	<span> Url Di Lazada </span> 
	<input type="url" class="form-control" name="lazada" value="<?php echo($data->lazada) ;  ?>" placeholder="http://"    />
	<br />
	 
	<br />
	<button type="submit" name="new" class="btn btn-success" >Perbaharui</button>  

</form>

</div>
</div>
</div>
</div>

  
</div>





<?php } ?>

