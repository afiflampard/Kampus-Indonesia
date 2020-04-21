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
<a class="nav-link active" id="tab_soal_1-tab" style="font-size : 18px !important; font-weight : bold;" data-toggle="tab" href="#tab_soal_1" role="tab" aria-controls="tab_soal_1" aria-selected="true">
<?php if($posisi == "1"){
	echo($data->nama_soal_1) ; 
} else {
	echo($data->nama_soal_2) ; 
}  ?>
</a>
</li> 
</ul>



<div class="tab-content" id="myTabContent" style="padding:10px;">
<div class="tab-pane fade show active" id="tab_soal_1" role="tabpanel" aria-labelledby="tab_soal_1-tab">
<div class="row">
<?php require_once("try_left_p.php"); ?>
<?php require_once("try_right_p.php"); ?>
</div>		
</div>
</div>


