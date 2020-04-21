
 
<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">
<div class="card">
<div class="card-header"><h5>Daftar Invoice Pembelian Anda</h5>   
</div>

<div class="card-block"><div class="table-responsive">
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
	
		<tr>
			<th> Invoice </th>  
			<th> Buku </th> 
			<th> Status </th>  
			<th> Status Bukti </th> 
			<th> Resi </th> 
			<th> Kurir Pilihan </th> 
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/buku_invoice.php", 
 "aoColumns": [
	null,
	null,
	null,
	null,
	null,
	null, 
	{ "mclass":"wall", "mData": "6", "mRender": function ( data, type, full ) { 
	conf = "showresi('"+data+"','"+full[2]+"')"; 
	see = ' <a href="?show=buku_bayar&invoice='+data+'" class="btn btn-success btn-xs btn-sm" onclick="'+conf+'" >Detail / Bayar</a> ';  
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



