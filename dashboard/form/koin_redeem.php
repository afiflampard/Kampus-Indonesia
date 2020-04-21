<?php if(isset($_POST['masukkan'])){
$kode = in($_POST['kode']);
$check_kode = select($pdo,"SELECT * FROM `voucher` WHERE `kode`='$kode'  "); 
$check_kode->execute();
$row_kode = row($check_kode);
if($row_kode >= 1){
	$k = fetch_obj($check_kode); 
	if($k->using == "No"){
		$t = $k->poin;
		$poin= $user->poin + $k->poin;
		
		eksekusi($pdo,"UPDATE `user` SET `poin`='$poin' WHERE `user_id`='$user_id'   ");
		$nama = $user->nama;
		
		eksekusi($pdo,"UPDATE `voucher` SET `using`='User $nama' WHERE `kode`='$kode'   ");
		$alert = "success";
		$respon = "Kode Voucher Sudah Di Redeem . Koin Anda Bertambah $t . Terima Kasih ";
		
		
	} else {
		$alert = "danger";
		$respon = "Maaf. Kode Sudah Di Gunakan Sebelumnya Oleh ".$k->using;
		
	}
}  

 
}  ?>
<?php  if(!empty($alert)){ ?>
	<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>			




<div class="row">
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1    p-1 ">
<div class="card">
<div class="card-header"><h5>Redeem Kode Voucher </h5></div>


<div class="card-block"><div class="table-responsive">
	<form method="post" enctype="multipart/form-data"> 
	 
	<span> Masukkan Kode Voucher </span> 
	<input type="text" required class="form-control" name="kode" value="" placeholder="Kode Voucher"    />
	<br />
	
	<button type="submit" class="btn btn-primary" name="masukkan" >Redeem Code</button> 
	</form>
	
</div>
</div>
</div>
</div>





</div>



 
 

 
