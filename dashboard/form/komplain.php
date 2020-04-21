<?php 
if(!empty($_GET['del'])){ 
$del = in($_GET['del']); 
eksekusi($pdo,"DELETE FROM `data_saran` WHERE `user_id`='$user_id' and `id`='$del' ");
}





if(isset($_POST['new'])){
$text = in($_POST['saran']);
$check_saran = select($pdo,"SELECT * FROM `data_saran` WHERE `user_id`='$user_id' and `text`='$text' "); 
$check_saran->execute();
$row_saran = row($check_saran);
if($row_saran >= 1){
	$alert = "danger";
	$respon = "Anda Sudah Memasukkan Saran yang sama";
}  else {
	eksekusi($pdo,"INSERT INTO `data_saran` (`user_id`,`text`,`date`) VALUES ('$user_id','$text','$date') ");
	$alert = "success";
	$respon = "Terima Kasih . Saran/komplain Anda Telah Kami Tampung. ";
}
} 



?>

<div class="row">
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1   p-1 ">
<div class="card">
<div class="card-header"><h5>Kirim Komplain/Saran Anda </h5></div>
<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data">  	
	 
<?php  if(!empty($alert)){ ?>
	<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>			


	
	<span> Saran / Komplain </span> 
	<textarea  required style="height:200px" class="form-control" name="saran" ></textarea>
	<br />
	
	<br />
	<button type="submit" name="new" class="btn btn-success" >Kirim Permintaan Konfirmasi</button>  

</form>

</div>
</div>
</div>
</div>




<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1">
<div class="card">
<div class="card-header"><h5>Projects</h5></div>
	 
<div class="card-block"><div class="table-responsive">

	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Tanggal </th> 
			<th> Saran/Komplain </th> 
			<th> Dibaca </th> 
			<th> # </th>  
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/saran.php", 
 "aoColumns": [
	null,
	{ "mclass":"wall", "mData": "1", "mRender": function ( data, type, full ) {
	return '<div style="white-space:normal !important; max-width:80%; "> '+data+' </div>';
	}},
	null,
	{ "mclass":"wall", "mData": "3", "mRender": function ( data, type, full ) {
	 del = "showdel('"+data+"','"+full[0]+"','komplain')";
	 hapus = ' <button class="btn btn-primary btn-xs btn-sm" onclick="'+del+'"  type="button">Hapus</button> ';
	 return hapus;
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




