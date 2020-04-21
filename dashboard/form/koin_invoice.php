<?php if(!empty($_GET['del'])){ 
$del = in($_GET['del']); 
$check_data = select($pdo,"Select * FROM `invoice` WHERE `id`='$del' and `user_id`='$user_id'  "); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
	eksekusi($pdo,"DELETE FROM `invoice` WHERE `id`='$del'  ");
	$alert = "danger";
	$respon = "Pesanan Sudah Dibatalkan . ";
	
}  




}
 ?>

<?php  if(!empty($alert)){ ?>
	<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>			


<div class="row">

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1    p-1">
<div class="card">
<div class="card-header"><h5>Daftar Invoice Pembelian</h5></div>
 
<div class="card-block"><div class="table-responsive">
 
 <div class="table-responsive">
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Tanggal </th> 
			<th> Expired </th> 
			<th> Invoice </th> 
			<th> Judul </th> 
			<th> Kupon</th> 
			<th> Total </th> 
			<th> Kode Unik</th> 
			<th> Total Pembayaran </th> 
			<th> Total Koin</th> 
			<th> Status </th> 
			<th> Bukti </th> 
			<th> Status Bukti </th> 
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/invoice.php", 
 "aoColumns": [
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	null,
	{ "mclass":"wall", "mData": "10", "mRender": function ( data, type, full ) {
		if((data != "") && (data != null)  && (data != "null")) {
			im = "showimg('../image/"+data+"')";
			return '<img  style="border-radius:0px !Important "  onclick="'+im+'" src="../crop.php?w=50&h=30&img='+data+'"   />';
		} else {
			return "";
		}
	}},
	null,
	{ "mclass":"wall", "mData": "12", "mRender": function ( data, type, full ) {
	 status = full[9];
	 invoice = full[2];
	 if(status == "Unpaid"){
		bayar = '<a class="btn btn-info btn-xs btn-sm" href="?show=koin_bayar&inv='+invoice+'" >Bayar</a> ';
	 return bayar;		 
	 } else {
		 return "";
	 }
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
</div>




