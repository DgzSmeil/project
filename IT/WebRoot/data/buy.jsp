<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="SQLBean.StudentBean"%>
<%@page import="SQLBean.CourseBean"%>
<%@page import="SQLBean.ExchangeCodeBean"%>
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
		var money = form1.money.value;
		var summoney = document.getElementById("summoney").innerHTML;
		var str="";
		if(money!=null){
			str = summoney.substring(1,summoney.length); 
			document.getElementById("summoney").innerHTML="￥"+(str-money);
			document.getElementById("mymoney").value=(str-money);
		}
	}
</script>
</head>
<body>
<%
	StudentBean bean = (StudentBean)session.getAttribute("bean");
	CourseBean coursebean =(CourseBean)session.getAttribute("coursebean");
	//ExchangeCodeBean exbean = (ExchangeCodeBean)session.getAttribute("exbean");
%>
	<div class="panel admin-panel margin-top">
	<div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>课程的购买</strong><strong style="float:right"><span class="icon-pencil-square-o"></span>学生姓名：<%=bean.getStudentname()%></strong></div>
		<div class="body-content">
		<form method="post" name="form1" name="form1" class="form-x" action="<%=basePath %>data/pwd.jsp" >
		    <input type="hidden" name="mymoney" id="mymoney" value="<%=coursebean.getPrice() %>">
		    <label style="font-size:24px;text-align:center">订单名称：</label><label style="font-size:24px"><%=coursebean.getCourse_name() %></label><br><br><br>
		    <label style="font-size:24px;text-align:center">订单金额：</label><label id="summoney" style="font-size:24px;color:red">￥<%=coursebean.getPrice()*(1-coursebean.getDiscount()) %></label><br><br><br>
	        <label style="font-size:24px;text-align:center">交易时间：</label><label style="font-size:24px;"><%=new Date().toLocaleString() %></label><br><br><br>
	        <label style="font-size:24px;text-align:center">交易方式：</label><input name="fangshi" value="1" type="radio" checked="checked">支付宝 <input name="fangshi" value="2" type="radio" >微信支付     <br><br><br>
	        <div class="form-group">
        <div class="label">
          <label style="font-size:24px;text-align:center">优惠券：</label>
        </div>
        <div class="field">
          <select name="money" class="input w50" onchange="check();">
            <option value="0">请选择优惠券</option>
			<c:forEach items="${exbean}" var="e">
				<option value="${e.exchangemeony}">${e.exchangemeony}<input type="hidden" name="code" value="${e.exchangecode}"></option>
			</c:forEach>
          </select>
          </div>
        </div>
      </div>
	        <div class="field">
	          <button class="button bg-main icon-check-square-o" type="submit">确认付款</button> <button class="button bg-main icon-check-square-o" type="reset">取消支付</button>
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