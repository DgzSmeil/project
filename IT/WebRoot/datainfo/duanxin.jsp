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
    <meta name="csrf-token" content="TTRKOVkxVFk8ZiYKNAg3aCV3c0k7dAw1NAcjZgZXHgYlVyNNOG46IA==">
    <title>找回密码</title>
    <link href="https://static4.51cto.com/home/ucenter/css/register.css?v=10000" rel="stylesheet">
<link href="https://static4.51cto.com/home/ucenter/css/register20160929.css?v=10005" rel="stylesheet">
<script src="https://static3.51cto.com/home/ucenter/js/reg_2015/jquery-1.8.3.min.js?v=10000"></script>
<script src="https://static3.51cto.com/home/ucenter/js/analyse.js?v=10000"></script>
<script src="https://static1.51cto.com/home/ucenter/js/reg_2015/pub.js?v=10000"></script>
<script src="<%=basePath %>js/findPassword.js?v=10000"></script>
<script src="<%=basePath %>js/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>xinxi/js/jquery.js"></script>

</head>
<script type="text/javascript">
$(function  () {
	//获取短信验证码
	var validCode=true;
	$(".msgs").click (function  () {
		var time=60;
		var code=$(this);
		if (validCode) {
			validCode=false;
			code.addClass("msgs1");
		var t=setInterval(function  () {
			time--;
			code.html(time+"秒");
			if (time==0) {
				clearInterval(t);
			code.html("重新获取");
				validCode=true;
			code.removeClass("msgs1");

			}
		},1000)
		}
	})
})
</script>
<script type="text/javascript">
	$(function(){
   			$("#registerName").bind("mouseout",function(){
   				$.post(
   					"${pageContext.request.contextPath}/studentservlet",
   					{
   						"order":"findword",
   						"registerName":$("#registerName").val()
   					},
   					function(data){
   						if(data=="输入正确"){
   							$("#red_ts").html("<font color='green'>"+data+"</font>");
   						}else{
   							$("#red_ts").html("<font color='red'>"+data+"</font>");
   							return false;
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


<!--头部文件-->
<div class="nav">
    <div class="nav_nr">
        <dl class="nav1">
            <dt><a href="<%=basePath %>courselistservlet?order=list" target="_blank"><img src="<%=basePath%>image/itlogo.png" style="" alt="IT课堂"></a></dt>
        </dl>
        <dl class="nav2">
            <dt><a href="<%=basePath %>datainfo/login.jsp">登录</a></dt>
            <dd><a href="javascript:void(0);" target="_blank">常见问题</a></dd>
        </dl>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        var doc=document,inputs=doc.getElementsByTagName('input'),supportPlaceholder='placeholder'in doc.createElement('input'),placeholder=function(input){var text=input.getAttribute('placeholder'),defaultValue=input.defaultValue;
            if(defaultValue==''){
                input.value=text}
            input.onfocus=function(){
                if(input.value===text){this.value=''}};
            input.onblur=function(){if(input.value===''){this.value=text}}};
        if(!supportPlaceholder){
            for(var i=0,len=inputs.length;i<len;i++){var input=inputs[i],text=input.getAttribute('placeholder');
                if((input.type==='text')&&text){placeholder(input)}}}});
</script>

<!--头部文件结束-->
<form name="reg" method="post" onsubmit="return check_submit();" action="<%=basePath %>studentservlet?order=duanxincheckpassword">
<input type="hidden" id="pwd" value="1111"/> 
    <div class="zczh">
        <h2>找回密码</h2>
        <div class="form-group">
            <div style="position: relative">
                <input class="string required form-control" id="registerName" name="registerName" onblur ="checkReisterType(this.name);" onkeyup="checkReisterType(this.name);" placeholder="请输入邮箱或手机号"required="required" type="text" autocomplete="off">
                <div class="sjhzc">请输入有效的邮箱或者手机号
                    <span><img src='https://static2.51cto.com/home/web/images/reg_2015//bbline.png'></span>
                </div>
                <span class="loading"><img src='https://static2.51cto.com/home/web/images/reg_2015/ajax-loader-big.gif' height="16" width="16"></span>
            </div>
            <span id="red_ts" class="red_ts registerName"></span>
            <div class="regr">
                <div class="code" id="sms_verify_code_wrapper" style="display: block">
                    <input   class="verify-code string user_verify" id="codev" maxlength="4" name="codev" placeholder="验证码" type="text" value=""  onblur="checkVerify(this.name);" onkeyup="checkVerify(this.name);"  />
                    <img id="w0-image"  class="boxyzm_yy" src="${pageContext.request.contextPath }/enimg.jsp" alt="图片无法加载" title="点击换图" style="cursor:pointer" onclick="refresh();">
                </div>
                <span class="red_ts codev" id="codepass"></span>
                <div class="code" id="sms_verify_code_wrapper" style="display: block">
                    <input  autocomplete="off" class="verify-code string user_verify" id="verify_code" maxlength="8" name="verify_code"    placeholder="短信验证码" type="text" value="" onblur="checkCode(this.name,'registerName');" onkeyup="checkCode(this.name,'registerName');" />
                    <input  class="msgs" value="获取验证码" href="javascript:;" onclick="set_time_code(this)" id="get_verify" tabindex="-1" title="接收短信是免费的" readonly="readonly"/>
                    
                    <!-- 
                    <span class="msgs" id="getcode" style="margin-left:20px;margin-top:20px;display:inline-block;width:118px;color:#fff;font-size:12px;border:1px solid #0697DA;text-align:center;height:35px;line-height:35px;background:#0697DA;cursor:pointer;" >获取短信验证码</span>
                	-->
                </div>
                <span id="getcodepassword" class="red_ts verify_code"></span>
                <input  id="userpwd" name="password" onkeyup="pwStrength(this.value)" value="" onBlur="pwStrength(this.value)" onChange="pwStrength(this.value)" size="15" name="password" placeholder="密码"  type="password" autocomplete="off" />
                <span class="red_ts password" id="userpassword"></span>
                <div class="sjhzc">请输入有效的邮箱或者手机号
                    <span><img src='https://static2.51cto.com/home/web/images/reg_2015/bbline.png'></span>
                </div>
                <div id="strength_L" class="mmqd">
                    密码强度：弱
                    <ul>
                        <li class="red"></li><li class="grey"></li><li class="grey"></li>
                    </ul>
                </div>
                <div id="strength_M" class="mmqd">
                    密码强度：中
                    <ul>
                        <li class="red"></li><li class="yellow"></li><li class="grey"></li>
                    </ul>
                </div>
                <div id="strength_H" class="mmqd">
                    密码强度：强
                    <ul>
                        <li class="red"></li><li class="yellow"></li><li class="green"></li>
                    </ul>
                </div>
            </div>
            <span class="red_ts noncode"><a target="_blank" href="http://51ctohome.blog.51cto.com/1805422/1717145">验证码收不到怎么办?</a></span>
            <span class="red_ts commit"></span>
            <div class="form-group1">
                <input class="btn input-submit"  name="commit" type="submit" value="修改">
            </div>
        </div>
        <div class="form-group">
            <h3>使用第三方账号</h3>
            <div class="login-way">
                <div class="login-wayin">
                    <a  class="wxin"></a>
                    <a  class="QQ"></a>
                    <a  class="wb"></a>
                    <a  class="gh"></a>
                </div>
            </div>
        </div>
    </div></form>

<div class="fixexit_small">
    <div class="infixexit">
        <div class="exit_list exit_list_fkui jsFeedCallBack"><a href="javascript:void(0);" class="ina"><b>意见<br />反馈</b></a></div>

        <div class="exit_list exit_list_zxun"><a href="<%=basePath %>datainfo/login.jsp" class="ina" target="_blank"></a></div>
    </div>
</div>
<input type="hidden" id="regType">
<input type="hidden" id="re_registerName">
<input type="hidden" id="re_codev">
<input type="hidden" id="re_checkUser">
<input type="hidden" id="re_password">
<input type="hidden" id="re_verify_code">
<input type="hidden" id="token" value="">
<input type="hidden" id="ref_url" value="http://home.51cto.com/index/?reback=http%3A%2F%2Fedu.51cto.com%2Fcenter%2Fuser%2Findex%2Flogin-success%3Fsign%3D8ee1fbpGnUXtgNe_Pad982Mp4eHhDNtupizX2hFw28dLtO9FMKfbnAg2CdO6skOor1_KqqQkyZuApd82jW6zPzu6mA%26client%3Dweb">
<script src="https://static2.51cto.com/home/web/js/yii/yii.captcha.js?v=10001"></script>
<script type="text/javascript">jQuery(document).ready(function () {
jQuery('#w0-image').yiiCaptcha({"refreshUrl":"\/forgot-password\/captcha?refresh=1","hashKey":"yiiCaptcha\/forgot-password\/captcha"});
});</script><script src="https://logs.51cto.com/rizhi/count/count.js"></script>

<div style="display:none">
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
  <script type="text/javascript">
            var uid = '0';
            var _educto = _educto || [];
            _educto.push(['_setUserId',uid]);
        </script>
<script type="text/javascript">
            document.write(decodeURI("%3Cscript src='https://tongji.51cto.com/cto.js/3d7ca8d8c01f7e7b50250ff1c15bdae3' type='text/javascript'%3E%3C/script%3E"));
</script>
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
		function refresh(){
			document.getElementById("w0-image").src= '${pageContext.request.contextPath }/enimg.jsp?'+Math.random();
		}
	</script>
	<script type="text/javascript">
	$("#get_verify").bind("click",function(){
		$.post(
			"${pageContext.request.contextPath}/apiservlet?order=sendcode",
			{
				"phone":$("#registerName").val()
			},
			function(data){
				$("#pwd").val(data);
			},
			"text"
		);
	});
	function checkCode(obj,name){
	    var code = $("#"+obj).val();
	    var inputcode = $("#verify_code").val();
		var outputcode = $("#pwd").val();
	    if(code == ''){
	        showMess(obj,'请输入验证码'); 
	        return false;
	    }
		if(inputcode!=outputcode){
			showMess(obj,'验证码错误');
			return false;
		}
		if(inputcode==outputcode){
			showMess(obj,"<span class='font_green12' >输入正确</span>");
			return true;
		}
    }
	function showMess(name,mess){
	    $("."+name).show();
	    $("."+name).html(mess);
	}
	
	function check_submit(){
	   var name = $("#red_ts").text();
	   var imgcode = $("#getcodepassword").text();
	   var duanxincode = $("#codepass").text();
	   var password = $("#userpwd").val();
	   if(password==''){
	   		$("#userpassword").html("<span class='font_red' >请输入密码</span>");
	   		return false;
	   }
	   var checkpassword = $("#userpassword").text();
	   if(name=='输入正确' && imgcode=='输入正确' && duanxincode=='输入正确' && checkpassword==''){
	   		return true;
	   }else{
	   		return false;
	   
	   }
	}
	//验证验证码
	function checkVerify(obj){
	    var codevalue = $("#"+obj).val();
	    var classN = "";
	    var falg = false;
	    if(codevalue==""){
	        showMess(obj,"输入验证码!");
	        return false;
	    }
	}
	$("#codev").bind("mouseout",function(){
			$.post(
				"${pageContext.request.contextPath}/studentservlet?order=checkcode",
				{
					"code":$("#codev").val()
				},
				function(data){
					if(data=='输入正确'){
						$("#codepass").html("<span class='font_green12' >输入正确</span>");
					}else{
						$("#codepass").html("输入错误");
					}
				},
				"text"
			);
		
		});
</script>
</html>

