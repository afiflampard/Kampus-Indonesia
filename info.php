<?php 
if(!empty($_GET['id'])){ 
$idx = in($_GET['id']); 
$idx = explode('-',$idx);
$id = "";
foreach($idx as $i){
	if(empty($id)){
		$id = $i;
	} 
}
}

if(!empty($id)){


$check_data = select($pdo,"SELECT * FROM `footer` WHERE `id`='$id' LIMIT 1"); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
	$data =fetch_obj($check_data); 
}

} else {

$check_data = select($pdo,"SELECT * FROM `footer` WHERE `id`<>'-1' LIMIT 1"); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
	$data =fetch_obj($check_data); 
}
}

if(!empty($data)){

?>

<style>
	h1,h2,h3,h4{font-size : 18px !Important;}
</style>

<div class="" style="min-height:500px;background: white; padding-bottom:20px !important; ">
<div class="container" style="padding-top: 100px; text-align: left;">
	
	<div class="" style="border:1px solid gainsboro ; padding:20px; border-radius:10px;  font-size : 16px; box-shadow:0px 0px 10px 0px gainsboro;">
		

		<h3 class="border-bottom p10" style="font-weight : bold;"> <?php echo($data->title) ;  ?></h3> 
		 
		<?php echo html_entity_decode(htmlspecialchars_decode($data->content)) ;  ?>
		 		
	
	</div>
	
</div>
</div>

<?php } else {?> 
<script>  document.location.href="<?php echo($site) ;  ?>";   </script>  
<?php } ?>