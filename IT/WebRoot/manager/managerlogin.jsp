<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<title>管理中心</title> 
<script type="text/javascript" src="manager/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="manager/images/login.js"></script>
<link href="manager/css/login2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="images/login.js"></script>
<link href="css/login2.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="<%=basePath %>images/lo.png" type="image/x-icon"/>	
</head>
<body>
<h1>管理中心入口<sup>2017</sup></h1>

<div class="login" style="margin-top:50px;">
    <div class="header">
        <div class="switch" id="switch"><a class="switch_btn_focus" id="switch_qlogin" href="javascript:void(0);" tabindex="7">快速登录</a>
        </div>
    </div>    
    <div class="web_qr_login" id="web_qr_login" style="display: block; height: 280px;width:500px">    

		<div class="web_login" id="web_login">
			<div class="login-box">
				<div class="login_form">
					<form action="<%=basePath %>loginservlet?order=manager" name="loginform"  id="login_form" class="loginForm" method="post"><input type="hidden" name="did" value="0"/>
		               <c:if test="${msg!=null}">
		            	<script type="text/javascript">
		            		alert("${msg}");
		            	</script>
		            </c:if>
		               <input type="hidden" name="to" value="log"/>
		                <div class="uinArea" id="uinArea">
		                	<label class="input-tips" for="u">账号：</label>
		                	<div class="inputOuter" id="uArea">
		                    	<input type="text" id="u" name="name" class="inputstyle"/>
		                	</div>
		                </div>
		                <div class="pwdArea" id="pwdArea">
		                	<label class="input-tips" for="p">密码：</label> 
		               		<div class="inputOuter" id="pArea">
		                    	<input type="password" id="p" name="password" class="inputstyle"/>
		                	</div>
		                </div>
		                <div class="uinArea" id="uinArea">
		                	<label class="input-tips" for="u">验证码：</label>
		                	<div class="inputOuter" id="uArea" >
		                    	<div style="float:left"><input type="text" id="u" name="code" class="inputstyle" style="width:110px;float:left"/></div>
		                		<div><img src="${pageContext.request.contextPath }/enimg.jsp"  width="110" height="40" style="width:80px;float:left;height:41px;"  id="codes"  alt="点击换一张"  onclick="refresh();"/></div>
		                	</div>
		                </div>
		          <div style="padding-left:50px;margin-top:20px;"><input type="submit" value="登 录" style="width:150px;" class="button_blue"/></div>
              </form>
           </div>
			</div>
		</div>
	</div>
</div>
<div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
</body>
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
			document.getElementById("codes").src= '${pageContext.request.contextPath }/enimg.jsp?'+Math.random();
		}
	</script>
</html>
