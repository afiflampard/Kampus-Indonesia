<?php 
if(isset($_POST['delete'])){
$id = in($_POST['id']);
eksekusi($pdo,"DELETE FROM `kategori_soal` WHERE `id`='$id' ");
}


if(isset($_POST['new'])){
$nama = in($_POST['nama']);
$total = in($_POST['total']);
 
 if($total > 3){ $total = 3;  }
 if($total <= 0){ $total = 1;  }
 
 
$check_k = select($pdo,"SELECT * FROM `kategori_soal` WHERE `nama`='$nama' "); 
$check_k->execute();
$row_k = row($check_k);
if($row_k >= 1){
	$alert = "danger";
	$respon = "Maaf. Kategori Ini Sudah Ada ";
}  else {
	eksekusi($pdo,"INSERT INTO `kategori_soal` (`nama`,`total_soal`) VALUES ('$nama','$total') ");
	$alert = "success";
	$respon = "Kategori Baru Sudah Di Buat";
	
}
}  

?>


<div class="row">
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1   p-1 ">
<div class="card">
<div class="card-header"><h5>Kategori Soal Baru</h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data"> 
	<?php  if(!empty($alert)){ ?>
		<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
		<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Respon !</strong> <?php echo($respon) ;  ?> 
	</div> <?php }  ?>			
	
	<span> Nama Kategori </span> 
	<input type="text" required class="form-control" name="nama" value="" placeholder="Masukkan Nama Kategori"    />
	<br />
	<span> Isi Soal - Max 3 </span> 
	<input type="number" required class="form-control" max="3" min="1" name="total" value="" placeholder="Total Soal Dalam Kategori"    />
	<br />
	<br />
	<button type="submit" name="new" class="btn btn-success" >Buat Kategori Baru</button>  

</form>

</div>
</div>
</div>
</div>



<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-1   p-1">
<div class="card">
<div class="card-header"><h5>Daftar Kategori</h5></div>


<div class="card-block"><div class="table-responsive">

	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Nama Kategori</th> 
			<th> Total Soal</th> 
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/kategori_soal.php", 
 "aoColumns": [
	null,
	null,
	{ "mclass":"wall", "mData": "2", "mRender": function ( data, type, full ) {
		del = "showdel('"+data+"','"+full[0]+"')";
	 hapus = ' <button class="btn btn-danger btn-xs btn-sm" onclick="'+del+'"  type="button"><i class="fa fa-trash">  </i></button> ';
	 see = ' <a  href="?show=soal_kategori_edit&id='+data+'" class="btn btn-primary btn-xs btn-sm"    ><i class="fa fa-edit">  </i></a> ';
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




