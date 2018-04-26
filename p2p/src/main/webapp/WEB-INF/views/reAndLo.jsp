<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<%@page import="java.net.URLDecoder"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta name="keywords" content="Sign In And Sign Up Forms  Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
	<title>登录与注册</title>
	<link href="<%=path %>/user/css/style.css" rel="stylesheet" rel="stylesheet" >
	<link href="<%=path %>/user/css/popup-box.css" rel="stylesheet" type="text/css" media="all" />
	<link href="<%=path %>/user/easyui/themes/default/easyui.css" rel="stylesheet">
	<link href="<%=path %>/user/easyui/themes/icon.css" rel="stylesheet" >
	
	<!-- 提示窗口 -->
	<link href="<%=path%>/Css/sweetalert.css" rel="stylesheet" />
	<script src="<%=path%>/Js/sweetalert-dev.js"></script>	

</head>
<body>

	               <!--手机号已注册的提示信息  -->
	<%
		String msg1 = (String)request.getAttribute("msg1");
		if(msg1!=null){
		%>
			<script>
			swal("${msg1}","","error");
	       	</script>  
	    <%		
		}
	%>
	
	               <!--登录失败的提示信息  -->
	<%
		String msg2 = (String)request.getAttribute("msg2");
		if(msg2!=null){
		%>
			<script>
	       		swal("${msg2}","","error");
	       	</script>  
	    <%		
		}
	%>	
	
	<%
  		if(session.getAttribute("user")!=null){
  			response.sendRedirect(path+"/user/skipUserInfo");
  		}else{
	  		//读取cookie变量的值
	  		Cookie cookies[]=request.getCookies();
	  		String mobile = "";
	  		String pass="";
	  		//如果没有cookie则，数组为空
	  		if(cookies!=null){
	  			for(int i=0;i<cookies.length;i++){
	  				Cookie c = cookies[i];
	  				//System.out.println(c.getName()+"="+c.getValue());
	  				if(c.getName().equals("mobile")){
	  					//解码操作URLDecoder.decode();
	  					mobile = URLDecoder.decode(c.getValue());//获取cookie的值
	  				}
	  				if(c.getName().equals("password")){
	  					pass = URLDecoder.decode(c.getValue());//获取cookie的值
	  				}
	  			}
	  		}%>
	  		<c:if test="${msg==null}">
		       <%
		       		if(!mobile.equals("") && !pass.equals("")){
		  			%>
						<jsp:forward page="http://localhost:8080/RealEstate/user/autoLogin">
							<jsp:param name="mobile" value="<%=mobile%>"/>
							<jsp:param name="password" value="<%=pass%>"/>
						</jsp:forward>  			
		  			
		  			<%
		  			}
		       %>
	       </c:if>
	       <%
       }
  	 %>
       
	<h1>登录与注册</h1>
	<div class="w3layouts">
		<div class="signin-agile">
			<h2 align="center">登录</h2>
			
			<form action="<%=path %>/user/login" method="post">
				<input type="text" name="user.user_phone" placeholder="手机号码" title="请输入已注册的手机号" maxlength="12" required="required" 
					onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" class="name" >
				<input type="password" name="user.user_pwd" placeholder="密码" title="请输入密码" maxlength="16" required="required" class="password" >
				<ul>
					<li>
						<input type="checkbox" checked="checked" id="brand1" value="">
						<label for="brand1"><a>记住密码</a></label>
					</li>
				</ul>
				<a href="<%=path %>/user/skipForgetPsd">忘记密码？</a><br>
				<div class="clear"></div>
				<input type="submit" value="登录">         
			</form>
		</div>
		<div class="signup-agileinfo">
			<h3>注册通行证</h3>
			<p>如果你想拥有一个充分利用你所爱的土地的独特地理和景观的新家园！！！</p>
			<div class="more">
				<a class="book popup-with-zoom-anim button-isi zoomIn animated" data-wow-delay=".5s" href="#small-dialog">免费注册</a>				
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="footer-w3l">
		<p class="agileinfo"> 2017房产营销平台*版权所有  <a href="#" target="_blank">***</a>
 </p>
	</div>
	<div class="pop-up"> 
	<div id="small-dialog" class="mfp-hide book-form">
		<h3>用户注册</h3>
		<form name="form1" action="<%=path %>/user/register" method="post"
			 onsubmit="return checkYzm()">
			<input type="text" name="user.user_nickname" placeholder="用户名" title="推荐使用中文;4-12位字符" maxlength="12" required=""/>				
			<input type="password" name="user.user_pwd" id="passwd" placeholder="密码" title="密码由6-16个半角字符组成" maxlength="16" class="password" required=""/>
			<!--  <input type="password" name="password" id="repasswd" placeholder="确认密码" class="password" required=""/>-->
			<input type="text" name="user.user_phone" id="user_phone"  placeholder="手机号码"
			   pattern="[0-9]{11}"  title="手机号码为11位数字" maxlength="11"  required=""
			   onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" />
			<input type="text" name="yzm" id="yzm" placeholder="验证码" pattern="[0-9]{6}" title="验证码为6位数字" maxlength="6" required=""
			   onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" style="width: 50%"/>
			<input type="button" id="ycode" value="获取短信验证码" onclick="return getPhoneCode();" />		
			<!-- <input type="submit" value="注册" onclick="checkPsd()" /> -->
			<input type="submit" value="注册" />                             
		</form>          
	</div>                     
