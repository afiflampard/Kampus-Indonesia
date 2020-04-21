
<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1    p-1">
<div class="card">
<div class="card-header"><h5>Informasi Terkait Referral </h5></div>
	
	
<div class="card-block"><div class="table-responsive">
	<div class="alert alert-info	alert-dismissable">
	<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
	<strong>Ayo !</strong>  Ajak Orang Lain Untuk Bergabung Dengan Kami menggunakan Link Referral Anda Untuk Dapatkan Bonus Koin Tiap Pembelian . 
</div>
<?php $url = $site."/?r=".$user->kode_referral;  ?>

	<p> <b> Link Referral Anda :  </b> <br />
	<a class="bg-success p-1"  style="display:block; color:white;"  > <?php echo($site) ;  ?>/?r=<?php echo($user->kode_referral) ;  ?>  </a>   <br />
	Setiap Orang Yang Mengklik URL yang anda bagikan maka Akan Tersimpan Sebagai Referral Anda . Anda Akan Terus Menerus mendapatkan bonus <b> Koin </b> Setiap User Yang Anda Ajak melakukan pembelian Paket Tryout . Tanpa Batasan Waktu Dan Tempat </p> 
	<br />
	<b> Bagaimana Cara Mengajak Orang Lain .  </b>
	<br />
	<p> Anda Dapat Menyebarkan Link Referral Anda Di Berbagai media social . seperti facebook, instagram, whatsapp, dan media sosial lainnya. </p> 
	
  <a target="_blank" href="http://www.facebook.com/sharer.php?u=<?php echo($url) ;  ?>" style="width : 23%;border-radius:0px !Important; " class="btn btn-primary m-1"><i class="fa fa-facebook">  </i> Share Ke Facebook </a> 
  <a target="_blank" href="https://plus.google.com/share?url=<?php echo($url) ;  ?>" style="width : 23%; border-radius:0px !Important;" class="btn btn-danger  m-1"><i class="fa fa-google-plus">  </i> Share Ke Google Plus</a> 
  <a target="_blank" href="https://twitter.com/share?url=<?php echo($url) ;  ?>;text=<?php echo($blog->judul) ;  ?>" style="width : 23%; border-radius:0px !Important;" class="btn btn-info  m-1"><i class="fa fa-twitter">  </i> Share Ke Twitter</a> 
  <a target="_blank" href="https://api.whatsapp.com/send?text=<?php echo($url) ;  ?>" style="width : 23%;border-radius:0px !Important;" class="btn btn-success  m-1"><i class="fa fa-whatsapp">  </i> Share Ke Whatsapp</a> 

  
	 
</div>
</div>
</div>
</div>
</div>

