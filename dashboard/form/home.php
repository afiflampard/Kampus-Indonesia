<?php 

$ref = 0;
$check_r = select($pdo,"SELECT SUM(`bonus`) as `total` FROM `riwayat_bonus` WHERE `user_id`='$user_id'  "); 
$check_r->execute();
$row_r = row($check_r);
if($row_r >= 1){
	while($r = fetch_obj($check_r)){
		$ref = $r->total;
		if(empty($r->total)){
			$ref = 0;
		} 
	}
}  

$jenis = array("TPA","TBI","TIU","TKP","TWK");

$max = array(180,120,150,175,175);
$xxx = 0;

?>
<script  src="assets/chart.js/js/Chart.js"></script>



<div class="row ">

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1" align="center">
	<h4 class="mb-1"> Batas Aktif Akun Anda</h4> 
	<p class="mb-1"> Akun Anda Memiliki Batas Akses Hingga <b> <?php echo($user->batas_login) ;  ?> </b></p> 
</div>


 


<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  p-1">
<div class="card">
<div class="card-header"><h5>Rincian Tryout Anda</h5></div>
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
 "sAjaxSource": "server/soal_saya.php", 
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




<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12   p-1">
<div class="card">
<div class="card-header"><h5>Grafik Spider </h5></div>
<div class="card-block"> 
<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-0">
<canvas id="myChart2"></canvas>
</div>
</div>
</div>
</div>
</div>



<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-1   p-1">
<div class="card">
<div class="card-header"><h5>Jadwal Event Tryout</h5></div>
<div class="card-block"><div class="table-responsive">



<div class="row">
<?php $check_data = select($pdo,"SELECT * FROM `data_soal` WHERE  `harga`<=0   and active='Yes'"); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
while($data = fetch_obj($check_data)){

$kode = $data->kode_soal;

?> 
		
		
	<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1">
		<div class="card bg-c-blue order-card">
		<div class="card-block">
			<h6 class="m-b-20"><?php echo($data->judul) ;  ?></h6>
			<h2 class="text-right"><i class="ti-receipt f-left"></i><span>Free</span></h2>
			<p class="m-b-0">
	
	<a class="cw" href="?show=soal_start&id=<?php echo($data->id) ;  ?>"   > Buka Soal </a>  <br />
	 
	   </p>
		</div>
	</div>
	</div>
		  
			
			
			<?php 
		}
	} else {?> 
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  p-1">
	<div class=""  style="background: #f9f9f9; padding:20px;" >
		<h4> Maaf. Saat Ini Belum Ada Soal Gratis Yang Di Bagikan Oleh Admin	</h4> 		
	</div>
	</div> 
	<?php }
	?>


</div>
</div>
</div>
</div>
</div>
</div>




<script>  
$(document).ready(function(){
var ctx = document.getElementById('myChart2').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'radar',

    // The data for our dataset
    data: {
        labels: [
		<?php 
		$x = 0;
		foreach($jenis as $jenis_soal){
			if($x == 0){ ?> 
				"<?php echo($jenis_soal) ;  ?>"
			<?php } else { ?> 
				 ,"<?php echo($jenis_soal) ;  ?>"
				<?php 
			} 
		$x++;
		} 
		?>
		],
        datasets: [{
            label: "Rata Rata Anda",
            backgroundColor: "rgba(100, 221, 187, 0.52)",
            borderColor: "rgba(72, 206, 168, 0.88)",
            pointBackgroundColor: "rgba(51, 175, 140, 0.88)",
            pointBorderColor: "rgba(44, 130, 105, 0.88)",
            pointHoverBackgroundColor: "rgba(44, 130, 105, 0.88)",
            pointHoverBorderColor: "rgba(107, 226, 193, 0.98)",
			data: [
			<?php 
$x = 0;			
foreach($jenis as $jenis_soal){
	$check_tiu = select($pdo,"SELECT COUNT(`jenis_soal`) as `count` ,SUM(`total_poin`) as `total` FROM `statistik_soal` WHERE `jenis_soal`='$jenis_soal' and `user_id`='$user_id'    "); 
	$check_tiu->execute();
	$row_tiu = row($check_tiu);
	if($row_tiu >= 1){
		$t = fetch_obj($check_tiu); 
		
		if(($t->total == "") or ($t->total == 0)) {
			$nil = 0;
		} else {
			$nil = $t->total / $t->count;
		}
	}  else {
		$nil = 0 ; 
	}
	
	if($x == 0){
		echo($nil) ; 
	} else {
		echo(",".$nil) ; 
	}
	$x++;
}
		 ?>
			],
        },{
            label: "Terbaik",
            backgroundColor: "rgba(255, 204, 189, 0.95)",
            borderColor: "rgba(255, 165, 138, 0.95)",
            pointBackgroundColor: "rgba(255, 116, 22, 0.94)",
            pointBorderColor: "rgba(251, 142, 109, 0.95)",
            pointHoverBackgroundColor: "rgba(251, 142, 109, 0.95)",
            pointHoverBorderColor: "rgba(255, 165, 138, 0.95)",
            data: [<?php $x = 0;
		
foreach($jenis as $jenis_soal){
	$check_tiu = select($pdo,"SELECT * FROM `statistik_soal` WHERE `jenis_soal`='$jenis_soal' ORDER BY `total_poin` DESC LIMIT 1    "); 
	$check_tiu->execute();
	$row_tiu = row($check_tiu);
	if($row_tiu >= 1){
		$t = fetch_obj($check_tiu); 
		$nil = $t->total_poin;
	}  else {
		$nil = "0" ; 
	}
	
	if($x == 0){
		echo($nil) ; 
	} else {
		echo(",".$nil) ; 
	}
	$x++;
}  ?>],
        }]
		
    },
 
    options: {scale: { 
                ticks: {
                    beginAtZero: true,
					max:180
                
				}
            }
			
			}
});
});



</script> 



