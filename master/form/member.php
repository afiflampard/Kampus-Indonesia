<?php
if(isset($_POST['delete'])){
$id = in($_POST['id']);
$check_u = select($pdo,"SELECT * FROM `user` WHERE `id`='$id' "); 
$check_u->execute();
$row_u = row($check_u);
if($row_u >= 1){
	while($u = fetch_obj($check_u)){
		$userx = $u->user_id;
		eksekusi($pdo,"DELETE FROM `user_jawab` WHERE `user_id`='$userx' ");
		eksekusi($pdo,"DELETE FROM `beli_paket` WHERE `user_id`='$userx' "); 
		eksekusi($pdo,"DELETE FROM `user` WHERE `id`='$id' ");	
	}
}  
}
?>
 
<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">

<div class="card">
<div class="card-header"><h5>Daftar Member</h5></div>


<div class="card-block"><div class="table-responsive">
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Nama </th> 
			<th> User ID </th> 
			<th> Password </th> 
			<th> Email </th> 
			<th> Telepon </th> 
			<th> WA </th>   
			<th> Jurusan </th> 
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/member.php", 
 "aoColumns": [
	null,
	null,
	null,
	null,
	null,
	null,
	null, 
	 { "mclass":"wall", "mData": "7", "mRender": function ( data, type, full ) {
	 del = "showdel('"+data+"','"+full[0]+"')";
	 hapus = ' <button class="btn btn-danger btn-xs btn-sm" onclick="'+del+'"  type="button">Hapus</button> ';
	 see = ' <a  href="?show=member_edit&id='+data+'" class="btn btn-primary btn-xs btn-sm"    >Edit Profile</a> ';
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


