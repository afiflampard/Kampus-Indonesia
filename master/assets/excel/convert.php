<?php

	require('php-excel-reader/excel_reader2.php');
	require('SpreadsheetReader.php');
	
	if(!empty($soal_1)){ $sx1 = "file_soal/".$soal_1 ; try { $ss1 = new SpreadsheetReader($sx1); $data_soal_1 = $ss1->Sheets(); } catch (Exception $E) { echo $E -> getMessage(); } }
	if(!empty($soal_2)){ $sx2 = "file_soal/".$soal_2 ; try { $ss2 = new SpreadsheetReader($sx2); $data_soal_2 = $ss2->Sheets(); } catch (Exception $E) { echo $E -> getMessage(); } }
	if(!empty($soal_3)){ $sx3 = "file_soal/".$soal_3 ; try { $ss3 = new SpreadsheetReader($sx3); $data_soal_3 = $ss3->Sheets(); } catch (Exception $E) { echo $E -> getMessage(); } }
	
	
	
?>
