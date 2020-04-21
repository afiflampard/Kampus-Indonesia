<?php if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 

$check_c = select($pdo,"SELECT * FROM `kategori_soal` WHERE `id`='$id' "); 
$check_c->execute();
$row_c = row($check_c);
if($row_c >= 1){
$data = fetch_obj($check_c); 

$old_kategori = $data->nama;

if(isset($_POST['new'])){
$nama = in($_POST['nama']);
$total = in($_POST['total']);
 

$check_c = select($pdo,"SELECT * FROM `kategori_soal` WHERE `nama`='$nama' and `id`<>'$id' "); 
$check_c->execute();
$row_c = row($check_c);
if($row_c >= 1){
	$alert = "danger";
	$respon = "Maaf. Nama Kategori Ini Sudah Ada Sebelumnya";
}  else {
	eksekusi($pdo,"UPDATE `kategori_soal` SET `nama`='$nama',`total_soal`='$total'  WHERE `id`='$id'");
	eksekusi($pdo,"UPDATE `data_soal` SET `kategori`='$nama'  WHERE `kategori`='$old_kategori'");
?> 
<script>  document.location.href="materi_kategori";   </script>  
<?php 
	
	
	
}


} 






?>

<div class="row">
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1   p-1 ">
<div class="card">
<div class="card-header"><h5>Kategori Soal Edit</h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data"> 
	<?php  if(!empty($alert)){ ?>
		<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
		<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Respon !</strong> <?php echo($respon) ;  ?> 
	</div> <?php }  ?>			
	
	<span> Nama Kategori </span> 
	<input type="text" required class="form-control" name="nama" value="<?php echo($data->nama) ;  ?>" placeholder="Masukkan Nama Kategori"    />
	<br />
	<span> Total Soal </span> 
	<input type="text" required class="form-control" max="3" min="1" name="total" value="<?php echo($data->total_soal) ;  ?>" placeholder="Total Soal"    />
	<br />
	<br />
	<a href="?show=soal_kategori" class="btn btn-danger" >Kembali </a>  
	<button type="submit" name="new" class="btn btn-success" >Edit Kategori </button>  

</form>

</div>
</div>
</div>
</div>

</div>





<?php } else {?> <script>  document.location.href="?show=soal_kategori";   </script>   <?php } ?>
<?php } else {?> <script>  document.location.href="?show=soal_kategori";   </script>   <?php } ?>
