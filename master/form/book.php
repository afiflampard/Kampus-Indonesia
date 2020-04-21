<?php
$where = " `id`<>'-1' ";
	$date_start = "";
	$date_stop = "";
	
if(isset($_POST['filter'])){
	$date_start = in($_POST['date_start']);
	 $date_stop = in($_POST['date_stop']);
	
	if(!empty($date_start)){ $where .= " and `date`>= '".$date_start."'"; }  
	if(!empty($date_stop)){ $where .= " and `date` <= '".$date_stop."'"; }  
} 



$check_total = select($pdo,"SELECT SUM(`jumlah`) as `total` FROM `buku_master` WHERE $where "); 
$check_total->execute();
$row_total = row($check_total);
if($row_total >= 1){
	$t = fetch_obj($check_total); 
	$total = $t->total;
}  

?>


<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">
<div class="card">
<div class="card-header"><h5>Buku Pemasukan</h5></div>




<div class="card-block"><div class="table-responsive">
<h4> Total Pemasukan : Rp. <?php echo uang($total) ;  ?></h4> 





<div class="p-3">
Filter Berdasarkan Tanggal : <br />
<form method="post" enctype="multipart/form-data"> 			
	<div class="row">
		<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-12 ">
			<input type="date" required class="form-control" name="date_start" value="<?php echo($date_start) ;  ?>" placeholder=""    />
		</div>
		<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 col-12 ">
			<input type="date" required class="form-control" name="date_stop" value="<?php echo($date_stop) ;  ?>" placeholder=""    />
		</div>
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12    ">
			<button type="submit"  style="width : 50% !Important; float:left; " name="filter" class="btn btn-success form-control" >Filter</button>
			<a href="?show=book"  style="width : 50% !Important; float:left; "   class="btn btn-danger form-control" >Default</a>
		</div>
			
	</div> 
</form>

</div> 
		
		

	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Tanggal </th> 
			<th> Keterangan </th> 
			<th> Jumlah </th> 
		</tr>
	</thead>
	</table>
	
 <script>   
 $(document).ready(function() {
 $('#history').dataTable( {
 "bProcessing": true,
 "bServerSide": true,
 "sAjaxSource": "server/book.php?filter=<?php echo($where) ;  ?>", 
 "aoColumns": [
	
	null,
	null,
	{ "mclass":"wall", "mData": "2", "mRender": function ( data, type, full ) {
		return "Rp. "+uang(data);
	}},
	
 ]
 } );
 } );
 </script>
 
</div>
</div>
</div>
</div>


</div>


