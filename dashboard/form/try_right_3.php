<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1  ">
<div class="sticky_page"   >
<div class="fixed-xs hide-on-xs" style="padding:10px; "align="center">
<a style="font-size : 24px; font-weight : bold;"> Sisa Waktu  
<span style="font-size : 26px ; font-weight : bold; color:#f01479; " class="countdown">  <?php echo($waktu_soal) ;  ?> </span> </a> 
<h5> Total Waktu : <?php echo($waktu_soal) ;  ?> Menit </h5> 
<h5> Judul : <?php echo($judul_soal) ;  ?></h5> 
</div>
<div class="card" style="border-radius:10px; border:1px solid gainsboro  ">
<div class="card-header"><h5>Page Active : <?php echo($data->nama_soal_3) ;  ?></h5></div>

<div class="card-block" align="center" style="padding:10px !Important;">
<div class="row" style="max-height:250px; overflow:auto !important;">
<?php 
	for ($i = 1; $i <= $max_3; $i++) {
		?> 
		
		<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2 col-2 p-1    " style="padding:3px !Important;">
			<a id="no_<?php echo($i) ;  ?>_3" onclick="go_page_3('<?php echo($i) ;  ?>')" class="btn btn-danger" style="width : 100%; color:white !important; padding:3px !Important; text-align:center; padding-top:7px !important; padding-bottom:7px !important;" > <?php echo($i) ;  ?> </a>  
		</div>
		
		<?php 
	} 
?>

</div>

<div class="row">
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  p-1 ">
<a class="btn btn-success " style="width : 100%; color:white !important;"    > <span id="dijawab_3"> 0 </span>  Dijawab </a>  
</div>
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  p-1 ">
<a class="btn btn-danger " style="width : 100%; color:white !important;"    > <span id="belum_3"> <?php echo($max_3) ;  ?> </span> Belum   </a>  
</div>
</div>

		


</div>
</div>
</div>
</div>

