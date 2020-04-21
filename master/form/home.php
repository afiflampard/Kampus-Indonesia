<?php 
$check_notif = select($pdo,"SELECT * FROM `notifikasi` WHERE `user_id`='$user_id' and `read`='No' ORDER BY `id` DESC  "); 
$check_notif->execute();
$row_notif = row($check_notif);

 
$check_soal = select($pdo,"SELECT * FROM `data_soal` WHERE `harga`>=1 "); 
$check_soal->execute();
$row_soal = row($check_soal);
 
 

$check_u = select($pdo,"SELECT `id` FROM `user`  "); 
$check_u->execute();
$row_u = row($check_u);


$check_inv = select($pdo,"SELECT * FROM `invoice` WHERE  `status_bukti`='Menunggu Konfirmasi'  "); 
$check_inv->execute();
$row_inv = row($check_inv);

$check_inv = select($pdo,"SELECT * FROM `invoice_buku` WHERE `status_bukti`='Menunggu Konfirmasi'  "); 
$check_inv->execute();
$row_inv2 = row($check_inv);

$total = 0;

$check_total = select($pdo,"SELECT SUM(`jumlah`) as `total` FROM `buku_master`   "); 
$check_total->execute();
$row_total = row($check_total);
if($row_total >= 1){
	$t = fetch_obj($check_total); 
	$total = $t->total;
}  

$check_b = select($pdo,"SELECT * FROM bimbel_daftar WHERE dibaca='No' "); 
$check_b->execute();
$bimbel = row($check_b);




 


?>

<div class="row">
<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-12 p-1">
	<div class="card bg-c-green order-card">
		<div class="card-block" style="min-height: 130px;">
			<h6 class="m-b-20">Total Soal </h6>
			<h2 class="text-right"><i class="ti-receipt f-left"></i><span><?php echo($row_soal) ;  ?></span></h2>
			<p class="m-b-0"><a class="" href="?show=soal_list" style="color:white !important;" > Lihat Semua Daftar Soal </a> </p>
		</div>
	</div>
</div>

 
 
 
<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-12 p-1">
	<div class="card bg-c-blue order-card">
		<div class="card-block" style="min-height: 130px;">
			<h6 class="m-b-20">Total Member </h6>
			<h2 class="text-right"><i class="fa fa-user f-left"></i><span><?php echo($row_u) ;  ?></span></h2>
			<p class="m-b-0"><a class="" href="?show=materi_list"  style="color:white !important;"> Lihat Semua Member </a>  </p>
		</div>
	</div>
</div>

 

 
<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-12 p-1">
	<div class="card bg-c-pink order-card">
		<div class="card-block" style="min-height: 130px;">
			<h6 class="m-b-20">Bukti Pembayaran Member </h6>
			<h2 class="text-right"><i class="fa fa-ticket f-left"></i><span><?php echo($row_inv) ;  ?></span></h2>
			<p class="m-b-0"><a class="" href="?show=permintaan_masuk"  style="color:white !important;"> Lihat Permintaan </a>  </p>
		</div>
	</div>
</div>

 
<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-12 p-1">
	<div class="card bg-c-pink order-card">
		<div class="card-block" style="min-height: 130px;">
			<h6 class="m-b-20">Bukti Pembayaran Buku </h6>
			<h2 class="text-right"><i class="fa fa-ticket f-left"></i><span><?php echo($row_inv2) ;  ?></span></h2>
			<p class="m-b-0"><a class="" href="?show=permintaan_masuk2"  style="color:white !important;"> Lihat Permintaan </a>  </p>
		</div>
	</div>
</div>
 
<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-12 p-1">
	<div class="card bg-c-blue order-card">
		<div class="card-block"  style="min-height: 130px;" >
			<h6 class="m-b-20">Pemasukan Selama Ini </h6>
			<h4 class="text-right"><i class="fa fa-money f-left"></i><span>Rp. <?php echo uang($total) ;  ?></span></h4>
			<p class="m-b-0"><a class="" href="?show=permintaan_masuk2"  style="color:white !important;"> Lihat Semua Pemasukan </a>  </p>
		</div>
	</div>
</div>

<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-12 p-1">
	<div class="card bg-c-blue order-card">
		<div class="card-block"  style="min-height: 130px;" >
			<h6 class="m-b-20">Permintaan Bimbel </h6>
			<h4 class="text-right"><i class="fa fa-ticket f-left"></i><span><?php echo uang($bimbel) ;  ?> Req</span></h4>
			<p class="m-b-0"><a class="" href="?show=bimbel_daftar"  style="color:white !important;"> Lihat Semua Permintaan </a>  </p>
		</div>
	</div>
</div>

 

 
</div>





<?php
$where = " `id`<>'-1' ";
	$date_start = "";
	$date_stop = "";
	 


$check_total = select($pdo,"SELECT SUM(`jumlah`) as `total` FROM `buku_master` WHERE $where "); 
$check_total->execute();
$row_total = row($check_total);
if($row_total >= 1){
	$t = fetch_obj($check_total); 
	$total = $t->total;
}  

?>


<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">
<div class="card">
<div class="card-header"><h5>Pemasukan Terbaru</h5></div>




<div class="card-block"><div class="table-responsive">
 <table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Tanggal </th> 
			<th> Keterangan </th> 
			<th> Jumlah </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/book.php?filter=<?php echo($where) ;  ?>", 
 "aoColumns": [
	
	null,
	null,
	{ "mclass":"wall", "mData": "2", "mRender": function ( data, type, full ) {
		return "Rp. "+uang(data);
	}},
	
 ]
 } );
 } );
 </script>
 
</div>
</div>
</div>
</div>


</div>


