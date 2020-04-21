
<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1    p-1">
<div class="card">
<div class="card-header"><h5>Riwayat Bonus Koin</h5></div>


<div class="card-block"><div class="table-responsive">
 
 <div class="table-responsive">
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Tanggal </th> 
			<th> Dari User </th> 
			<th> Keterangan </th> 
			<th> Bonus Koin </th>
		</tr>
	</thead>
	</table>
</div>

	 
</div>
</div>
</div>
</div>
</div>



<script>  

 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/my_bonus.php", 
 "aoColumns": [
	null,
	null,
	null,
	null
 ]
 } );
 } );
 </script>
</script> 