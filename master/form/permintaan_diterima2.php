<div class="row">

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">

<div class="card">
<div class="card-header"><h5>Permintaan Konfirmasi Diterima</h5></div>


<div class="card-block"><div class="table-responsive">
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
	
		<tr>
			<th> Date </th>  
			<th> Judul </th> 
			<th> Invoice </th>  
			<th> Total Pembayaran</th> 
			<th> Bukti </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/permintaan_diterima2.php", 
 "aoColumns": [
	 
	null,
	null,
	null,
	null,
	{ "mclass":"wall", "mData": "4", "mRender": function ( data, type, full ) {
		if(data != ""){
		on = "showimg('../image/"+data+"')";
			return '<img onclick="'+on+'" src="../crop.php?w=60&h=40&img='+data+'" style="border-radius:3px !Important " />';
		} 	else {
			return "Tidak Ada Bukti";
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


