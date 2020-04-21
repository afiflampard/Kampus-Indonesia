<?php 
$id = -1;
if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 
}

$check_buku = select($pdo,"SELECT * FROM `data_buku` WHERE `id`='$id'  "); 
$check_buku->execute();
$row_buku = row($check_buku);
if($row_buku >= 1){
$buku = fetch_obj($check_buku); 
$whatsapp = " ".$master->whatsapp;
$judul = $buku->judul;

if(isset($_POST['beli'])){
	$provinsi = in($_POST['provinsi']);
	$kota = in($_POST['kota']);
	$alamat = in($_POST['alamat']);
	$nama = in($_POST['nama']);
	$k = in($_POST['kurir']);
	$kx = explode('_',$k)     ;
	$kurir = $kx[0]." ".$kx[1];
	$ongkir = angka($kx[2]);
	if($ongkir >= 10){
		
		$unik = 1;
		$check_unik = select($pdo,"SELECT MAX(kode_unik) as kode_unik FROM `invoice_buku` WHERE status='Menunggu Pembayaran' "); 
		$check_unik->execute();
		$row_unik = row($check_unik);
		if($row_unik >= 1){
			$u = fetch_obj($check_unik); 
			$unik = $u->kode_unik + 1;
		}  
		
		$harga = $buku->harga;
		$total = $harga + $ongkir + $unik ;
		$kurir2= $kurir." - Rp. ".$ongkir;
		
		$invoice = "INVB-".date('ymdhis').$user->id;
		
		eksekusi($pdo,"INSERT INTO `invoice_buku`
		(`judul`, `provinsi`, `kota`, `alamat`,		 `nama_penerima`, `total`, `kode_unik`, `total_pembayaran`, `status`, `user_id`, `date`, `invoice`,  `kurir`, `nama_buku`) VALUES 
		('Pembelian Buku $judul','$provinsi','$kota','$alamat','$nama','$harga','$kode_unik','$total','Menunggu Pembayaran','$user_id','$date','$invoice','$kurir2','$judul') ");
		
		?> 
		<script>  document.location.href="?show=buku_bayar&invoice=<?php echo($invoice) ;  ?>";   </script>  
		<?php 
		
		
	} else {
		$alert = "danger";
		$respon = "Terjadi Kesalahan Saat Pengambilan Data Kurir";
		
	}
	
} 


?>
<?php  if(!empty($alert)){ ?>
	<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>			



<div class="row"> 
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1">
<a class="btn btn-danger btn-sm" href="?show=buku" > Kembali </a> 
</div>
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1  p-1">
	<img src="../image/<?php echo($buku->image) ;  ?>"  style="width : 100%;"  />
</div>


<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-1     p-1">
<div class="card">
<div class="card-header"><h5><?php echo($buku->judul) ;  ?>  </h5></div>

	
<div class="card-block"><div class="table-responsive">
<?php echo html_entity_decode(htmlspecialchars_decode($buku->keterangan)) ;  ?>
<br />
<br />
  
  
<form method="post" enctype="multipart/form-data"> 
	<div class="bg-light p-3">
	<h4> Beli Sekarang</h4>
	<p> Silahkan Mengisi Form Pengiriman Jika Ingin Melakukan Pembelian </p> 
	<br />
	 
	<span> Provinsi </span> 
	<select type="text" required class="form-control" onchange="check_kota(this.value)" name="provinsi" value="" placeholder=""    >
	<option  value=""  > Pilih Provinsi </option>
	<?php $check_p = select($pdo,"SELECT * FROM z_provinsi "); 
	$check_p->execute();
	$row_p = row($check_p);
	if($row_p >= 1){
		while($p = fetch_obj($check_p)){
			?> 
			<option><?php echo($p->provinsi) ;  ?></option> 
			<?php 
		}
	}  
	?>
	</select>
	<br />
	<span> Kota </span> 
	<select type="text" required onchange="check_kurir(this.value)" class="form-control" id="kota" name="kota" value="" placeholder=""   >
	<option> Pilih Provinsi Dulu </option>
	</select><br />
	 
	<span> Pilih Kurir </span> 
	<select type="text" required class="form-control" id="kurir" name="kurir" value="" placeholder=""   >
	<option> Pilih Kota Dulu </option>
	</select>
	<br />
	
	<span> Alamat Lengkap </span> 
	<input type="text" required class="form-control" name="alamat" value="" placeholder=""    />
	<br />
	<span> Nama Penerima </span> 
	<input type="text" required class="form-control" name="nama" value="" placeholder=""    />
	<br />
	<button type="submit" name="beli" class="btn btn-success" >Beli Sekarang </button>

</form>





</div>
</div> 

  
  
 
</div>
</div> 
</div> 
</div> 



<script>  
function check_kota(provinsi){
	$.getJSON('check_kota.php?provinsi='+provinsi,function(respon){
		if(((respon != "")) && (respon != "undifined") && (respon !=  null)){
			
			response = respon['response'];
			if(response == "success"){
				
				d  = "";
				data = respon['data']
				$.each(data,function(key,val){
				d += '<option>'+val+'</option>';
				});
		
			if(d != ""){
				$('#kota').html(d);
			} else {
				$('#kota').html('<option  value=""  >Gagal Mengambil Data Kota</option>');	
			}
				
			} else {
				$('#kota').html('<option  value=""  >Gagal Mengambil Data Kota</option>');
			}
		} 
	});
}


function check_kurir(kabupaten){
	if(kabupaten != ""){
		

	$('#kurir').html('<option  value=""  >Sedang Mengambil Ongkir</option>');	
	
	$.getJSON('check_kurir.php?kabupaten='+kabupaten,function(respon){
		if(((respon != "")) && (respon != "undifined") && (respon !=  null)){
			
			response = respon['response'];
			if(response == "success"){
				
				
			data = respon['data']
						
			if(data != ""){
				$('#kurir').html(data);
			} else {
				$('#kurir').html('<option  value=""  >Kota Tujuan Tidak Di Dukung Pengiriman</option>');	
			}
				
			} else {
				$('#kurir').html('<option  value=""  >Kota Tujuan Tidak Di Dukung Pengiriman</option>');
			}
		} 
	});
	} else {
			$('#kurir').html('<option  value=""  >Pilih Kota Dulu </option>');
	}
}

</script> 



<?php } ?>

