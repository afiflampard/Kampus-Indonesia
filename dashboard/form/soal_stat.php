<?php
if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 

$check_data = select($pdo,"SELECT * FROM `data_soal` WHERE `id`='$id' "); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
$data = fetch_obj($check_data); 
$kode = $data->kode_soal;
$tanggal = "#";



$poin_1 = "#";
$poin_2 = "#";
$poin_3 = "#";

$nama_soal_1 = $data->nama_soal_1;
$nama_soal_2 = $data->nama_soal_2;
$nama_soal_3 = $data->nama_soal_3;


$top_1 = 0;
$top_2 = 0;
$top_3 = 0;


$check_jawab = select($pdo,"SELECT * FROM `user_jawab` WHERE `kode_soal`='$kode' and `user_id`='$user_id' ORDER BY `id` ASC "); 
$check_jawab->execute();
$row_jawab = row($check_jawab);
if($row_jawab >= 1){
	while($jawab = fetch_obj($check_jawab)){
		$tanggal .= ',"'.$jawab->date.'"';
		$poin_1 .= ",".$jawab->poin_1;
		$poin_2 .= ",".$jawab->poin_2;
		$poin_3 .= ",".$jawab->poin_3;
		
		if($top_1 <= $jawab->poin_1){$top_1 = $jawab->poin_1;} 
		if($top_2 <= $jawab->poin_2){$top_2 = $jawab->poin_2;} 
		if($top_3 <= $jawab->poin_3){$top_3 = $jawab->poin_3;} 
		
	}
}  


 
if($tanggal == "#"){ $tanggal = '"Tidak Ada Data"'; } else {$tanggal = str_replace('#,','',$tanggal); }
if($poin_1 == "#"){ $poin_1 =0; } else {$poin_1 = str_replace('#,','',$poin_1); }
if($poin_2 == "#"){ $poin_2 =0; } else {$poin_2 = str_replace('#,','',$poin_2); }
if($poin_3 == "#"){ $poin_3 =0; } else {$poin_3 = str_replace('#,','',$poin_3); }





$check_top = select($pdo,"SELECT MAX(`poin_1`) AS `poin_1`,MAX(`poin_2`) as `poin_2`, MAX(`poin_3`) as `poin_3` FROM `user_jawab` "); 
$check_top->execute();
$row_top = row($check_top);
if($row_top >= 1){
	$t = fetch_obj($check_top); 
	$topx_1 = $t->poin_1;
	$topx_2 = $t->poin_2;
	$topx_3 = $t->poin_3;
	
}  else {
	$topx_1 = 0;
	$topx_2 = 0;
	$topx_3 = 0;
}




?>

<script src="../files/bower_components/chart.js/js/Chart.js"></script>

<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">

<div class="card">
<div class="card-header"><h5>Statistik Anda </h5></div>


<div class="card-block"><div class="table-responsive">
<canvas id="myChart"></canvas>
</div>
</div>
</div>
</div>



 


</div>




<script>
var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: [<?php echo($tanggal) ;  ?>],
        datasets: [{
            label: '<?php echo($nama_soal_1) ;  ?>',
            data: [<?php echo($poin_1) ;  ?>],
            backgroundColor: 'rgba(255, 99, 132, 0)',
            borderColor: 'rgba(255,99,132,1)',
            borderWidth: 3
        },
		<?php if(!empty($nama_soal_2)){?> 
		
		{
            label: '<?php echo($nama_soal_2) ;  ?>',
            data: [<?php echo($poin_2) ;  ?>],
            backgroundColor: 'rgba(54, 162, 235, 0)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 3
        },
		 
		<?php 
		}  ?>
		
		<?php if(!empty($nama_soal_3)){ ?> 
		
		{
            label: '<?php echo($nama_soal_3) ;  ?>',
            data: [<?php echo($poin_3) ;  ?>],
            backgroundColor:'rgba(255, 206, 86, 0)',
            borderColor: 'rgba(255, 206, 86, 1)',
            borderWidth: 3
        },
		 
		<?php 
		}  ?>
		]
		
                
                
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});









 
</script>






<?php } else {?> <script>  document.location.href="?show=soal_saya_biasa";   </script>   <?php } ?>
<?php } else {?> <script>  document.location.href="?show=soal_saya_biasa";   </script>   <?php } ?>


