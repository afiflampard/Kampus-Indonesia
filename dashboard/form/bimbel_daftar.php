<?php 
$id = "";
if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 
}

$check_data = select($pdo,"SELECT * FROM bimbel WHERE id='$id' "); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
$data = fetch_obj($check_data); 
 


if(isset($_POST['new'])){
$nama = in($_POST['nama']);
$telepon = in($_POST['telepon']);
  	$lokasi = in($_POST['lokasi']); 
	$judul = $data->judul;
	
	$check_db = select($pdo,"SELECT * FROM bimbel_daftar WHERE user_id='$user_id' and lokasi='$lokasi' and judul='$judul' and dibaca='No' "); 
	$check_db->execute();
	$row_db = row($check_db);
	if($row_db >= 1){
		$alert = "danger";
		$respon = "Sebelumnya anda sudah mengirim permintaan bimbel pada lokasi ini . harap tunggu hingga admin menghubungi anda";
	}  else {
		eksekusi($pdo,"INSERT INTO `bimbel_daftar`
		( `nama`, `user_id`, `telepon`, `lokasi`, `dibaca`,`judul`) VALUES 
		('$nama','$user_id','$telepon','$lokasi','No','$judul') ");
		$alert = "success";
		$respon = "Terima Kasih Sudah Melakukan Pendaftaran , Kami Akan Segera Menghubungi Anda";	
	}
}


?>


<div class="row">

<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12  p-1">
<div class="card">
<div class="card-header"><h5><?php echo($data->judul) ;  ?></h5></div>
<div class="card-block">

	<img src="<?php echo($site) ?>/image/<?php echo($data->image) ;  ?>" />

</div>
</div>
</div>



<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12  p-1">
<div class="card">
<div class="card-header"><h5>Daftar Bimbel</h5></div>
<div class="card-block">

<form method="post" enctype="multipart/form-data"> 
<b> Keterangan </b><br /> 
<?php echo html_entity_decode(htmlspecialchars_decode($data->text)) ;  ?>
	<h5> Silahkan Masukkan Data Anda </h5> 
	<p> Kami Akan Segera Mneghubungi anda untuk tindak lanjut pendaftaran bimbel - Sesuai dengan lokasi yang anda pilih </p> 
	
	
	<span> Paket Bimbel </span> 
	<input type="text" required readonly class="form-control" name="judul" value="<?php echo($data->judul) ;  ?>" placeholder=""    />
	<br />
	<span> Pilih Lokasi </span> 
	<select type="text" required  class="form-control" name="lokasi" value="<?php echo($data->lokasi) ;  ?>" placeholder="" >
	<option  value=""  > Pilih Lokasi </option>
		<?php $check_l = select($pdo,"SELECT * FROM bimbel_lokasi WHERE id_bimbel='$id' "); 
		$check_l->execute();
		$row_l = row($check_l);
		if($row_l >= 1){
			while($l = fetch_obj($check_l)){
				?> 
				<option><?php echo($l->lokasi) ;  ?></option> 
				<?php 
			}
		}  
		 ?>
	</select>
	<br />
	<span> Nama Lengkap </span> 
	<input type="text" required class="form-control" name="nama" value="<?php echo($user->nama) ;  ?>" placeholder=""    />
	<br />
	<span> Nomor Telepon </span> 
	<input type="text" required class="form-control" name="telepon" value="<?php echo($user->telepon) ;  ?>" placeholder=""    />
	<br />
	
	
	<button type="submit" name="new" class="btn btn-success" >Daftar Sekarang</button> 
	

</form>
</div>
</div>
</div>
</div>



<?php } ?>

