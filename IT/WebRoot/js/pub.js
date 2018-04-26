	$(function(){
			//禁用回车
		document.onkeypress=function(e) {   
			  var code;     
			  if  (!e)     
			  {     
				  var e=window.event;     
			  }     
			  if(e.keyCode)     
			  {       
				  code=e.keyCode;     
			  }     
			  else if(e.which)     
			  {     
				  code   =   e.which;     
			  }   
			  if(code==13)   
			  {   
				 return false;   
			}
		}	
	});

	function showMess(name,mess){
		$("."+name).show();
		$("."+name).html(mess);
		$("#re_"+name).val(0);
	}

	function hideMess(name){
		$("."+name).hide();
		$("."+name).html("");
	}
	
	