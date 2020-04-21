<?php 
if(isset($_POST['edit_foto'])){
require_once("isset_foto.php");
if(!empty($foto)){
eksekusi($pdo,"UPDATE `user` SET `foto`='$foto' WHERE `user_id`='$user_id'");
$alert ="success";
$respon ="Foto Profile Sudah Di Edit";

} 
} 



if(isset($_POST['edit'])){

$email = in($_POST['email']);
$nama = in($_POST['nama']);
$telepon = in($_POST['telepon']);
$whatsapp = in($_POST['whatsapp']);
$gelar = in($_POST['gelar']);
$sekolah = in($_POST['sekolah']);
$kemenkeu = "";
$jurusan = "";

if(!empty($_POST['kemenkeu'])){
	$kemenkeu = in($_POST['kemenkeu']);
} 

if(!empty($_POST['jurusan'])){
	$jurusan = in($_POST['jurusan']);
} 


$group = in($_POST['group']);
$tgl_lahir = in($_POST['tgl_lahir']);
$tempat_lahir = in($_POST['tempat_lahir']);
$tau = in($_POST['tau']);
     
   
eksekusi($pdo,"UPDATE `user` SET `tau`='$tau',`tgl_lahir`='$tgl_lahir',`tempat_lahir`='$tempat_lahir',`kemenkeu`='$kemenkeu',`jurusan`='$jurusan',`group`='$group',`nama`='$nama',`email`='$email',`telepon`='$telepon',`gelar`='$gelar',`sekolah`='$sekolah' WHERE `user_id`='$user_id' ");

$alert ="success";
$respon ="Data Profile Sudah Di Edit";
}



$check_user = select($pdo,"SELECT * FROM `user` WHERE `user_id`='$user_id' "); 
$check_user->execute();
$row_user = row($check_user);
if($row_user >= 1){
	$user = fetch_obj($check_user); 
}  


?>


<div class="row">
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1    p-1 ">
<div class="card">
<div class="card-header"><h5>Edit Profile</h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data"> 
	<?php  if(!empty($alert)){ ?>
		<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
		<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Respon !</strong> <?php echo($respon) ;  ?> 
	</div> <?php }  ?>			

	<span> Nama </span> 
	<input type="text" required class="form-control" name="nama" value="<?php echo($user->nama) ;  ?>" placeholder="Masukkan Nama Anda"    />
	<br />

	<span> Email </span> 
	<input type="text" required class="form-control" name="email" value="<?php echo($user->email) ;  ?>" placeholder="Masukkan Alamat Email Anda "    />
	<br />

	<span> Telepon </span> 
	<input type="text" required class="form-control" name="telepon" value="<?php echo($user->telepon) ;  ?>" placeholder="Masukkan Nomor Telepon Anda "    />
	<br />

	<span> Whatsapp  </span> 
	<input type="text" required class="form-control" name="whatsapp" value="<?php echo($user->wa) ;  ?>" placeholder="Masukkan Nomor Whatsapp Anda"    />
	<br />

	<span> Gelar Terakhir  </span> 
	<select type="text" required class="form-control" name="gelar"  placeholder=""   >
		<option>SMA</option>
		<option>SMK</option>
		<option>Sarjana S1</option>
		<option>Sarjana S2</option>
		<option>Sarjana S3</option>
		<option>Sarjana S4</option>
	</select>
	<br />

	<span> Sekolah Terakhir  </span> 
	<input type="text" required class="form-control" name="sekolah" value="<?php echo($user->sekolah) ;  ?>" placeholder="Masukkan Asal Sekolah Terakhir Anda"    />
	<br />
	
	<span> Tempat Tanggal Lahir  </span> 
	<div class="row m-0">
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  p-0">
			<input type="text" required class="form-control" name="tempat_lahir" value="<?php echo($user->tempat_lahir) ;  ?>" placeholder="Tempat"    />
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  p-0">
			<input type="date" required class="form-control" name="tgl_lahir" value="<?php echo($user->tgl_lahir) ;  ?>" placeholder="Tempat"    />
		</div>
	</div>
	<br />
	
	
	<div class=""  style="padding:10px; background: #f1f1f1;" >
		<b  style="font-weight : bold !important;" > Group Saat Ini  </b> <br>
		Group : <?php echo($user->group) ;  ?> <br>
		<?php if(!empty($user->kemenkeu)){echo($user->kemenkeu) ; 
		}  ?>
		JURUSAN : <?php echo($user->jurusan) ;  ?> <br>
	</div>
	
	
 
	<span> Group  </span> 
	<select type="text" onchange="check_next(this.value)" required class="form-control" name="group"   placeholder="Masukkan Asal Sekolah Terakhir Anda"   >
		<option   value=""   >Perbaharui Group Anda </option>
		<option   >PKN STAN REGULER</option>
		<option   >DIII TUGAS BELAJAR</option>
		<option   >DIV TUGAS BELAJAR</option>
		<option   >CPNS Sekolah Kedinasan</option>
		<option   >CPNS UMUM</option>
	</select>
	<br />
	
	
	
	
	<div class="" id="step1"  style="background: #f9f9f9; padding:10px; " >
		
	</div>
	
	<div class="" id="step2" style="background: #f9f9f9; padding:10px; ">
		
	</div> 
	
	
	 
	 
	 
	<span> Kamu tau Website ini dari mana ya  </span> 
	<input type="text" required class="form-control" name="tau" value="<?php echo($user->tau) ;  ?>" placeholder=""    />
	<br />
 
 
	<br /> 
	
	<button type="submit" name="edit" class="btn btn-success" >Edit Data Profile</button>  

