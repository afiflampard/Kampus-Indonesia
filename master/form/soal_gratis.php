<?php  

$kategori = "Soal Gratis"; 

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
}  
}
?>

<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">
<a class="btn btn-success" href="download_peringkat.php?kategori=<?php echo($kategori) ;  ?>" > Siapkan File Excel Peringkat Nasional </a> 
<div class="card">
<div class="card-header"><h5>Daftar Soal</h5></div>


<div class="card-block"><div class="table-responsive">
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Judul </th> 
			<th> Harga </th> 
			<th> Mypoin </th> 
			<th> Kategori </th> 
			<th> Waktu 1/2/3 </th> 
			<th> Grade 1/2/3 </th> 
			<th> Soal 1/2/3 </th> 
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
	null,
	 { "mclass":"wall", "mData": "4", "mRender": function ( data, type, full ) {
		w1 = full[4];
		w2 = full[5];
		w3 = full[6];
		return w1+'/'+w2+'/'+w3;
		
	 }},
	 { "mclass":"wall", "mData": "7", "mRender": function ( data, type, full ) {
		g1 = full[7];
		g2 = full[8];
		g3 = full[9];
		
		return g1+'/'+g2+'/'+g3;
	 }},
	 { "mclass":"wall", "mData": "10", "mRender": function ( data, type, full ) {
		s1 = full[10];
		s2 = full[11];
		s3 = full[12];
		return s1+'/'+s2+'/'+s3;
	 }},
	 
	 { "mclass":"wall", "mData": "13", "mRender": function ( data, type, full ) {
		del = "showdel('"+data+"','"+full[0]+"')";
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

 
  