 
<script>

  
var no_1 = "<?php echo($no_1) ;  ?>";
var no_2 = "<?php echo($no_2) ;  ?>";
var no_3 = "<?php echo($no_3) ;  ?>";

var max_1 = "<?php echo($max_1) ;  ?>";
var max_2 = "<?php echo($max_2) ;  ?>";
var max_3 = "<?php echo($max_3) ;  ?>";

var next_1 = "<?php echo($no_1+1) ;  ?>";
var next_2 = "<?php echo($no_2+1) ;  ?>";
var next_3 = "<?php echo($no_3+1) ;  ?>"; 


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


	
function next_page_1(){ if(Number(no_1)+1 <= Number(max_1)){ next_1 = Number(no_1)+1; show_page_1(); }  }
function next_page_2(){ if(Number(no_2)+1 <= Number(max_2)){ next_2 = Number(no_2)+1; show_page_2(); }  }
function next_page_3(){ if(Number(no_3)+1 <= Number(max_3)){ next_3 = Number(no_3)+1; show_page_3(); }  }



function back_page_1(num_1){ if(Number(no_1)-1 >= 1){ next_1= Number(no_1)-1; show_page_1(); } }
function back_page_2(num_2){ if(Number(no_2)-1 >= 1){ next_2= Number(no_2)-1; show_page_2(); } }
function back_page_3(num_3){ if(Number(no_3)-1 >= 1){ next_3= Number(no_3)-1; show_page_3(); } }



function active_btn_1(nomor_1){ dijawab_1 = dijawab_1+1; belum_1= belum_1-1; $('#no_'+nomor_1+'_1').removeClass('btn-primary');$('#no_'+nomor_1+'_1').removeClass('btn-info');	$('#no_'+nomor_1+'_1').addClass('btn-success');	$('#dijawab_1').html(dijawab_1);	 $('#belum_1').html(belum_1);	 }
function active_btn_2(nomor_2){ dijawab_2 = dijawab_2+1; belum_2= belum_2-1; $('#no_'+nomor_2+'_2').removeClass('btn-primary');$('#no_'+nomor_2+'_2').removeClass('btn-info');	$('#no_'+nomor_2+'_2').addClass('btn-success');	$('#dijawab_2').html(dijawab_2);	 $('#belum_2').html(belum_2);	 }
function active_btn_3(nomor_3){ dijawab_3 = dijawab_3+1; belum_3= belum_3-1; $('#no_'+nomor_3+'_3').removeClass('btn-primary');$('#no_'+nomor_3+'_3').removeClass('btn-info');	$('#no_'+nomor_3+'_3').addClass('btn-success');	$('#dijawab_3').html(dijawab_3);	 $('#belum_3').html(belum_3);	 }

 

function go_page_1(num_1){ next_1= num_1; show_page_1(); }
function go_page_2(num_2){ next_2= num_2; show_page_2(); }
function go_page_3(num_3){ next_3= num_3; show_page_3(); }



function show_page_1(){ hidden_page_1(); no_1= next_1; $('#page_'+next_1+'_1').removeClass('hidden_1'); if(next_1+1 <= max_1){ next_1= next_1+1; } }
function show_page_2(){ hidden_page_2(); no_2= next_2; $('#page_'+next_2+'_2').removeClass('hidden_2'); if(next_2+1 <= max_2){ next_2= next_2+1; } }
function show_page_3(){ hidden_page_3(); no_3= next_3; $('#page_'+next_3+'_3').removeClass('hidden_3'); if(next_3+1 <= max_3){ next_3= next_3+1; } }
 

  
 
 
 
 
  
</script> 

