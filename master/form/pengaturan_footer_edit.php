<?php
if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 
$check_title = select($pdo,"SELECT * FROM `footer` WHERE `id`='$id' "); 
$check_title->execute();
$row_title = row($check_title);
if($row_title >= 1){
$data = fetch_obj($check_title); 




if(isset($_POST['new'])){
$title = in($_POST['title']);
$content = in($_POST['content']);
$check_title = select($pdo,"SELECT * FROM `footer` WHERE `title`='$title' and `id`<>'$id' "); 
$check_title->execute();
$row_title = row($check_title);
if($row_title >= 1){
	$alert = "danger";
	$respon = "Title Ini Sudah Ada Sebelumnya";
}  else {
	
	eksekusi($pdo,"UPDATE `footer` SET `title`='$title' and `content`='$content' WHERE `id`='$id'  ");
	?> 
	<script>  document.location.href="?show=pengaturan_footer";   </script>  
	<?php 
	
}

} 

 ?>
<div class="row">

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">

<div class="card">
<div class="card-header"><h5>Tambah Isi Footer</h5></div>


<div class="card-block"><div class="table-responsive">
 <a class="btn btn-danger" href="?show=pengaturan_footer" > Kembali </a> 
<form method="post" enctype="multipart/form-data"> 
<?php  if(!empty($alert)){ ?>
	<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>			

	<span> Title </span> 
	<input type="text" required class="form-control" name="judul" value="<?php echo($data->title) ;  ?>" placeholder="Masukkan Judul Footer "    />
	<br />

	<span> Content  </span> 
	<link rel="stylesheet" href="assets/html5-editor/bootstrap-wysihtml5.css" />   
	<script src="assets/tinymce/tinymce.min.js"></script>
	<textarea id="mymce"  class="form-control" name="content"><?php echo($data->content) ;  ?></textarea>
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
	
	<button type="submit" class="btn btn-success" name="new" >Edit Footer </button>
	
</form>

</div>
</div>
</div>
</div>


</div>





<?php } else {?> <script>  document.location.href="?show=pengaturan_footer";   </script>   <?php } ?>
<?php } else {?> <script>  document.location.href="?show=pengaturan_footer";   </script>   <?php } ?>
