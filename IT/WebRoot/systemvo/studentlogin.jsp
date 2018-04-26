<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>登录</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
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
</head>
<body >
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form action="<%=basePath %>loginservlet?order=student" method="post">
	            <c:if test="${msg!=null}">
	            	<script type="text/javascript">
	            		alert("${msg}");
	            	</script>
	            </c:if>
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>登录窗口</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="name" placeholder="登录昵称" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="password" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field">
                            <input type="text" class="input input-big" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" id="check"/>
                           	<img src="${pageContext.request.contextPath }/enimg.jsp" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" id="codes" align="top" alt="点击换一张"  onclick="refresh();">   
                                                   
                        </div>
                    </div>
                </div>
                <div style="padding:30px;"><input type="submit" class="button button-block bg-main text-big input-big" value="登录" onclick="return c();"></div>
            </div>
            </form>          
        </div>
    </div>
</div>
</body>
</html>