<?php 
eksekusi($pdo,"UPDATE `notifikasi`  SET `read`='Yes' WHERE `user_id`='$user_id'  ");


?>

<?php  if(!empty($alert)){ ?>
	<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>			


<div class="row">

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1    p-1">
<div class="card">
<div class="card-header"><h5>History Keuangan</h5></div>
<div class="card-block"><div class="table-responsive">
 
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Tanggal </th> 
			<th> Notifikasi </th> 
			<th> Debet</th> 
			<th> Kredit </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/notifikasi.php", 
 "aoColumns": [
	null,
	null,
	null,
	null,
 ]
 } );
 } );
 </script>
 
</div>
</div>
</div>
</div>
</div>