</form>

</div>
</div>
</div>
</div>



<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1    p-1 ">
<div class="card">
<div class="card-header"><h5>Foto Profile</h5></div>


<div class="card-block" align="center"> 

	<img src="../crop.php?h=100&w=100&img=<?php echo($user->foto) ;  ?>" style="border-radius:100%; " class="" />
	<br />
	<form method="post" enctype="multipart/form-data"> <br />
	 
		<span> Ganti Foto </span> 
		<input type="file" required class="form-control" name="foto" value="" placeholder=""    />
		<br />
		<br />
		<button type="submit" class="btn btn-success" name="edit_foto" >Ganti Foto</button>  
		

	</form>
	
	

</div>
</div>
</div>


</div>




<script>  
function check_next(val){
	$('#step1').html('');
	$('#step2').html('');

	if(val == "PKN STAN REGULER"){
		$('#step1').html('	<select type="text" onchange="check_next2(this.value)" required class="form-control" name="kemenkeu"   placeholder=""   ><option   value=""   >Kemenkeu/Non Kemenkeu </option><option   >KEMENKEU</option><option   >NON KEMENKEU</option> </select><br />');
	} else 
	if(val == "DIII TUGAS BELAJAR"){
$('#step1').html('<select type="text"   required class="form-control" name="jurusan"   placeholder=""   > <option>DIII Pajak (Alih Program)</option> <option>DIII Akuntansi (Alih Program)</option> </select>');
} else 

if(val == "DIV TUGAS BELAJAR"){
$('#step1').html('<select type="text"   required class="form-control" name="jurusan"   placeholder=""   > <option>DIV Akuntansi</option> <option>DIV Akutansi (Alih Program) - A</option> <option>DIV Akuntansi (Alih Program) - B</option> </select>');
} else 

if(val == "CPNS Sekolah Kedinasan"){
$('#step1').html('<select type="text"   required class="form-control" name="jurusan"   placeholder=""   > <option>IPDN</option><option>STSN</option><option>STMKG</option><option>POLSTIS (STIS)</option> <option>STIN</option> <option>STTD</option> <option>POLTEKIP/POLTEKIM</option> <option>PTK lainnya</option> </select>');
} 

	
}




