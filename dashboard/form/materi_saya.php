 
<div class="row">

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">

<div class="card">
<div class="card-header"><h5>Daftar Materi Yang Telah Anda Beli</h5></div>


<div class="card-block"><div class="table-responsive">
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
	
		<tr>
			<th> Publish </th> 
			<th> Judul </th> 
			<th> Kategori </th> 
			<th> Harga </th> 
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/materi_saya.php", 
 "aoColumns": [
	
	null,
	null,
	null,
{ "mclass":"wall", "mData": "3", "mRender": function ( data, type, full ) {
	if(data >= 1){return data;
	} else {
		return "Bonus Pendaftaran";
	}
}},

	{ "mclass":"wall", "mData": "4", "mRender": function ( data, type, full ) {
		kode = full[5];
		baca= ' <a class="btn btn-primary btn-xs btn-sm"  href="?show=baca&kode='+kode+'" >Baca</a> ';
	 return baca;
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


