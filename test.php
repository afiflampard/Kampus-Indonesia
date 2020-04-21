<?php 
require_once("a_con.php");

$check_k = select($pdo,"SELECT * FROM `quipper_kategori`  "); 
$check_k->execute();
$row_k = row($check_k);
if($row_k >= 1){
	while($k = fetch_obj($check_k)){
		
		$kategori = $k->kategori;
		$materi = $k->materi;
		
		for ($i = 1; $i <= 10; $i++) {
		$judul = "Contoh Materi ".$i;
		eksekusi($pdo,"INSERT INTO `quipper_video` (`id`, `judul`, `materi`, `kategori`, `video`, `keterangan`, `materi_download`, `kode_soal`) VALUES (NULL, '$judul', '$materi', '$kategori', '181123084939videoplayback.mp4', '<p>Hello Guy</p>
<p>asdkjasdk</p>
<p>aksjd</p>', '181123cara_kerja.xls', 'MateriVideo-20181123084939');");
		}
		
		
	}
}  

?>