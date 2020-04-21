<?php 
if(isset($_POST['new'])){
	$unik = rand(0,1999);
	$id_bank = in($_POST['metode']);
	$invoice = date('Ymdhis').'-'.$unik;
	
	
	$check_bank = select($pdo,"SELECT * FROM `data_bank` WHERE `id`='$id_bank'  "); 
	$check_bank->execute();
	$row_bank = row($check_bank);
	if($row_bank >= 1){
		$b = fetch_obj($check_bank); 
		$bank_jenis = $b->bank_jenis;
		$bank_rekening = $b->bank_rekening;
		$bank_nama = $b->bank_nama;
	
	$metode = "Transfer ".$bank_jenis ;
	
	
	$total = $master->harga_premium;
	$total_pembayaran = $total+$unik;
	
	$expired= date('Y-m-d', strtotime('+2 days', strtotime($date)));
	
	eksekusi($pdo,"INSERT INTO `invoice_premium`
	(`bank_jenis`,`bank_rekening`,`bank_nama`,`judul`, `metode`, `total`, `kode_unik`, `total_pembayaran`, `status`, `user_id`, `date`, `invoice`) VALUES 
	('$bank_jenis','$bank_rekening','$bank_nama','Biaya Register Menjadi Member Premium Rp. ".uang($total)."','$metode','$total','$unik','$total_pembayaran','Unpaid','$user_id','$date','$invoice') ");

	
	?> 
	<script>  document.location.href="?show=member_premium";   </script>  
	<?php 
	
		
		 
	} else {
		$alert = "danger";
		$respon = "Maaf. Data Bank Tidak Di Temukan";
		
	}
	
} 
?>
<?php  if(!empty($alert)){ ?>
	<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>			




<div class="row">
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1    p-1 ">
<div class="card">
<div class="card-header"><h5>Tata Cara Menjadi Member Premium</h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data">  	
	
	
	<div class="alert alert-info alert-dismissable">
		<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Tata Cara Daftar Member Premium !</strong> <br />
		1. Untuk Menjadi Member Premium harap perhatikan di bawah : <br /> 
		2. Konfirmasi Permintaan Pembuatan Invoice pada form yang telah di sediakan  <br />
		3. Kirim Dana Register Member Premium Sesuai Dengan Bank Pilihan<br />
		4. Upload Bukti Pembayaran Setelah Membuat Invoice<br />
		
	</div>  
	
	
<form method="post" enctype="multipart/form-data"> 

 
<div class="input-group mb-3">
<div    style="width : 40%;" class="input-group-prepend">
<span   style="width : 100%;"  class="input-group-text" id="basic-addon1">Biaya Member Premium</span>
</div> 
<input type="text" required class="form-control" name="biaya" readonly value="Rp. <?php echo uang($master->harga_premium) ;  ?>" placeholder=""    />
<br />
</div>
 
 
 
<div class="input-group mb-3">
  <div    style="width : 40%;" class="input-group-prepend">
    <span   style="width : 100%;"  class="input-group-text" id="basic-addon1">Metode Pembayaran</span>
  </div>
  
  <select type="text" class="form-control" name="metode" placeholder="">
<?php $check_b = select($pdo,"SELECT * FROM `data_bank` "); 
$check_b->execute();
$row_b = row($check_b);
if($row_b >= 1){
	while($b = fetch_obj($check_b)){
		?> 
		<option  value="<?php echo($b->id) ;  ?>"  >Transfer Bank <?php echo($b->bank_jenis) ;  ?></option> 
		<?php 
	}
}  
 ?>
</select>
</div>
  

<button type="submit" name="new" class="btn btn-primary form-control" >Buat Pesanan</button>
	
</form>

	
</form>

</div>
</div>
</div>
</div>
</div>




