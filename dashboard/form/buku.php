<?php  if(!empty($alert)){ ?>
	<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>			


<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1    p-1">
<div class="card">
<div class="card-header"><h5>Beli Buku </h5></div>



<div class="card-block"><div class="table-responsive">
<p class="mb-1">  Pembelian Buku dapat dilakukan melalui toko online official kami dibawah ini . atau juga melalui merchant-merchant kami yang tersebar diseluruh indonesia . </p> 

<div class="row">
 
  <?php $check_bonus = select($pdo,"SELECT * FROM `data_buku` "); 
  $check_bonus->execute();
  $row_bonus = row($check_bonus);
  if($row_bonus >= 1){
	  while($bonus = fetch_obj($check_bonus)){
		  ?> 
		   <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-12 p-1  "  style="padding:10px" >
			<div class="shadow"  style="background: white; " >
				<img src="../crop.php?w=300&h=400&img=<?php echo($bonus->image) ;  ?>"  style="width : 100%;"    />
				<div class=""  style="padding:10px;" >
				<a  style="font-size : 18px !Important"  class=""  style=""  > <?php echo judul($bonus->judul,4) ;  ?> </a> <br />
				
				Harga : Rp. <?php echo uang($bonus->harga) ;  ?> <br />
				<a class="btn btn-warning form-control" href="?show=buku_detail&id=<?php echo($bonus->id) ;  ?>" > Rincian </a>  
				</div>
			
			</div>
		   
		   </div>
		  <?php 
	  }
  }  
   ?>
   <br />
  </div>
   <br />
    
   
  <div class="alert alert-info alert-dismissable">
	  <a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	  Pembelian Buku dapat dilakukan melalui toko online official kami dibawah ini . atau juga melalui merchant-merchant kami yang tersebar diseluruh indonesia .
  </div> 
<br />
  <div class="row">
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-6  "> <a target="_blank" href="<?php echo($master->tokopedia) ;  ?>" > <img src="../image/tokopedia.png"  style="width : 100%;"  /> </a> </div>
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-6  "> <a target="_blank" href="<?php echo($master->shopee) ;  ?>" >  <img src="../image/shopee.png"  style="width : 100%;"  /></a> </div>
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-6  "> <a target="_blank" href="<?php echo($master->bukalapak) ;  ?>" >  <img src="../image/bukalapak.png"  style="width : 100%;"  /> </a></div>
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 col-6  "> <a target="_blank" href="<?php echo($master->lazada) ;  ?>" >  <img src="../image/lazada.png"  style="width : 100%;"  /> </a></div>
  </div>
	
	
	
	
	</div>
   </div> 
  
  
  
 
</div>
</div> 
</div> 




