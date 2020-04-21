<?php 
if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 

$check_bank = select($pdo,"SELECT * FROM `data_bank`  WHERE `id`='$id' "); 
$check_bank->execute();
$row_bank = row($check_bank);
if($row_bank >= 1){
$data = fetch_obj($check_bank); 




if(isset($_POST['new'])){
$bank_jenis = in($_POST['bank_jenis']);
$bank_rekening = in($_POST['bank_rekening']);
$bank_nama = in($_POST['bank_nama']);
$check_bank = select($pdo,"SELECT * FROM `data_bank` WHERE `bank_jenis`='$bank_jenis' and `bank_rekening`='$bank_rekening' and `id`<>'$id' "); 
$check_bank->execute();
$row_bank = row($check_bank);
if($row_bank >= 1){
	$alert = "danger";
	$respon = "Maaf. Data Bank Ini Sudah Ada Sebelumnya";
}  else {
	
	eksekusi($pdo,"UPDATE `data_bank` SET `bank_jenis`='$bank_jenis',`bank_rekening`='$bank_rekening',`bank_nama`='$bank_nama' WHERE `id`='$id' ");
	?> 
	<script>  document.location.href="?show=pengaturan_bank";   </script>  
	<?php 
	}
} 
 ?>

 
<div class="row">
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1    p-1 ">
<div class="card">
<div class="card-header"><h5>Edit Data Bank</h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data"> 
	<?php  if(!empty($alert)){ ?>
		<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
		<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Respon !</strong> <?php echo($respon) ;  ?> 
	</div> <?php }  ?>			
	
	<span> Jenis Bank </span> 
	<input type="text" required class="form-control" name="bank_jenis" value="<?php echo($data->bank_jenis) ;  ?>" placeholder="Jenis Bank"    />
	<br />
	
	<span> Nomor Rekening </span> 
	<input type="text" required class="form-control" name="bank_rekening" value="<?php echo($data->bank_rekening) ;  ?>" placeholder="Nomor Rekening"    />
	<br />
	
	<span> Atas Nama </span> 
	<input type="text" required class="form-control" name="bank_nama" value="<?php echo($data->bank_nama) ;  ?>" placeholder="Nama Pemilik Rekening"    />
	<br />
	
	<br />
	<a class="btn btn-danger" href="?show=pengaturan_bank" > Kembali </a> 
	<button type="submit" name="new" class="btn btn-success" >Edit Data Bank</button>  

</form>

</div>
</div>
</div>
</div>
</div>






<?php } else {?> <script>  document.location.href="?show=pengaturan_bank";   </script>   <?php } ?>
<?php } else {?> <script>  document.location.href="?show=pengaturan_bank";   </script>   <?php } ?>
