<?php
$id = -1; 
	
if(!empty($_GET['tukar'])){ 
$id= in($_GET['tukar']); 
}


$check_data = select($pdo,"SELECT * FROM `data_bonus` WHERE `id`='$id'  "); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
$data = fetch_obj($check_data); 
if($user->mypoin >= $data->poin){
	
if(isset($_POST['tukarkan'])){
	$penerima = in($_POST['penerima']);
	$alamat = str_replace("'","`",$_POST['alamat']);
	$alamat = str_replace("\n","<br>",$alamat);
	
	$nama_barang = $data->judul;
	
	$mypoin = $user->mypoin - $data->poin;
	eksekusi($pdo,"INSERT INTO `data_bonus_permintaan`
	(`id_barang`, `nama_barang`, `user_id`, `alamat`, `penerima`) VALUES 
	('$id','$nama_barang','$user_id','$alamat','$penerima') ");
	
	eksekusi($pdo,"UPDATE `user` SET `mypoin`='$mypoin' WHERE `user_id`='$user_id'   ");
	
	$alert = "success";
	$respon = "Permintaan Pertukaran Anda Sedang Di Proses. Terima Kasih";
	
	
} 
?>




<?php  if(!empty($alert)){ ?>
	<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>			


<div class="row">
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1     p-1">
<div class="card">
<div class="card-header"><h5>Tukar Bonus Poin Dengan <?php echo($data->judul) ;  ?></h5></div>
	 
<div class="card-block"><div class="table-responsive">
  <p> Tukarkan Poin Anda Dengan barang yang mungkin anda sukai . Setiap melakukan transaksi / pembelian tryout . maka anda akan mendapatkan poin sesuai dengan poin yang disediakan .  </p> 
<br />
<form method="post" enctype="multipart/form-data"> 
<span> Bonus Poin Anda </span> 
<input type="text" required class="form-control"readonly name="bonus"  value="<?php echo($user->mypoin) ;  ?>" placeholder=""    />
<br />
<span> Nama Barang </span> 
<input type="text" required class="form-control"readonly name="barang" value="<?php echo($data->judul) ;  ?>" placeholder=""    />

<br />
<span> Poin Yang Ditukarkan </span> 
<input type="text" required class="form-control" readonly name="barang" value="<?php echo($data->poin) ;  ?>" placeholder=""    />

<br />
<span> Alamat Tujuan & Kontak </span> 
<textarea type="text"  style="height: 200px"  required class="form-control"   name="alamat" value="<?php echo($data->poin) ;  ?>" placeholder="Masukkan Alamat Lengkap"   >
Provinsi : 
Kota : 
Alamat : 
Telepon : 
</textarea>

<br />
<span> Penerima </span> 
<input type="text" required class="form-control"   name="penerima" value="<?php echo($user->nama) ;  ?>" placeholder="Nama Penerima Barang"    />


<br />
<a   class="btn btn-danger" href="?show=mypoin" name="tukarkan" >Kembali </a> 
<button type="submit" class="btn btn-primary" name="tukarkan" >Tukarkan Poin </button> 
 

</form>


  
 
</div>
</div>
</div>
</div>


<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  p-1" >
<div class="card">
<div class="card-header"><h5>Riwayat Pertukaran Anda</h5></div>
<div class="card-block">
<p> Kami Akan segera mengirim barang yang anda tukarkan sesuai dengan destinasi pengiriman . </p> 

<div class="table-responsive">
<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
<thead>
<tr>
<th> Nama Barang </th> 
<th> Alamat Tujuan </th> 
<th> Penerima </th> 
<th> Status  </th> 
</tr>
</thead>
</table>

<script>   
$(document).ready(function() {
$('#history').dataTable( {
"bProcessing": true,
"bServerSide": true,
"sAjaxSource": "server/data_bonus_permintaan.php", 
"aoColumns": [
null,
null,
null,
null
]
} );
} );
</script>
</div>

</div> 
</div>  
</div> 
</div> 





<?php } else {?> 
<script>  document.location.href="?show=mypoin";   </script>  
<?php } ?>



<?php } else {?> 
<script>  document.location.href="?show=mypoin";   </script>  
<?php } ?>


