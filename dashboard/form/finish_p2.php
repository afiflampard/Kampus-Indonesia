<?php 
if(!empty($_GET['kode'])){ 
$kode = in($_GET['kode']); 

$check_data = select($pdo,"SELECT * FROM `data_soal` WHERE `kode_soal`='$kode' LIMIT 1"); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
$data =fetch_obj($check_data); 
$kode = $data->kode_soal;
$id = $data->id;
$w2 = $data->waktu_2;
$judul_soal = $data->judul;
$_SESSION['jawaban_'.$kode."_1"] = "";


$nama_soal_1 = $data->nama_soal_1;
$nama_soal_2 = $data->nama_soal_2;
$mypoin = $master->poin_uji;



$check_jawab = select($pdo,"SELECT * FROM `user_jawab` WHERE `user_id`='$user_id' and `selesai`='Belum' and `kode_soal`='$kode' "); 
$check_jawab->execute();
$row_jawab = row($check_jawab);
if($row_jawab >= 1){
$jawab = fetch_obj($check_jawab); 
$id_jawab = $jawab->id;
$posisi = $jawab->posisi;

if($posisi <> "Finish"){
?> 
<script>  document.location.href="?show=start_tryout_p1&kode=<?php echo($kode) ;  ?>";   </script>  
<?php 
}



if(!empty($_SESSION['jawaban_1'])){ 	$jawaban_1 = $_SESSION['jawaban_1']; } 



$check_1 = array(); 
$benar_1=0;
$salah_1=0;
$kosong_1=0;

$poin_1 = 0;
$lulus_1 = $data->lulus_2;




$check_soal = select($pdo,"SELECT `kode_soal`,`jenis_soal`,`id`,`nomor`,`nilai_a` AS `a` ,`nilai_b` AS `b` ,`nilai_c` AS `c` ,`nilai_d` AS `d` ,`nilai_e` AS `e` FROM `data_jawaban` WHERE `kode_soal`='$kode' and `jenis_soal`='Soal 2' ORDER BY `nomor` ASC "); 
$check_soal->execute();
$row_soal = row($check_soal);
if($row_soal >= 1){
	while($j = fetch_obj($check_soal)){
		$jx = $jawaban_1[$j->nomor];
		if(!empty($jx)){
			$check_1[$j->nomor] = $j->$jx; 
			if($j->$jx >= 1){
				$benar_1++;
			} else {
				$salah_1++;
			}
			
			$poin_1 += $j->$jx;
			
		} else {
			$check_1[$j->nomor] = 0;
			$kosong_1++;
		}
		
	$kode_soal = $j->kode_soal;
	$jenis_soal = $j->jenis_soal;
	$nomor = $j->nomor;
	}
}  




$total_poin = $jawab->total_poin; 
$total_poin = $total_poin + $poin_1 ; 
$kelulusan = $jawab->kelulusan ;



$gagal = "";


$kelulusan_1 = $jawab->lulus_1;
$keterangan_poin = " $nama_soal_1 = ".$jawab->poin_1." (".$jawab->lulus_1.") "; 
$kodex = date('ymdhis').rand(0,99);





if(($data->harga >= 1) and ($data->mini == "No")){
$check_old = select($pdo,"SELECT * FROM statistik_soal WHERE kode='$kodex' and jenis_soal='$nama_soal_2' and user_id='$user_id' "); 
$check_old->execute();
$row_old = row($check_old);
if($row_old <= 0){
eksekusi($pdo,"INSERT INTO `statistik_soal`
(`date`, `nama_soal`, `jenis_soal`, `total_poin`, `user_id`,`kode`) VALUES 
('$date','$judul_soal','$nama_soal_2','$poin_1','$user_id','$kodex') ");
}
}



if($poin_1 >= $lulus_1){


$kelulusan_2 = "Lulus"; $keterangan_poin .= " $nama_soal_1 = $poin_1 (Lulus) "; 
} else {$kelulusan = "Tidak Lulus ";  $kelulusan_2 = "Tidak Lulus"; $keterangan_poin .= " $nama_soal_1 = $poin_1 (Tidak Lulus) "; }






 







 



if($kelulusan == "Lulus"){
$mypoin += $master->poin_uji_lulus;

$keterangan = "Selamat. Anda Lulus Pada Ujian Ini Dengan Total Poin ".$total_poin." . Anda Mendapatkan Tambahan Mypoin Sebesar $mypoin ";
eksekusi($pdo,"UPDATE `user` SET `total_lulus`=`total_lulus`+1 WHERE `user_id`='$user_id'  ");

} else {
$keterangan = "Maaf. Anda Gagal Pada Ujian Ini . Total Poin Anda : ".$total_poin;
}


eksekusi($pdo,"UPDATE `user_jawab` SET   `poin_2`='$poin_1', `lulus_2`='$kelulusan_2', 
`total_poin`='$total_poin', `kelulusan`='$kelulusan', `selesai`='Selesai', 
`benar_2`='$benar_1', `salah_2`='$salah_1', `kosong_2`='$kosong_1', 
`keterangan`='$keterangan'  WHERE `id`='$id_jawab' ");









$nama = $user->nama;
$jurusan = $user->jurusan;
$kategori = $data->kategori;




eksekusi($pdo,"INSERT INTO `ranking`
(`keterangan_poin`,`nama`, `user_id`, `total_poin`, `judul_soal`, `kode_soal`,`kategori`,`jurusan`,`lulus`) VALUES 
('$keterangan_poin','$nama','$user_id','$total_poin','$judul_soal','$kode','$kategori','$jurusan','$kelulusan') ");	




$check_ranking = select($pdo,"SELECT * FROM `ranking` WHERE `kode_soal`='$kode'  ORDER BY `total_poin` DESC,`total_soal` DESC  "); 
$check_ranking->execute();
$row_ranking = row($check_ranking);
if($row_ranking >= 1){
	$x = 1;
	while($r = fetch_obj($check_ranking)){
		$id = $r->id;
		eksekusi($pdo,"UPDATE `ranking` SET `ranking`='$x' WHERE `id`='$id'   ");
		$x++;
	}
}



?> 
<script>  document.location.href="?show=finish_data&id=<?php echo($id_jawab) ;  ?>";   </script>  
<?php 



} else {?> <script>  document.location.href="?show=soal_saya&kategori=<?php echo($user->kategori_tryout) ;  ?>";   </script>   <?php } ?>
<?php } else {?> <script>  document.location.href="?show=soal_saya&kategori=<?php echo($user->kategori_tryout) ;  ?>";   </script>   <?php } ?>
<?php } else {?> <script>  document.location.href="?show=soal_saya&kategori=<?php echo($user->kategori_tryout) ;  ?>";   </script>   <?php } ?>
