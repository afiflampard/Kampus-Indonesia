<?php
if(empty($_GET['iDisplayStart'])){
	$_GET['iDisplayStart'] = 0;
} 

if(empty($_GET['iDisplayLength'])){
	$_GET['iDisplayLength'] = 10;
} 




	$sLimit = "";
	if ( isset( $_GET['iDisplayStart'] ) && $_GET['iDisplayLength'] != '-1' )
	{
		
		$sLimit = "LIMIT ".in( $_GET['iDisplayStart'] ).", ".$_GET['iDisplayLength'];
		
	} else {
		if(!empty($_GET['iDisplayLength'])){
		$sLimit = "LIMIT ".$_GET['iDisplayLength'];
		} else {
		$sLimit = "LIMIT 10";
		}
	}
	
	
	
	$sOrder = "ORDER BY ".$ordered;
	
	if (isset( $_GET['iSortCol_0'] ))
	{
		
		
		$sOrder = "ORDER BY ";
		for ( $i=0 ; $i<intval( $_GET['iSortingCols'] ) ; $i++ )
		{
			if(!empty($_GET[ 'bSortable_'.intval($_GET['iSortCol_'.$i]) ])){
			if ( $_GET[ 'bSortable_'.intval($_GET['iSortCol_'.$i]) ] == "true" )
			{
				
				if($_GET['iSortCol_0'] >= 1){		
				$sOrder .= $aColumns[ intval( $_GET['iSortCol_'.$i] ) ]."
				 	".in( $_GET['sSortDir_'.$i] ) .", ";
				} else {
					$sOrder = "ORDER BY  $sIndexColumn ".in($_GET['sSortDir_'.$i]).", ";
				}
			}
			}
		}
		
		
		$sOrder = substr_replace( $sOrder, "", -2 );
		if ( $sOrder == "ORDER BY" )
		{
			$sOrder = "ORDER BY  ";
		}
	}
	
	
	
	
	
	$sWhere = "";
	if(!empty($_GET['sSearch'])){
	if ( $_GET['sSearch'] != "" )
	{
		$sWhere = "WHERE (";
		for ( $i=0 ; $i<count($aColumns) ; $i++ )
		{
			$sWhere .= $aColumns[$i]." LIKE '%".in( $_GET['sSearch'] )."%' OR ";
		}
		$sWhere = substr_replace( $sWhere, "", -3 );
		$sWhere .= ')';
	}
	
	for ( $i=0 ; $i<count($aColumns) ; $i++ )
	{
		if(!empty($_GET['bSearchable_'.$i])){
		if ( $_GET['bSearchable_'.$i] == "true" && $_GET['sSearch_'.$i] != '' )
		{
			if(!empty($_GET['sSearch_'.$i])){
			
			if ( $sWhere == "" )
			{
				$sWhere = "WHERE ";
			}
			else
			{
				$sWhere .= " AND ";
			}
				$sWhere .= $aColumns[$i]." LIKE '%".in($_GET['sSearch_'.$i])."%' ";
			
			}
		}
		}
	}
	}
	 
	 
	
if ($wheres <> ""){

if ($sWhere=="") {
    $sQuery = "
        SELECT SQL_CALC_FOUND_ROWS ".str_replace(" , ", " ", implode(", ", $aColumns))."
        FROM   $sTable
        Where $wheres
		$sOrder
        $sLimit
    ";
} else {
    $sQuery = "
        SELECT SQL_CALC_FOUND_ROWS ".str_replace(" , ", " ", implode(", ", $aColumns))."
        FROM   $sTable
        $sWhere AND $wheres
		$sOrder
        $sLimit
        ";
}
 
} else {
	$sQuery = "
		SELECT SQL_CALC_FOUND_ROWS ".str_replace(" , ", " ", implode(", ", $aColumns))."
		FROM   $sTable
		$sWhere 
		$sOrder
        $sLimit
	";
} 
 
 
	$rResult = select($pdo, $sQuery);
	$rResult->execute();
	
	
	$sQuery = "
		SELECT FOUND_ROWS()
	";
	$rResultFilterTotal = select($pdo,  $sQuery);
	$rResultFilterTotal->execute();
	
	$aResultFilterTotal = fetch($rResultFilterTotal);
	$iFilteredTotal = $aResultFilterTotal[0];
	
	$sQuery = "
		SELECT COUNT(".$sIndexColumn.")
		FROM   $sTable
	";
	
	$rResultTotal = select($pdo, $sQuery);
	$rResultTotal->execute();
	
	$aResultTotal = fetch($rResultTotal);
	$iTotal = $aResultTotal[0];
	
	if(!empty($_GET['sEcho'])){
	$output = array(
		"sEcho" => intval($_GET['sEcho']),
		"iTotalRecords" => $iTotal,
		"iTotalDisplayRecords" => $iFilteredTotal,
		"aaData" => array()
	);
	
	} else {
	$output = array(
		"sEcho" => 1,
		"iTotalRecords" => $iTotal,
		"iTotalDisplayRecords" => $iFilteredTotal,
		"aaData" => array()
	);
		
	}
	
	while ( $aRow = fetch( $rResult ) )
	{
		
		$row = array();
		for ( $i=0 ; $i<count($aColumns) ; $i++ )
		{
			
			if ( $aColumns[$i] == "version" )
			{
				$row[] = $aRow[$i];
			}
			else if ( $aColumns[$i] != ' ' )
			{
				$row[] = $aRow[$i];
			}
		}
		$output['aaData'][] = $row;
	}
	
	
	
	echo json_encode( $output );
?>
	