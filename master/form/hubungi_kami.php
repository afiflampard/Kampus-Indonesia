<?php 

if(isset($_POST['new'])){ 
$hubungi_kami = in($_POST['hubungi_kami']);

eksekusi($pdo,"UPDATE `master` SET `hubungi_kami`='$hubungi_kami'    ");
$alert = "success";
$respon = "Pengaturan Hubungi Kami Sudah Di Perbaharui ";
  $master->hubungi_kami = $hubungi_kami;
} 

 ?>
<div class="row">

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">

<div class="card">
<div class="card-header"><h5>Pengaturan Hubungi Kami</h5></div>


<div class="card-block">
<form method="post" enctype="multipart/form-data">  
 

	<span> Content  </span> 
	<link rel="stylesheet" href="assets/html5-editor/bootstrap-wysihtml5.css" />   
	<script src="assets/tinymce/tinymce.min.js"></script>
	<textarea id="mymce"  class="form-control" name="hubungi_kami"><?php echo($master->hubungi_kami) ;  ?></textarea>
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
	
	<button type="submit" class="btn btn-success" name="new" >Edit Data </button>
	
</form>

</div> 


 