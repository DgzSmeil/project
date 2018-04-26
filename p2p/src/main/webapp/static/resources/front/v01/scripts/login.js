var pullTest = false;
var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;
$(function(){
		utils.initInput();
		var href = utils.getUrlParam('href');
		var ev = utils.getUrlParam('ev');
		var id = utils.getUrlParam('id');
		if(href){
			jumpHref = href+'.html';
		}
		if(id){
			jumpHref = jumpHref + '?id='+id;
		}
		if(ev){
			jumpHref = jumpHref + '&ev='+ev;
		}
		//进度登录条
		var X = $('.pull-box').offset().left;
		var Width = $('.pull-box')[0].offsetWidth;
		var bX = -1;
		$('.pull-btn').bind('mousedown',function(){
			$(document).bind('mousemove',function(e){
				bX = e.pageX-X;
				if(bX<0){
					return;
				}
				if((bX+45)>=Width){
					$(document).unbind('mousemove');
					//验证通过
					$('.pull-default').attr('class','pull-default-true');
					$('.pull-btn').addClass('pull-btn-true');
					$('.pull-bg').html('验证通过').css('width',Width-46+'px');
					pullTest = true;
					return;
				};
				$('.pull-btn').css('left',bX+'px');
				$('.pull-bg').css('width',bX+'px');
			});
		});
		$(document).mouseup(function(){
			$(document).unbind('mousemove');
			if((bX+47)>=Width){
				bX = Width-47;
				$('.pull-btn').css('left',bX+'px');
			}else{
				$('.pull-btn').animate({left:"-1px"});
				$('.pull-bg').animate({width:"0px"})
			}
		})
		//登录
		$('.btn').bind('click',function(){
			submit();
		});
		$("#password").bind('keyup', function(event){
			   if (event.keyCode=="13"){
				   submit();
			   }
		})
});
function submit(){
	var phone = $('#phone').val();
	var password = $('#password').val();
	if(phone==''){
		showError('请输入手机号码',$('#phone'));
        return;
	} else if (utils.isPhone(phone)) {
        showError("请输入正确的手机号码",$('#phone'));
        return;
    };
	if(password==''){
		showError('请输入密码',$('#password'));
		return;
	};
	if(!pullTest){
		utils.toast('请拖动验证码到正确位置');
		return;
	};
    $('.btn').addClass('disabled').text('登录中...').unbind('click');
    var url =basePath + "/login";
    $.post(url,
		{
            phone:phone,
            pwd:password
        },
        function(data){
            if (data.result === 'ok' || data.result === 'logined') {
                window.location.href = "/user/user_home";
            } else{
                utils.alert(data.message);
                $('.btn').removeClass('disabled').text('登录').bind('click',function(){
                    submit();
                });
            }
        },
        "json"
    );
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
