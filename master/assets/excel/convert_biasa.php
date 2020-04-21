<?php

	require('php-excel-reader/excel_reader2.php');
	require('SpreadsheetReader.php');
	
	$twk = "file_soal/".$soal;
	
	try
	{
		$s1 = new SpreadsheetReader($twk);
		$soal = $s1->Sheets();
		 
	}
	
	
	catch (Exception $E)
	{
		echo $E -> getMessage();
	}
	
	
?>
