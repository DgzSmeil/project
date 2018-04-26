<%@page import="com.gs.pojo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
    <% 
    String path = request.getContextPath();
    %>
    <%
		Employee employee = (Employee)session.getAttribute("employee");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 使用viewport技术检测当前屏幕的大小,把网页的大小设置成屏幕的大小
	width=device-width,把网页的绽放比例设置成未绽放
 -->
 <meta name="viewport" content="width=device-width, initial-scale=1">

<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
<script src="<%=path %>/js/html5shiv.js"></script>
<script src="<%=path %>/js/respond.min.js"></script>
<title>Insert title here</title>
<link href="<%=path %>/css/style.default.css" rel="stylesheet">
<link href="<%=path %>/css/fullcalendar.css" rel="stylesheet">
</head>
<body style="background-color: white">
<div class="pageheader">
	<h2>账户设置<span>修改信息</span></h2>
	
</div>
	<div class="contentpanel">
     
    	<div class="panel panel-default">
		<div class="panel-body panel-body-nopadding">
<form class="form-horizontal" action="<%=path %>/emp/update" style="width:400px;" method="post" id="form1" enctype="multipart/form-data">
	<input type="hidden" id="id" name="employee.id" value="${employee.id}"/>
	<input type="hidden" id="pwd" name="employee.pwd" value="${employee.pwd}"/>
	<input type="hidden" id="basic_salary" name="employee.basic_salary" value="${employee.basic_salary}"/>
	<input type="hidden" id="angency_id" name="employee.angency_id" value="${employee.angency_id}"/>
	<input type="hidden" id="building_id" name="employee.building_id" value="${employee.building_id}"/>
	<input type="hidden" id="created_time" name="employee.created_time" value="${employee.created_time}"/>
	<input type="hidden" id="status" name="employee.status" value="${employee.status}"/>
  	<div class="form-group">
    <label for="name" class="col-sm-4 control-label">姓名</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="name" name="employee.name" value="${employee.name}" placeholder="员工姓名">
    </div>
  </div>
  <div class="form-group">
    <label for="email" class="col-sm-4 control-label">邮箱</label>
    <div class="col-sm-8">
      <input type="email" class="form-control" id="email" name="employee.email" value="${employee.email}" placeholder="邮箱地址">
    </div>
  </div>
  <div class="form-group">
    <label for="phone" class="col-sm-4 control-label">手机号码</label>
    <div class="col-sm-8">
      <input type="text" maxlength="11" class="form-control" id="phone" name="employee.phone" value="${employee.phone}" placeholder="手机号码">
    </div>
  </div>
  <div class="form-group">
    <label for="qq" class="col-sm-4 control-label">QQ号</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="qq" name="employee.qq" value="${employee.qq}" placeholder="QQ号">
    </div>
  </div>
  <div class="form-group">
    <label for="wechat" class="col-sm-4 control-label">微信号</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="wechat" name="employee.wechat" value="${employee.wechat}" placeholder="微信号">
    </div>
  </div>
  <div class="form-group">
  	<label for="gender" class="col-sm-4 control-label">性别</label>
     <s:if test='employee.gender=="男"'>
	     <label class="checkbox-inline">
		    <input type="radio" id="gender" name="employee.gender" value="男" checked>男
		    <input type="radio" id="gender" name="employee.gender" value="女">女
	  	</label>
  	</s:if>
  	<s:if test='employee.gender=="女"'>
  	<label class="checkbox-inline">
	    <input type="radio" id="gender" name="employee.gender"  value="男">男
	    <input type="radio" id="gender" name="employee.gender"  value="女" checked>女
  	</label>
  	</s:if>
  </div>
 
  <div class="form-group">
	  <label class="col-sm-4 control-label">工作经验:</label>
	  <div class="col-sm-8">
		<textarea id="exp" name="employee.exp" class="form-control" rows="3">${employee.exp}</textarea>
	  </div>
  </div>
  <div class="form-group">
	  <label class="col-sm-4 control-label">个人说明:</label>
	  <div class="col-sm-8">
		<textarea id="des" name="employee.des" class="form-control" rows="3">${employee.des}</textarea>
	  </div>
  </div>
  <div class="form-group">
    <label for="address" class="col-sm-4 control-label">地址:</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="address" name="employee.address" value="${employee.address}" placeholder="地址">
    </div>
  </div>
 <div class="form-group">
   <label class="col-sm-4 control-label">头像</label>
   <div class="col-sm-8">
   	 <img id="img" src="<%=path%>/upload/${employee.headicon }" class="img-rounded"  onclick="F_Open_dialog()" style="width:100px;height:80px">
     <input type="file" id="headicon" name="upload" value="${employee.headicon }" placeholder="请选择头像" style="display:none">
   	 <input type="hidden" id="headicon2" value="${employee.headicon }" name="employee.headicon">
   </div>
  </div>
  <div class="form-group">
    <label class="col-sm-4 control-label">简介:</label>
    <div class="col-sm-8">
      <textarea id="intro" name="employee.intro" rows="3" class="form-control">${employee.intro}</textarea>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-4 col-sm-8">
      <button type="submit" class="btn btn-primary" id="submit_btn">修改</button>
    </div>
  </div>
</form>
</div>
</div>
</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#submit_btn").bind("click", function() {
			$("#form1").submit();
		});
	
	})
var input = document.getElementById("headicon");
var $img = $('#img');
//文件域选择文件时, 执行readFile函数
input.addEventListener('change',readFile,false);
function readFile(){
var file=this.files[0];
    //alert(file.name);
var $file = $(this);
var fileObj = $file[0];
var windowURL = window.URL || window.webkitURL;
var dataURL;
dataURL = windowURL.createObjectURL(fileObj.files[0]);
 //alert(dataURL);
$img.attr('src',dataURL);
}
function F_Open_dialog() 
{ 
	document.getElementById("headicon").click(); 
} 
</script>

</html>