<?php 
if(isset($_POST['new'])){
	$unik = rand(0,1999);
	$koin = angka($_POST['koin']);
	$kupon = in($_POST['kupon']);
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
	
	
	if($koin >= 25){
	$total = $koin * $master->harga_poin;
	$total_pembayaran = $total+$unik;
	$expired= date('Y-m-d', strtotime('+2 days', strtotime($date)));
	
	eksekusi($pdo,"INSERT INTO `invoice`
	(`bank_jenis`,`bank_rekening`,`bank_nama`,`judul`, `metode`, `total`, `kupon`, `kode_unik`, `total_pembayaran`, `status`, `user_id`, `date`, `expired`,`invoice`,`koin`) VALUES 
	('$bank_jenis','$bank_rekening','$bank_nama','Pembelian Koin $total','$metode','$total','$kupon','$unik','$total_pembayaran','Unpaid','$user_id','$date','$expired','$invoice','$koin') ");
	
	?> 
	<script>  document.location.href="?show=koin_bayar&inv=<?php echo($invoice) ;  ?>";   </script>  
	<?php 
		
		
	
	} else {
		$alert = "danger";
		$respon = "Maaf. Harap Memasukkan Jumlah Koin Dengan Benar";
		
	}
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
<div class="card-header"><h5>Tata Cara Deposiit</h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data">  	
	
	
	<div class="alert alert-info alert-dismissable">
		<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>TARA CARA DEPOSIT KOIN : </strong> <br />
		
1. Deposit Koin adalah cara menambahkan koin anda dengan melalui system  transfer.<br />
2. Jumlah Koin minimal yang dapat diisi adalah 25 koin tanpa batas maksimal<br />
3. Deposit koin hanya dapat dilakukan melalui Bank BCA, BRI, BNI dan Mandiri atas nama Alex Oktobertus Pandapotan <br />
4. Deposit Koin hanya akan diproses setelah user mengUPLOAD Bukti Transfer berupa resi transfer ATM, m-banking, sms banking, dan TELLER Bank.<br />
5. Deposit Koin tidak akan diproses tanpa bukti transfer dengan alasan apapun.<br />
6. Uang yang ditransfer untuk membeli tidak dapat dikembalikan dengan alasan apapun<br />
7. Jika memiliki kendala silahkan hubungi kami di 0812-5618-5080  <br />
	</div>  
	
	
</form>

</div>
</div>
</div>
</div>




<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1    p-1">
<div class="card">
<div class="card-header"><h5>Buat Pesanan </h5></div>


<div class="card-block"><div class="table-responsive">
 
	<p> Silahkan Mengisi Permintaan Pembelian Koin Di Bawah Ini (<b> Minimal Pembelian 25 Koin </b>). Pastikan Mengisi Data Dengan Benar . Terima Kasih </p> 
	<form method="post" enctype="multipart/form-data"> 
		

<div class="input-group mb-3">
  <input type="number" name="koin" min="25" required onchange="calc_price(this.value)"  onkeyup="calc_price(this.value)" class="form-control" placeholder="Jumlah Koin">
</div>

	
<div class="input-group mb-3">
  <div class="input-group-prepend"  style="width : 40%;">
    <span class="input-group-text"  style="width : 100%;"  id="basic-addon1">Gunakan Kupon</span>
  </div>
  <input type="text"  class="form-control" name="kupon" placeholder="Jika Ada">
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

	<br />
	<br />
	  
<div class="input-group mb-3">
  <div    style="width : 40%;" class="input-group-prepend">
    <span   style="width : 100%;"  class="input-group-text" id="basic-addon1">Subtotal </span>
  </div>
  <input type="text" readonly class="form-control" id="sub_total" value="Rp. 0" placeholder="Rp"    />
</div>

<div class="input-group mb-3">
  <div    style="width : 40%;" class="input-group-prepend">
    <span   style="width : 100%;"  class="input-group-text" id="basic-addon1">Biaya Admin </span>
  </div>
  <input type="text" readonly class="form-control" value="Rp. 0" placeholder=""    />
</div>

<div class="input-group mb-3">
  <div    style="width : 40%;" class="input-group-prepend">
    <span   style="width : 100%;"  class="input-group-text" id="basic-addon1">Total </span>
  </div>
  <input type="text" readonly class="form-control" id="total" value="" placeholder="Rp. 0"    />
</div>


<button type="submit" name="new" class="btn btn-primary form-control" >Buat Pesanan</button>
	
</form>

</div>
</div>
</div>
</div>
</div>




<script>  
var price = <?php echo($master->harga_poin) ;  ?>;

function calc_price(total){
if(total != ""){
	totalx = Number(total);
	if(totalx >= 1){
	
	t = totalx * price;
	$('#total').val('Rp. '+uang(t));
	$('#sub_total').val('Rp. '+uang(t));
} else {
	$('#total').val('Rp. 0');
	$('#sub_total').val('Rp. 0');
	
}
} else {
	$('#total').val('Rp. 0');
	$('#sub_total').val('Rp. 0');
	
}
}

</script> 