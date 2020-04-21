<?php 
if(isset($_POST['new'])){
$harga = 0; 

$judul = in($_POST['judul']);
$kode = "Free - ".date("mdhis");
require_once("empty.php"); 
$masa_aktif = in($_POST['masa_aktif']);



	
$lulus_1 = in($_POST['lulus_1']);
if(!empty($_POST['lulus_2'])){$lulus_2 = in($_POST['lulus_2']);}
if(!empty($_POST['lulus_3'])){$lulus_3 = in($_POST['lulus_3']);}

$waktu_1 = in($_POST['waktu_1']);
if(!empty($_POST['waktu_2'])){$waktu_2 = in($_POST['waktu_2']);}
if(!empty($_POST['waktu_3'])){$waktu_3 = in($_POST['waktu_3']);}

$nama_soal_1 = in($_POST['nama_soal_1']);
if(!empty($_POST['nama_soal_2'])){$nama_soal_2 = in($_POST['nama_soal_2']);}
if(!empty($_POST['nama_soal_3'])){$nama_soal_3 = in($_POST['nama_soal_3']);}



$check_data = select($pdo,"SELECT * FROM `data_soal` WHERE `judul`='$judul' and `jenis_soal`='Public'  and `id`='1' "); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
	$alert = "danger";
	$respon = "Maaf. Soal Ini Sudah ada sebelumnya";
}  else {
	
	require_once("isset_soal_1.php");
	require_once("isset_soal_2.php");
	require_once("isset_soal_3.php");
	
	
	
	if(!empty($soal_1)){
		
		
		require_once("assets/excel/convert.php");
		require_once("masukkan_soal.php");
		
		
		if($total_1 >= 1){$total_1 = $total_1-1;} 
		if($total_2 >= 1){$total_2 = $total_2-1;} else {$waktu_2 = "0"; $lulus_2 = "0"; }
		if($total_3 >= 1){$total_3 = $total_3-1;}else { $waktu_3 = "0"; $lulus_3 = "0"; }
		
		
		
		if($total_1 >= 1){
		
		eksekusi($pdo,"INSERT INTO `data_soal`
		(`masa_aktif`,`jenis_soal`,`judul`, `tanggal`, `harga`, `kode_soal`, `waktu_1`, `waktu_2`, `waktu_3`, `lulus_1`, `lulus_2`, `lulus_3`, `soal_1`, `soal_2`, `soal_3`,`nama_soal_1`, `nama_soal_2`, `nama_soal_3`, `kategori`) VALUES 
		('$masa_aktif','Public','$judul','$date','$harga','$kode','$waktu_1','$waktu_2','$waktu_3','$lulus_1','$lulus_2','$lulus_3','$total_1','$total_2','$total_3','$nama_soal_1','$nama_soal_2','$nama_soal_3','Soal Gratis') ");
		
		
		$alert ="success";
		$respon ="Soal Baru Sudah Dimasukkan  ";
		
		} else {
			$alert = "danger";
			$respon = "Maaf. Tidak Ditemukan Soal Dalam File";
		}
		
		
	} else {
		$alert = "danger";
		$respon = "Maaf. Soal Tidak Valid , Wajib (xls,xlsx) ";
	}
	
	
}
} 

?>








<div class="row justify-content-center">
<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-12 p-1    p-1 ">
<div class="card">
<div class="card-header"><h5> Soal Baru</h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data"> 
	<?php  if(!empty($alert)){ ?>
		<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
		<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Respon !</strong> <?php echo($respon) ;  ?> 
	</div> <?php }  ?>			
	
	<span> <b> Judul Soal </b> </span> 
	<input type="text" required class="form-control" name="judul" value="" placeholder="Masukkan Judul Soal "    />
	<br />
	 
	
	<span> <b> Masa Aktif Soal  </b> </span> 
	<input type="date" required class="form-control" name="masa_aktif" value="" placeholder="Masukkan Password Soal "    />
	<br />
	  
	<span> Data Soal Dan Jawaban <small> <a class="btn-link" href="file_soal/sample.xls" download="sample.xls" target="_blank" > Download Format Soal </a> </small>   </span> 
	<br /><br />
	 
	 
	<span> <b> Jenis Soal    </b></span> 
	<div class="row">
	<?php for ($i = 1; $i <= 3; $i++) { ?> 
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1  ">
	<span> Soal <?php echo($i) ;  ?> </span>  
		<select type="text" required min="0"  class="form-control" name="nama_soal_<?php echo($i) ;  ?>" value="" 	>
		<option>TPA</option>
		<option>TBI</option>
		<option>TIU</option>
		<option>TKP</option>
		<option>TWK</option> 
	</select></div>
	<?php } ?>
	</div>
	
	
	<div class="row">
	<?php for ($i = 1; $i <= 3; $i++) { ?> 
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1  ">
	<span> Soal <?php echo($i) ;  ?>"</span>  
	<input type="file"   min="0"  class="form-control" name="soal_<?php echo($i) ;  ?>" value="0" />
	</div>
	<?php }  ?>
	</div>
	<br />
	
	 
	<span> <b> Waktu Soal </b>   </span> 
	<div class="row">
	<?php for ($i = 1; $i <= 3; $i++) { ?> 
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1  ">
	<span> Waktu <?php echo($i) ;  ?> </span>  
	<input type="number"   min="0"  class="form-control" name="waktu_<?php echo($i) ;  ?>" value="60" />
	</div>
	<?php } ?>
	</div>
	
	<br />
	<span> <b> Poin Grade </b>  </span> 
	<div class="row">
	<?php for ($i = 1; $i <= 3; $i++) { ?> 
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1  ">
	<span> Poin <?php echo($i) ;  ?></span>  
	<input type="number"   min="0"  class="form-control" name="lulus_<?php echo($i) ;  ?>" value="70" />
	</div>
	<?php } ?>
	</div>
	
	<br />
	<button type="submit" name="new" class="btn btn-success" >Masukkan Soal Baru </button>  

</form>

</div>
</div>
</div>
</div>

</div>


 