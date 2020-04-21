 
<?php  if(!empty($alert)){ ?>
	<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong>Respon !</strong> <?php echo($respon) ;  ?> 
</div> <?php }  ?>			


<div class="row">

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1    p-1">
<div class="card">
<div class="card-header"><h5>Analisis Hasil Jawaban Tryout Mini</h5></div>
<div class="card-block"><div class="table-responsive">
 
	<table id="analisis" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Tanggal </th> 
			<th> Judul Soal / Keterangan</th> 
			<th> Waktu Selesai </th> 
			<th> Poin </th>  
			<th> Kelulusan </th> 
			<th> Dinyatakan</th> 
			<th> Pembahasan </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#analisis').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/jawaban.php?mini=Yes", 
 "aoColumns": [
	null,
	{ "mclass":"wall", "mData": "1", "mRender": function ( data, type, full ) {
		x = full[1] + "<br> <br> <div style='max-width:150px;  font-size : 12px!important; word-wrap: break-word;white-space: pre-wrap;'>"+full[12]+"</div>";
		return x;
	}},
	{ "mclass":"wall", "mData": "2", "mRender": function ( data, type, full ) {
		x =  " Start : "+full[2]+"<br> Stop : "+full[3] ;
		return x;
	}},
	{ "mclass":"wall", "mData": "4", "mRender": function ( data, type, full ) {
		x = " Soal 1 : "+full[4];
		if(full[5] != ""){ x += "<br> Soal 2 : "+full[5]; } 
		if(full[6] != ""){ x += "<br> Soal 3 : "+full[6]; } 
		x += "<br> TOTAL : "+full[7];
		return x;
		
	}},
	{ "mclass":"wall", "mData": "8", "mRender": function ( data, type, full ) {
		x = " Soal 1 : "+full[8];
		if(full[9] != ""){ x += "<br> Soal 2 : "+full[9]; } 
		if(full[10] != ""){ x += "<br> Soal 3 : "+full[10]; } 
		
		
		return x;
	}},
	{ "mclass":"wall", "mData": "11", "mRender": function ( data, type, full ) {
		return full[11] ;
	}},
	{ "mclass":"wall", "mData": "14", "mRender": function ( data, type, full ) {
		x = '<a class="btn btn-success btn-sm"  href="?show=pembahasan&kode='+data+'" > <i class="fa fa-book">  </i> Lihat </a> ';
		return x+ '<a class="btn btn-success btn-sm"  href="?show=finish_data&id='+full[13]+'" > <i class="fa fa-info">  </i> Detail </a> ';
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




