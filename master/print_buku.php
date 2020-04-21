<?php 
require_once("../a_con.php");
$id = "";
if(!empty($_GET['id'])){ 
$id = in($_GET['id']); 
}

$check_data = select($pdo,"SELECT * FROM invoice_buku WHERE id='$id'"); 
$check_data->execute();
$row_data = row($check_data);
if($row_data >= 1){
$data = fetch_obj($check_data); 
 

?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="description">
		<meta name="author" content="">
		<title>Your Title Website</title>
		<style>
			th,td{padding:5px; padding-left:10px; padding-right:10px;border:1px solid gainsboro;  }
			table{width : 500px; }
			*{font-family : sans,roboto,calibri}
			table{background: #f9f9f9; padding:10px;}
			th{background: #f1f1f1;}
			
		</style>
	</head>
	<body>
		<h3> Pemesanan  Buku <?php echo($data->nama_buku) ;  ?></h3> 
		
	
		<table>
			<tbody>
			<tr>
				<th> Pesanan </th>
				<td> <?php echo($data->judul) ;  ?> </td>
			</tr>
			<tr>
				<th> Provinsi </th>
				<td> <?php echo($data->provinsi) ;  ?> </td>
			</tr>
			<tr>
				<th> Kota </th>
				<td> <?php echo($data->kota) ;  ?> </td>
			</tr>
			<tr>
				<th> Alamat </th>
				<td> <?php echo($data->alamat) ;  ?> </td>
			</tr>
			<tr>
				<th> Nama Penerima  </th>
				<td> <?php echo($data->nama_penerima) ;  ?> </td>
			</tr>
			<tr>
				<th> Kurir Pilihan </th>
				<td> <?php echo($data->kurir) ;  ?> </td>
			</tr>
			
			
			</tbody>
		</table> 
		
	<script>  window.print();  </script> 
	
	</body>
</html>

<?php } ?>