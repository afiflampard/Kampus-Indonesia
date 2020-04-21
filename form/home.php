
        <div class="container shape-container d-flex align-items-center py-lg">
          <div class="col px-0">
            <div class="row align-items-center justify-content-center">
              <div class="col-lg-6 text-center">
				<h3 class="text-white"> <?php echo($master->name) ;  ?></h3> 
                <p class="lead text-white"> <?php echo html_entity_decode(htmlspecialchars_decode($master->description)) ;  ?> </p>
				<?php  if(!empty($alert)){ ?>
					<div class="alert alert-<?php echo($alert) ;  ?>	alert-dismissable">
					<a class="close" data-dismiss="alert" aria-label="close">&times;</a>
					<strong>Respon !</strong> <?php echo($respon) ;  ?> 
				</div> <?php }  ?>			
				
                <div class="btn-wrapper mt-5">
                  <a href="<?php echo($site) ?>/login" class="btn btn-lg btn-white btn-icon mb-3 mb-sm-0">
                    <span class="btn-inner--text">Masuk Sekarang</span>
                  </a>
                  <a href="<?php echo($site) ?>/register" class="btn btn-lg btn-github btn-icon mb-3 mb-sm-0" target="_blank">
                    <span class="btn-inner--icon"><i class="fa fa-github"></i></span>
                    <span class="btn-inner--text"> Dafar Akun Baru</span>
                  </a>
                </div> 
              </div>
            </div>
          </div>
        </div> 
     