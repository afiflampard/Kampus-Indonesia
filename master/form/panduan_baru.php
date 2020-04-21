<?php  
if(isset($_POST['new'])){
$judul = in($_POST['judul']);
$isi = str_replace("'",'"',$_POST['isi']);
$isi = str_replace("\n",'<br>',$isi);


$check_k = select($pdo,"SELECT * FROM `faq_panduan` WHERE `judul`='$judul' "); 
$check_k->execute();
$row_k = row($check_k);
if($row_k >= 1){
	$alert = "danger";
	$respon = "Maaf. Data Ini Sudah Ada ";
}  else {
	eksekusi($pdo,"INSERT INTO `faq_panduan` (`judul`,`text`) VALUES ('$judul','$isi') ");
	$alert = "success";
	$respon = "Data Panduan Baru Sudah Di Buat";
}
}  

?>


<div class="row">
<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-1    p-1 ">
<div class="card">
<div class="card-header"><h5>Panduan Baru</h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data"> 
	<?php  if(!empty($alert)){ ?>
		<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
		<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Respon !</strong> <?php echo($respon) ;  ?> 
	</div> <?php }  ?>			
	
	<span> Judul </span> 
	<input type="text" required class="form-control" name="judul" value="" placeholder="Masukkan Judul Faq"    />
	<br /> 
	<span> Isi Faq </span> 
	<textarea type="text" required class="form-control" name="isi" value="" placeholder="Isi Faq"   style="height: 200px"    ></textarea>
	<br />
	
	<br />
	<button type="submit" name="new" class="btn btn-success" >Buat Panduan Baru</button>  

</form>

</div>
</div>
</div>
</div>

  
</div>




