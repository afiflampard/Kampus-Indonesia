<?php 
$id = -1;
if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 
}


$check_data = select($pdo,"SELECT * FROM `faq_category` WHERE `id`='$id'  "); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
$data = fetch_obj($check_data); 

$old = $data->kategori;


if(isset($_POST['new'])){
$nama = in($_POST['nama']);
$check_k = select($pdo,"SELECT * FROM `faq_category` WHERE `kategori`='$nama' and `id`<>'$id' "); 
$check_k->execute();
$row_k = row($check_k);
if($row_k >= 1){
	$alert = "danger";
	$respon = "Maaf. Kategori Ini Sudah Ada ";
}  else {
	eksekusi($pdo,"UPDATE `faq_category` SET `kategori`='$nama' WHERE `id`='$id'  ");
	eksekusi($pdo,"UPDATE `faq` SET `kategori`='$nama' WHERE `kategori`='$old'  ");
	?> 
	<script>  document.location.href="?show=faq_kategori";   </script>  
	<?php 
	
}
}  

?>


<div class="row">
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1   p-1 ">
<div class="card">
<div class="card-header"><h5>Kategori Faq </h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data"> 
	<?php  if(!empty($alert)){ ?>
		<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
		<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Respon !</strong> <?php echo($respon) ;  ?> 
	</div> <?php }  ?>			
	
	<span> Nama Kategori </span> 
	<input type="text" required class="form-control" name="nama" value="<?php echo($data->kategori) ;  ?>" placeholder="Masukkan Nama Kategori"    />
	<br />
	<br />
	<button type="submit" name="new" class="btn btn-success" >Edit Kategori </button>  

</form>

</div>
</div>
</div>
</div>
</div> 





<?php } ?>

