<?php  
$id = "";
if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 
}

$check_data = select($pdo,"SELECT * FROM materi WHERE id='$id' "); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
	$data = fetch_obj($check_data); 
?>

 
<div class="row justify-content-center"> 
	<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12  p-1  p-1">
	
	<div class="card" style="border-radius:10px; border:1px solid gainsboro  ">
	<div class="card-header"><h5><?php echo($data->judul) ;  ?> </h5></div>
 

 
	
	<div class="card-block">
		<?php echo html_entity_decode(htmlspecialchars_decode($data->text)) ;  ?> <br />
		<?php if(!empty($data->file)){?> 
			<a class="btn btn-primary" href="../file/<?php echo($data->file) ;  ?>" target="_blank" download="<?php echo($data->file) ;  ?>" > Download File  </a>  
		<?php  }  ?>
		
	</div>
	
	
	
</div>



<?php } else {?> 
<script>  document.location.href="?show=materi";   </script>  
<?php } ?>