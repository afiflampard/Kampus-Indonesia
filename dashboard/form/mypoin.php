<?php  if(!empty($alert)){ ?>
	<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>			


<div class="row">

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1    p-1">
<div class="card">
<div class="card-header"><h5>My Poin - Poin Anda : <?php echo($user->mypoin) ;  ?></h5></div>
	
	
<div class="card-block"><div class="table-responsive">
  <p> Tukarkan Poin Anda Dengan barang yang mungkin anda sukai . Setiap melakukan transaksi / pembelian tryout . maka anda akan mendapatkan poin sesuai dengan poin yang disediakan .  </p> 
<br />
<div class="row">
 
  <?php $check_bonus = select($pdo,"SELECT * FROM `data_bonus` "); 
  $check_bonus->execute();
  $row_bonus = row($check_bonus);
  if($row_bonus >= 1){
	  while($bonus = fetch_obj($check_bonus)){
		  ?> 
		   <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-12 p-1  "  style="padding:10px" >
			<div class="shadow"  style="background: white; " >
				<img src="../crop.php?w=300&h=200&img=<?php echo($bonus->image) ;  ?>"  style="width : 100%;"    />
				<div class=""  style="padding:10px;" >
				<a class=""  style=""  > <?php echo($bonus->judul) ;  ?> </a> 
				<br />
				Tukar Poin : <?php echo($bonus->poin) ;  ?> <br />
				<?php if($user->mypoin >= $bonus->poin){ ?> 
				<a class="btn btn-warning form-control" href="?show=mypoin_tukar&tukar=<?php echo($bonus->id) ;  ?>" > Tukar </a>  
				<?php } else {?> 
				<a class="btn btn-danger form-control disabled" disabled > Poin Tidak Cukup </a>  
				<?php } ?>
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
    
   <div class="row"   >
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  "  style="padding:10px;" >
		<b> Riwayat Pertukaran Anda  </b>
		<p> Kami Akan segera mengirim barang yang anda tukarkan sesuai dengan destinasi pengiriman . </p> 
		<br />
		 
 <div class="table-responsive">
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Nama Barang </th> 
			<th> Alamat Tujuan </th> 
			<th> Penerima </th> 
			<th> Status  </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/data_bonus_permintaan.php", 
 "aoColumns": [
	null,
	null,
	null,
	null
 ]
 } );
 } );
 </script>
 </div>
 
	
	</div>
   </div> 
  
  
  
 
</div>
</div>
</div>
</div>
</div> 




