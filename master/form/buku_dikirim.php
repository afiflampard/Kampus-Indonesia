<?php 
if(isset($_POST['delete'])){
$id = in($_POST['id']);
$check_p = select($pdo,"SELECT * FROM `invoice_buku` WHERE `id`='$id' and `status_bukti`='Menunggu Konfirmasi' "); 
$check_p->execute();
$row_p = row($check_p);
if($row_p >= 1){
	eksekusi($pdo,"UPDATE `invoice_premium` SET `status_bukti`='Ditolak' WHERE `id`='$id' ");
	$alert = "danger";
	$respon = "Permintaan Sudah Ditolak";
	

}  
}


if(isset($_POST['masukkan_resi'])){
	$resi = in($_POST['resi']);
	$id = in($_POST['id']);
	eksekusi($pdo,"UPDATE invoice_buku SET status='Terkirim' , resi='$resi' WHERE id='$id' ");
	$alert = "success";
	$respon = "Pesanan Telah Di Selesaikan Dan Resi Telah Di Masukkan ";
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
<div class="card-header"><h5>Berikut Permintaan Pembelian Yang Perlu DIkirim</h5>   
</div>


<div class="card-block"><div class="table-responsive">
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
	
		<tr>
			<th> Nama Penerima </th>  
			<th> Judul </th> 
			<th> Provinsi </th>  
			<th> Kota </th> 
			<th> Alamat Tujuan  </th> 
			<th> Kurir Pilihan </th> 
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/buku_dikirim.php", 
 "aoColumns": [
	 
	null,
	null,
	null,
	null, 
	null, 
	null, 
	{ "mclass":"wall", "mData": "6", "mRender": function ( data, type, full ) { 
	conf = "showresi('"+data+"','"+full[2]+"')"; 
	see = ' <button class="btn btn-success btn-xs btn-sm" onclick="'+conf+'"  type="button">Telah Dikirim</button> '; 
	print = ' <a class="btn btn-primary btn-xs btn-sm" href="print_buku.php?id='+data+'"  >Print</a> '; 
	return see+print;
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


