<?php

	require('php-excel-reader/excel_reader2.php');
	require('SpreadsheetReader.php');
	
	if(!empty($soal_1)){ $sx1 = "file_soal/".$soal_1 ; try { $ss1 = new SpreadsheetReader($sx1); $data_soal_1 = $ss1->Sheets(); } catch (Exception $E) { echo $E -> getMessage(); } }
	
	
?>
