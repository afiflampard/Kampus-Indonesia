<?php
if($user->level == "master"){


if(isset($_POST['delete'])){
$id = in($_POST['id']);
eksekusi($pdo,"DELETE FROM `admin` WHERE `id`='$id' ");
}



if(isset($_POST['new'])){

$user_id = in($_POST['user_id']);
$nama = in($_POST['nama']);
$password = in($_POST['password']);
    

$check_bank = select($pdo,"SELECT * FROM `admin` WHERE `user_id`='$user_id'  "); 
$check_bank->execute();
$row_bank = row($check_bank);
if($row_bank >= 1){
	$alert = "danger";
	$respon = "Maaf. Data Ini Sudah Ada Sebelumnya";
}  else {
	eksekusi($pdo,"INSERT INTO `admin` (`nama`,`user_id`,`password`,`level`) VALUES ('$nama','$user_id','$password','admin') ");
	$alert = "success";
	$respon = "Data Admin Baru Sudah Dimasukkan";
}
} 



?>
 

 
<div class="row">
<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1   p-1 ">
<div class="card">
<div class="card-header"><h5>Tambah Admin</h5></div>


<div class="card-block"><div class="table-responsive">
<form method="post" enctype="multipart/form-data">  		
	
	<span> Nama </span> 
	<input type="text" required class="form-control" name="nama" value="" placeholder=""    />
	<br />
	
	<span> User ID </span> 
	<input type="text" required class="form-control" name="user_id" value="" placeholder=""    />
	<br />
	
	<span> Password </span> 
	<input type="text" required class="form-control" name="password" value="" placeholder=""    />
	<br />
	
	<br />
	<button type="submit" name="new" class="btn btn-success" >Masukkan Admin Baru</button>  

</form>

</div>
</div>
</div>
</div>



<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-1   p-1">
<div class="card">
<div class="card-header"><h5>List Admin</h5></div> 
<div class="card-block">

	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Nama </th> 
			<th> User ID</th> 
			<th> Password</th> 
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/admin.php", 
 "aoColumns": [
	null,
	null,
	null,
	{ "mclass":"wall", "mData": "3", "mRender": function ( data, type, full ) {
	 del = "showdel('"+data+"','"+full[0]+"')";
	 hapus = ' <button class="btn btn-danger btn-xs btn-sm" onclick="'+del+'"  type="button"><i class="fa fa-trash">  </i></button> ';
	 see = ' <a  href="?show=pengaturan_admin_edit&id='+data+'" class="btn btn-primary btn-xs btn-sm"    ><i class="fa fa-edit">  </i></a> ';
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






<?php } else {?> 
<h4> Tidak Ada Akses</h4>  
<?php } ?>