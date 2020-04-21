<?php 

?>

<style>
	.md-tabs .nav-link.active
	{
		border-bottom:4px solid rgb(68, 138, 255) !important;
	}
	.table label{
		line-height:14px !important;
	}
	
</style>
<ul class="nav nav-tabs md-tabs" id="myTab" role="tablist">
<li class="nav-item">
<a class="nav-link active" id="tab_soal_1-tab" style="font-size : 18px !important; font-weight : bold;" data-toggle="tab" href="#tab_soal_1" role="tab" aria-controls="tab_soal_1" aria-selected="true"><?php echo($data->nama_soal_1) ;  ?></a>
</li>
<?php if(!empty($data->soal_2)){?> 
<li class="nav-item">
<a class="nav-link" id="tab_soal_2-tab" style="font-size : 18px !important; font-weight : bold;" data-toggle="tab" href="#tab_soal_2" role="tab" aria-controls="tab_soal_2" aria-selected="false"><?php echo($data->nama_soal_2) ;  ?></a>
</li>
<?php }  ?>

<?php if(!empty($data->soal_3)){?> 
<li class="nav-item">
<a class="nav-link" id="tab_soal_3-tab" style="font-size : 18px !important; font-weight : bold;" data-toggle="tab" href="#tab_soal_3" role="tab" aria-controls="tab_soal_3" aria-selected="false"><?php echo($data->nama_soal_3) ;  ?></a>
</li>
<?php }  ?>

</ul>

	<div class="tab-content" id="myTabContent" style="padding:10px;">
	<div class="tab-pane fade show active" id="tab_soal_1" role="tabpanel" aria-labelledby="tab_soal_1-tab">
	<div class="row">
		<?php require_once("try_left_1.php"); ?>
		<?php require_once("try_right_1.php"); ?>
	</div>		
	</div>

	<?php if(!empty($data->soal_2)){?> 
	<div class="tab-pane fade" id="tab_soal_2" role="tabpanel" aria-labelledby="tab_soal_2-tab">
	<div class="row">
	<?php require_once("try_left_2.php"); ?>
	<?php require_once("try_right_2.php"); ?>
	</div>
	</div>
	<?php } ?>

	<?php if(!empty($data->soal_3)){?> 
	<div class="tab-pane fade" id="tab_soal_3" role="tabpanel" aria-labelledby="tab_soal_3-tab">
	<div class="row">
	<?php require_once("try_left_3.php"); ?>
	<?php require_once("try_right_3.php"); ?>
	</div>
	</div>
	
	<?php } ?>
	 
</div>



