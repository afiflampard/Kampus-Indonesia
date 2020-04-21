<?php 
if(!empty($_GET['kategori'])){ 
$kategori = in($_GET['kategori']); 
}




$check_k = select($pdo,"SELECT * FROM `kategori_soal` WHERE `nama`='$kategori'  "); 
$check_k->execute();
$row_k = row($check_k);
if($row_k >= 1){
$k = fetch_obj($check_k); 
$total_soal = $k->total_soal;

if(isset($_POST['sembunyikan'])){
	$id = in($_POST['id']);
	eksekusi($pdo,"UPDATE data_soal SET active='No' WHERE id='$id' ");
	$alert = "success";
	$respon = "Soal Sudah Di Non Aktifkan ";
} 

if(isset($_POST['aktifkan'])){
	$id = in($_POST['id']);
	eksekusi($pdo,"UPDATE data_soal SET active='Yes' WHERE id='$id' ");
	$alert = "success";
	$respon = "Soal Sudah Di Aktifkan ";
} 




if(isset($_POST['delete'])){
$id = in($_POST['id']);  
$check_data = select($pdo,"SELECT * FROM `data_soal` WHERE `id`='$id' "); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
	while($data = fetch_obj($check_data)){
		$kode  = $data->kode_soal;
		eksekusi($pdo,"DELETE FROM `data_jawaban` WHERE `kode_soal`='$kode' ");
	}
	eksekusi($pdo,"DELETE FROM `data_soal` WHERE `id`='$id' ");
	$alert = "success";
	$respon = "Soal Berhasil Di Hapus";
	
}  else {
	$alert = "danger";
	$respon = "Soal Tidak Di Temukan";
	
}
}
?>


 
<script>
function showhidex(id,nama){
 $('#hidex_id').val(id);
 $('#hidex_name').val(nama);
 
 $('#modal_hidex').modal('show'); 
}
function cancel_hidex(){ $('#modal_hidex').modal('hide'); }
</script>

<div class="modal fade" id="modal_hidex" role="dialog" style="display: none; margin-top:0px;">
 <div class="modal-dialog"style="border-radius:0px !Important ">
	 <div class="modal-content"style="border-radius:0px !Important ">
		 <div class="modal-header" style="border-radius:0px !Important ">
			 <span class="modal-title">Apakah Anda Yakin Ingin Menonaktifkan Data Ini</span>
			 <button type="button" class="close" data-dismiss="modal">x</button>
		 </div>
		 <div class="modal-body">
		 <form method="post" enctype="multipart/form-data"> 
			<span> Data Anda </span> 
			<input type="hidden" required class="form-control" id="hidex_id" name="id" value="" placeholder=""    />
			<input type="text" required class="form-control" id="hidex_name" name="data" value="" placeholder="Your Data "    />
			<br />
			<button type="submit" name="sembunyikan" class="btn btn-primary" >Non Aktifkan</button> 
		 </form>
		 </div> 
	 </div>
 </div>
</div>


 <script>
function showtampil(id,nama){
 $('#tampil_id').val(id);
 $('#tampil_name').val(nama);
 
 $('#modal_tampil').modal('show'); 
}
function cancel_tampil(){ $('#modal_tampil').modal('hide'); }
</script>

<div class="modal fade" id="modal_tampil" role="dialog" style="display: none; margin-top:0px;">
 <div class="modal-dialog"style="border-radius:0px !Important ">
	 <div class="modal-content"style="border-radius:0px !Important ">
		 <div class="modal-header" style="border-radius:0px !Important ">
			 <span class="modal-title">Apakah Anda Yakin Ingin Aktifkan Data Ini</span>
			 <button type="button" class="close" data-dismiss="modal">x</button>
		 </div>
		 <div class="modal-body">
		 <form method="post" enctype="multipart/form-data"> 
			<span> Your Data </span> 
			<input type="hidden" required class="form-control" id="tampil_id" name="id" value="" placeholder=""    />
			<input type="text" required class="form-control" id="tampil_name" name="data" value="" placeholder="Your Data "    />
			<br />
			<button type="submit" name="aktifkan" class="btn btn-primary" >Aktifkan</button> 
		 </form>
		 </div> 
	 </div>
 </div>
</div>
 
 


<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">

<div class="card">
<div class="card-header"><h5>Daftar Soal</h5></div>


<div class="card-block"><div class="table-responsive">
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Judul </th> 
			<th> Kategori </th> 
			<th> Jenis </th> 
			<th> Waktu 1/2/3 </th> 
			<th> Grade 1/2/3 </th> 
			<th> Soal 1/2/3 </th> 
			<th> Active </th> 
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/soal.php?kategori=<?php echo($kategori) ;  ?>", 
 "aoColumns": [
	
	null,
	null,
	null,
	 { "mclass":"wall", "mData": "3", "mRender": function ( data, type, full ) {
		w1 = full[3];
		w2 = full[4];
		w3 = full[5];
		return w1+'/'+w2+'/'+w3;
		
	 }},
	 { "mclass":"wall", "mData": "6", "mRender": function ( data, type, full ) {
		g1 = full[6];
		g2 = full[7];
		g3 = full[8];
		
		return g1+'/'+g2+'/'+g3;
	 }},
	 { "mclass":"wall", "mData": "9", "mRender": function ( data, type, full ) {
		s1 = full[9];
		s2 = full[10];
		s3 = full[11];
		return s1+'/'+s2+'/'+s3;
	 }},
	 
	 { "mclass":"wall", "mData": "12", "mRender": function ( data, type, full ) {
		return data; 
	 }},
	 
	 { "mclass":"wall", "mData": "13", "mRender": function ( data, type, full ) {
		del = "showdel('"+data+"','"+full[0]+"')";
		hidex  = "showhidex('"+data+"','"+full[0]+"')";
		tampil = "showtampil('"+data+"','"+full[0]+"')";
		hapus = ' <button class="btn btn-danger btn-xs btn-sm" onclick="'+del+'"  type="button"><i class="fa fa-trash">  </i></button> ';
		sembunyikan = ' <button class="btn btn-danger btn-xs btn-sm" onclick="'+hidex+'"  type="button">Hide</button> ';
		aktifkan = ' <button class="btn btn-primary btn-xs btn-sm" onclick="'+tampil+'"  type="button">Show</button> ';
		 
	if(full[12] == "Yes"){
	 return hapus+sembunyikan;
	} else {
	 return hapus+aktifkan;
	}
	
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




<?php } ?>

