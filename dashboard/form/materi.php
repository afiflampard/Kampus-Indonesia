 

<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1    p-1">
<div class="card">
<div class="card-header"><h5>Daftar Materi</h5></div>


<div class="card-block"><div class="table-responsive">

	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Judul </th>    
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
	

 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/materi.php", 
 "aoColumns": [
	null,  
	{ "mclass":"wall", "mData": "1", "mRender": function ( data, type, full ) {
	 see = ' <a  href="?show=materi_baca&id='+data+'" class="btn btn-primary btn-xs btn-sm"    >Buka Materi</a> ';
	 return see;
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

