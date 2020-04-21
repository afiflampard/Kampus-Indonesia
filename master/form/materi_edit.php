<?php  
$id = "";
if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 
}

$check_data = select($pdo,"SELECT * FROM materi WHERE id='$id' "); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
	$data = fetch_obj($check_data); 
 



if(isset($_POST['new'])){
$judul = in($_POST['judul']);
$text = in($_POST['text']); 
$file = "";
 

$check_k = select($pdo,"SELECT * FROM `materi` WHERE `judul`='$judul' and id<>'$id'  "); 
$check_k->execute();
$row_k = row($check_k);
if($row_k >= 1){
	$alert = "danger";
	$respon = "Maaf. Data Ini Sudah Ada ";
}  else {
	require_once("isset_file.php");
	
	eksekusi($pdo,"UPDATE `materi` SET `judul`='$judul',`text`='$text' WHERE id='$id'  ");
	if(!empty($file)){
		eksekusi($pdo,"UPDATE `materi` SET `file`='$file' WHERE id='$id'  ");
	} 
	?> 
	<script>  document.location.href="?show=materi_list";   </script>  
	<?php 
	$alert = "success";
	$respon = "Data Materi Baru Sudah Di Buat";
}
}  

?>


<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1 ">
<div class="card">
<div class="card-header">
	<h5>Materi baru</h5>
</div>


<div class="card-block">
<form method="post" enctype="multipart/form-data"> 

	<span> Judul </span> 
	<input type="text" required class="form-control" name="judul" value="<?php echo html_entity_decode(htmlspecialchars_decode($data->judul)) ;  ?>" placeholder="Masukkan Judul Faq"    />
	<br />
	 
	<span> File Download </span> 
	<input type="file"   class="form-control" name="file" value="" placeholder="Masukkan Judul Faq"    />
	<br />
	 
	<span> Materi  </span> 
	<link rel="stylesheet" href="assets/html5-editor/bootstrap-wysihtml5.css" />   
	<script src="assets/tinymce/tinymce.min.js"></script>
	<textarea id="mymce"  class="form-control" name="text"><?php echo html_entity_decode(htmlspecialchars_decode($data->text)) ;  ?></textarea>
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
	<button type="submit" name="new" class="btn btn-success" >Edit Materi Baru</button>  

</form>

</div>
</div>  
</div> 
</div> 




<?php } else {?> 
<script>  document.location.href="?show=materi_list";   </script>  
<?php } ?>