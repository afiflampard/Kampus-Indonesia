<?php
$kategori = "";
if(!empty($_GET['kategori'])){ 
$kategori = in($_GET['kategori']); 
}

if($user->kategori_tryout == $kategori){

?>
<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">
<div class="card">
<div class="card-header"><h5>Daftar Tryout Mini - <?php echo($user->kategori_tryout) ;  ?></h5></div>


<div class="card-block"><div class="table-responsive">
<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
<thead>
	<tr>
	<th> Judul </th>  
	<th> Kategori </th> 
	<th> Waktu Soal (1/2/3) </th> 
	<th> Grade Soal (1/2/3) </th> 
	<th> Jumlah Soal (1/2/3) </th>  
	<th style="width : 100px; min-width:100px;"> # </th> 
	</tr>
</thead>
</table>

	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/soal_saya.php?mini=Yes", 
 "aoColumns": [
	
	null, 
	null,
	 { "mclass":"wall", "mData": "2", "mRender": function ( data, type, full ) {
		w1 = full[2];
		w2 = full[3];
		w3 = full[4];
		return w1+'/'+w2+'/'+w3;
		
	 }},
	 { "mclass":"wall", "mData": "5", "mRender": function ( data, type, full ) {
		g1 = full[5];
		g2 = full[6];
		g3 = full[7];
		
		return g1+'/'+g2+'/'+g3;
	 }},
	 { "mclass":"wall", "mData": "8", "mRender": function ( data, type, full ) {
		s1 = full[8];
		s2 = full[9];
		s3 = full[10];
		return s1+'/'+s2+'/'+s3;
	 }},
	 
	 { "mclass":"wall", "mData": "11", "mRender": function ( data, type, full ) {
	 kode = full[12];
	 buka = ' <a class="btn btn-success btn-xs btn-sm" href="?show=soal_start&id='+data+'" >Buka Tryout </a> ';
	 buka += ' <a class="btn btn-success btn-xs btn-sm" href="?show=soal_stat&id='+data+'" >Statistik </a> ';
	 return buka;
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




<?php require_once("form/analisis_mini.php"); ?>


<?php } else {
	?> 
<div class="p-3 bg-light">
	<h4> Maaf. Anda Tidak Memiliki Akses Ke Kategori Ini</h4> 
</div> 
	<?php 
} ?>