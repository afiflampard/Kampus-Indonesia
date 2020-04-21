<?php 
if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 

$check_s = select($pdo,"SELECT * FROM `data_soal` WHERE `id`='$id'  "); 
$check_s->execute();
$row_s = row($check_s);
if($row_s >= 1){
$soal = fetch_obj($check_s); 
$kode = $soal->kode_soal;



?>



<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">

<div class="card">
<div class="card-header"><h5>Anggota Lulus Berdasarkan Peringkat <br>Pada - <?php echo($soal->judul) ;  ?></h5></div>
	
	
<div class="card-block"><div class="table-responsive">
<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
<thead>
	<tr>
	<th style="width : 100px; min-width:100px;"> # </th> 
	<th> Nama</th> 
	<th> Tanggal </th> 
	<th> Poin TWK </th> 
	<th> Poin TIU </th> 
	<th> Poin TKP </th> 
	<th> Total Poin </th> 
	<th> Lulus/Tidak </th> 
	</tr>
</thead>
	<tbody>
	<?php 
	$x = 1;
	$check_jawab = select($pdo,"SELECT * FROM `user_jawab` WHERE `kelulusan`='Lulus' and `kode_soal`='$kode' ORDER BY `total_poin` DESC,`id` ASC "); 
	$check_jawab->execute();
	$row_jawab = row($check_jawab);
	if($row_jawab >= 1){
		while($j = fetch_obj($check_jawab)){
			?> 
			<tr>
				<td> <?php echo($x) ;  ?> </td>
				<td> <?php echo($j->nama) ;  ?> </td>
				<td> <?php echo($j->date) ;  ?> </td>
				<td> <?php echo($j->poin_twk) ;  ?> </td>
				<td> <?php echo($j->poin_tiu) ;  ?> </td>
				<td> <?php echo($j->poin_tkp) ;  ?> </td>
				<td> <?php echo($j->total_poin) ;  ?> </td>
				<td> <?php echo($j->kelulusan) ;  ?> </td>
			</tr> 
			<?php 
			$x++;
		}
	}  
	 ?>
	
	</tbody> 
</table>

	
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true
 } );
 } );
 </script>


</div>
</div>
</div>


<div class="card" style="margin-top: 30px;">
<div class="card-header"><h5>Anggota Tidak Lulus Berdasarkan Peringkat <br>Pada - <?php echo($soal->judul) ;  ?></h5></div>


<div class="card-block"><div class="table-responsive">
<table id="history2" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
<thead>
	<tr>
	<th style="width : 100px; min-width:100px;"> # </th> 
	<th> Nama </th> 
	<th> Tanggal </th> 
	<th> Poin TWK </th> 
	<th> Poin TIU </th> 
	<th> Poin TKP </th> 
	<th> Total Poin </th> 
	<th> Lulus/Tidak </th> 
	</tr>
</thead>
	<tbody>
	<?php 
	$x = 1;
	$check_jawab = select($pdo,"SELECT * FROM `user_jawab` WHERE `kelulusan`='Tidak Lulus' and `kode_soal`='$kode'  ORDER BY `total_poin` DESC,`id` ASC "); 
	$check_jawab->execute();
	$row_jawab = row($check_jawab);
	if($row_jawab >= 1){
		while($j = fetch_obj($check_jawab)){
			?> 
			<tr>
				<td> <?php echo($x) ;  ?> </td>
				<td> <?php echo($j->nama) ;  ?> </td>
				<td> <?php echo($j->date) ;  ?> </td>
				<td> <?php echo($j->poin_twk) ;  ?> </td>
				<td> <?php echo($j->poin_tiu) ;  ?> </td>
				<td> <?php echo($j->poin_tkp) ;  ?> </td>
				<td> <?php echo($j->total_poin) ;  ?> </td>
				<td> <?php echo($j->kelulusan) ;  ?> </td>
			</tr> 
			<?php 
			$x++;
		}
	}  
	 ?>
	
	</tbody> 
</table>

	
	
 <script>   
 $(document).ready(function() {
 $('#history2').dataTable( {
 "bProcessing": true
 } );
 } );
 </script>


</div>
</div>



</div>
</div>
</div>





<?php } else {?> <script>  document.location.href="?show=peringkat";   </script>   <?php } ?>
<?php } else {?> <script>  document.location.href="?show=peringkat";   </script>   <?php } ?>
