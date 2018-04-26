<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript">
	function check(){
		if(form1.codemoney.value>10){
			alert("优惠金额小于10！");
			form1.codemoney.focus();
			return false;
		}
		return true;
	}
</script>
<script type="text/javascript">
	function check(){
		var num = parseInt(Math.random()*1000000000);
		form1.codenum.value=num;
	}
</script>
<jsp:include page="/IncludeJS.jsp"></jsp:include>
</head>
<body>
	<div class="panel admin-panel margin-top">
	<div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>优惠券的发布</strong></div>
		<div class="body-content">
		<form method="post" name="form1" class="form-x" action="<%=basePath %>exchangecodeservlet?order=addsave" onsubmit="return check();">
			<div class="form-group">
	        <div class="label">
	          <label>活动名称：</label>
	        </div>
	        <div class="field">
	          <select name="activeid" class="input w50">
	            <option value="">请选择活动名称</option>
	            <c:forEach items="${exchangerecodelist}" var="b">
	            	<option value="${b.activity_id}">${b.activity_name}</option>
	            </c:forEach>
	          </select>
	        </div>
	      </div>
     	<div class="form-group">
			<div class="label">
	          <label>优惠券编码：</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="codenum"  ><button class="button bg-main icon-check-square-o" value="随机产生" onclick="check();" type="button">随机产生</button>
	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
			<div class="label">
	          <label>优惠金额：</label>
	        </div>
	        <div class="field">
	  			<input type="text" class="input w50"  name="codemoney" >
	        <div class="tips"></div>
	        </div>
     	</div>
     	<div class="form-group">
        <div class="label">
          <label>发布时间：</label>
        </div>
        <div class="field">
          <input type="text" name="date" id="publishDate" class="easyui-datebox" style="width:160px；height:40px"/>
          <div class="tips"></div>
        </div>
      </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit">确认发布</button>
        </div>
      </div>
</div>
<script type="text/javascript">
function del(id,mid){
	if(confirm("您确定要删除吗?")){			
		
	}
}
</script>
</body>
</html>