<script>    var site = "<?php echo($site) ;  ?>/";  


 function filters(data){   	data = data.toLowerCase(); 
  	data = data.replace(/  /g,' '); 
   	data = data.replace(/ /g,'-'); 
   	data = data.replace(/#/g,'-'); 
    	data = data.replace(/&/g,'-and-'); 
    	data = data.replace(/--/g,'-'); 
    	data = data.replace(/--/g,'-'); 
    	data = data.replace(/\//g,''); 
     	data = data.replace(/\\/g,''); 
     	data = escape(data); 
   	  	data = "ltrings" +data+'rtrings'; 
   	data = data.replace(/ltrings-/g,''); 
    	data = data.replace(/-rtrings/g,''); 
    	data = data.replace(/rtrings/g,''); 
    	data = data.replace(/ltrings/g,''); 
    	  	return data; 
   }         	  
 function uang(nums) {  var vals = nums; 
  var vals = vals+""; 
  if (vals == null){  	vals = "0"; 
  }    	vals = vals.replace(/,/g, ""); 
      vals += ''; 
      x = vals.split('.'); 
      x1 = x[0]; 
      x2 = x.length > 1 ? '.' + x[1] : ''; 
        var rgx = /(\d+)(\d{3})/; 
        while (rgx.test(x1)) {          x1 = x1.replace(rgx, '$1' + ',' + '$2'); 
      }    	xx = x1 + x2; 
  	  if (xx == "0"){  	xx = "0"; 
  }  	      return xx; 
    }        
 function judul(text,num){  var str = text; 
  var res = str.split(" "); 
  var t = ""; 
  num = Number(num); 
  var dot =""; 
    if(num < res.length){  	dot = "..."; 
  }     for (i = 0; 
 i < num ; 
 i++) {  	t += res[i]+" "; 
  }    return t+dot; 
  }        </script>             
