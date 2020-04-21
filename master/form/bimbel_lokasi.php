<?php 
if(isset($_POST['delete'])){
$id = in($_POST['id']); 
eksekusi($pdo,"DELETE FROM `bimbel` WHERE `id`='$id' ");
}


if(isset($_POST['new'])){
	$id_bimbel = in($_POST['id_bimbel']);
	$lokasi = in($_POST['lokasi']);
	
	$check_b = select($pdo,"SELECT * FROM bimbel WHERE id='$id_bimbel' "); 
	$check_b->execute();
	$row_b = row($check_b);
	if($row_b >= 1){
	$b = fetch_obj($check_b); 
	$judul = $b->judul;

	
	    
	$check_data = select($pdo,"SELECT * FROM bimbel_lokasi WHERE id_bimbel='$id_bimbel' and lokasi='$lokasi' "); 
	$check_data->execute();
	$row_data = row($check_data);
	if($row_data >= 1){
		$alert = "danger";
		$respon = "Maaf. Lokasi Ini Sudah Ada sebelumnya";
	}  else {
		
		eksekusi($pdo,"INSERT INTO bimbel_lokasi (`id_bimbel`,`lokasi`,`judul_bimbel`) VALUES  ('$id_bimbel','$lokasi','$judul') ");
		$alert = "success";
		$respon = "Lokasi Baru Berhasil Di Masukkan ";	
		
	}
	
	
	
	
	} else {
		$alert = "danger";
		$respon = "Bimbel Tidak Valid ";
	}
} 
 
?>




<div class="row">

<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12  p-1">
<div class="card">
<div class="card-header"><h5>Tambah Alamat</h5></div>


<div class="card-block">
<form method="post" enctype="multipart/form-data"> 
	
	<span> Judul Bimbel </span> 
	<select type="text" required class="form-control" name="id_bimbel" value="" placeholder=""   >
	<?php $check_b = select($pdo,"SELECT * FROM bimbel "); 
	$check_b->execute();
	$row_b = row($check_b);
	if($row_b >= 1){
		while($b = fetch_obj($check_b)){
			?> 
			<option  value="<?php echo($b->id) ;  ?>"  > <?php echo($b->judul) ;  ?> </option> 
			<?php 
		}
	}  
	 ?>
	</select>
	<br />
	<span> Nama Lokasi </span> 
	<input type="text" required class="form-control" name="lokasi" value="" placeholder=""    />
	<br />
	  
	<button type="submit" name="new" class="btn btn-success" >Tambah Lokasi</button> 
	

</form>
</div>
</div>
</div>


<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12  p-1">
<div class="card">
<div class="card-header"><h5>Daftar Lokasi Bimbel</h5></div>


<div class="card-block"><div class="table-responsive">

	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Judul </th>  
			<th> Lokasi </th>  
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/bimbel_lokasi.php", 
 "aoColumns": [ 
	null,
	null,
	{ "mclass":"wall", "mData": "2", "mRender": function ( data, type, full ) {
	del = "showdel('"+data+"','"+full[1]+"')";
	 hapus = ' <button class="btn btn-danger btn-xs btn-sm" onclick="'+del+'"  type="button"><i class="fa fa-trash">  </i></button> '; 
	 return hapus;
	 }} 
 ]
 } );
 } );
 </script>
 
</div>
</div>
</div>
</div>
</div>




