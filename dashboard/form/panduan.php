<div class="row">

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1    p-1">
<div class="card">
<div class="card-header"><h5>Panduan Penggunaan</h5></div>


<div class="card-block"><div class="table-responsive">
  
   
		<div class="mb-3" role="tablist" id="accordion">		
		<?php 
		$x = 0; 
		$check_data = select($pdo,"SELECT * FROM `faq_panduan`   "); 
		$check_data->execute();
		$row_data = row($check_data);
		if($row_data >= 1){		
		while($data = fetch_obj($check_data)){
		$x++;
		?> 
		<div class="card-block"> <div class="card-header" role="tab">
		<h5 class="mb-0"> <a data-toggle="collapse" aria-expanded="true" aria-controls="accordion .item-<?php echo($data->id) ;  ?>" href="div#accordion .item-<?php echo($data->id) ;  ?>" class="color-style"> <i class="fa fa-angle-double-right"></i>&nbsp;<?php echo($data->judul) ;  ?></a> </h5>
		</div>
		<div class="collapse <?php if($x == "1"){echo(" show ") ; }  ?> item-<?php echo($data->id) ;  ?>" role="tabpanel" data-parent="#accordion" style="border-top: 0px !important;border-color: #f9f9f9 !important;">
		<div style="border-top: 0px !Important; font-size : 13px; padding:20px"> 
			<?php echo html_entity_decode(htmlspecialchars_decode($data->text)) ;  ?>
		</div>
		</div>
		</div>
		<?php }  ?> </div>

 
				<?php 
			}
		
		
		 ?>
  
</div>
</div>
</div>
</div>
</div>




