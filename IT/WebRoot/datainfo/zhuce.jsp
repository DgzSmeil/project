<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en-US">
	<head>
		<meta charset="UTF-8">
		<meta name="csrf-param" content="_csrf">
		<meta name="csrf-token"
			content="MTJEWkYuNzEcSD4XIHZQX2tiIjwBS2JEd3wTOXJWQ0RWV2lrdh0aYg==">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<title>用户注册</title>
		<link
			href="https://static3.51cto.com/home/web/css/reg_2015/register20160929.css?v=10005"
			rel="stylesheet">
		<script src="<%=basePath %>js/jquery-1.8.3.min.js?v=10001"></script>
		<script src="<%=basePath %>js/yii.js?v=10001"></script>
		<script src="<%=basePath %>js/51cto.js?v=10001"></script>
		<script src="<%=basePath %>js/jquery.message.js?v=10001"></script>
		<script src="<%=basePath %>js/ajaxreg.js?v=10002"></script>
		<script src="<%=basePath %>js/pub.js?v=10001"></script>
		<script src="<%=basePath %>js/analyse.js?v=10002"></script>
		<script src="<%=basePath %>js/zhuce.js"></script>
		<script src="<%=basePath %>js/yii.captcha.js?v=10001"></script>
		<script src="<%=basePath %>js/jquery-1.4.1.min.js"></script>
	</head>
	<script type="text/javascript">
   	function c(){
   		var check = document.getElementById("check").value;
   		var incheck = document.getElementById("incheck").value;
   		if(check!=incheck){
   			alert("验证码输入错误");
   			return false;
   		}
   		return true;
   	}
   </script>
   <script type="text/javascript">
	function check(){
		if($("#codev").val()==""){
			$("#code").html("<font color='red'>请输入验证码。</font>");
			return false;
		}
		if($("#username").val()==""){
			$("#checkUser").html("<font color='red'>请输入用户名称。</font>");
			return false;
		}
		if($("#username").val()==""){
			$("#checkUser").html("<font color='red'>请输入用户名称。</font>");
			return false;
		}
		if($("#userpwd").val()==""){
			$("#red_ts password").html("<font color='red'>请输入密码。</font>");
			return false;
		}
		
	}

