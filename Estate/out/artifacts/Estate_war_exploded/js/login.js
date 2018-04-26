	$("input[name='manager.name']").blur(function(){
			$("input[name='manager.name']").next("div").text("");
			$("input[name='manager.name']").next("div").css("color",'#ccc');
			$("input[name='password']").next("div").text("");
			$("input[name='password']").next("div").css("color",'#ccc');
	});
	//密码
	$("input[name='password']").blur(function(){
		$("input[name='manager.name']").next("div").text("");
		$("input[name='manager.name']").next("div").css("color",'#ccc');
		$("input[name='password']").next("div").text("");
		$("input[name='password']").next("div").css("color",'#ccc');
	})
	$("input[name='manager.phone']").blur(function(){
		$("input[name='phonecode']").next("div").text("");
		$("input[name='phonecode']").next("div").css("color",'#ccc');
		$("input[name='manager.phone']").next("div").text("");
		$("input[name='manager.phone']").next("div").css("color",'#ccc');
	});
	$("input[name='phonecode']").blur(function(){
			$("input[name='phonecode']").next("div").text("");
			$("input[name='phonecode']").next("div").css("color",'#ccc');
			$("input[name='manager.phone']").next("div").text("");
			$("input[name='manager.phone']").next("div").css("color",'#ccc');
	});
	
//	提交按钮
	$("button[name='accountlogin']").click(function(e){		
		if($("input[name='manager.name']").val().length==0){				
			$("input[name='manager.name']").focus();
			$("input[name='manager.name']").next("div").text("此处不能为空");
			$("input[name='manager.name']").next("div").css("color",'red');
			e.preventDefault();
			return false;
		}
		if($("input[name='password']").val().length==0){				
			$("input[name='password']").focus();
			$("input[name='password']").next("div").text("此处不能为空");
			$("input[name='password']").next("div").css("color",'red');
			e.preventDefault();
			return false;
		}
		
		
			if($("input[name='manager.name']").val().length>0 && $("input[name='manager.name']").val().length<4){
				$("input[name='manager.name']").next("div").text("长度只能在4-20个字符之间");
				$("input[name='manager.name']").next("div").css("color",'red');
				$("input[name='manager.name']").focus();
				e.preventDefault();
				return false;
			}else if($("input[name='manager.name']").val().length>=4&& !isNaN($("input[name='manager.name']").val())){
				$("input[name='manager.name']").next("div").text("用户名不能为纯数字");
				$("input[name='manager.name']").next("div").css("color",'red');
				$("input[name='manager.name']").focus();
				e.preventDefault();
				return false;
			}
				

		//密码
	
			if($("input[name='password']").val().length>0 && $("input[name='password']").val().length<6){
				$("input[name='password']").next("div").text("长度只能在6-20个字符之间");
				$("input[name='password']").next("div").css("color",'red');
				$("input[name='password']").focus();
				e.preventDefault();
				return false;
			}
	
	});
	
	


