<?php 
if(isset($_POST['delete'])){
$id = in($_POST['id']);
$check_p = select($pdo,"SELECT * FROM `invoice` WHERE `id`='$id' and `status_bukti`='Menunggu Konfirmasi' "); 
$check_p->execute();
$row_p = row($check_p);
if($row_p >= 1){
	eksekusi($pdo,"UPDATE `invoice` SET `status_bukti`='Ditolak' WHERE `id`='$id' ");	$alert = "danger";
	$respon = "Permintaan Sudah Ditolak";

}  
}




if(!empty($_GET['conf'])){ 
$id = in($_GET['conf']); 
$check_p = select($pdo,"SELECT * FROM `invoice` WHERE `id`='$id' and `status_bukti`='Menunggu Konfirmasi' "); 
$check_p->execute();
$row_p = row($check_p);
if($row_p >= 1){
	$p = fetch_obj($check_p); 
	$poin = $p->koin;
	$userx = $p->user_id;
	
	$total_pembayaran = $p->total_pembayaran;
	$judul = $p->judul." Pada Rekening ".$p->bank_jenis." - ".$p->bank_rekening;
	
	eksekusi($pdo,"INSERT INTO `buku_master` (`date`,`keterangan`,`jumlah`) VALUES ('$date','$judul','$total_pembayaran') ");
	
	
	
	
	
	eksekusi($pdo,"UPDATE `invoice` SET `status_bukti`='Diterima',`status`='Paid' WHERE `id`='$id' ");
	eksekusi($pdo,"UPDATE `user` SET `poin`=`poin`+$poin WHERE `user_id`='$userx' ");
	eksekusi($pdo,"INSERT INTO `notifikasi` (`date`,`text`,`user_id`,`kredit`) VALUES ('$date','Anda Mendapatkan Tambahan Poin Sebesari $poin','$userx','$poin') ");

						$alert = "success";
	$respon = "Permintaan Sudah Diterima";

$check_u = select($pdo,"SELECT * FROM `user` WHERE `user_id`='$userx'  "); 
$check_u->execute();
$row_u = row($check_u);
if($row_u >= 1){
	$u = fetch_obj($check_u); 
	$email = $u->email;
	$nama = $u->nama;
}  
}
}

?>

<?php  if(!empty($alert)){ ?>
	<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>			


<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">
<div class="card">
<div class="card-header"><h5>Permintaan Konfirmasi</h5></div>


<div class="card-block"><div class="table-responsive">
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
	
		<tr>
			<th> Date </th> 
			<th> User ID </th> 
			<th> Judul </th> 
			<th> Invoice </th> 
			<th> Total Pembayaran</th> 
			<th> Bukti </th> 
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/permintaan_masuk.php", 
 "aoColumns": [
	
	null,
	null, 
	null,
	null, 
	null, 
	{ "mclass":"wall", "mData": "5", "mRender": function ( data, type, full ) {
		if(data != ""){
			on = "showimg('../image/"+data+"')";
			return '<img onclick="'+on+'" src="../crop.php?w=60&h=40&img='+data+'" style="border-radius:3px !Important " />';
		} 	else {
			return "";
		}
	}}, 
	{ "mclass":"wall", "mData": "6", "mRender": function ( data, type, full ) {
	del = "showdel('"+data+"','"+full[3]+"')"; 
	hapus = ' <button class="btn btn-danger btn-xs btn-sm" onclick="'+del+'"  type="button">Tolak</button> ';
	see = ' <a href="?show=permintaan_masuk_invoice&invoice='+full[3]+'" class="btn btn-success btn-xs btn-sm" >Terima</a> '; 
	return hapus+see;
	}} 
 ]
 } );
 } );
 </script>
 
</div>
</div>
</div>
</div>



</div>


