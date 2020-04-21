<?php 
if(!empty($_GET['kode'])){ 
$kode = in($_GET['kode']); 


$check_data = select($pdo,"SELECT * FROM `materi` WHERE `kode`='$kode' LIMIT 1"); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
$data =fetch_obj($check_data); 
?>



<div class="row">
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1 " style="padding:5px !important;">
		<img src="<?php echo($site) ;  ?>/crop/<?php echo($data->image) ;  ?>" class="" style="width : 100%; border-radius:10px !important; " />
	</div>
	
	<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-1  " style="padding:5px !important;">
		
	<div class="card" style="border-radius:10px; border:1px solid gainsboro  ">
	<div class="card-header"><h5>Materi Terbaru - <?php echo($data->judul) ;  ?> </h5></div>
 

 
	
	<div class="card-block">
	
	<?php 
		if((($data->harga <= 0) or (in_array($data->kode,$kode_akses))) and (!empty($login))){
			if(!empty($url_video)){
			echo($data->url_video."<br /> <br />") ;
			}
			
			echo html_entity_decode(htmlspecialchars_decode($data->text)) ;  
			
		} else {
			
			echo  judul(planText(html_entity_decode(htmlspecialchars_decode($data->text))),20) ; 
			echo("<br> <h6 style='padding:20px;' align='center'> Anda Wajib Membeli/ Login Sebelum Melihat Isi Materi Sepenuhnya . <br>Terima Kasih</h6> "); 
			
		}
		
	?>
	</div>
	</div>
	
	
	
</div>
</div>





<?php } else {?> <script>  document.location.href="?show=materi_saya";   </script>   <?php } ?>
<?php } else {?> <script>  document.location.href="?show=materi_saya";   </script>   <?php } ?>

