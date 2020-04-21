
<script>
 function showdel(id,nama,url){
	 $('#isi_delete').html(nama);
	 del='<a  href="?show='+url+'&del='+id+'" class="btn btn-danger margin-0">Yes</a>';
	 back = '<a  class="btn btn-primary margin-0 margin-left-10" onclick="cancel_delete();" data-dismiss="modal">No</a>'
	 $('#isi_tombol_delete').html(del+back);
	 $('#modal_delete').modal('show'); 
 }
 function cancel_delete(){ $('#modal_delete').modal('hide'); }
</script>
 
 <div class="modal fade" id="modal_delete" role="dialog" style="display: none; margin-top:0px;">
	 <div class="modal-dialog">
		 <div class="modal-content">
			 <div class="modal-header">
				 <span class="modal-title">Anda Yakin Ingin Menghapus Data Ini </span>
				 <button type="button" class="close" data-dismiss="modal">x</button>
			 </div>
			 <div class="modal-body" id="isi_delete">
					
					
					
			 </div>
			 <div class="modal-footer" id="isi_tombol_delete">
					 
			 </div>
		 </div>
	 </div>
 </div>
  
  
  
  
<script>
 function showconf(id,nama,url){
	 $('#isi_confirm').html(nama);
	 del='<a  href="?show='+url+'&conf='+id+'" class="btn btn-danger margin-0">Yes</a>';
	 back = '<a  class="btn btn-primary margin-0 margin-left-10" onclick="cancel_confirm();" data-dismiss="modal">No</a>'
	 $('#isi_tombol_confirm').html(del+back);
	 $('#modal_confirm').modal('show'); 
 }
 function cancel_confirm(){ $('#modal_confirm').modal('hide'); }
</script>
 
 <div class="modal fade" id="modal_confirm" role="dialog" style="display: none; margin-top:0px;">
	 <div class="modal-dialog">
		 <div class="modal-content">
			 <div class="modal-header">
				 <span class="modal-title">Anda Yakin Ingin Mengonfirmasi Data Ini</span>
				 <button type="button" class="close" data-dismiss="modal">x</button>
			 </div>
			 <div class="modal-body" id="isi_confirm">
					
					
					
			 </div>
			 <div class="modal-footer" id="isi_tombol_confirm">
					 
			 </div>
		 </div>
	 </div>
 </div>
  
 
  
  
  
   <script>
   function showimg(src){
	   $('#imgs').attr('src',src);
	   $('#hr').attr('href',src);
	   $('#modal_img').modal('show'); 
	   
   }
   </script>
   
   <div class="modal fade" id="modal_img" role="dialog" style="display: none; margin-top:0px;">
	   <div class="modal-dialog">
		   <div class="modal-content">
			   <div class="modal-header red col-white">
				   <span class="modal-title">Bukti Pembayaran  </span>
				   <button type="button" class="close" data-dismiss="modal">x</button>
			   </div>
			   <div class="modal-body" id="isi_img">
				  <img src="" id="imgs" class="responsive" style="width : 100%;" />
			  </div>
		   </div>
	   </div>
   </div>
	
	
	
	
	
	
<script>
 function showbeli(id,nama,harga1,harga2){
	 $('#harga_premium').val(harga2+" Koin");
	 $('#harga_reguler').val(harga1+" Koin");
	 $('#kode_soal_beli').val(id);
	$('#judul_beli').val(nama);
	 $('#modal_beli').modal('show'); 
 }
 function cancel_beli(){ $('#modal_beli').modal('hide'); }
