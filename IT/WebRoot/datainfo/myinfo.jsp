<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html>
<html lang="en-US">
	<head>

		<meta name="viewport"
			content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no, email=no" />
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="HandheldFriendly" content="true">
		<meta name="MobileOptimized" content="320">
		<meta name="screen-orientation" content="portrait">
		<meta name="x5-orientation" content="portrait">
		<meta name="full-screen" content="yes">
		<meta name="x5-fullscreen" content="true">
		<meta name="browsermode" content="application">
		<meta name="x5-page-mode" content="app">
		<meta name="msapplication-tap-highlight" content="no">
		<meta charset="UTF-8">
		<meta name="csrf-param" content="_csrf">
		<meta name="csrf-token"
			content="V1NBaGRyMUkPYnkBVhAABgMXNlouXwIeGTEoABwXXw0jYhkBJxRLOA==">
		<title>51CTO技术家园</title>
		<link rel="shortcut icon"
			href="https://static3.51cto.com/home/web/images/favicon.ico"
			type="image/x-icon">
		<link
			href="https://static4.51cto.com/home/web/css/z_sign.min.css?v=100008"
			rel="stylesheet">
		<script
			src="https://static5.51cto.com/home/web/js/jquery.min.js?v=10001"></script>
		<script src="https://static4.51cto.com/home/web/js/51cto.js?v=10001"></script>
		<script
			src="https://static1.51cto.com/home/web/js/public/msg.js?v=10001"></script>
		<script
			src="https://static5.51cto.com/home/web/js/jquery.message.js?v=10001"></script>
		<script src="https://static4.51cto.com/home/web/js/yii/yii.js?v=10001"></script>
		<script
			src="https://static5.51cto.com/home/web/js/yii/yii.activeForm.js?v=10001"></script>
		<script
			src="https://static4.51cto.com/home/web/js/yii/yii.validation.js?v=10001"></script>
	</head>
	<body>

		<div class="sign">
			<div class="loginWrap">
				<a class="logo"></a>
				<div class="loginPic zxflogoPic clearfix">
					<div class="loginImg">
						<a href="http://x.51cto.com/act/cto/camp/page/course_list?dl"
							target="_blank"><img
								src="https://s1.51cto.com/wyfs02/M02/8D/94/wKiom1iifguifAP9AAHpfdkY4jY536.jpg"
								alt="" border="0" />
						</a>
					</div>
					<div class="loginBord" id="login-base">
						<div class="loginTit">

							<div class="tosignup">
								<a target="_blank"
									href="http://51ctohome.blog.51cto.com/1805422/579769"
									style="margin-right: 10px; color: #969696;">无法登录?</a>|
								<a
									href="/user/register?reback=http%3A%2F%2Fgaozhao.51cto.com%2Fresume%2Fadd%3FinviteId%3DMTA1ODgxNjc%3D"
									style="margin-left: 10px; color: #d54e4e;">注册</a>
							</div>

							<h1 style="color: #333;">
								登录IT课堂
							</h1>
						</div>
						<form id="login-form"
							action="/index?reback=http%3A%2F%2Fgaozhao.51cto.com%2Fresume%2Fadd%3FinviteId%3DMTA1ODgxNjc%3D"
							method="post" role="form">
							<input type="hidden" name="_csrf"
								value="V1NBaGRyMUkPYnkBVhAABgMXNlouXwIeGTEoABwXXw0jYhkBJxRLOA==">
							<div class="inpBox textbox_ui user">
								<div class="form-group field-loginform-username required">
									<label class="control-label" for="loginform-username"></label>
									<input type="text" id="loginform-username" class="form-control"
										name="LoginForm[username]" placeholder="用户名/邮箱/手机">

									<div class="custom invalid error_9o8Kl" style="display: none"></div>
								</div>
							</div>
							<div class="inpBox textbox_ui pass zxfpass">
								<div class="form-group field-loginform-password required">
									<label class="control-label" for="loginform-password"></label>
									<input type="password" id="loginform-password"
										class="form-control" name="LoginForm[password]"
										placeholder="密码">

									<div class="custom invalid error_9o8Kl" style="display: none"></div>
								</div>
							</div>


							<div class="clearfix zxfDl">
								<a class="fr"
									href="/forgot-password/find-password?reback=http%3A%2F%2Fgaozhao.51cto.com%2Fresume%2Fadd%3FinviteId%3DMTA1ODgxNjc%3D">忘记密码?</a>
								<label for="agree_userterm" class="fr">
									<div class="form-group field-loginform-rememberme">
										<div class="checkbox">
											<label for="loginform-rememberme">
												<input type="hidden" name="LoginForm[rememberMe]" value="0">
												<input type="checkbox" id="loginform-rememberme"
													name="LoginForm[rememberMe]" value="1">
												10天内自动登录
											</label>
											<div class="custom invalid error_9o8Kl" style="display: none"></div>

										</div>
									</div>
								</label>
								<input type="submit" class="loginbtn fl" name="login-button"
									value="登 录">
							</div>
							<div id="errorMsg"></div>
						</form>
						<div class="zxfWechat">
							<a href="javascript:;" onclick="wechat_login()">微信登录</a>
						</div>
						<div class="otherAccout zxfAccout">
							<p>
								你也可以使用以下账号登录
							</p>
							<div class="z_box">
								<div class="z_a">
									<div class="z_a_m clearfix">
										<a class="a_QQ" href="/third-party/auth?type=qq"><i
											class="iQQ"></i>QQ</a>
										<a href="/third-party/auth?type=sina"><i class="iweibo"></i>微博</a>
										<a href="/third-party/auth?type=douban"><i class="douban"></i>豆瓣</a>
										<a href="/third-party/auth?type=renren"><i class="irenren"></i>人人</a>
										<a href="/third-party/auth?type=github" style="width: 64px;"><i
											class="igitup"></i>github</a>
									</div>
								</div>
							</div>
						</div>
						<div class="shadow_l"></div>
						<div class="shadow_r"></div>
					</div>
					<div class="loginBord" id="login-wechat" style="display: none">
						<div class="loginTit">
							<div class="tosignup">
								<a href="javascript:void(0);" onclick="base_login()"
									class="back_account">返回账号登陆</a>
							</div>
							<h1>
								登录51CTO
							</h1>
						</div>
						<!--20160530检测到微信开始-->
						<div class="code_wxbox">
							<div class="wx_img">
								<img src="" width="185" height="185" id="qr-img">
							</div>
							<div class="wx_0s">
								<div class="ts">
									请使用微信扫描上方二维码
								</div>
								<div class="usehelp">
									<a href="javascript:void(0)">使用帮助</a>
								</div>
							</div>
							<div class="wx_10s" style="display: none">
								<span class="wx_loseicon"></span><span class="wx_losetxt">二维码失效<br />请点击<a
									href="javascript:void(0);" onclick="getQrImg()">刷新二维码</a>
								</span>
							</div>
							<div class="hidetips">
								<img src="public/images/weixin_logintip.png" width="258"
									height="240">
							</div>
						</div>
						<script type="text/javascript">
                $(function(){
                    $('.zxfAccout p').click(function() {
                        $('.z_box').toggle();
                        $('.zxfAccout p').toggleClass('pUp');
                    });
                    function btnbg(zxf_a){
                        $(zxf_a).focus(function() {
                            $('.zxfDl .loginbtn').addClass('zxfBtnbg');
                        });
                        $(zxf_a).blur(function() {
                            if($('.pass input').val() == '' &&  $('.user input').val() == ''){
                                $('.zxfDl .loginbtn').removeClass('zxfBtnbg');
                            }
                        });
                    }
                    btnbg('.pass input');
                    btnbg('.user input');
                    $(".usehelp a").hover(function(){
                        $(".hidetips").show()
                    },function(){
                        $(".hidetips").hide()
                    });

                });
            </script>
						<!--20160530检测到微信结束-->
						<div class="shadow_l"></div>
						<div class="shadow_r"></div>
					</div>
				</div>
			</div>
		</div>



		<script type="text/javascript">

     var timmer_pull = null ;
     var sid = '' ;

     function getQrImg(){

         $('#qr-img').attr('src', 'https://static3.51cto.com/home/web/images/wx_bind/wx_loading.gif');

         $.getJSON('/wechat/get-qr-code', function(data){
             if (data.code == 200){
                 stopPull();

                 $('.wx_10s').hide();
                 $('.wx_0s').show();

                 sid = data.data.sid ;
                 $('#qr-img').attr('src', data.data.img);

                 timmer_pull = setInterval("pull()", 1000) ;
             }else{
             }

         });
     }



     function stopPull(){
         if (timmer_pull != null){
             clearTimeout(timmer_pull);
             timmer_pull = null;
         }
     }
     function pull(){
		 var timestamp = Date.parse(new Date());		 
         $.getJSON('/wechat/scan-pull?sid='+sid+'&time='+timestamp, function(data){

             if (data.code == 200){
                 if (data.data.isok == 1){
                     window.location.href = "/third-party/reg-login?from=http%3A%2F%2Fgaozhao.51cto.com%2Fresume%2Fadd%3FinviteId%3DMTA1ODgxNjc%3D";
                 }
             }else{

                 $('.wx_10s').show();
                 $('.wx_0s').hide();
                 stopPull();
             }

         });

     }

     function wechat_login(){
         $('#login-wechat').show();
         $('#login-base').hide();
         getQrImg();
     }

     function base_login(){
         $('#login-wechat').hide();
         $('#login-base').show();
         stopPull();
     }
     $(function(){
         $(".jsCloseBg").click(function(){
             $("#jsValidateUser").hide();
             $(".jsShaow").hide();
         });
     });
          
 </script>



		<!--意见反馈-->
		<div class="feedback" style="display: none">
			<div class="popyjdatil">
				<dl class="dl_400 pl20 mb10 clearfix">
					<dt class="left mt5 tr">
						意见或建议：
					</dt>
					<dd class="left validation_or">
						<span><textarea name="feedarea" cols="" rows=""
								class="pop_area_320 inputtext_del t12"
								placeholder="请详细描述意见、问题或建议，2-300字以内"></textarea><span
							class="cl_red" id="cl_redp"></span>
						</span>
					</dd>

				</dl>
				<dl class="dl_400 pl20 mb10 clearfix">
					<dt class="left mt5 tr">
						联系方式：
					</dt>
					<dd class="left validation_or">
						<span><input type="text" value="" placeholder="邮箱/QQ号"
								class="pop_input_320 inputtext_del t12" name="feedord"><span
							class="cl_red" id="c1_redb"></span>
						</span>
					</dd>

				</dl>
			</div>
		</div>
		<div class="feedbackstatus" style="display: none">
			<div class="popsuctext">
				您已提交成功！
				<br />
				感谢您的宝贵意见，我们会尽快处理
			</div>
			<div class="regemailloeslist" style="display: none">
				<div class="tl t14 mb15 pl20 emailstatus"></div>
			</div>
		</div>
		<div class="foot">
			<a target="_blank" href="http://www.51cto.com/about/aboutus.html">关于我们</a>
			|
			<a target="_blank" href="http://www.51cto.com/about/zhaopin.html">诚聘英才</a>
			|
			<a target="_blank" href="http://www.51cto.com/about/contactus.html">联系我们</a>
			|
			<a target="_blank" href="http://www.51cto.com/about/history2011.html">网站大事</a>
			|
			<a href="javascript:void(0)" class="ina popyjdatilfeedback">意见反馈</a>
			|
			<a target="_blank" href="http://www.51cto.com/about/map.htm">网站地图</a>
			<br>
			Copyright &copy; 2005-2017
			<a href="Http://www.51cto.com">51CTO.COM</a> 版权所有
		</div>

		<script
			src="https://static3.51cto.com/home/web/js/loginForm.js?v=10007"></script>

		<div style="display: none">
			<script src="https://logs.51cto.com/rizhi/count/count.js"></script>
			<script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "https://hm.baidu.com/hm.js?844390da7774b6a92b34d40f8e16f5ac";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
