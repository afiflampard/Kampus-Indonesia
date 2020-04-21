<?php 
$materi = "";
if(!empty($_GET['materi'])){ 
$materi = in($_GET['materi']); 
}

$check_quipper = select($pdo,"SELECT * FROM `quipper_kategori` where `materi`='$materi' "); 
$check_quipper->execute();
$row_quipper = row($check_quipper);
if($row_quipper >= 1){


?> 


<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">

<div class="card">
<div class="card-header"><h5>Kategori <?php echo($materi) ;  ?></h5></div>


<div class="card-block"><div class="table-responsive">
<?php  if(!empty($alert)){ ?>
	<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>			


<br />
<div class="row">
	 <?php
		while($data = fetch_obj($check_quipper)){
			 
			
			?> 
			<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-12 p-1     p-1"  style="padding:5px !Important" >
				<div class=""  style="border:3px solid blue;  border-radius:10px !Important; padding:10px; font-size : 18px !important" >
				<div class=""  style="height: 80px; overflow:hidden; font-size : 18px !Important;" >
						<?php echo judul($data->kategori,6) ;  ?> <br />
						<small> <?php echo($materi) ;  ?> </small> 
				</div>
					<a href="?show=materi_video&materi=<?php echo($data->materi) ;  ?>&kategori=<?php echo($data->kategori) ;  ?>"   class="btn btn-primary form-control" > Buka List Video </a> 				 
				</div>
			</div> 
			<?php 
		
	}  
	?>

</div> 


</div>
</div>
</div>
</div>


</div>

 


 
<?php } ?>

