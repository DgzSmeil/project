		var path="/Estate";
		var mobile_code="";
		var InterValObj;
		var count=60;
		var curcount;
		function getPhoneCode(){
			curcount=count;
			var phone = $('#phone').val();
			if(phone != ""){
				$('#vcode').attr("disabled",true);
				$('#vcode').val(curcount+"秒后重发验证码");
				InterValObj = setInterval(setRemainTime, 1000);
				alert(InterValObj);
				checkPhoneIsExist();
			}else if(phone.length != 11){
				alert("请输入11位的手机号码！");
			}else if(!myreg.test(phone)){
				alert("请输入有效的验证号码！");
			}else if(checkPhoneIsExist()){
				alert("该号码已被注册！");
			}else{
				alert("手机号码并不能为空！");
			}
		}	
		
		 function setRemainTime() {  
		
			    if (curcount == 0) {  
			        clearInterval(InterValObj);//停止计时器  
			        $("#vcode").removeAttr("disabled");//启用按钮  
			        $("#vcode").val("重新发送验证码");   
			        code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效      
			    }  
			    else {  
			    	  curcount--;  
			    	  $("#vcode").val(curcount + "秒后可重发验证码");  
			    }  
			}  
		
		function checkPhoneIsExist(){
	         var phone = $('#phone').val();
	         var url = path+"/agency/yzm";
	   			$.ajax({
	   	            type: "POST",
	   	            url: url,
	   	            data: {
	   	            	"agency.phone":phone
	   	            },
	   	            dataType: "text",
	   	            success: function(data) {  
	   	            	if(data!=0){
	   	            		mobile_code=data;
	   	            	}
	   	            },
	   	            error: function() {
	   	                alert("错误");             
	   	            }
	   	        }); 
	       }
		
		
		 function checkyzm(){
			 var yzm =  $('#code').val();
			 if($('#code').val().length==0){
					$('#code').parent().next().next("div").text("");
					$('#code').parent().next().next("div").css("color",'#ccc');
					return;
			 }else if(yzm!=mobile_code){
				 	document.getElementById( "div10" ).className = "form-group has-error";
					$('#code').parent().next("div").text("验证码错误 请重新输入");
					$('#code').parent().next("div").css("color",'red');
					return;
			 }else{
					document.getElementById( "div10" ).className = "form-group has-success";
					$('#code').parent().next().next("div").text("");
			 }		
			
		 }
