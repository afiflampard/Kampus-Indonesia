<div id="soal" class="card-block">
<a class="btn btn-primary" id="btn_3" href="?show=materi_video&materi=<?php echo($materi) ;  ?>&kategori=<?php echo($kategori) ;  ?>" > Lihat Materi Lainnya </a>  
<br />
 

<table class="table table-striped">
<tbody>
<?php 
$i = 1;
$benar = array();
$name = array();
$jenis_soal = 'Soal';


$check_jawaban = select($pdo,"SELECT * FROM `data_jawaban_quipper` WHERE `kode_soal`='$kode' and `jenis_soal`='$jenis_soal' ORDER BY `nomor` ASC  "); 
$check_jawaban->execute();
$row_jawaban = row($check_jawaban);
if($row_jawaban >= 1){
while($jawaban = fetch_obj($check_jawaban)){
$tepat = "Tidak Ada Jawaban Yang Tepat";
$nil = 0;
$nilai_a = $jawaban->nilai_a;
$nilai_b = $jawaban->nilai_b;
$nilai_c = $jawaban->nilai_c;
$nilai_d = $jawaban->nilai_d;
$nilai_e = $jawaban->nilai_e;

$benar_a = "";
$benar_b = "";
$benar_c = "";
$benar_d = "";
$benar_e = "";
$b = "a";

if($nilai_a >= 0){ if($nil < $nilai_a){ $nil = $nilai_a;$b="a"; $benar_a="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_a; }  } 
if($nilai_b >= 0){ if($nil < $nilai_b){ $nil = $nilai_b;$b="b"; $benar_b="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang  <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_b; }  } 
if($nilai_c >= 0){ if($nil < $nilai_c){ $nil = $nilai_c;$b="c"; $benar_c="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang  <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_c; }  } 
if($nilai_d >= 0){ if($nil < $nilai_d){ $nil = $nilai_d;$b="d"; $benar_d="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang  <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_d; }  } 
if($nilai_e >= 0){ if($nil < $nilai_e){ $nil = $nilai_e;$b="e"; $benar_e="color: blue !important; font-weight : bold;"; $tepat ="Jawaban Yang  <b>Paling Tepat </b> Adalah Pilihan  - ".$jawaban->pilihan_e; }  } 

$nomorx[$i][] = $jawaban->nomor;
$benar[$i][$jawaban->nomor] = $b;
?> 



<tr> 
<td  style="border-bottom:1px solid gainsboro;  padding-bottom:30px !Important;" > 
<div id="page_<?php echo($jawaban->nomor) ;  ?>" align="left">
<div class="row">
<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12 col-12 p-1  p-1">
<div style="font-size : 18px; display:block !important; white-space:pre-wrap "> 
<b>Soal No : <?php echo($jawaban->nomor) ;  ?>  </b> 
<?php echo($jawaban->soal) ;  ?>
</div>
</div>

<div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 col-12 p-1  p-1 ">
<a class="" id="hasil<?php echo($i) ;  ?>_<?php echo($jawaban->nomor) ;  ?>" > </a> 
<div style="font-size : 18px; display:block !important; white-space:pre-wrap "> 
Pilih Jawaban
</div>
<br />

<table class="table table-striped" style="width : 100%;">
<tbody>
<?php if(!empty($jawaban->pilihan_a)){ ?> 
<tr> 
<td style="width : 25px;max-width:25px !important; padding-left:10px!important; padding-right:0px !important;"> <input  type="radio" id="jawaban_<?php echo($i) ;  ?>_<?php echo($jawaban->id) ;  ?>_a"  value="a" checked name="soal_<?php echo($i) ;  ?>_<?php echo($jawaban->nomor) ;  ?>"       />  </td>
<td >
<label style="width:100% !important; display:block !important; white-space:pre-wrap"  for="jawaban_<?php echo($i) ;  ?>_<?php echo($jawaban->id) ;  ?>_a">
<?php echo($jawaban->pilihan_a) ;  ?></label>   </td>
</tr>
<?php } ?>
<?php if(!empty($jawaban->pilihan_b)){ ?> 
<tr> 
<td style="width : 25px;max-width:25px !important; padding-left:10px!important; padding-right:0px !important;"> <input  type="radio" id="jawaban_<?php echo($i) ;  ?>_<?php echo($jawaban->id) ;  ?>_b"  value="b"  name="soal_<?php echo($i) ;  ?>_<?php echo($jawaban->nomor) ;  ?>"       />  </td>
<td ><label style="width:100% !important; display:block !important; white-space:pre-wrap"  for="jawaban_<?php echo($i) ;  ?>_<?php echo($jawaban->id) ;  ?>_b">
<?php echo($jawaban->pilihan_b) ;  ?>
</label>   </td>
</tr>
<?php } ?>
<?php if(!empty($jawaban->pilihan_c)){ ?> 
<tr> 
<td style="width : 25px;max-width:25px !important; padding-left:10px!important; padding-right:0px !important;"> <input  type="radio" id="jawaban_<?php echo($i) ;  ?>_<?php echo($jawaban->id) ;  ?>_c"  value="c"   name="soal_<?php echo($i) ;  ?>_<?php echo($jawaban->nomor) ;  ?>"       /> </td>
<td > <label style="width:100% !important; display:block !important; white-space:pre-wrap"  for="jawaban_<?php echo($i) ;  ?>_<?php echo($jawaban->id) ;  ?>_c">
<?php echo($jawaban->pilihan_c) ;  ?>
</label> </td>
</tr>
<?php } ?>

<?php if(!empty($jawaban->pilihan_d)){ ?> 
<tr> 
<td style="width : 25px;max-width:25px !important; padding-left:10px!important; padding-right:0px !important;"> <input  type="radio" id="jawaban_<?php echo($i) ;  ?>_<?php echo($jawaban->id) ;  ?>_d"  value="d"  name="soal_<?php echo($i) ;  ?>_<?php echo($jawaban->nomor) ;  ?>"       />  </td>
<td >
<label style="width:100% !important; display:block !important; white-space:pre-wrap"  for="jawaban_<?php echo($i) ;  ?>_<?php echo($jawaban->id) ;  ?>_d">
<?php echo($jawaban->pilihan_d) ;  ?>
</label>   </td>
</tr>
<?php } ?>
<?php if(!empty($jawaban->pilihan_e)){ ?> 
<tr> 
<td style="width : 25px;max-width:25px !important; padding-left:10px!important; padding-right:0px !important;"> <input  type="radio" id="jawaban_<?php echo($i) ;  ?>_<?php echo($jawaban->id) ;  ?>_e"  value="e"  name="soal_<?php echo($i) ;  ?>_<?php echo($jawaban->nomor) ;  ?>"       />  </td>
<td ><label style="width:100% !important; display:block !important; white-space:pre-wrap"  for="jawaban_<?php echo($i) ;  ?>_<?php echo($jawaban->id) ;  ?>_e">
<?php echo($jawaban->pilihan_e) ;  ?>
</label>   </td>
</tr>
<?php } ?>

</tbody>
</table>
</div> 

<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  p-0 pembahasan_<?php echo($i) ;  ?>"  style="display:none" >
<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-12 p-1  ">
<b  style="font-size : 18px;" > Pembahasan </b>	
</div>

<?php if(!empty($jawaban->video)){?> 
<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-12 p-1  p-1">
	<?php echo($jawaban->video) ;  ?>
</div> 
<?php  }  ?>


<div class="col p-1">		
<div class=" p-1 " style="background: white; margin-top: 20px;" > 
<pre style="white-space:pre-line !important;padding:10px; width:100%; padding:0px;  height:auto !important;margin:0px !important; font-family : inherit !important;"><?php echo($jawaban->pembahasan) ;  ?></pre> 

<div style="font-size : 14px;color:blue; display:block !important; white-space:pre-wrap "> 
<?php echo($tepat) ;  ?>
</div>
</div>
</div>
</div>
</div>



</div> 



</div> 
</td>
</tr>
<?php 
}
}  

?>

</tbody>
</table> 

<div class="p-1" align="center">
<a  style="color:white; " id="btn_<?php echo($i) ;  ?>" onclick="check_jawaban_<?php echo($i) ;  ?>()"  class="btn btn-success " > Periksan Jawaban Dan Pembahasan </a> 
<br />
<a class="btn btn-primary" id="btn_2" href="?show=materi_video&materi=<?php echo($materi) ;  ?>&kategori=<?php echo($kategori) ;  ?>" > Lihat Materi Lainnya </a>  

</div>
</div>


<script>  
$('#btn_2').hide();
$('#btn_3').hide();

nomor_<?php echo($i) ;  ?> = [<?php 
$x = 0;
foreach($nomorx[$i] as $n){
	if($x == "0"){
	echo('"'.$n.'"') ; 
	} else {
		echo(',"'.$n.'"') ; 
	}	
	$x++;
} ?>];


benar_<?php echo($i) ;  ?> = [<?php 
$x = 0;
foreach($benar[$i] as $b){
	if($x == "0"){
	echo('"'.$b.'"') ; 
	} else {
		echo(',"'.$b.'"') ; 
	}	
	$x++;
} ?>];

 
function check_jawaban_<?php echo($i) ;  ?>(){
$('#btn_<?php echo($i) ;  ?>').hide();
$('.pembahasan_<?php echo($i) ;  ?>').show();
window.scrollTo(top,0);

$('#btn_2').show();
$('#btn_3').show();

//hasil1_
//jawaban_

$.each( nomor_<?php echo($i) ;  ?>, function(key,no) {
	
	pilih_<?php echo($i) ;  ?> = $( "input[type=radio][name=soal_<?php echo($i) ;  ?>_"+no+"]:checked" ).val();
//    alert(value+" "+pilih);
	if(benar_<?php echo($i) ;  ?>[key] == pilih_<?php echo($i) ;  ?>){
		$('#hasil<?php echo($i) ;  ?>_'+no).html('<i class="fa fa-check">  </i> Benar');
		$('#hasil<?php echo($i) ;  ?>_'+no).attr('style','color:blue !important;  position:absolute; top:10px;font-size : 20px; font-weight : bold; right:10px');
	} else {
		$('#hasil<?php echo($i) ;  ?>_'+no).html('<i class="fa fa-close">  </i> Salah (Benar = '+benar_<?php echo($i) ;  ?>[key]+')');
		$('#hasil<?php echo($i) ;  ?>_'+no).attr('style','color:red !important;  position:absolute; top:10px;font-size : 20px; font-weight : bold; right:10px');
		
	}
	 
	 
});


}

</script> 


