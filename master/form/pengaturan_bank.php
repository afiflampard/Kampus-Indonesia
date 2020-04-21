<?php
if(isset($_POST['delete'])){
$id = in($_POST['id']);
eksekusi($pdo,"DELETE FROM `data_bank` WHERE `id`='$id' ");
}

if(isset($_POST['new'])){
$bank_jenis = in($_POST['bank_jenis']);
$bank_rekening = in($_POST['bank_rekening']);
$bank_nama = in($_POST['bank_nama']);
$check_bank = select($pdo,"SELECT * FROM `data_bank` WHERE `bank_jenis`='$bank_jenis' and `bank_rekening`='$bank_rekening' "); 
$check_bank->execute();
$row_bank = row($check_bank);
if($row_bank >= 1){
	$alert = "danger";
	$respon = "Maaf. Data Bank Ini Sudah Ada Sebelumnya";
}  else {
	eksekusi($pdo,"INSERT INTO `data_bank` (`bank_jenis`,`bank_rekening`,`bank_nama`) VALUES ('$bank_jenis','$bank_rekening','$bank_nama') ");
	$alert = "success";
	$respon = "Data Bank Baru Sudah Dimasukkan";
}
} 
 ?>

 <div class="alert bg-info alert-dismissable"  style="color:white !Important" >
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
<p  style="color:white !important;" > Untuk Mengaktifkan Auto Confirm . Pastikan Anda Sudah Punya Akun http://cekmutasi.co.id/ . <br />
Cara Untuk Mengaktifkan Auto Confirm . Anda tinggal memasukkan URL Callback Pada Saat Memasukkan Data Bank Di Cekmutasi.co.id <br />
<b> URL CALLBACK = <span  style="color: yellow !important;" > <?php echo($site) ?>/callback.php </span>  </b>  </p> 
</div> 


 
<div class="row">
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1   p-1 ">
<div class="card">
<div class="card-header"><h5>Tambah Data Bank</h5>
</div>

<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data"> 
	<?php  if(!empty($alert)){ ?>
		<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
		<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Respon !</strong> <?php echo($respon) ;  ?> 
	</div> <?php }  ?>			
	
	<span> Jenis Bank </span> 
	<input type="text" required class="form-control" name="bank_jenis" value="" placeholder="Jenis Bank"    />
	<br />
	
	<span> Nomor Rekening </span> 
	<input type="text" required class="form-control" name="bank_rekening" value="" placeholder="Nomor Rekening"    />
	<br />
	
	<span> Atas Nama </span> 
	<input type="text" required class="form-control" name="bank_nama" value="" placeholder="Nama Pemilik Rekening"    />
	<br />
	
	<br />
	<button type="submit" name="new" class="btn btn-success" >Masukkan Rekening Baru</button>  

</form>

</div>
</div>
</div>
</div>



<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-1   p-1">
<div class="card">
<div class="card-header"> 
	<i class="mdi mdi-package-down">  </i> Daftar Bank
</div>
<div class="card-block"><div class="table-responsive">

	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Jenis Bank</th> 
			<th> Nomor Rekening</th> 
			<th> Atas Nama</th> 
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/bank.php", 
 "aoColumns": [
	null,
	null,
	null,
	{ "mclass":"wall", "mData": "3", "mRender": function ( data, type, full ) {
	 del = "showdel('"+data+"','"+full[0]+"')";
	 hapus = ' <button class="btn btn-danger btn-xs btn-sm" onclick="'+del+'"  type="button"><i class="fa fa-trash">  </i></button> ';
	 see = ' <a  href="?show=pengaturan_bank_edit&id='+data+'" class="btn btn-primary btn-xs btn-sm"    ><i class="fa fa-edit">  </i></a> ';
	 return hapus+see;
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




