<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">

<div class="card">
<div class="card-header"><h5>Daftar  Event Tryout</h5></div>


<div class="card-block"> 
<?php  if(!empty($alert)){ ?>
	<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>			


<br />
<div class="row">
	
	<?php $check_data = select($pdo,"SELECT * FROM `data_soal` WHERE  `harga`<=0 and active='Yes'  "); 
	$check_data->execute();
	$row_data = row($check_data);
	if($row_data >= 1){
	while($data = fetch_obj($check_data)){
	?> 
	
	<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-12  p-1">
		<div class="card  bg-c-blue order-card">
		<div class="card-block">
			<h6 class="m-b-20" style="height: 20px; line-height:24px; overflow:hidden;"><?php echo($data->judul) ;  ?> </h6>
			<h2 class="text-right"  ><i class="ti-receipt f-left"></i><span>Free</span></h2>
			<p class="m-b-0">
				<a class="cw" href="?show=soal_start&id=<?php echo($data->id) ;  ?>"  > Buka Soal </a> 
			</p>
		</div>
	</div>
	</div> 
	
	<?php 
	}
	} else {?> 
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  p-1">
	<div class=""  style="background: #f9f9f9; padding:20px;" >
		<h4> Maaf. Saat Ini Belum Ada Soal Gratis Yang Di Bagikan Oleh Admin	</h4> 		
	</div>
	</div> 
	<?php } ?>

</div> 


</div>
</div> 
</div>
</div>
 