<div class="card">
<div class="card-block"><div class="table-responsive">
<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  ">
			<img src="../image/logo.png"  style="height: 30px;"   />
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  " align="right">
			<h5>INVOICE#<?php echo($inv) ;  ?> <label class="badge badge-danger"><?php echo($data->status) ;  ?></label> </h5>  
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  ">
			<small> Hello <?php echo($user->nama) ;  ?></small> <br />
			<p  style="font-size : 12px !important" > Silahkan Mengirim Pembayaran Pembelian Koin Anda Ke Nomor Rekening Admin Di Bawah ini :  <br />
			<b> Jenis Bank : </b> <?php echo($data->bank_jenis) ;  ?> <br />
			<b> Nomor Rekening : </b> <?php echo($data->bank_rekening) ;  ?> <br />
			<b> Atas Nama : </b> <?php echo($data->bank_nama) ;  ?>  <br /> 
			</p> 
			 		
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  " align="right">
			<small> <b> Order Data : </b> <?php echo($data->date) ;  ?></small> 	<br /> 
		</div>
	</div>
 
	<br />
	 
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th> # </th> 
			<th> Item </th> 
			<th> Metode Pembayaran </th> 
			<th> Total </th> 
		</tr>
	</thead>
	<tbody>
	<tr>
		<td>1 </td>
		<td><?php echo($data->judul) ;  ?></td>
		<td><?php echo($data->metode) ;  ?></td>
		<td>Rp. <?php echo uang($data->total) ;  ?></td>
	</tr>
	</tbody> 
	</table>
	
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

	</div>
	<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-12 p-1  ">
	
	
	<div class=""  align="right" >
		<a class="btn btn-primary" href="print_invoice_premium.php?inv=<?php echo($data->invoice) ;  ?>" > Print </a> 		
		<a class="btn btn-info" href="?show=member_premium_bukti&inv=<?php echo($data->invoice) ;  ?>"> Upload Bukti Pembayaran </a> 	
	</div>
	
	</div>	
	
</div>
</div>
</div>
</div>




