var type = '';
$(function(){
		var hash = location.hash;
		if(hash == '#deal'){
			$('.recover-box h3').text('手机找回交易密码');
			type = 'dealpwd';
		}else{
			$('.recover-box h3').text('手机找回登录密码');
			type = 'resetPwd';
		}
		//获取验证码
		$('#getMsgCode').click(function(){
			var phone= $('#phone').val();
			if(phone==''){
				showError('请输入手机号',$('#phone'));
				return;
			};
			utils.getSmsCode($(this),phone,type);
		});
		$('#step1').click(function(){
			var param = {
					code:$('#msgcode').val(),
					type:type
			};
			utils.ajax({
		        url:'checkMobilePhoneCode.do',
		        data:JSON.stringify(param),
		        dataType:'json',
		        success: function(data){
		        	if(data.error =='0'){
		        		step();
		        	}else{
		        		utils.toast(data.msg);
		        	}
		        }
			});
		})
});
function step(){
	$('.step').hide();
	$('.step-two').show();
	//提交
	$('#submit').bind('click',function(){
		var msgCode = $('#msgcode').val();
		if(msgCode==''){
			showError('请输入短信验证码',$('#msgcode'));
			return;
		};
		submit();
	});
}

//提交修改密码
function submit(){
	var pwdOne = $('#pwd').val();
	var pwdTwo = $('#pwd-c').val();
	if(pwdOne==''){
		showError('请输入密码',$('#pwd'));
		return;
	};
	if(pwdTwo==''){
		showError('请输入确认密码',$('#pwd-c'));
		return;
	};
	if(pwdOne!=''&&pwdOne!=pwdTwo){
		showError('两次密码输入不一致',$('#pwd-c'));
		return;
	};
	$('#submit').addClass('disabled').text('提交中...').unbind('click');
	
	var param={
			mobilePhone:$('#phone').val(),
			passwd:pwdOne,
			confirmpassword:pwdTwo,
			type:type
	};
	var url = '';
	if(type == 'dealpwd'){
		url = 'front/updateUserdealpwd.do';
	}else{
		url = 'front/findLoginPwd.do';
	}
	utils.ajax({
        url:url,
        data:JSON.stringify(param),
        dataType:'json',
        success: function(data){
        	if(data.error =='0'){
        		$('.step').hide();
        		$('.step-three').show();
        		$('#login').click(function(){
        			window.location.href="login.html";
        		})
        		$('#submit').removeClass('disabled').text('登录').bind('click',function(){
        			submit();
        		});
        	}else{
        		utils.alert(data.msg);
        		$('#submit').removeClass('disabled').text('提交').bind('click',function(){
        			submit();
        		});
        	}
        }
    })
}
//错误提示
function showError(msg,obj){
	$('.error-msg').text(msg).addClass('show');
	obj.parent('.from').addClass('error');
	obj.focus(function(){
		obj.parent('.from').removeClass('error');
		$('.error-msg').removeClass('show');
	});
}
