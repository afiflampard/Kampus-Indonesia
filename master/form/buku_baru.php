<?php  

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


$check_k = select($pdo,"SELECT * FROM `data_buku` WHERE `judul`='$judul'  "); 
$check_k->execute();
$row_k = row($check_k);
if($row_k >= 1){
	$alert = "danger";
	$respon = "Maaf. Data Ini Sudah Ada ";
}  else {
	require_once("isset_image.php");
	if(!empty($image)){
	eksekusi($pdo,"INSERT INTO `data_buku`
	(`judul`, `harga`, `keterangan`, `shopee`, `tokopedia`, `bukalapak`, `lazada`, `image`) VALUES 
	('$judul','$harga','$keterangan','$shopee','$tokopedia','$bukalapak','$lazada','$image') ");
	$alert = "success";
	$respon = "Data Buku sudah dimasukkan";
	
} else {
	$alert = "danger";
	$respon = "Maaf. Foto yang anda masukkan tidak valid";
	
}
}
}  

?>




<div class="row">
<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-1    p-1 ">
<div class="card">
<div class="card-header"><h5>Buku Baru</h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data"> 
	<?php  if(!empty($alert)){ ?>
		<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
		<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Respon !</strong> <?php echo($respon) ;  ?> 
	</div> <?php }  ?>			
	
	<span> Judul </span> 
	<input type="text" required class="form-control" name="judul" value="" placeholder="Masukkan Judul Buku"    />
	<br />
	
	<span> Image </span> 
	<input type="file" required class="form-control" name="image" value="" placeholder="Masukkan Judul Buku"    />
	<br />
	
	<span> Harga </span> 
	<input type="number" required class="form-control" name="harga" value="" placeholder="Harga Buku"    />
	<br />
	 
	<span> Keterangan </span> 
	<textarea type="text" required class="form-control" name="keterangan" value="" placeholder="Keterangan Buku"   style="height: 200px"    ></textarea>
	<br />
	
	<span> Url Di Shopee </span> 
	<input type="url" class="form-control" name="shopee" value="" placeholder="http://"    />
	<br />
	 
	<span> Url Di Bukalapak </span> 
	<input type="url" class="form-control" name="bukalapak" value="" placeholder="http://"    />
	<br />
	 
	<span> Url Di Tokopedia </span> 
	<input type="url" class="form-control" name="tokopedia" value="" placeholder="http://"    />
	<br />
	 
	<span> Url Di Lazada </span> 
	<input type="url" class="form-control" name="lazada" value="" placeholder="http://"    />
	<br />
	 
	<br />
	<button type="submit" name="new" class="btn btn-success" >Masukkan Baru</button>  

</form>

</div>
</div>
</div>
</div>

  
</div>




