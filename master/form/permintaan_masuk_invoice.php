<?php 
$invoice = "";
if(!empty($_GET['invoice'])){ 
$invoice = in($_GET['invoice']); 
}
 

$check_inv = select($pdo,"SELECT * FROM invoice WHERE invoice='$invoice' "); 
$check_inv->execute();
$row_inv = row($check_inv);
if($row_inv >= 1){
$data = fetch_obj($check_inv); 
$user_id = $data->user_id;

$check_u = select($pdo,"SELECT * FROM user WHERE user_id='$user_id' "); 
$check_u->execute();
$row_u = row($check_u);
$user = fetch_obj($check_u); 



if(isset($_POST['konfirmasi'])){
$batas_login = in($_POST['batas_login']);
$kategori_tryout = in($_POST['kategori_tryout']);

eksekusi($pdo,"UPDATE user SET premium='Yes' ,`batas_login`='$batas_login' , kategori_tryout='$kategori_tryout' WHERE user_id='$user_id'  ");
eksekusi($pdo,"UPDATE invoice SET status_bukti='Diterima' WHERE invoice='$invoice'  ");
$alert = "success";
$respon = "Permintaan Berhasil DI Konfirmasi";

$data->status_bukti= 'Diterima';
$data->status = "Terbayar";
$total = $data->total;

eksekusi($pdo,"INSERT INTO buku_master (`date`,`keterangan`,`jumlah`) VALUES ('$date','Registrasi $user_id','$total' ) ");


}


?>
			


<div class="row">
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12    p-1 ">
<div class="card">
<div class="card-header"><h5>Permintaan Konfirmasi - <?php echo($data->user_id) ;  ?></h5></div>


<div class="card-block"><div class="table-responsive">
	<?php if($data->status_bukti == "Menunggu Konfirmasi"){ ?> 
	<h5> Apakah Anda Yakin Ingin Mengkonfirmasi Invoice <?php echo($data->user_id) ;  ?></h5> 
	<br />
	<form method="post" enctype="multipart/form-data"> 
	
		<span> User ID </span> 
		<input type="text" readonly class="form-control" name="user_id" value="<?php echo($data->user_id) ;  ?>" placeholder=""    />
		<br>
		<span> Total Pembayaran </span> 
		<input type="text" readonly class="form-control" name="total" value="<?php echo(uang($data->total)) ;  ?>" placeholder=""    />
		<br>
		<span> Kategori Yang Di Pilih </span> 
		<select type="text" required class="form-control" name="kategori_tryout" value="" placeholder=""   >
			<option>PKN STAN REGULER</option>
			<option>DIII STAN TUGAS BELAJAR</option>
			<option>DIV STAN TUGAS BELAJAR</option>
			<option>PERGURUAN TINGGI KEDINASAN</option>
			<option>CPNS UMUM</option>
		</select>
		<br />
		<script>  $('#kategori').val('<?php echo($user->kategori_tryout) ;  ?>')  </script> 
		<span> Masa Aktif <small> (yyyy-mm-dd) </small> </span> 
		<input type="date" required class="form-control" name="batas_login" value="" placeholder=""    />
		<br />
		 
		<a href="?show=permintaan_masuk" class="btn btn-danger" >Kembali</a>
		<button type="submit" name="konfirmasi" class="btn btn-success" >Konfirmasi</button>
		
	
	</form>
	 
	<?php  } else {?> 
	<h4> Permintaan Ini Sudah Di Konfirmasi </h4>  
	<?php }  ?>
	
	
</div>
</div>
</div>
</div>



</div>



<?php } else {?> 
 <script>  document.location.href="?show=permintaan_masuk";   </script> 
<?php } ?>