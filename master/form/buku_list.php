<?php 
if(isset($_POST['delete'])){
$id = in($_POST['id']); 
eksekusi($pdo,"DELETE FROM `data_buku` WHERE `id`='$id' ");
}

 
?>


<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1    p-1">
<div class="card">
<div class="card-header"><h5>Daftar Buku Jualan</h5></div>


<div class="card-block"><div class="table-responsive">

	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Image </th> 
			<th> Judul </th> 
			<th> Harga </th>   
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/buku.php", 
 "aoColumns": [
	{ "mclass":"wall", "mData": "0", "mRender": function ( data, type, full ) {
		on = "showimg('../image/"+data+"')";
		return	'<img onclick="'+on+'" src="../crop.php?w=30&h=50&img='+data+'"   style="width : 30px;border-radius:3px; " />';
	}},
	null,
	null,
	{ "mclass":"wall", "mData": "3", "mRender": function ( data, type, full ) {
		del = "showdel('"+data+"','"+full[1]+"')";
	 hapus = ' <button class="btn btn-danger btn-xs btn-sm" onclick="'+del+'"  type="button"><i class="fa fa-trash">  </i></button> ';
	 see = ' <a  href="?show=buku_edit&id='+data+'" class="btn btn-primary btn-xs btn-sm"    ><i class="fa fa-edit">  </i></a> ';
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




