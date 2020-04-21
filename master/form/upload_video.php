<?php 
if(isset($_POST['delete'])){
$id = in($_POST['id']);
eksekusi($pdo,"delete from `list_video` where `id`='$id' ");


}
 ?>

<link rel="stylesheet" href="assets/dropzone/dropzone.css">
<script src="assets/dropzone/dropzone.js"></script>




<div class="card">
<div class="card-header"><h5>Upload Video</h5></div>
<div class="card-block row"> 
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  p-1 ">

	
		<form action="isset_upload_video.php"  style="border-radius:3px;"  id="frmFileUpload" class="dropzone" method="post" enctype="multipart/form-data">
		<h3> Insert ZIP  </h3> 
		<small> Name Must Same (.mp4) </small> <br />
		<br />
		  
		<div class="fallback">
		<input name="file" type="file" multiple />
		</div>
		</form> 

	
</div>

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  p-1">
	
	
	<table id="history" class="table table-striped " style="margin:0px; width : 100%;" cellspacing="0" width="100%">
	<thead>
		<tr> 
			<th> URL </th> 
			<th style="width : 100px; min-width:100px;"> # </th> 
		</tr>
	</thead>
	</table>
	
	

<script>   
$(document).ready(function() {
	var site="<?php echo($site) ;  ?>";
$('#history').dataTable( {
"bProcessing": true,
"bServerSide": true,
"sAjaxSource": "server/list_video.php", 
"aoColumns": [
{ "mclass":"wall", "mData": "0", "mRender": function ( data, type, full ) {
	a = '<a  style="color:black !Important"   target="_blank" href="'+site+'/video/'+data+'" > '+site+'/video/'+data+' </a> ';
	return a;
}},
{ "mclass":"wall", "mData": "1", "mRender": function ( data, type, full ) {
	del = "showdel('"+data+"','"+full[1]+"')";
 hapus = ' <button class="btn btn-danger btn-xs btn-sm" onclick="'+del+'"  type="button"><i class="fa fa-trash">  </i></button> ';
 return hapus;
 }} 
]
} );
} );
</script>
 

</div>

</div>
</div>



	
<script>  
$(function(){
  Dropzone.options.frmFileUpload = { 
    addRemoveLinks: true,
    dictResponseError: 'Server not Configured',
    acceptedFiles: ".mp4",
    init:function(){
      var self = this;
      // config
      self.options.addRemoveLinks = true;
      self.options.dictRemoveFile = "Delete";
      //New file added
      self.on("addedfile", function (file) {
        console.log('new file added ', file);
      });
      // Send file starts
      self.on("sending", function (file) {
        console.log('upload started', file);
        $('.meter').show();
      });
      
      // File upload Progress
      self.on("totaluploadprogress", function (progress) {
        console.log("progress ", progress);
        $('.roller').width(progress + '%');
      });

      self.on("queuecomplete", function (progress) {
        $('.meter').delay(999).slideUp(999);
      });
      
      // On removing file
      self.on("removedfile", function (file) {
        console.log(file);
      });
    }
  };
})
  </script> 
