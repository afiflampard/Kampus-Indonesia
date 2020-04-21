<?php 
if(isset($_POST['delete'])){
$id = in($_POST['id']);
eksekusi($pdo,"DELETE FROM `data_saran` WHERE `id`='$id' ");
}

?>

<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1">
<div class="card">
<div class="card-header"><h5>Saran/Komplain Masuk</h5></div>


<div class="card-block"><div class="table-responsive">

	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Tanggal </th> 
			<th> User ID</th> 
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
	null,
	{ "mclass":"wall", "mData": "2", "mRender": function ( data, type, full ) {
	return '<div style="white-space:normal !important; max-width:80%; "> '+data+' </div>';
	}},
	null,
	{ "mclass":"wall", "mData": "4", "mRender": function ( data, type, full ) {
	 del = "showdel('"+data+"','"+full[0]+"')";
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