function check_next2(val){
	$('#step2').html('');
	
	if(val == "KEMENKEU"){
		data = '';
		data += '<select type="text"   required class="form-control" name="jurusan"   placeholder=""   >'; 
data += '<optgroup label="Reguler">'; 
data += '<option value="Reguler - Diploma I Pajak">Diploma I Pajak </option>'; 
data += '<option value="Reguler - Diploma I Kepabeanan dan Cukai">Diploma I Kepabeanan dan Cukai </option>'; 
data += '<option value="Reguler - Diploma I Kebendaharaan Negara">Diploma I Kebendaharaan Negara </option>'; 
data += '<option value="Reguler - Diploma III Pajak">Diploma III Pajak </option>'; 
data += '<option value="Reguler - Diploma III Penilai/PBB">Diploma III Penilai/PBB </option>'; 
data += '<option value="Reguler - Diploma III Kepabeanan dan Cukai">Diploma III Kepabeanan dan Cukai </option>'; 
data += '<option value="Reguler - Diploma III Kebendaharaan Negara">Diploma III Kebendaharaan Negara </option>'; 
data += '<option value="Reguler - Diploma III Akuntansi">Diploma III Akuntansi </option>'; 
data += '<option value="Reguler - Diploma III Akuntansi">Diploma III Akuntansi </option>'; 
data += '<option value="Reguler - Diploma IV Akuntansi">Diploma IV Akuntansi </option>'; 
data += '</optgroup>'; 
data += '<optgroup label="Papua">'; 
data += '<option value="Papua - Diploma I Pajak">Diploma I Pajak </option>'; 
data += '<option value="Papua - Diploma I Kepabeanan dan Cukai">Diploma I Kepabeanan dan Cukai </option>'; 
data += '<option value="Papua - Diploma I Kebendaharaan Negara">Diploma I Kebendaharaan Negara </option>'; 
data += '</optgroup>'; 
data += '<optgroup label="Papua Barat">'; 
data += '<option value="Papua Barat - Diploma I Pajak">Diploma I Pajak </option>'; 
data += '<option value="Papua Barat - Diploma I Kepabeanan dan Cukai">Diploma I Kepabeanan dan Cukai </option>'; 
data += '<option value="Papua Barat - Diploma I Kebendaharaan Negara">Diploma I Kebendaharaan Negara </option>'; 
data += '</optgroup>'; 
data += '<optgroup label="Maluku">'; 
data += '<option value="Maluku - Diploma I Pajak">Diploma I Pajak </option>'; 
data += '<option value="Maluku - Diploma I Kepabeanan dan Cukai">Diploma I Kepabeanan dan Cukai </option>'; 
data += '<option value="Maluku - Diploma I Kebendaharaan Negara">Diploma I Kebendaharaan Negara </option>'; 
data += '</optgroup>'; 
data += '<optgroup label="Maluku Utara">'; 
data += '<option value="Maluku Utara - Diploma I Pajak">Diploma I Pajak </option>'; 
data += '<option value="Maluku Utara - Diploma I Kepabeanan dan Cukai">Diploma I Kepabeanan dan Cukai </option>'; 
data += '<option value="Maluku Utara - Diploma I Kebendaharaan Negara">Diploma I Kebendaharaan Negara </option>'; 
data += '</optgroup>'; 
data += '<optgroup label="NTT">'; 
data += '<option value="NTT - Diploma I Pajak">Diploma I Pajak </option>'; 
data += '<option value="NTT - Diploma I Kepabeanan dan Cukai">Diploma I Kepabeanan dan Cukai </option>'; 
data += '<option value="NTT - Diploma I Kebendaharaan Negara">Diploma I Kebendaharaan Negara </option>'; 
data += '</optgroup>'; 
data += '</select>'; 

	$('#step2').html(data);
	} else {
		$('#step2').html('<select type="text"   required class="form-control" name="jurusan"   placeholder=""   ><option> Diploma I Kebendaharaan Negara </option><option> Diploma III Kebendaharaan Negara </option> <option> Diploma III Akuntansi </option> </select>');
	}
	
}


</script> 