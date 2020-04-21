<?php 
$kategori = "";

if(!empty($_GET['kategori'])){ 
$kategori = in($_GET['kategori']); 
}
$kode = "";
$jurusan = "";
$filter = "";

$check_k = select($pdo,"SELECT * FROM `kategori_soal` WHERE `nama`='$kategori'  "); 
$check_k->execute();
$row_k = row($check_k);
if(($row_k >= 1) OR ($kategori == "Soal Gratis")){
$k = fetch_obj($check_k); 

if(isset($_POST['filter'])){
	$kode = in($_POST['Soal']);
	$jurusan = in($_POST['jurusan']);

	if(!empty($kode)){
		$filter .= " WHERE `kode_soal`='$kode' "; 
		if(!empty($jurusan)){ $filter .= " and `jurusan`='$jurusan' "; } 
	} 
	
	
} 


?>

<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">

<div class="card">
<div class="card-header">
<h5> Filter Peringkat </h5> 
<form method="post" enctype="multipart/form-data"> 
<div class="row">
<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-12 p-1">
<span> Pilih Jenis Soal </span> 
<select class="form-control" required name="Soal">
<option  value=""  >Lihat Peringkat Pada Soal</option>
	<?php 
$check_soal = select($pdo,"SELECT * FROM `data_soal` WHERE `kategori`='$kategori'  "); 
$check_soal->execute();
$row_soal = row($check_soal);
if($row_soal >= 1){
while($soal = fetch_obj($check_soal)){
?> 
<option  value="<?php echo($soal->kode_soal) ;  ?>" <?php if($soal->kode_soal == $kode){echo(" selected") ; }  ?> > <?php echo($soal->judul) ;  ?> </option> 
<?php 
}}
 ?>
	
</select>
</div>
 

<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-12 p-1">
	<span> Pilih Jurusan </span> 
	<select type="text"  class="form-control" name="jurusan" value="" placeholder=""   >
		<option  value=""  > Semua </option>
		<?php $check_g = select($pdo,"SELECT `jurusan` FROM `ranking` GROUP BY `jurusan`  "); 
		$check_g->execute();
		$row_g = row($check_g);
		if($row_g >= 1){
			while($g = fetch_obj($check_g)){
				if($g->jurusan <> ''){
				?> 
				<option <?php if($g->jurusan == $jurusan){echo(" selected ") ; }  ?>><?php echo($g->jurusan) ;  ?></option> 
				<?php 
				}
			}
		}  
		 ?>
	</select>
</div>
 

<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-12 p-1">
<span> &nbsp; </span> 
	<button type="submit" class="btn btn-success form-control" name="filter" >Filter</button>
</div>

</div>
</form>
</div>





<div class="card-block"><div class="table-responsive"> 
<div class="table-responsive">
<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
<thead>
	<tr>
	<th style="width : 100px; min-width:100px;"> Peringkat </th> 
	<th> Nama</th> 
	<th> Group </th> 
	<th> Jumlah Poin </th> 
	<th> Total Poin </th> 
	<th> Lulus / Tidak Lulus </th> 
	</tr>
</thead>
<tbody>

<?php 
if(!empty($filter)){

$check_rank = select($pdo,"SELECT * FROM `ranking` $filter ORDER BY `lulus` ASC , `total_poin` DESC   "); 
$check_rank->execute();
$row_rank = row($check_rank);	
if($row_rank >= 1){
	$x = 1;
	while($rank = fetch_obj($check_rank)){
		?> 
		<tr> 
			<td> <?php echo($x) ;  ?> </td>
			<td> <?php echo($rank->nama) ;  ?> </td>
			<td> <?php echo($rank->jurusan) ;  ?> </td>
			<td> <?php echo($rank->keterangan_poin) ;  ?> </td>
			<td> <?php echo($rank->total_poin) ;  ?> </td>
			<td> <?php echo($rank->lulus) ;  ?> </td>
		</tr> 
		<?php 
		$x++;
	}
	?> 
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 } );
 } );
 </script>
 
	<?php 
}else {?> 
<tr> 
	<td colspan="100"> Tidak Ada Peringkat Dalam Filter Ini </td>
</tr> 
<?php }

	
} else {
?> 

<tr>
	<td colspan="100">Data Belum tersedia</td>
</tr>
 
<?php 	
} ?>


</tbody>  
</table>



</div>
</div>
</div>
</div>
</div>
</div>





<?php } ?>
 