</script>
   <script type="text/javascript">
   		$(function(){
   			$("#registerName").bind("mouseout",function(){
   				$.post(
   					"${pageContext.request.contextPath}/studentservlet",
   					{
   						"order":"check",
   						"registerName":$("#registerName").val()
   					},
   					function(data){
   						if(data=="该手机号可以使用！"){
   							$("#red_ts").html("<font color='green'>"+data+"</font>");
   						}else{
   							$("#red_ts").html("<font color='red'>"+data+"</font>");
   						}
   						return ture;
   					},
   					"text"
   				);
   			});
   			$("#username").bind("mouseout",function(){
   				$.post(
   					"${pageContext.request.contextPath}/studentservlet",
   					{
   						"order":"checkusername",
   						"username":$("#username").val()
   					},
   					function(data){
   						if($("#username").val()!=""){
   							$("#checkUser").html("<font color='green'>"+data+"</font>");
   							return ture;
   						}
   					},
   					"text"
   				);
   			});
   		});
   
   </script>
	<script type="text/javascript">
	function refresh(){
		document.getElementById("codes").src= '${pageContext.request.contextPath }/enimg.jsp?'+Math.random();
	}
	</script>
	<body>
		<!--头部文件-->
		<div class="nav">
			<div class="nav_nr">
				<dl class="nav1">
					<dt>
						<a href="<%=basePath %>courselistservlet?order=list"
							target="_blank"><img src='<%=basePath %>image/itlogo.png'
								alt="" style="width: 130px">
						</a>
					</dt>
					<dd>
						账号通行证
					</dd>
				</dl>
				<dl class="nav2">
					<dt>
						<a href="<%=basePath %>datainfo/login.jsp">登录</a>
					</dt>
					<dd>
						<a target="_blank">常见问题</a>
					</dd>
				</dl>
			</div>
		</div>
		<!--头部文件结束-->
		<form action="<%=basePath %>studentservlet?order=add" method="post"
			name="form1">
			<div class="zczh">
				<h2>
					注册账号
				</h2>
				<div class="form-group">
					<div style="position: relative">
						<input class="string required form-control" id="registerName"
							name="registerName"
							placeholder="请输入有效账号"  required="required" type="text"
							autocomplete="off" onblur ="return checkReisterType(this.name);"/>
						<span class="loading"><img
								src='<%=basePath %>images/ajax-loader-big.gif'
								height="16" width="16">
						</span>

					</div>
					<span id="red_ts" class="red_ts registerName"></span>
					<div class="regr">
						<div class="code" id="sms_verify_code_wrapper">
							<input onblur="return checkVerify(this.name);"
								onkeyup="return checkVerify(this.name);"
								class="verify-code string user_verify" id="codev" maxlength="4"
								name="codev" placeholder="验证码" type="text" value="" />
							<a class="boxyzm_yy " id="captchaImage"><img id="codes"
									src="${pageContext.request.contextPath }/enimg.jsp"
									alt="图片无法加载" title="点击换图" onclick="refresh();"
									style="cursor: pointer"></img>
							</a>
						</div>
						<span class="red_ts codev" id="code"></span>
						<span class="red_ts verify_code"></span>
						<input name="checkUser" id="username" onblur="return checkIsUser(this.name);" value="" placeholder="用户名"type="text" autocomplete="off" />
						<div class="sjhzc">
							请输入有效账号
							<span><img
									src='https://static4.51cto.com/home/web/images/reg_2015/bbline.png'>
							</span>
						</div>
						<span class="red_ts checkUser" id="checkUser"
							style="display: block"><div style="color: #1b66c7">
								用户名一旦设置成功，不能修改
							</div>
						</span>
						<input id="userpwd" onkeyup="pwStrength(this.value)" value=""
							onBlur="pwStrength(this.value)" onChange="pwStrength(this.value)"
							size="15" name="password" placeholder="密码" type="password"
							autocomplete="off" />
						<span class="red_ts password"></span>
						<div class="sjhzc">
							请输入有效账号
							<span><img
									src='https://static4.51cto.com/home/web/images/reg_2015/bbline.png'>
							</span>
						</div>
						<div id="strength_L" class="mmqd">
							密码强度：弱
							<ul>
								<li class="red"></li>
								<li class="grey"></li>
								<li class="grey"></li>
							</ul>
						</div>
						<div id="strength_M" class="mmqd">
							密码强度：中
							<ul>
								<li class="red"></li>
								<li class="yellow"></li>
								<li class="grey"></li>
							</ul>
						</div>
						<div id="strength_H" class="mmqd">
							密码强度：强
							<ul>
								<li class="red"></li>
								<li class="yellow"></li>
								<li class="green"></li>
							</ul>
						</div>
					</div>
					 <p class="ydxy"><input type="checkbox" checked name="checkbox" onclick ="check_provision()" value=""><span>我已经认真阅读并同意<a target="_blank" href="javascript:void(0);">《it课堂服务条款》</a></span></p>
				    <span  class="red_ts provision"></span>
				    <div class="form-group1">
				        <input class="btn input-submit" data-confirm-text="登录" data-loading-text="提交中.." data-login-text="登录" data-loginandsetpassword-text="设置密码并登录" data-register-text="注册" id="submit" name="commit" onclick="return check();" type="submit" value="立即注册">
				    </div>
				    <span class="red_ts noncode"><a target="_blank" href="javascript:void(0)">验证码收不到怎么办?</a></span>
				    <span class="red_ts commit" ></span>
				</div>
				<div class="form-group">
					<h3>
						使用第三方账号
					</h3>
					<div class="login-way">
						<div class="login-wayin">
							<a class="wxin"></a>
							<a class="QQ"></a>
							<a class="wb"></a>
							<a class="gh"></a>
						</div>
					</div>
				</div>
			</div>
		</form>

		<div class="fixexit_small">
			<div class="infixexit">
				<div class="exit_list exit_list_fkui jsFeedCallBack">
					<a href="javascript:void(0);" class="ina"><b>意见<br />反馈</b>
					</a>
				</div>

				<div class="exit_list exit_list_zxun">
					<a class="ina" target="_blank"></a>
				</div>
			</div>
		</div>
		<input type="hidden" id="regType">
		<input type="hidden" id="re_registerName">
		<input type="hidden" id="re_codev">
		<input type="hidden" id="re_checkUser">
		<input type="hidden" id="re_password">
		<input type="hidden" id="re_verify_code">
		<input type="hidden" id="token" value="">
		<input type="hidden" id="ref_url" value="edu.51cto.com">
		<input type="hidden" id="reback"
			value="http://edu.51cto.com/center/user/index/login-success?sign=de2f8R-DxxMVUB0AyDQFs4BBMlhxDWpF6n9NpLxEauDlNOJNglwUK2y21t1AagAL2WFihCID7R2-OVIIObiDi9PNqbcV6VdqHgBBhjdnVA6GyBM8YKu6jWpvUaFjMidtVKn0">
		<script src="https://logs.51cto.com/rizhi/count/count.js"></script>

		<div style="display: none">
			<script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "https://hm.baidu.com/hm.js?844390da7774b6a92b34d40f8e16f5ac";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
	</script>
			<script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-57622524-1', 'auto');
        ga('send', 'pageview');
    </script>
		</div>
		<div style="display: none">


			<script src="https://logs.51cto.com/rizhi/count/count.js"></script>
			<iframe frameborder="0" scrolling="no" width="0" height="0"
				src="http://log.51cto.com/pageview.php?frompos=www_art"></iframe>
			<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?844390da7774b6a92b34d40f8e16f5ac";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
			<script type="text/javascript">
            var uid = '0';
            var _educto = _educto || [];
            _educto.push(['_setUserId',uid]);
        </script>
			<script type="text/javascript">
            document.write(decodeURI("%3Cscript src='https://tongji.51cto.com/cto.js/3d7ca8d8c01f7e7b50250ff1c15bdae3' type='text/javascript'%3E%3C/script%3E"));
</script>

			<script
				src="https://static4.51cto.com/home/web/js/reg_2015/footer.js?v=10002"></script>
			<script type="text/javascript">jQuery(document).ready(function () {
jQuery('#w0-image').yiiCaptcha({"refreshUrl":"\/user\/captcha?refresh=1","hashKey":"yiiCaptcha\/user\/captcha"});
});</script>
	</body>
</html>