</div>	
</body>
	<script src="<%=path %>/static/js/jquery.min.js"></script>
	<script src="<%=path %>/user/js/jquery.magnific-popup.js" ></script>
	<script src="<%=path %>/user/js/modernizr.custom.53451.js"></script> 
	<script src="<%=path %>/user/easyui/jquery.easyui.min.js"></script>
	<script src="<%=path %>/user/easyui/locale/easyui-lang-zh_CN.js"></script>
	<script src="<%=path %>/user/js/user.js"></script>
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<script>
		$(document).ready(function() {
			$('.popup-with-zoom-anim').magnificPopup({
				type: 'inline',
				fixedContentPos: false,
				fixedBgPos: true,
				overflowY: 'auto',
				closeBtnInside: true,
				preloader: false,
				midClick: true,
				removalDelay: 300,
				mainClass: 'my-mfp-zoom-in'
			});																
		});
	</script>	
	
	<script>
		var mobile_code;               //手机验证码
		var InterValObj;
		var count=60;
		var curcount;
		function getPhoneCode(){
			curcount=count;
			var phone = $('#user_phone').val();
			var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/; 
			if(phone != ""){
				$('#ycode').attr("disabled",true);
				$('#ycode').val(curcount+"秒后重发验证码");

			}else if(phone.length != 11){				
				alert('请输入11位的手机号码!');
				return false;
//			}else if(!myreg.test(phone)){
//				alert("请输入有效的验证号码！");
//			}else if(checkPhoneIsExist()){
//                checkPhoneIsExist();
//				alert("该号码已被注册！");
//			}else{
//				alert("手机号码并不能为空！");
			}
            SendDxModel();
            InterValObj = window.setInterval(SetRemainTime, 1000);
		}
		
		 function checkPhoneIsExist(){
            var phone = $("#user_phone").val();
            var url = "${pageContext.request.contextPath}/dxModel/save";
   			$.ajax({
   	            type: "POST",
   	            url: url,
   	            data: {
   	            	"phone":phone
   	            },
   	            dataType: "text",
   	            success: function(data) {  
   	            	if(data!=0){
   	            		mobile_code=data;
   	            		//alert(mobile_code);
   	            	}
   	            },      
   	            error: function() {
   	                alert("错误");             
   	            }
   	        }); 
	     }

        function SendDxModel(){
            var phone = $("#user_phone").val();
            var url = "${pageContext.request.contextPath}/dxModel/save";
            $.ajax({
                type: "POST",
                url: url,
                data: {
                    "phone":phone
                },
                dataType: "text",
                success: function(data) {
                    if(data!=0){
                        mobile_code=data;
                        //alert(mobile_code);
                    }
                },
                error: function() {
                    alert("错误");
                }
            });
        }
		 
		 function SetRemainTime() {  
		    if (curcount == 0) {                  
		        window.clearInterval(InterValObj);//停止计时器  
		        $("#ycode").removeAttr("disabled");//启用按钮  
		        $("#ycode").val("重新发送验证码");  
		        code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效      
		    }  
		    else {  
		    	curcount--;  
		        $("#ycode").val(curcount + "秒后可重发验证码");  
		    }  
		 }		       
	</script>   
		
</html>