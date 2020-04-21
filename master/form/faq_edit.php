<?php  
$id= -1;
if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 
}

$check_data = select($pdo,"SELECT * FROM `faq` WHERE `id`='$id'  "); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
$data = fetch_obj($check_data); 



if(isset($_POST['new'])){
$judul = in($_POST['judul']);
$isi = str_replace("'",'"',$_POST['isi']);
$isi = str_replace("\n",'<br>',$isi);
$kategori = in($_POST['kategori']);

$check_k = select($pdo,"SELECT * FROM `faq` WHERE `judul`='$judul' and `kategori`='$kategori' and `id`<>'$id' "); 
$check_k->execute();
$row_k = row($check_k);
if($row_k >= 1){
	$alert = "danger";
	$respon = "Maaf. Data Ini Sudah Ada ";
}  else {
	eksekusi($pdo,"UPDATE `faq`  SET `kategori`='$kategori',`judul`='$judul',`text`='$isi' WHERE `id`='$id'  ");
	?> 
	<script>  document.location.href="?show=faq_list";   </script>  
	<?php 
}
}
?>




<div class="row">
<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-1    p-1 ">
<div class="card">
<div class="card-header"><h5>Edit Faq</h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data"> 
	<?php  if(!empty($alert)){ ?>
		<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
		<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Respon !</strong> <?php echo($respon) ;  ?> 
	</div> <?php }  ?>			
	
	<span> Judul </span> 
	<input type="text" required class="form-control" name="judul" value="<?php echo($data->judul) ;  ?>" placeholder="Masukkan Judul Faq"    />
	<br />
	<span> Kategori </span> 
	<select type="text" required class="form-control" name="kategori" value="" placeholder="Masukkan Kategori"   >
	<?php $check_c = select($pdo,"SELECT * FROM `faq_category` "); 
	$check_c->execute();
	$row_c = row($check_c);
	if($row_c >= 1){
		while($c = fetch_obj($check_c)){
			?> 
			<option <?php if($data->kategori == $c->kategori){echo(" selected ") ; }  ?>><?php echo($c->kategori) ;  ?></option> 
			<?php 
		}
	}  
	 ?>
	</select>
	<br />
	
	<span> Isi Faq </span> 
	<textarea type="text" required class="form-control" name="isi" value="" placeholder="Isi Faq"   style="height: 200px"    ><?php echo str_replace("<br>","\n",$data->text) ;  ?></textarea>
	<br />
	
	<br />
	<button type="submit" name="new" class="btn btn-success" >Edit Faq</button>  

</form>

</div>
</div>
</div>
</div>

  
</div>




<?php } ?>
