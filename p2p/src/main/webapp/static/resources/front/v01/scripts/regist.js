var isPhoneRegist, isUserRegist, isSend = false;
var localObj = window.location;
var basePath = localObj.protocol + "//" + localObj.host;
$(function(){
    var useCode = $("#useCode").val();
    if(useCode !=''){
        $("#asda").show();
        $("#useCode").attr("readOnly","true");
    }
    $(".icon-bottom").click(function(){
        $("#asda").show();
    })
    utils.initInput();
	/*
	var phone;
	$('.code').one('click',function(){
		$('.from-ext').attr('class','from fadeOutUpBig');
	});
	//极验
	var handlerPopup = function (captchaObj) {
		$(".btn").bind('click',function () {
			if($(this).hasClass('disabled'))return;
			regist(captchaObj);
		});
		// 将验证码加到id为captcha的元素里
		captchaObj.appendTo("#popup-captcha");
		// 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
	};
	// 验证开始需要向网站主后台获取id，challenge，success（是否启用failback）
	var url = " " + (new Date()).getTime();
	$.ajax({
		url: url, // 加随机数防止缓存
		type: "get",
		dataType: "json",
		success: function (data) {
			// 使用initGeetest接口
			// 参数1：配置参数
			// 参数2：回调，回调的第一个参数验证码对象，之后可以使用它做appendTo之类的事件
			initGeetest({
				gt: data.gt,
				challenge: data.challenge,
				product: "popup", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
				offline: !data.success // 表示用户后台检测极验服务器是否宕机，一般不需要关注
				// 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
			}, handlerPopup);
		}
	});
*/
	//获取验证码
	$('#getMsgCode').click(function(){
		phone = $('#phone').val();
		if(phone==''){
			showError('请输入手机号',$('#phone'));
			return;
		} else if(utils.isPhone(phone)){
            showError('请输入正确手机号',$('#phone'));
            return;
        };
		addAssignmentDebt(phone);
	});

});


//验证码
function addAssignmentDebt(phone){
	utils.Dialog(true);
	$('.claimm-from').show();
	$('.claimm-from .close').click(function(){
		utils.Dialog();
		$('.claimm-from').hide();
	});
	$('#claimm-price').val('');
	$('#claimm-submit').unbind('click').bind('click',function(){
        var url = basePath + "/user/isPhoneExist";
        $.post(
            url,
            {
                phone:phone
            },
            function (data) {
                if (data.result === 'exist') {
                    showError("手机号已存在！",$(obj));
                    return;
                } else {
                    var code = $('#claimm-price').val();
                    if (code == '') {
                        utils.alert('请输入图中验证码');
                        return;
                    } else {
                        $.post(basePath + '/user/checkCode',
                            {code:code},
                            function(data){
                                utils.Dialog();
                                $('.claimm-from').hide();
                                if(data.result == 'ok'){
                                    isSend = true;
                                    $('#getMsgCode').attr("disabled", true);
                                    // console.log($('#getMsgCode'));
                                    utils.getSmsCode($('#getMsgCode'), phone);
                                }else{
                                    utils.alert('验证码错误！');
                                }
                            },
                            "json"
                        )
                    }
                }
            },
            "json"
        );
	});
}

