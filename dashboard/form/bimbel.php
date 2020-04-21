<?php  if(!empty($alert)){ ?>
	<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>			


<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1    p-1">
<div class="card">
<div class="card-header"><h5>Daftar Bimbingan Belajar </h5>
<p class="mb-1"> Silahkan Pilih Paket Bimbingan Belajar Yang anda inginkan untuk meningkatkan kualitas mata pelajaran anda </p></div>



<div class="card-block"><div class="table-responsive">
<div class="row">
 
  <?php $check_bonus = select($pdo,"SELECT * FROM `bimbel` "); 
  $check_bonus->execute();
  $row_bonus = row($check_bonus);
  if($row_bonus >= 1){
	  while($bonus = fetch_obj($check_bonus)){
		  ?> 
		   <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-12 p-1  "  style="padding:10px" >
			<div class="shadow"  style="background: white; " >
				<img src="../crop.php?w=300&h=300&img=<?php echo($bonus->image) ;  ?>"  style="width : 100%;"    />
				<div class="bg-light"  style="padding:10px;" >
				<a  style="font-size : 18px !Important"  class=""  style=""  > <?php echo judul($bonus->judul,4) ;  ?> </a> <br />
				 
				<a class="btn btn-warning form-control" href="?show=bimbel_daftar&id=<?php echo($bonus->id) ;  ?>" > Rincian </a>  
				</div>
			
			</div>
		   
		   </div>
		  <?php 
	  }
  }  
   ?>
   <br />
  </div> 
	
	
	</div>
   </div> 
  
  
  
 
</div>
</div> 
</div> 




