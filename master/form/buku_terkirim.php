  

<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">
<div class="card">
<div class="card-header"><h5>Berikut Permintaan Pembelian Yang Telah Terkirim </h5>   
</div>


<div class="card-block"><div class="table-responsive">
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
	
		<tr>
			<th> Nama Penerima </th>  
			<th> Judul </th>  
			<th> Total Pembayaran</th>  
			<th> Alamat Tujuan  </th> 
			<th> Kurir Pilihan </th> 
			<th> Resi </th>  
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/buku_terkirim.php", 
 "aoColumns": [
	 
	null, 
	null, 
	null, 
	null, 
	null, 
	null,  
 ]
 } );
 } );
 </script>
 
</div>
</div>
</div>
</div>


</div>