//进行注册
function regist(){
    var phone = $('#phone').val();
    var username = $('#username').val();
    var pwd = $('#pwd').val();
    var msgCode = $('#msgcode').val();
    var userCode = $('#useCode').val();
    if(username==''){
        showError('请输入用户名', $('#username'));
        return;
    };
    if(phone==''){
        showError('请输入手机号', $('#phone'));
        return;
    };
    if(utils.isPhone(phone)){
        showError('请输入正确的手机号码', $('#phone'));
        return;
    };
    if(pwd==''){
        showError('请输入登录密码', $("#pwd"));
        return;
    } else if (pwd.length<6) {
        showError("密码为6-18个字符！",$("#pwd"));
        return;
    };
    if(msgCode==''){
    	showError('请先输入短信验证码',$("#msgcode"));
    	return;
    } else {
        if (!isSend) {
            utils.alert('请获取短信验证码!');
            return;
        } else {
            $.post(
                basePath + "/user/checkmsgCode",
                {
                    smsCode:msgCode
                },
                function(data){
                    if (data.result === 'ok') {
                        if(!$('#agree').is(':checked')){
                            utils.alert('请勾选服务协议!');
                            return;
                        }
                        $('.btn').text('注册中...').addClass('disabled');
                        var param={
                            uname:username,
                            upwd:pwd,
                            phone:phone,
                            tzm:userCode
                        };
                        $.post(
                            basePath + "/user/save",
                            param,
                            function (data) {
                                if (data.result === 'ok') {
                                    utils.alert('注册成功！',function(){
                                        window.location.href= basePath + '/user/login_page';
                                    });
                                } else {
                                    utils.alert('注册失败！');
                                }
                                $('.btn').text('注册').removeClass('disabled');
                            },
                            "json"
                        );
                    } else {
                        utils.alert("验证码错误，请重新输入！");
                        return;
                    }
                },
                "json"
            );
        }
    };
}

//验证手机号是否注册
function chosePhone(obj){
	var phone = $(obj).val();
	if(phone == ''){
		showError("请输入手机号码",$(obj));
		return;
	} else if (utils.isPhone(phone)) {
        showError("请输入正确的手机号码",$(obj));
        return;
    };
    var url = basePath + "/user/isPhoneExist";
    $.post(
        url,
        {
            phone:phone
        },
        function (data) {
            if (data.result === 'exist') {
                showError("手机号已存在！",$(obj));
                return;
            }
        },
        "json"
    );
};
//验证用户名是否存在
function choseUser(obj){
	var name = $(obj).val();
	if(name == ''){
		showError("请输入用户名",$(obj));
		return;
	};
}
//验证密码是否合法
function chosePwd(obj){
    var pwd = $(obj).val();
    if(pwd == ''){
        showError("请输入密码！",$(obj));
        return;
    } else if (pwd.length<6) {
        showError("密码为6-18为字符！",$(obj));
        return;
	};
}

//验证推荐码是否存在
// function choseUserCode(obj){
//     var userCode = $(obj).val();
//     if (userCode != '') {
//         $.post(
//             basePath + "/user/isUserCodeExist",
//             {
//                 tzm:userCode
//             },
//             function (data) {
//                 if (data.result === 'unexist') {
//                     showError("推荐码不存在，请重新输入！",$(obj));
//                     return;
//                 } else if (data.result === 'exist') {
//
// 				}
//             },
//             "json"
//         );
// 	}
// };
/**
 * 添加推荐人ID
function addUserCode() {
    var phone = $('#phone').val();
    var username = $('#username').val();
    var pwd = $('#pwd').val();
    var userCode = $('#userCode').val();
    $.post(
        basePath + "/user/save",
        {
            tzm:userCode
        },
        function (data) {

        },
        "json"
    );
}*/
//错误提示
function showError(msg,obj){
	$('.error-msg').text(msg).addClass('show');
	obj.parent('.from').addClass('error');
	obj.focus(function(){
		obj.parent('.from').removeClass('error');
		$('.error-msg').removeClass('show');
	});
}
//查看平台服务协议
function AgreeMent(val){
	var id = '31';
	if(val == 1){
		id='12';
		$('.AgreeMent .title').text('风险提示书');
	}else{
		$('.AgreeMent .title').text('普金资本服务协议');
	}
	utils.Dialog(true);
	$('.AgreeMent').fadeIn();
	$('.AgreeMent .close').click(function(){
		$('.AgreeMent').hide();
		utils.Dialog();
	});
	$('.AgreeMent .popup-area').empty();
	var param={TypeId:id}; 
	utils.ajax({
        url:' ',
        data:JSON.stringify(param),
        dataType:'json',
        success: function(data){
        	if(data.error == '0'){
        		$('.AgreeMent .popup-area').html(data.content);
        		
        	}
        }
    });
}
