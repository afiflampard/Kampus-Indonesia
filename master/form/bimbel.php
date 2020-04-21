<?php 
if(isset($_POST['delete'])){
$id = in($_POST['id']); 
eksekusi($pdo,"DELETE FROM `bimbel` WHERE `id`='$id' ");
}

if(isset($_POST['new'])){
	$judul = in($_POST['judul']);
	$text = in($_POST['text']);
	   require_once("isset_image.php");
	   
	if(!empty($image)){
	$check_data = select($pdo,"SELECT * FROM bimbel WHERE judul='$judul' "); 
	$check_data->execute();
	$row_data = row($check_data);
	if($row_data >= 1){
		$alert = "danger";
		$respon = "Maaf. Judul Ini Sudah Ada sebelumnya";
	}  else {
		
		eksekusi($pdo,"INSERT INTO bimbel (`judul`,`image`,`text`) VALUES  ('$judul','$image','$text') ");
		$alert = "success";
		$respon = "Bimbel Baru Berhasil Di Masukkan - Silahkan Tambahkan Alamat Bimble Pada Form Lokasi Bimbel";	
		
	}
	} else {
		$alert = "danger";
		$respon = "Image Ini Tidak Valid ";
		
	}
} 
 
?>


<div class="row">

<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12  p-1">
<div class="card">
<div class="card-header"><h5>Tambah Alamat</h5></div>


<div class="card-block">
<form method="post" enctype="multipart/form-data"> 
	
	<span> Judul Bimbel </span> 
	<input type="text" required class="form-control" name="judul" value="" placeholder=""    />
	<br />
	<span> Image </span> 
	<input type="file" required class="form-control" name="image" value="" placeholder=""    />
	<br />
	
	<span> Content  </span> 
	<link rel="stylesheet" href="assets/html5-editor/bootstrap-wysihtml5.css" />   
	<script src="assets/tinymce/tinymce.min.js"></script>
	<textarea id="mymce"  class="form-control" name="text"></textarea>
	<script>
	$(document).ready(function () {
	if ($("#mymce").length > 0) {
	tinymce.init({
	 selector: "textarea#mymce"
	 , theme: "modern"
	 , height: 300
	 , plugins: [
	"advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker"
	, "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking"
	, "save table contextmenu directionality emoticons template paste textcolor"
	]
	 , toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l   ink image | print preview media fullpage | forecolor backcolor emoticons"
	, });
	}
	});
	</script> 	
	<br />
	<button type="submit" name="new" class="btn btn-success" >Tambah Bimbel</button> 
	

</form>
</div>
</div>
</div>


<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12  p-1">
<div class="card">
<div class="card-header"><h5>Daftar Judul Bimbel</h5></div>


<div class="card-block"><div class="table-responsive">

	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Judul </th>  
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/bimbel.php", 
 "aoColumns": [ 
 
	null,
	{ "mclass":"wall", "mData": "1", "mRender": function ( data, type, full ) {
	del = "showdel('"+data+"','"+full[0]+"')";
	 hapus = ' <button class="btn btn-danger btn-xs btn-sm" onclick="'+del+'"  type="button"><i class="fa fa-trash">  </i></button> '; 
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




