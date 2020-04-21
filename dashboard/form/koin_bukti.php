<?php 
$inv = -1;
if(!empty($_GET['inv'])){ 
$inv = in($_GET['inv']); 
}


$check_inv = select($pdo,"SELECT * FROM `invoice` WHERE `invoice`='$inv' AND `user_id`='$user_id' and `status`='Unpaid'  "); 
$check_inv->execute();
$row_inv = row($check_inv);
if($row_inv >= 1){
$data =fetch_obj($check_inv); 

if(isset($_POST['masukkan'])){
	$image = "";
	require_once("isset_bukti.php");
	if(!empty($image)){
		
		eksekusi($pdo,"UPDATE `invoice` SET `bukti`='$image',`status_bukti`='Menunggu Konfirmasi' WHERE `invoice`='$inv'   ");
		
		$alert = "success";
		$respon = "Bukti Pembayaran Anda Sudah Di Masukkan . Apabila Anda memasukkannya kembali maka bukti lama akan di ganti dengan bukti baru . terima kasih ";
		
		
		
	} else {
		$alert = "danger";
		$respon = "Maaf. Bukti Yang Anda Masukkan Tidak Valid. Harap Masukkan Gambar Format (jpg,png,bmp). Terima Kasih";
		
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
<div class="card-header"><h5>Masukkan Bukti Pembayaran </h5></div>
 
<div class="card-block"><div class="table-responsive">
	<form method="post" enctype="multipart/form-data"> 
	<span> Invoice </span> 
	<input type="text" required class="form-control" name="invoice" readonly value="INVOICE#<?php echo($data->invoice) ;  ?>" placeholder=""    />
	<br />
	<span> Total Pembayaran </span> 
	<input type="text" required class="form-control" name="total" readonly value="Rp. <?php echo uang($data->total_pembayaran) ;  ?>" placeholder=""    />
	<br />
	<span> Screenshot Bukti Pembayaran </span> 
	<input type="file" required class="form-control" name="image" value="" placeholder=""    />
	<br />
	<a  class="btn btn-danger" href="?show=koin_bayar&inv=<?php echo($inv) ;  ?>" >Kembali Ke List</a> 
	<button type="submit" class="btn btn-primary" name="masukkan" >Masukkan Data</button> 
	</form>
	
</div>
</div>
</div>
</div>





</div>



 
 
<?php } ?>

