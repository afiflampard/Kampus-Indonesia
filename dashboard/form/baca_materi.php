 
<div class="row">
	<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  p-1">
		<video controls  style="background: black;" > 
		  <source src="../video/<?php echo($data->video) ;  ?>" type="video/mp4">
		</video>  
	</div>
	
	<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  p-1">
		<?php echo html_entity_decode(htmlspecialchars_decode($data->keterangan)) ;  ?>
		<br />
		<a class="btn btn-primary" href="../materi/<?php echo($data->materi_download) ;  ?>" download="materi- <?php echo($data->materi_download) ;  ?>" > Download Materi </a>  
			  
		<div class="alert alert-info alert-dismissable mt-2 mb-2">
			<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
			Anda Sudah Selesai Membaca Materi . Anda Bisa Mengujinya Pada Quiz Materi 
		</div>  
		<form method="post" enctype="multipart/form-data"> 
			<button type="submit" class="btn btn-success m-1" name="buka_soal" >Buka Quiz Soal</button>
		</form>
		
	</div>
	
	
</div>

