<?php 
if(empty($no_1)){ $no_1 = 1; } 
if(empty($max_1)){ $max_1 = 1; } 
?>



<script>
kode_soal ="<?php echo($kode) ;  ?>";




ar_dijawab_1 = ['-1'];
ar_dijawab_2 = ['-1'];
 
var no_1 = "<?php echo($no_1) ;  ?>";
var max_1 = "<?php echo($max_x) ;  ?>";
var next_1 = "<?php echo($no_1+1) ;  ?>";
var sisa_waktu = <?php echo($sisa) ;  ?>;

var dijawab_1 = 0;
var belum_1 = <?php echo($max_x) ;  ?>;

$('#page_1_1').removeClass('hidden_1');

function hidden_page_1(){ for (i = 1; i <= max_1; i++) { $('#page_'+i+'_1').addClass('hidden_1'); }  }
function next_page_1(){ if(Number(no_1)+1 <= Number(max_1)){ next_1 = Number(no_1)+1; show_page_1(); }  }
function back_page_1(num_1){ if(Number(no_1)-1 >= 1){ next_1= Number(no_1)-1; show_page_1(); } }

function active_btn_1(valx,nomor_1){
var r = Math.random();
var r2 = Math.random();


indexo = ar_dijawab_1.indexOf(nomor_1);
if(indexo < 0){
dijawab_1 = dijawab_1+1; 
belum_1 = belum_1-1; 
ar_dijawab_1.push(nomor_1);
}
$('#no_'+nomor_1+'_1').removeClass('btn-danger');$('#no_'+nomor_1+'_1').removeClass('btn-warning');	$('#no_'+nomor_1+'_1').addClass('btn-success');	$('#dijawab_1').html(dijawab_1);	 $('#belum_1').html(belum_1);	 }



 
function tandai_1(){$('#no_'+no_1+'_1').removeClass('btn-danger');$('#no_'+no_1+'_1').removeClass('btn-success');$('#no_'+no_1+'_1').removeClass('btn-warning');	$('#no_'+no_1+'_1').addClass('btn-warning');	next_page_1(); }



function go_page_1(num_1){ next_1= num_1; show_page_1(); }




function show_page_1(){ hidden_page_1(); no_1= next_1; $('#page_'+next_1+'_1').removeClass('hidden_1'); if(next_1+1 <= max_1){ next_1= next_1+1; }    }



 
var x = setInterval(function() {
	 
	sisa_waktu = sisa_waktu - 1 ;
	
    var hours = Math.floor((sisa_waktu % (60 * 60 * 60)) / (60 * 60));
    var minutes = Math.floor((sisa_waktu % (60 * 60)) / 60);
    var seconds = Math.floor(sisa_waktu % 60);
    
	hours = ('0' + hours).slice(-2);
    minutes = ('0' + minutes).slice(-2);
    seconds = ('0' + seconds).slice(-2);
	
    $(".countdown").html(hours + " : "+minutes + " : " + seconds + "  ");
    
    // If the count down is over, write some text 
    if (sisa_waktu < 0) {
        clearInterval(x);
		$( "#checkboxx" ).prop( "checked", true );
		$('#selesai').click();
    }
	
	
}, 1000);
 
 
 
 function buttonAnswer(data){
	var splitdata = data.split("-");
	var id = "#"+splitdata[0];
	
	var resetvalue = splitdata[0].split("_");
	var resetvalueA = "input[id="+resetvalue[0]+"_"+resetvalue[1]+"_"+"a_"+resetvalue[3]+"]";
	var resetvalueB = "input[id="+resetvalue[0]+"_"+resetvalue[1]+"_"+"b_"+resetvalue[3]+"]";
	var resetvalueC = "input[id="+resetvalue[0]+"_"+resetvalue[1]+"_"+"c_"+resetvalue[3]+"]";
	var resetvalueD = "input[id="+resetvalue[0]+"_"+resetvalue[1]+"_"+"d_"+resetvalue[3]+"]";
	var resetvalueE = "input[id="+resetvalue[0]+"_"+resetvalue[1]+"_"+"e_"+resetvalue[3]+"]";
	
	$(resetvalueA).attr("checked",false); 
	$(resetvalueB).attr("checked",false); 
	$(resetvalueC).attr("checked",false); 
	$(resetvalueD).attr("checked",false); 
	$(resetvalueE).attr("checked",false); 
	
	$(id).attr('checked',true);
	var datacount = splitdata[1].split("_");
	if(datacount[0] == 1){
		active_btn_1($(id).val(),datacount[1]);
	}else if(datacount[0] == 2){
		active_btn_2($(id).val(),datacount[1]);
	}else if(datacount[0] == 3){
		active_btn_3($(id).val(),datacount[1]);
	}else{
		console.log("data not found");
	}
}
 
  
  
</script> 