</script>
		</div>
		<script type="text/javascript">
            var uid = '0';
            var _educto = _educto || [];
            _educto.push(['_setUserId',uid]);
        </script>
		<script type="text/javascript">
            document.write(decodeURI("%3Cscript src='https://tongji.51cto.com/cto.js/3d7ca8d8c01f7e7b50250ff1c15bdae3' type='text/javascript'%3E%3C/script%3E"));
</script>
		<script type="text/javascript">jQuery(document).ready(function () {
jQuery('#login-form').yiiActiveForm([{"id":"loginform-username","name":"username","container":".field-loginform-username","input":"#loginform-username","error":".custom.invalid.error_9o8Kl","encodeError":false,"validate":function (attribute, value, messages, deferred, $form) {yii.validation.required(value, messages, {"message":"账号不能为空"});}},{"id":"loginform-password","name":"password","container":".field-loginform-password","input":"#loginform-password","error":".custom.invalid.error_9o8Kl","encodeError":false,"validate":function (attribute, value, messages, deferred, $form) {yii.validation.required(value, messages, {"message":"密码不能为空"});}},{"id":"loginform-rememberme","name":"rememberMe","container":".field-loginform-rememberme","input":"#loginform-rememberme","error":".custom.invalid.error_9o8Kl","encodeError":false,"validate":function (attribute, value, messages, deferred, $form) {yii.validation.boolean(value, messages, {"trueValue":"1","falseValue":"0","message":"10天内自动登录 must be either \"1\" or \"0\".","skipOnEmpty":1});}}], []);
});</script>
	</body>
</html>
