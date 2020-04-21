<?php 

		
		$total_1 = 0;
		$total_2 = 0;
		$total_3 = 0;
		
		$nomor1 = 1;
		$nomor2 = 1;
		$nomor3 = 1;
		
		if(!empty($data_soal_1)){ 
		foreach ($data_soal_1 as $Index => $Name){
		$ss1->ChangeSheet($Index);
			foreach ($ss1 as $Key => $row)
			{
				if($total_1 >= 1){
				if(!empty($row[0])){
				$soal = $row[0];
				$soal = str_replace("'",'"',$soal); 
				
				$p1 = "";
				$p2 = "";
				$p3= "";
				$p4 = "";
				$p5 = "";
				
				$n1 = 0;
				$n2 = 0;
				$n3= 0;
				$n4 = 0;
				$n5 = 0;
				$pembahasan = "";
				$video = "";
				
				if(!empty($row[1])){ $p1 = str_replace("'",'"',$row[1]); } 
				if(!empty($row[2])){ $p2 = str_replace("'",'"',$row[2]); } 
				if(!empty($row[3])){ $p3 = str_replace("'",'"',$row[3]); } 
				if(!empty($row[4])){ $p4 = str_replace("'",'"',$row[4]); } 
				if(!empty($row[5])){ $p5 = str_replace("'",'"',$row[5]); } 
				
				if(!empty($row[6])){ $n1 = $row[6]; } 
				if(!empty($row[7])){ $n2 = $row[7]; } 
				if(!empty($row[8])){ $n3 = $row[8]; } 
				if(!empty($row[9])){ $n4 = $row[9]; } 
				if(!empty($row[10])){$n5 = $row[10]; } 
				
				if(!empty($row[11])){$pembahasan = str_replace("'",'"',$row[11]); } 
				if(!empty($row[12])){$video = $row[12]; } 
				$p1 = str_replace("'",'"',$p1);  $p2 = str_replace("'",'"',$p2);   $p3 = str_replace("'",'"',$p3);  
				$p4 = str_replace("'",'"',$p4); 
				$p5 = str_replace("'",'"',$p5); 
				
				$pembahasan = str_replace("'",'"',$pembahasan);
				$video = str_replace("'",'"',$video);
				
				if(empty($n1)){$n1 = 0;} 
				if(empty($n2)){$n2 = 0;} 
				if(empty($n3)){$n3 = 0;} 
				if(empty($n4)){$n4 = 0;} 
				if(empty($n5)){$n5 = 0;} 
				
				
				if((!empty($p1)) and (!empty($soal))){
				eksekusi($pdo,"INSERT INTO `data_jawaban`
				(`nomor`,`kode_soal`,`jenis_soal`, `soal`, `pilihan_a`, `pilihan_b`, `pilihan_c`, `pilihan_d`, `pilihan_e`, `nilai_a`, `nilai_b`, `nilai_c`, `nilai_d`,`nilai_e`,`pembahasan`,`video`) VALUES 
				('$nomor1','$kode','Soal 1','$soal','$p1','$p2','$p3','$p4','$p5','$n1','$n2','$n3','$n4','$n5','$pembahasan','$video')");
				
				$nomor1++;
				}
				}
				}
				$total_1++;
				
			}
		}
		}
		
		
		
		if(!empty($data_soal_2)){
		foreach ($data_soal_2 as $Index => $Name){
		$ss2->ChangeSheet($Index);
			foreach ($ss2 as $Key => $row)
			{
				
				if($total_2 >= 1){
				if(!empty($row[0])){
				$soal = $row[0];
				$soal = str_replace("'",'"',$soal);				
				$soal = str_replace("'",'"',$soal);

				
				
				$p1 = "";
				$p2 = "";
				$p3= "";
				$p4 = "";
				$p5 = "";
				
				$n1 = 0;
				$n2 = 0;
				$n3= 0;
				$n4 = 0; 
				$n5 = 0;
				$pembahasan = "";
				$video = "";
				if(!empty($row[1])){ $p1 = str_replace("'",'"',$row[1]); } 
				if(!empty($row[2])){ $p2 = str_replace("'",'"',$row[2]); } 
				if(!empty($row[3])){ $p3 = str_replace("'",'"',$row[3]); } 
				if(!empty($row[4])){ $p4 = str_replace("'",'"',$row[4]); } 
				if(!empty($row[5])){ $p5 = str_replace("'",'"',$row[5]); } 
				
				if(!empty($row[6])){ $n1 = $row[6]; } 
				if(!empty($row[7])){ $n2 = $row[7]; } 
				if(!empty($row[8])){ $n3 = $row[8]; } 
				if(!empty($row[9])){ $n4 = $row[9]; } 
				if(!empty($row[10])){$n5 = $row[10]; } 
				$p1 = str_replace("'",'"',$p1);  $p2 = str_replace("'",'"',$p2);   $p3 = str_replace("'",'"',$p3);  
				$p4 = str_replace("'",'"',$p4); 
				$p5 = str_replace("'",'"',$p5); 
				
				if(!empty($row[11])){$pembahasan = str_replace("'",'"',$row[11]); } 
				if(!empty($row[12])){$video = $row[12]; } 
				
				$pembahasan = str_replace("'",'"',$pembahasan);
				$video = str_replace("'",'"',$video);
				
				if(empty($n1)){$n1 = 0;} 
				if(empty($n2)){$n2 = 0;} 
				if(empty($n3)){$n3 = 0;} 
				if(empty($n4)){$n4 = 0;} 
				if(empty($n5)){$n5 = 0;} 
				
				
				if((!empty($p1)) and (!empty($soal))){
				eksekusi($pdo,"INSERT INTO `data_jawaban`
				(`nomor`,`kode_soal`,`jenis_soal`, `soal`, `pilihan_a`, `pilihan_b`, `pilihan_c`, `pilihan_d`, `pilihan_e`, `nilai_a`, `nilai_b`, `nilai_c`, `nilai_d`,`nilai_e`,`pembahasan`,`video`) VALUES 
				('$nomor2','$kode','Soal 2','$soal','$p1','$p2','$p3','$p4','$p5','$n1','$n2','$n3','$n4','$n5','$pembahasan','$video')");
				
				$nomor2++; 
				}
				}
				
				}  
				
				$total_2++;
			}
		}
		}
		
		
		
		if(!empty($data_soal_3)){
		foreach ($data_soal_3 as $Index => $Name){
		$ss3->ChangeSheet($Index);
			foreach ($ss3 as $Key => $row)
			{
				if($total_3 >= 1){
				if(!empty($row[0])){
				$soal = $row[0];
				$soal = str_replace("'",'"',$soal); 				
				$soal = str_replace("'",'"',$soal);

				
				$p1 = "";
				$p2 = "";
				$p3= "";
				$p4 = "";
				$p5 = "";
				
				$n1 = 0;
				$n2 = 0;
				$n3= 0;
				$n4 = 0;
				$n5 = 0;
				$pembahasan = "";
				$video = "";
				if(!empty($row[1])){ $p1 = str_replace("'",'"',$row[1]); } 
				if(!empty($row[2])){ $p2 = str_replace("'",'"',$row[2]); } 
				if(!empty($row[3])){ $p3 = str_replace("'",'"',$row[3]); } 
				if(!empty($row[4])){ $p4 = str_replace("'",'"',$row[4]); } 
				if(!empty($row[5])){ $p5 = str_replace("'",'"',$row[5]); } 
				$p1 = str_replace("'",'"',$p1);  $p2 = str_replace("'",'"',$p2);   $p3 = str_replace("'",'"',$p3);  
				$p4 = str_replace("'",'"',$p4); 
				$p5 = str_replace("'",'"',$p5); 
				
				if(!empty($row[6])){ $n1 = $row[6]; } 
				if(!empty($row[7])){ $n2 = $row[7]; } 
				if(!empty($row[8])){ $n3 = $row[8]; } 
				if(!empty($row[9])){ $n4 = $row[9]; } 
				if(!empty($row[10])){$n5 = $row[10]; } 
				
				if(!empty($row[11])){$pembahasan = str_replace("'",'"',$row[11]); } 
				if(!empty($row[12])){$video = $row[12]; } 
				
				$pembahasan = str_replace("'",'"',$pembahasan);
				$video = str_replace("'",'"',$video);
				
				if(empty($n1)){$n1 = 0;} 
				if(empty($n2)){$n2 = 0;} 
				if(empty($n3)){$n3 = 0;} 
				if(empty($n4)){$n4 = 0;} 
				if(empty($n5)){$n5 = 0;} 
				
				
				if((!empty($p1)) and (!empty($soal))){
				eksekusi($pdo,"INSERT INTO `data_jawaban`
				(`nomor`,`kode_soal`,`jenis_soal`, `soal`, `pilihan_a`, `pilihan_b`, `pilihan_c`, `pilihan_d`, `pilihan_e`, `nilai_a`, `nilai_b`, `nilai_c`, `nilai_d`,`nilai_e`,`pembahasan`,`video`) VALUES 
				('$nomor3','$kode','Soal 3','$soal','$p1','$p2','$p3','$p4','$p5','$n1','$n2','$n3','$n4','$n5','$pembahasan','$video')");
				$nomor3++; 
				}
				}
				} 
				$total_3++;
				
			}
		}
		}
		
		
?>

