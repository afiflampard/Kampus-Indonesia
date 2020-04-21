<script src="assets/chart.js/js/Chart.js"></script>




<style>
	canvas{
		width:100% !important; 
		max-width:100% !important;
	}
</style>
<div class="row">
<?php 
/*
 * 		<option>TPA</option>
		<option>TBI</option>
		<option>TIU</option>
		<option>TKP</option>
		<option>TWK</option> 
 * --------------
 */

$jenis = array("TPA","TBI","TIU","TKP","TWK");
$max = array(180,120,150,175,175);
$xxx = 0;

foreach($jenis as $jenis_soal){
	$xxx++;
	?> 
	 
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1   p-1 ">
<div class="card">
<div class="card-header"><h5>Statistik <?php echo($jenis_soal) ;  ?></h5></div>
<div class="card-block"> 

<canvas class=""  style="width : 100% !Important; height: 400px;"  id="myChart_<?php echo($jenis_soal) ;  ?>"> </canvas>

</div>
</div>
</div>

<script>  



var ctx_<?php echo($jenis_soal) ;  ?> = document.getElementById('myChart_<?php echo($jenis_soal) ;  ?>').getContext('2d');

var chart_<?php echo($jenis_soal) ;  ?> = new Chart(ctx_<?php echo($jenis_soal) ;  ?>, {
    // The type of chart we want to create
    type: 'line', 
    data: {
		labels: [
		"Start"
		<?php 
		$check_st = select($pdo,"SELECT * FROM `statistik_soal` WHERE `jenis_soal`='$jenis_soal' and `user_id`='$user_id' ORDER BY `id` ASC "); 
		$check_st->execute();
		$row_st = row($check_st);
		if($row_st >= 1){
			$x = 0;
			while($st = fetch_obj($check_st)){
				
					?> ,"<?php echo($st->nama_soal) ;  ?>"<?php 
				$x++;
			}
		}  else {
			echo('"Tidak Ada Data"') ; 
		}
		 ?>
		],
        datasets: [
		{
            label: "Your Score",
            backgroundColor: 'rgb(89, 131, 232,0)',
            borderColor: 'rgb(89, 131, 232)',
            borderSize: '5px',
            data: [
			0
			<?php 
		$check_st = select($pdo,"SELECT * FROM `statistik_soal` WHERE `jenis_soal`='$jenis_soal' and `user_id`='$user_id' ORDER BY `id` ASC "); 
		$check_st->execute();
		$row_st = row($check_st);
		if($row_st >= 1){
			$x = 0;
			while($st = fetch_obj($check_st)){
					echo(','.$st->total_poin) ;  
				$x++;
			}
		}  else {
			echo('0') ; 
		}
		?> ],
        },{
            label: "Top Score",
            backgroundColor: 'rgb(200, 21, 21,0)',
            borderColor: 'rgb(200, 21, 21)',
            borderSize: '5px',
            data: [
			0		
		<?php 
		$check_stx = select($pdo,"SELECT * FROM `statistik_soal` WHERE `jenis_soal`='$jenis_soal' and `user_id`='$user_id' ORDER BY `id` ASC "); 
		$check_stx->execute();
		$row_stx = row($check_stx);
		if($row_stx >= 1){
			$x = 0;
			
		while($stx = fetch_obj($check_stx)){
		$nama_soal = $stx->nama_soal;
		
		$check_st = select($pdo,"SELECT MAX(`total_poin`) AS `total_poin` FROM `statistik_soal` WHERE `jenis_soal`='$jenis_soal' and `nama_soal`='$nama_soal'    "); 
		$check_st->execute();
		$row_st = row($check_st);
		if($row_st >= 1){
		$st = fetch_obj($check_st); 
			echo(','.$st->total_poin);  
			$x++;
		}
		}
		}  else {
			echo('0') ; 
		}
		
		?> ],
        }
		,{
            label: "Rata Rata ",
            backgroundColor: 'rgb(0, 228, 208,0)',
            borderColor: 'rgb(0,228, 208)',
            borderSize: '5px',
            data: [
0		
		<?php 
		$check_stx = select($pdo,"SELECT * FROM `statistik_soal` WHERE `jenis_soal`='$jenis_soal' and `user_id`='$user_id' ORDER BY `id` ASC "); 
		$check_stx->execute();
		$row_stx = row($check_stx);
		if($row_stx >= 1){
			$x = 0;
			
		while($stx = fetch_obj($check_stx)){
		$nama_soal = $stx->nama_soal;
		
		$check_st = select($pdo,"SELECT AVG(`total_poin`) AS `total_poin` FROM `statistik_soal` WHERE `jenis_soal`='$jenis_soal' and `nama_soal`='$nama_soal' "); 
		$check_st->execute();
		$row_st = row($check_st);
		if($row_st >= 1){
		$st = fetch_obj($check_st); 
				echo(','.$st->total_poin) ;  
			$x++;
		}
		}
		}  else {
			echo('0') ; 
		}
		
		?> ],
        }
		
		]
		
    },
 
    options: {scales: {
		xAxes: [{
				display: true,
				scaleLabel: { 
					display: true,
					labelString: 'Tryout Yang Pernah Dikerjakan'
				}
			}],
		yAxes: [{
				display: true,
				ticks: {
					beginAtZero: true,
					steps: 10,
					stepValue: 5,
					max: <?php echo($max[$xxx -1]) ;  ?>
				}
			}]
                }
				}
});

  </script> 


	<?php 
}

?>

 




<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  ">
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



<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1    ">
<div class="card">
<div class="card-header"><h5>Keterangan</h5></div>
<div class="card-block"> 
Statistik Tryout Saya Merupakan statistik Tryout yang telah diikuti terbagi atas Beberapa Kategori Yang Mencangkup : 
<br />
<ul>
<?php foreach($jenis as $jenis_soal){
	?> 
	<li><?php echo($jenis_soal) ;  ?></li>  
	<?php 
} ?>
</ul>


 
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


