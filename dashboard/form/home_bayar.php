<?php 
$check_inv = select($pdo,"SELECT * FROM `invoice` WHERE  `user_id`='$user_id'  LIMIT 1 "); 
$check_inv->execute();
$row_inv = row($check_inv);
if($row_inv >= 1){
$data =fetch_obj($check_inv); 
?>
<div class="card">
<div class="card-block"><div class="table-responsive">
<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  ">
			<h5 class="mb-0"> <?php echo($master->name) ;  ?></h5> 
			<p class="mb-0"> <small> <?php echo($master->description) ;  ?></small> </p> 
			
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  " align="right">
			<h5 class="mb-0">INVOICE#<?php echo($data->invoice) ;  ?></h5>  
			<label class="badge badge-danger">Status : <?php echo($data->status) ;  ?></label> <br />
			 
			<label class="badge badge-danger">Status Bukti : <?php echo($data->status_bukti) ;  ?></label> 
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  ">
			<small> Hai <?php echo($user->nama) ;  ?></small> <br />
			<p  style="font-size : 12px !important" > Silahkan Mengirim Pembayaran Pembelian Koin Anda Ke Nomor Rekening Admin </p> 
			 		
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  " align="right">
			<small> <b> Order Data : </b> <?php echo($data->date) ;  ?></small> 	<br /> 
		</div>
	</div>
   
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> # </th> 
			<th> Keterangan </th>  
			<th> Total </th> 
		</tr>
	</thead>
	<tbody>
	<tr>
		<td>1 </td>
		<td><?php echo($data->judul) ;  ?></td> 
		<td>Rp. <?php echo uang($data->total) ;  ?></td>
	</tr>
	</tbody> 
	</table>
	<br />
	<div class="p-2">
		<h5> Nomor Rekening Tujuan </h5> 
		<p> Pastikan Anda Hanya Melakukan pembayaran di nomor rekening di bawah ini </p> 
		
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> Jenis Bank </th> 
			<th> Nomor Rekening </th>  
			<th> Atas Nama</th> 
		</tr>
	</thead>
	<tbody>
	<tr>
	<?php $check_bank = select($pdo,"SELECT * FROM data_bank"); 
	$check_bank->execute();
	$row_bank = row($check_bank);
	if($row_bank >= 1){
		while($bank = fetch_obj($check_bank)){
			?> 
			<tr> 
			
		<td><?php echo($bank->bank_jenis) ;  ?> </td>
		<td><?php echo($bank->bank_rekening) ;  ?> </td>
		<td><?php echo($bank->bank_nama) ;  ?> </td> 
			</tr>
			<?php 
		}
	}  
	 ?>
	</tr>
	</tbody> 
	</table>
	</div> 
	
	<br />
	<div class="row">
		<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-1  ">
			<b> Catatan </b><br /> 
			<small  style="color:red;" > Mohon Untuk Melakukan pemabayaran dengan angka unik untuk bisa dikonfirmasi secara otomatis . Apabila Anda tidak mengirimkan jumlah yang sesuai dengan angka unik atau status pembayaran anda 2x24 jam tidak berubah statusnya . Silahkan Upload Bukti Pemabayaran </small> 		
		</div>
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1  "  align="right">
			<small> <b> Sub Total : </b> Rp. <?php echo uang($data->total) ;  ?></small>  <br />
			 
			<small> <b> Kode Unik : </b> Rp. <?php echo uang($data->kode_unik) ;  ?></small> <br />
			<small> <b> Biaya Admin : </b> Rp. 0</small> <br />
			<h3 class="mt-2"  style="font-size : 20px !important; color:blue !important;" > <b style="font-size : 20px !important;"> Total Pembayaran : </b> Rp. <?php echo uang($data->total_pembayaran) ;  ?></h3> <br />
		</div>
	</div>
	
	<div class="row" style="padding-top:20px;">
	<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-12 p-1  ">
	<a class="btn btn-danger" href="?show=koin_invoice" > Kembali Ke List </a> 
	</div>
	<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-1  ">
	
	
	<div class=""  align="right" >  
		<a class="btn btn-info" href="?show=home_bukti&inv=<?php echo($data->invoice) ;  ?>"> Upload Bukti Pembayaran </a> 	
	</div>
	
	</div>	
	
</div>
</div>
</div>
</div>




<?php } ?>

