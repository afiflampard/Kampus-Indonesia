<?php 
if(empty($no_3)){ $no_3 = 1; } 
if(empty($no_2)){ $no_2 = 1; } 
if(empty($no_1)){ $no_1 = 1; } 

if(empty($max_1)){ $max_1 = 1; } 
if(empty($max_2)){ $max_2 = 1; } 
if(empty($max_3)){ $max_3 = 1; } 
?>


<script>
kode_soal ="<?php echo($kode) ;  ?>";
ar_dijawab_1 = ['-1'];
ar_dijawab_2 = ['-1'];
ar_dijawab_3 = ['-1'];


c_1 = [];
c_2 = [];
c_3 = [];
 


var no_1 = "<?php echo($no_1) ;  ?>";
var no_2 = "<?php echo($no_2) ;  ?>";
var no_3 = "<?php echo($no_3) ;  ?>";

var max_1 = "<?php echo($max_1) ;  ?>";
var max_2 = "<?php echo($max_2) ;  ?>";
var max_3 = "<?php echo($max_3) ;  ?>";

var next_1 = "<?php echo($no_1+1) ;  ?>";
var next_2 = "<?php echo($no_2+1) ;  ?>";
var next_3 = "<?php echo($no_3+1) ;  ?>";
var sisa_waktu = <?php echo($sisa) ;  ?>;


var dijawab_1 = 0;
var dijawab_2 = 0;
var dijawab_3 = 0;

var belum_1 = <?php echo($max_1) ;  ?>;
var belum_2 = <?php echo($max_2) ;  ?>;
var belum_3 = <?php echo($max_3) ;  ?>;



$('#page_1_1').removeClass('hidden_1');
$('#page_1_2').removeClass('hidden_2');
$('#page_1_3').removeClass('hidden_3');

function hidden_page_1(){ for (i = 1; i <= max_1; i++) { $('#page_'+i+'_1').addClass('hidden_1'); }  }
function hidden_page_2(){ for (i = 1; i <= max_2; i++) { $('#page_'+i+'_2').addClass('hidden_2'); }  }
function hidden_page_3(){ for (i = 1; i <= max_3; i++) { $('#page_'+i+'_3').addClass('hidden_3'); }  }


	
function next_page_1(){ if(Number(no_1)+1 <= Number(max_1)){ next_1 = Number(no_1)+1; show_page_1();  } }
function next_page_2(){ if(Number(no_2)+1 <= Number(max_2)){ next_2 = Number(no_2)+1; show_page_2(); }  }
function next_page_3(){ if(Number(no_3)+1 <= Number(max_3)){ next_3 = Number(no_3)+1; show_page_3(); }  }



function back_page_1(num_1){ if(Number(no_1)-1 >= 1){ next_1= Number(no_1)-1; show_page_1(); } }
function back_page_2(num_2){ if(Number(no_2)-1 >= 1){ next_2= Number(no_2)-1; show_page_2(); } }
function back_page_3(num_3){ if(Number(no_3)-1 >= 1){ next_3= Number(no_3)-1; show_page_3(); } }


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
	console.log(datacount);
	
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


function active_btn_1(valx,nomor_1){ 
var r = Math.random();
var r2 = Math.random();


if($("this").is(':checked'))
{
$(this).parent().css({"background" : "#ffffff", "-moz-border-radius" : "5px"})
}
indexo = ar_dijawab_1.indexOf(nomor_1);
if(indexo < 0){
dijawab_1 = dijawab_1+1; 
belum_1 = belum_1-1; 
ar_dijawab_1.push(nomor_1);
}

$('#no_'+nomor_1+'_1').removeClass('btn-danger');$('#no_'+nomor_1+'_1').removeClass('btn-warning');	$('#no_'+nomor_1+'_1').addClass('btn-success');	$('#dijawab_1').html(dijawab_1);	 $('#belum_1').html(belum_1);	 }



function active_btn_2(valx,nomor_2){
var r = Math.random();
var r2 = Math.random();



indexo = ar_dijawab_2.indexOf(nomor_2);
if(indexo < 0){
dijawab_2 = dijawab_2+1; 
belum_2 = belum_2-1; 
ar_dijawab_2.push(nomor_2);
}

$('#no_'+nomor_2+'_2').removeClass('btn-danger');$('#no_'+nomor_2+'_2').removeClass('btn-warning');	$('#no_'+nomor_2+'_2').addClass('btn-success');	$('#dijawab_2').html(dijawab_2);	 $('#belum_2').html(belum_2);	 }




function active_btn_3(valx,nomor_3){ 
var r = Math.random();
var r2 = Math.random(); 


indexo = ar_dijawab_3.indexOf(nomor_3);
if(indexo < 0){
dijawab_3 = dijawab_3+1; 
belum_3 = belum_3-1; 
ar_dijawab_3.push(nomor_3);
}
 $('#no_'+nomor_3+'_3').removeClass('btn-danger');$('#no_'+nomor_3+'_3').removeClass('btn-warning');	$('#no_'+nomor_3+'_3').addClass('btn-success');	$('#dijawab_3').html(dijawab_3);	 $('#belum_3').html(belum_3);	 }


 
 
function tandai_1(){$('#no_'+no_1+'_1').removeClass('btn-danger');$('#no_'+no_1+'_1').removeClass('btn-success');$('#no_'+no_1+'_1').removeClass('btn-warning');	$('#no_'+no_1+'_1').addClass('btn-warning');next_page_1();	}
function tandai_2(){$('#no_'+no_2+'_2').removeClass('btn-danger');$('#no_'+no_2+'_2').removeClass('btn-success');$('#no_'+no_2+'_2').removeClass('btn-warning');	$('#no_'+no_2+'_2').addClass('btn-warning');next_page_2();	}
function tandai_3(){$('#no_'+no_3+'_3').removeClass('btn-danger');$('#no_'+no_3+'_3').removeClass('btn-success');$('#no_'+no_3+'_3').removeClass('btn-warning');	$('#no_'+no_3+'_3').addClass('btn-warning');next_page_3();	}



function go_page_1(num_1){ next_1= num_1; show_page_1(); }
function go_page_2(num_2){ next_2= num_2; show_page_2(); }
function go_page_3(num_3){ next_3= num_3; show_page_3(); }



function show_page_1(){ hidden_page_1(); no_1= next_1; $('#page_'+next_1+'_1').removeClass('hidden_1'); if(next_1+1 <= max_1){ next_1= next_1+1; }   }
function show_page_2(){ hidden_page_2(); no_2= next_2; $('#page_'+next_2+'_2').removeClass('hidden_2'); if(next_2+1 <= max_2){ next_2= next_2+1; }   }
function show_page_3(){ hidden_page_3(); no_3= next_3; $('#page_'+next_3+'_3').removeClass('hidden_3'); if(next_3+1 <= max_3){ next_3= next_3+1; }   }
 

 
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

 
 
  
</script> 