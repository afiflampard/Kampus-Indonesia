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
$w1 = $data->waktu_1;
$judul_soal = $data->judul;
$nama_soal_1 = $data->nama_soal_1;

$_SESSION['jawaban_'.$kode.'_1'] = "";



$check_jawab = select($pdo,"SELECT * FROM `user_jawab` WHERE `user_id`='$user_id' and `selesai`='Belum' and `kode_soal`='$kode' "); 
$check_jawab->execute();
$row_jawab = row($check_jawab);
if($row_jawab >= 1){
$jawab = fetch_obj($check_jawab); 
$id_jawab = $jawab->id;
$posisi = $jawab->posisi;

if($posisi <> "2"){
?> 
<script>  document.location.href="?show=start_tryout_p1&kode=<?php echo($kode) ;  ?>";   </script>  
<?php 
} else {



if(!empty($_SESSION['jawaban_1'])){ 	$jawaban_1 = $_SESSION['jawaban_1']; } 
$check_1 = array();


$benar_1=0;
$benar_2=0;
$benar_3=0;
$poin_1 = 0;
$lulus_1 = $data->lulus_1;
$kosong_1 = 0;
$salah_1 = 0;



$check_soal = select($pdo,"SELECT `kode_soal`,`jenis_soal`,`id`,`nomor`,`nilai_a` AS `a` ,`nilai_b` AS `b` ,`nilai_c` AS `c` ,`nilai_d` AS `d` ,`nilai_e` AS `e` FROM `data_jawaban` WHERE `kode_soal`='$kode' and `jenis_soal`='Soal 1' ORDER BY `nomor` ASC "); 
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






 

$lulus_1 = $data->lulus_1;
$lulus_2 = $data->lulus_2;


$total_poin = $poin_1 ;
$total_salah = $salah_1 ;

$kelulusan = "Lulus";
$gagal = "";


$keterangan_poin = "";
$kodex = date('ymdhis').rand(0,99);


if(($data->harga >= 1) and ($data->mini == "No")){
$check_old = select($pdo,"SELECT * FROM statistik_soal WHERE kode='$kodex' and jenis_soal='$nama_soal_1' and user_id='$user_id' "); 
$check_old->execute();
$row_old = row($check_old);
if($row_old <= 0){
eksekusi($pdo,"INSERT INTO `statistik_soal`
(`date`, `nama_soal`, `jenis_soal`, `total_poin`, `user_id`,`kode`) VALUES 
('$date','$judul_soal','$nama_soal_1','$poin_1','$user_id','$kodex') ");
}
}


if($poin_1 >= $lulus_1){



$kelulusan_1 = "Lulus"; $keterangan_poin .= " $nama_soal_1 = $poin_1 (Lulus) "; 
} else {$kelulusan = "Tidak Lulus "; $gagal .= $data->nama_soal_1; $kelulusan_1 = "Tidak Lulus"; $keterangan_poin .= " $nama_soal_1 = $poin_1 (Tidak Lulus) "; }





eksekusi($pdo,"UPDATE `user_jawab` SET `poin_1`='$poin_1',  `lulus_1`='$kelulusan_1',  
`total_poin`='$total_poin', `kelulusan`='$kelulusan',  
`benar_1`='$benar_1', `kosong_1`='$kosong_1', `salah_1`='$salah_1'  WHERE `id`='$id_jawab' ");




$nama = $user->nama;
$jurusan = $user->jurusan;
$group = $user->group;
$kemenkeu = $user->kemenkeu;
$sekolah = $user->sekolah;
$kategori = $data->kategori;

?> 
<script>  document.location.href="?show=start_tryout_p1&kode=<?php echo($kode) ;  ?>";   </script>  
<?php 
} 



} else {?> <script>  document.location.href="?show=soal_saya&kategori=<?php echo($user->kategori_tryout) ;  ?>";   </script>   <?php } ?>
<?php } else {?> <script>  document.location.href="?show=soal_saya&kategori=<?php echo($user->kategori_tryout) ;  ?>";   </script>   <?php } ?>
<?php } else {?> <script>  document.location.href="?show=soal_saya&kategori=<?php echo($user->kategori_tryout) ;  ?>";   </script>   <?php } ?>



