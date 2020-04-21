<?php 
$id = -1;
if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 
}


$check_jawab = select($pdo,"SELECT * FROM `user_jawab` WHERE `user_id`='$user_id' and `selesai`='Selesai' and `id`='$id' "); 
$check_jawab->execute();
$row_jawab = row($check_jawab);
if($row_jawab >= 1){
$jawab = fetch_obj($check_jawab); 
$kode = $jawab->kode_soal;

$check_data = select($pdo,"SELECT * FROM `data_soal` WHERE `kode_soal`='$kode' LIMIT 1"); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
$data =fetch_obj($check_data); 
$id_soal = $data->id;

?>





<div class="" style="min-height:500px;background: white; padding-bottom:20px !important; "> 
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  " style="padding:15px !important ">
		
		<a class="text-primary" > Soal <?php echo($data->nama_soal_1) ;  ?> </a> -  	
		
		<?php if(!empty($data->nama_soal_2)){ ?> 
		<a class="text-primary" > Soal <?php echo($data->nama_soal_2) ;  ?> </a> -  	 
		<?php }  ?>
		
		<?php if(!empty($data->nama_soal_3)){ ?> 
		<a class="text-primary" > Soal <?php echo($data->nama_soal_3) ;  ?> </a> 	 
		<?php }  ?>
		
		
		<a class="text-primary" > HASIL UJIAN </a> 
	</div>
	
	
	
	<?php if($jawab->kelulusan == "Lulus"){ ?> 
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  " style="padding:20px;" align="center">
		<h5 style="font-size : 20px; font-weight : bold;"> 
SELAMAT! ATAS KELULUSANMU! Ayo asah lagi kemampuanmu dengan mengikuti TRY OUT lainnya ya! <a  style="font-size : inherit !important" href="?show=soal_saya"> Klik disini  </a> 
		<br> 		<br />
		 
		<b> Total Poin Anda   </b><br />
		<?php echo($data->nama_soal_1) ;  ?> : <?php echo($jawab->poin_1) ;  ?>
		<?php if(!empty($data->nama_soal_2)){?>  , <?php echo($data->nama_soal_2) ;  ?> : <?php echo($jawab->poin_2) ;  }?>
		<?php if(!empty($data->nama_soal_3)){?>  , <?php echo($data->nama_soal_3) ;  ?> : <?php echo($jawab->poin_3) ; } ?> 
		</h5> 
	</div>	  
	
	
	<?php } else {?> 
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  " style="padding:20px;"align="center"> 
		<h5 style="font-size : 20px; font-weight : bold;"> 
		JANGAN MENYERAH! Kesuksesan adalah Kegagalan yang Tertunda! Buktikan dirimu di TRY OUT lainnya ya!   <a  style="font-size : inherit !important" href="?show=soal_saya"> Klik disini  </a> 
		<br> 		<br />
		<b> Total Poin Anda   </b><br />
		 
		<?php echo($data->nama_soal_1) ;  ?> : <?php echo($jawab->poin_1) ;  ?>
		<?php if(!empty($data->nama_soal_2)){?>  , <?php echo($data->nama_soal_2) ;  ?> : <?php echo($jawab->poin_2) ;  }?>
		<?php if(!empty($data->nama_soal_3)){?>  , <?php echo($data->nama_soal_3) ;  ?> : <?php echo($jawab->poin_3) ; } ?> 
		</h5>
		<div class=""  style="padding:10px; " >
		<p> Jangan Menyerah ! Kegagalan adalah kesuksesaan yang tertunda . Teruslah berlatih demi masa depan kamu dengan fitur yang kami sediakan di bawah ini </p> 
		<div class=""  style="width : 300px; margin-left : auto; margin-right : auto;" >
		<ol> 
			<li><a class="" href="?show=soal_saya&kategori=<?php echo($user->kategori_tryout) ;  ?>">Coba Tryout Lain </a> </li>
			<li><a class="" href="?show=buku" >Beli Buku PKN STAN </a> </li>
			<li><a class="" href="?show=group">Gabung Group Diskusi </a> </li>
		</ol>
		</div>
		</div> 
	</div>	
	
	
	
	<?php } ?>
	
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  ">
	<h5 style="padding:10px; font-size : 20px;"> Analysis Soal </h5> 
		
	<div class="row justify-content-center">
	
		<div class="col	">
			<div class="card" style="border-radius:10px; border:1px solid gainsboro  ">
			<div class="card-header" style="font-size : 16px;  font-weight : 500">
				<?php echo($data->nama_soal_1) ;  ?>
			</div>
			<div class="card-block" align="center">
				Soal TWK : <?php echo($data->soal_1) ;  ?> Soal <br />  
				Waktu : <?php echo($data->waktu_1) ;  ?> Menit  <br />
				Poin Minimal : <?php echo($data->lulus_1) ;  ?> Poin <br />
				Poin Anda : <?php echo($jawab->poin_1) ;  ?>  Poin <br />
				Kelulusan : <?php echo($jawab->lulus_1) ;  ?>
				</div>
			</div>
		</div>
		
		
		<?php if(!empty($data->nama_soal_2)){?> 
		<div class="col	">
			<div class="card" style="border-radius:10px; border:1px solid gainsboro  ">
			<div class="card-header" style="font-size : 16px;  font-weight : 500">
					<?php echo($data->nama_soal_2) ;  ?>
			</div>
			<div class="card-block" align="center">
				Soal TIU : <?php echo($data->soal_2) ;  ?> Soal <br />  
				Waktu : <?php echo($data->waktu_2) ;  ?> Menit  <br />
				Poin Minimal : <?php echo($data->lulus_2) ;  ?> Poin <br />
				Poin Anda : <?php echo($jawab->poin_2) ;  ?>  Poin <br />
				Kelulusan : <?php echo($jawab->lulus_2) ;  ?>
				</div>
			</div>
		</div>
		<?php }  ?>
		
		<?php if(!empty($data->nama_soal_3)){?> 
		<div class="col	">
			<div class="card" style="border-radius:10px; border:1px solid gainsboro  ">
			<div class="card-header" style="font-size : 16px;  font-weight : 500">
				 	<?php echo($data->nama_soal_3) ;  ?>
			</div>
			<div class="card-block" align="center">
				Soal TKP : <?php echo($data->soal_3) ;  ?> Soal <br />  
				Waktu : <?php echo($data->waktu_3) ;  ?> Menit  <br />
				Poin Minimal : <?php echo($data->lulus_3) ;  ?> Poin <br />
				Poin Anda : <?php echo($jawab->poin_3) ;  ?>  Poin <br />
				Kelulusan : <?php echo($jawab->lulus_3) ;  ?>
				</div>
			</div>
		</div>
		<?php } ?>
		
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  " style="padding:10px;" align="center">
		<a class="btn btn-success mt-2" href="?show=soal_saya&kategori=<?php echo($user->kategori_tryout) ;  ?>" > Cari Soal Lain</a> 
		<a class="btn btn-primary mt-2" href="?show=soal_start&id=<?php echo($id_soal) ;  ?>" > Coba Lagi </a> <br /> 
		   				
		<a class="btn btn-dark mt-2" href="?show=buku" > Beli Buku </a> 				
		<a class="btn btn-dark mt-2" href="?show=bimbel" > Ikut Bimbel </a> 				
		<a class="btn btn-dark mt-2" href="?show=group" > Grup Diskusi </a> 				
		</div>
	</div>
	</div>
	
	</div>
</div> 

 
 
 
 
<?php } ?>
<?php } ?>


