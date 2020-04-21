<?php 
if(isset($_POST['delete'])){
$id = in($_POST['id']);
eksekusi($pdo,"DELETE FROM `faq_panduan` WHERE `id`='$id' ");
}
?>


<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1    p-1">
<div class="card">
<div class="card-header"><h5>Daftar Panduan</h5></div>


<div class="card-block"><div class="table-responsive">

	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Judul </th> 
			<th> Isi </th> 
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/panduan.php", 
 "aoColumns": [
	null,
	{ "mclass":"wall", "mData": "1", "mRender": function ( data, type, full ) {
		return '<div  style="width : 300px; white-space:pre-line; display:block" >'+data+'</div>';
	}},
	{ "mclass":"wall", "mData": "2", "mRender": function ( data, type, full ) {
		del = "showdel('"+data+"','"+full[0]+"')";
	 hapus = ' <button class="btn btn-danger btn-xs btn-sm" onclick="'+del+'"  type="button"><i class="fa fa-trash">  </i></button> ';
	 see = ' <a  href="?show=panduan_edit&id='+data+'" class="btn btn-primary btn-xs btn-sm"    ><i class="fa fa-edit">  </i></a> ';
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