</script>
 
 <div class="modal fade" id="modal_beli" role="dialog" style="display: none; margin-top:0px;">
	 <div class="modal-dialog">
		 <div class="modal-content">
			 <div class="modal-header">
				 <span class="modal-title">Anda Yakin Ingin Membeli Soal Ini </span>
				 <button type="button" class="close" data-dismiss="modal">x</button>
			 </div>
			 <div class="modal-body">
				<form method="post" enctype="multipart/form-data"> 
					<span> Judul Soal </span> 
					<input type="hidden" required class="form-control" name="kode_soal" id="kode_soal_beli" value="" placeholder=""    />
					<input type="text" required class="form-control" name="judul" id="judul_beli" readonly value="" placeholder=""    />
					<br />
					<span> Harga Reguler </span> 
					<input type="text"  class="form-control"  id="harga_reguler" readonly value="" placeholder=""    />
					<br />
					<span> Harga Premium  </span> 
					<input type="text"  class="form-control" id="harga_premium" readonly value="" placeholder=""    />
					<br />
					
					<small> 1. Paket Reguler Hanya Pembahasan Berupa Keterangan</small> <br>
					<small> 2. Paket Premium Memiliki Pembahasan Reguler + Video Pembahasan </small>  <br />
					<br />
					  
					<button type="submit" class="btn btn-success" name="beli" >Beli Paket Reguler </button> 
					<?php if($master->aktif_video == "Yes"){?> 
					<button type="submit" class="btn btn-primary" name="beli_premium" >Beli Paket Premium</button> 
					 <?php }  ?>
				</form>
			 </div>
		 </div>
	 </div>
 </div>
  
  
  
  
<script>
 function showbeli_Private(id,nama){
	 $('#kode_soal_beli_private').val(id);
	$('#judul_beli_private').val(nama);
	 $('#modal_beli_private').modal('show'); 
 }
 function cancel_beli_private(){ $('#modal_beli_private').modal('hide'); }
</script>
 
 <div class="modal fade" id="modal_beli_private" role="dialog" style="display: none; margin-top:0px;">
	 <div class="modal-dialog">
		 <div class="modal-content">
			 <div class="modal-header">
				 <span class="modal-title">Silahkan Masukkan Password Soal Untuk Mencobanya </span>
				 <button type="button" class="close" data-dismiss="modal">x</button>
			 </div>
			 <div class="modal-body">
				<form method="post" enctype="multipart/form-data"> 
					<span> Judul Soal </span> 
					<input type="hidden" required class="form-control" name="kode_soal" id="kode_soal_beli_private" value="" placeholder=""    />
					<input type="text" required class="form-control" name="judul" id="judul_beli_private" readonly value="" placeholder=""    />
					<br />
					<span> Password Soal </span> 
					<input type="text" required class="form-control" name="password_soal" value="" placeholder=""    />
					<br />
					 
					<button type="submit" class="btn btn-success" name="beli_private" >Buka Akses</button> 
				</form>
			 </div>
		 </div>
	 </div>
 </div>
 
 
  
<script>
 function showbeli_Public(id,nama){
	 $('#kode_soal_beli_public').val(id);
	$('#judul_beli_public').val(nama);
	 $('#modal_beli_public').modal('show'); 
 }
 function cancel_beli_public(){ $('#modal_beli_public').modal('hide'); }
</script>
 
 <div class="modal fade" id="modal_beli_public" role="dialog" style="display: none; margin-top:0px;">
	 <div class="modal-dialog">
		 <div class="modal-content">
			 <div class="modal-header">
				 <span class="modal-title">Yakin Ingin Mencobanya.  </span>
				 <button type="button" class="close" data-dismiss="modal">x</button>
			 </div>
			 <div class="modal-body">
				<form method="post" enctype="multipart/form-data"> 
					<span> Judul Soal </span> 
					<input type="hidden" required class="form-control" name="kode_soal" id="kode_soal_beli_public" value="" placeholder=""    />
					<input type="text" required class="form-control" name="judul" id="judul_beli_public" readonly value="" placeholder=""    />
					<br /> 
					<button type="submit" class="btn btn-success" name="beli_public" >Buka Akses</button> 
				</form>
			 </div>
		 </div>
	 </div>
 </div>
 
 
 
 <script>  function close_alert(){
	$('.alert').hide();
 }
   </script> 