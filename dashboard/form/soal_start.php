<?php 
if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 

$check_data = select($pdo,"SELECT * FROM `data_soal` WHERE `id`='$id' "); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
$data = fetch_obj($check_data); 
$kode = $data->kode_soal;



if(isset($_POST['mulai'])){
	$password_soal = in($_POST['password_soal']);
	if($data->password == $password_soal){
	$check_jawab = select($pdo,"SELECT * FROM `user_jawab` WHERE `user_id`='$user_id' and `selesai`='Belum' and `kode_soal`='$kode' "); 
	$check_jawab->execute();
	$row_jawab = row($check_jawab);
	if($row_jawab <= 0){
		$nama = $user->user_id;
		$judul = $data->judul;
		$pisahkan = $data->pisah;
		
		 
		$w1 = $data->waktu_1;
		$w2 = $data->waktu_2;
		$w3 = $data->waktu_3;
	
		if($pisahkan == "Yes"){
			$start1 = date("Y-m-d H:i:s",mktime(date('H'), date('i'), date('s'), date("m"), date("d"), date("Y")));
			$start2 = date("Y-m-d H:i:s",mktime(date('H'), date('i')+$w1, date('s'), date("m"), date("d"), date("Y")));
			
			eksekusi($pdo,"INSERT INTO `user_jawab`
			(`user_id`, `nama`, `judul`, `kode_soal`, `start`, `stop`, `date`,`posisi`) VALUES 
			('$user_id','$nama','$judul','$kode',  '$start1','$start2','$date','1')");
			
		} else {
		$start1 = date("Y-m-d H:i:s",mktime(date('H'), date('i'), date('s'), date("m"), date("d"), date("Y")));
		$start2 = date("Y-m-d H:i:s",mktime(date('H'), date('i')+$w1+$w2+$w3, date('s'), date("m"), date("d"), date("Y")));
	
			eksekusi($pdo,"INSERT INTO `user_jawab`
			(`user_id`, `nama`, `judul`, `kode_soal`, `start`, `stop`, `date`) VALUES 
			('$user_id','$nama','$judul','$kode',  '$start1','$start2','$date')");
		}
		$go = "1";
		
		
		 
	} else {
		$j = fetch_obj($check_jawab); 
		$go = $j->posisi;
	}
	
		if($pisahkan == "Yes"){ ?> 
		<script>  document.location.href="?show=start_tryout_p1&kode=<?php echo($kode) ;  ?>";     </script>  
		<?php 	
		} else {
		?> 
		<script>  document.location.href="?show=start_tryout&kode=<?php echo($kode) ;  ?>";   </script>  
		<?php 
		}
		
	} else {
		$alert = "danger";
		$respon = "Maaf. Password yang anda masukkan salah";
	}
}
?>





<div class="card" style="border-radius:10px; border:1px solid gainsboro  ">
<div class="card-header"><h5>Tryout - <?php echo($data->judul) ;  ?></h5></div>
 

<div class="card-block" align="center">
	
	
	<h5> Perhatikan . Saat Soal Dimulai Anda Dilarang keluar dari form atau anda akan di nyatakan tidak lulus sebagaimana saat ujian <?php echo(strtoupper($data->kategori)) ;  ?>  <br />
	Ada Baiknya Anda Mendownload Kisi Kisi Soal Terlebih Dahulu Jika Ada  </h5> 
	
	<?php if($data->pisah == "Yes"){?> 
		<h4> Tryout Ini Memiliki Waktu Masing Masing (Terpisah)</h4> 
	<?php } else {?> 
		<h4> Tryout Ini Menggunakan Waktu Total (Tidak Terpisah)</h4>  
	<?php } ?>
	<h5> </h5> 
	
	<br />
	
	<?php 
		$user_date = $user->batas_login;
		$date = date('Y-m-d');
		if($user_date >= $date){
		?>
	
	<div class="row justify-content-center">
		<?php if(!empty($data->nama_soal_1)){ ?> 
		<div class="col " style="padding:10px !Important">
		<div class="" style="background: #f9f9f9; padding:10px; border:1px solid gainsboro; border-radius:10px;   ">
			<b> Soal <?php echo($data->nama_soal_1) ;  ?>  </b><br />
			Total Soal : <?php echo($data->soal_1) ;  ?>  Soal <br>
			Waktu : <?php echo($data->waktu_1) ;  ?>  Menit <br>
			Poin Grade : <?php echo($data->lulus_1) ;  ?> Poin <br> 
			<?php 

			if($data->nama_soal_1 == "TWK"){echo(" Penilaian :  Benar +5, Salah 0, Tidak Menjawab 0") ; } else   
			if($data->nama_soal_1 == "TIU"){echo(" Penilaian : Benar +5, Salah 0, Tidak Menjawab 0") ; } else   
			if($data->nama_soal_1 == "TKP"){echo(" Penilaian : Nilai Terendah +1, Nilai Tertinggi +5, Tidak Menjawab 0") ; } else   
			if($data->nama_soal_1 == "TPA"){echo(" Penilaian : Benar +4, Salah -1, Tidak Menjawab 0") ; } else   
			if($data->nama_soal_1 == "TBI"){echo(" Penilaian : Benar +4, Salah -1, Tidak Menjawab 0") ; } 
			?>
		</div>
		</div>
		<?php }  ?>
		
		<?php if(!empty($data->soal_2)){ ?> 
		<div class="col " style="padding:10px !Important">
		<div class="" style="background: #f9f9f9; padding:10px;  border:1px solid gainsboro; border-radius:10px;">
			<b>Soal <?php echo($data->nama_soal_2) ;  ?>  </b><br />
			Total Soal : <?php echo($data->soal_2) ;  ?> Soal <br>
			Waktu : <?php echo($data->waktu_2) ;  ?> Menit  <br>
			Poin Grade : <?php echo($data->lulus_2) ;  ?> Poin <br>
			<?php 

			if($data->nama_soal_2 == "TWK"){echo(" Penilaian :  Benar +5, Salah 0, Tidak Menjawab 0") ; } else   
			if($data->nama_soal_2 == "TIU"){echo(" Penilaian : Benar +5, Salah 0, Tidak Menjawab 0") ; } else   
			if($data->nama_soal_2 == "TKP"){echo(" Penilaian : Nilai Terendah +1, Nilai Tertinggi +5, Tidak Menjawab 0") ; } else   
			if($data->nama_soal_2 == "TPA"){echo(" Penilaian : Benar +4, Salah -1, Tidak Menjawab 0") ; } else   
			if($data->nama_soal_2 == "TBI"){echo(" Penilaian : Benar +4, Salah -1, Tidak Menjawab 0") ; } 
			
			
			?>			
		</div>
		</div>
		<?php }  ?>
		<?php if(!empty($data->soal_3)){ ?> 
		<div class="col " style="padding:10px !Important">
		<div class="" style="background: #f9f9f9; padding:10px;  border:1px solid gainsboro; border-radius:10px;">
			<b>Soal <?php echo($data->nama_soal_3) ;  ?> </b> <br />
			Total Soal : <?php echo($data->soal_3) ;  ?> Soal <br>
			Waktu : <?php echo($data->waktu_3) ;  ?> Menit <br>
			Poin Grade : <?php echo($data->lulus_3) ;  ?> Poin <br> 
			<?php 

			if($data->nama_soal_3 == "TWK"){echo(" Penilaian :  Benar +5, Salah 0, Tidak Menjawab 0") ; } else   
			if($data->nama_soal_3 == "TIU"){echo(" Penilaian : Benar +5, Salah 0, Tidak Menjawab 0") ; } else   
			if($data->nama_soal_3 == "TKP"){echo(" Penilaian : Nilai Terendah +1, Nilai Tertinggi +5, Tidak Menjawab 0") ; } else   
			if($data->nama_soal_3 == "TPA"){echo(" Penilaian : Benar +4, Salah -1, Tidak Menjawab 0") ; } else   
			if($data->nama_soal_3 == "TBI"){echo(" Penilaian : Benar +4, Salah -1, Tidak Menjawab 0") ; } 
			
			?>
		</div>
		</div>
		<?php }  ?>
		
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-2 ">
			<h5> SELAMAT MENGERJAKAN PEJUANG <?php echo(strtoupper($data->kategori)) ;  ?> !!!
		</h5> 
			
		</div>
	</div>
	
	<br />
	<form method="post" enctype="multipart/form-data"> 
	<a class="btn btn-primary" href="?show=soal_saya" > Kembali Ke List Soal </a> <br />
	<br />
	<span> Masukkan Password Soal </span> 
	<input type="password" required class="form-control"  style="width : 400px; max-width:100%;"  name="password_soal" value="" placeholder="Masukkan Password Soal"    />
	<br />
	
	<button name="mulai" type="submit" class="btn btn-success"  > Mulai Sekarang</button> 
	</form>
	
	<br />
	<br />
		<?php } else {?> 
		 <h4> <b> Maaf. Batas Waktu Anda Untuk memulai tryout telah habis . </b> <br />
		 Batas Waktu Anda <?php echo($user->batas_login) ;  ?>  </h4> 
		<?php  } ?>
	
</div>
</div>




<?php } else {?> <script>  document.location.href="?show=soal_saya&kategori=<?php echo($user->kategori_tryout) ;  ?>";   </script>   <?php } ?>
<?php } else {?> <script>  document.location.href="?show=soal_saya&kategori=<?php echo($user->kategori_tryout) ;  ?>";   </script>   <?php } ?>


