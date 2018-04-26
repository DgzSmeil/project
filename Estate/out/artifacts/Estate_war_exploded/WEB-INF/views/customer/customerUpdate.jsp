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
<html lang="zh-cn">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
  <link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
  <script src="<%=path %>/js/html5shiv.js"></script>
  <script src="<%=path %>/js/respond.min.js"></script>
  <title>添加客户</title>

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
  <link href="<%=path %>/css/style.default.css" rel="stylesheet">
  <link href="<%=path %>/css/fullcalendar.css" rel="stylesheet">
  
</head>
<body style="background-color: white">


<div class="pageheader">
	<h2>客户管理<span>修改客户信息</span></h2>
</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
	<form id="form1" class="form-horizontal" style="width:400px;" action="<%=path %>/customer/update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="customer.id" value="${customer.id}"/>
		<input type="hidden" name="customer.employee_id" value="${customer.employee_id}"/>
		<input type="hidden" name="customer.created_time" value="${customer.created_time}"/>
		<input type="hidden" name="customer.status" value="${customer.status}"/>
	  <div class="form-group">
	    <label for="name" class="col-sm-4 control-label">姓名</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="name" name="customer.name" value="${customer.name}" placeholder="客户姓名">
	    </div>
	  </div>
	  <div class="form-group">
	  	<label for="gender" class="col-sm-4 control-label">性别</label>
	     <s:if test='customer.gender=="男"'>
		     <label class="checkbox-inline">
			    <input type="radio" id="gender" name="customer.gender" value="男" checked>男
			    <input type="radio" id="gender" name="customer.gender" value="女">女
		  	</label>
	  	</s:if>
	  	<s:if test='customer.gender=="女"'>
	  	<label class="checkbox-inline">
		    <input type="radio" id="gender" name="customer.gender"  value="男">男
		    <input type="radio" id="gender" name="customer.gender"  value="女" checked>女
	  	</label>
	  	</s:if>
	  </div>
	 <div class="form-group">
	    <label for="birthday" class="col-sm-4 control-label">生日</label>
	    <div class="col-sm-8">
	      <input type="date" class="form-control" id="birthday" name="customer.birthday" value="${customer.birthday}" placeholder="生日">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="identity_id" class="col-sm-4 control-label">身份证号</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="identity_id" name="customer.identity_id" value="${customer.identity_id}" placeholder="身份证号码">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="email" class="col-sm-4 control-label">邮箱</label>
	    <div class="col-sm-8">
	      <input type="email" class="form-control" id="email" name="customer.email" value="${customer.email}" placeholder="邮箱地址">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="phone" class="col-sm-4 control-label">手机号</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="phone" name="customer.phone" value="${customer.phone}" placeholder="手机号码">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="address" class="col-sm-4 control-label">地址</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="address" name="customer.address" value="${customer.address}" placeholder="联系地址">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="customer_type" class="col-sm-4 control-label">客户类型</label>
	    <div class="col-sm-8" id="customer_type">
	    <select class="form-control" id="customer_type" name="customer.customer_type">
	    	<s:if test='customer.customer_type=="预约客户"'>
			      <option selected="selected">预约客户</option>
				  <option>预定客户</option>
				  <option>购房客户</option>
		    </s:if>
			<s:if test='customer.customer_type=="预定客户"'>
			      <option>预约客户</option>
				  <option selected="selected">预定客户</option>
				  <option>购房客户</option>
		    </s:if>
		    <s:if test='customer.customer_type=="购房客户"'>
			      <option>预约客户</option>
				  <option>预定客户</option>
				  <option selected="selected">购房客户</option>
		    </s:if>
		    </select>
		</div>
	  </div>
	  <div class="form-group">
	    <label for="together" class="col-sm-4 control-label">购房人姓名</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="together" name="customer.together" value="${customer.together}" placeholder="共同购房人姓名">
	    </div>
	  </div>
	  <div class="form-group">
	    <label class="col-sm-4 control-label">购房合同</label>
	   	<div class="col-sm-8">
	    	<input type="file" id="contract" name="upload">
	    	 <input type="hidden" id="contract2" value="${customer.contract }" name="customer.contract">
	    	<p class="help-block">电子版购房合同</p>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="archives" class="col-sm-4 control-label">客户档案</label>
	    <div class="col-sm-8">
	    	<input type="file" id="archives" name="upload">
	    	<input type="hidden" id="archives2" value="${customer.archives }" name="customer.archives">
	    	<p class="help-block">zip店子档案路径</p>
	    </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-4 col-sm-8">
	      <button type="submit" class="btn btn-primary form-control" id="submit_btn">修改</button>
	    </div>
	  </div>
</form>
</div></div>
</div>
<script src="<%=path %>/js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
$(function() {
	$("#submit_btn").bind("click", function() {
		$("#form1").submit();
	});

})

var input = document.getElementById("contract");
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
</script>
</html>