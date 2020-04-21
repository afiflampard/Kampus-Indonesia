<?php 
if(isset($_POST['delete'])){
$id = in($_POST['id']); 
eksekusi($pdo,"DELETE FROM bimbel_daftar WHERE `id`='$id' ");
}


if(isset($_POST['konfirmasi'])){
$id = in($_POST['id']); 
eksekusi($pdo,"UPDATE `bimbel_daftar` SET dibaca='Yes' WHERE `id`='$id' ");
}


 
?>


<div class="row"> 
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12   p-1">
<div class="card">
<div class="card-header"><h5>Permintaan Bimbel Masuk</h5></div>


<div class="card-block"><div class="table-responsive">

	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> User ID </th>  
			<th> Nama </th>  
			<th> Telepon </th>  
			<th> Paket Pilihan</th>  
			<th> Lokasi </th>  
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/bimbel_masuk.php", 
 "aoColumns": [ 
 
	null,
	null,
	null,
	null,
	null,
	{ "mclass":"wall", "mData": "5", "mRender": function ( data, type, full ) {
	conf = "showconf('"+data+"','"+full[1]+"')";
	del = "showdel('"+data+"','"+full[1]+"')";
	c = ' <button class="btn btn-primary btn-xs btn-sm" onclick="'+conf+'"  type="button">Sudah Di Baca</button> '; 
	hapus = ' <button class="btn btn-danger btn-xs btn-sm" onclick="'+del+'"  type="button">Hapus</button> '; 
	if(full[6] == "No"){
	return hapus+c;
	} else {
		return hapus;
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




