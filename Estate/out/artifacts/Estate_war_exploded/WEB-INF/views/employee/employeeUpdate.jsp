<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
	Agency agency = (Agency)session.getAttribute("agency");
%>
<%@page import="com.gs.pojo.Agency"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="images/favicon.png" type="image/png">

        <title>房天下后台管理</title>

  <link href="<%=path %>/css/style.default.css" rel="stylesheet">
  <link href="<%=path %>/css/fullcalendar.css" rel="stylesheet">
  <link href="<%=path %>/css/sweetalert.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>

<body style="background-color: white">


<div class="pageheader">
	<h2> 员工管理<span>修改员工</span></h2>
	<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
</div>

	<div class="contentpanel">
		<!-- content goes here... -->

     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path%>/emp/employeeUpdate" id="form1">
				<input type="hidden" id="agency_id" name="agency_id" value="${agency.id }">
				<input type="hidden" id="angency_id" name="employee.angency_id" value="${agency.id }">
				<input type="hidden" id="id" name="employee.id" value="${employee.id}"/>
				<input type="hidden" id="pwd" name="employee.pwd" value="${employee.pwd}">
				<input type="hidden" id="qq" name="employee.qq" value="${employee.qq}">
				<input type="hidden" id="wechat" name="employee.wechat" value="${employee.wechat}">
				<input type="hidden" id="gender" name="employee.gender" value="${employee.gender}">
				<input type="hidden" id="exp" name="employee.exp" value="${employee.exp}">
				<input type="hidden" id="des" name="employee.des" value="${employee.des}">
				<input type="hidden" id="address" name="employee.address" value="${employee.address}">
				<input type="hidden" id="headicon" name="employee.headicon" value="${employee.headicon}">
				<input type="hidden" id="intro" name="employee.intro" value="${employee.intro }">
				<input type="hidden" id="created_time" name="employee.created_time" value="${employee.created_time }">
				<input type="hidden" id="status" name="employee.status" value="${employee.status }">
				<div class="form-group" id="div1">
				  <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label">员工姓名：</label>
				  <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
					<input type="text" id="name" name="employee.name" placeholder="请输入员工姓名" value="${employee.name }" data-placement="right" title="与实际员工姓名保持一致" class="form-control tooltips">
				  </div>
				   <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div2">
				  <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label">手机号码：</label>
				  <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
					<input type="number" id="phone" name="employee.phone" placeholder="输入手机号码" value="${employee.phone }" data-placement="right" title="与实际手机号码保持一致" class="form-control tooltips">
				  </div>
				   <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div3">
				  <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label">邮箱地址：</label>
				  <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
					<input type="email" id="email" name="employee.email" placeholder="输入邮箱地址" value="${employee.email }" data-placement="right" title="与实际邮箱保持一致" class="form-control tooltips">
				  </div>
				   <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div4">
				  <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label">基础工资：</label>
				  <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
					<input type="number" id="basic_salary" name="employee.basic_salary" placeholder="输入基础工资" value="${employee.basic_salary }" data-placement="right" title="与实际基础工资保持一致" class="form-control tooltips">
				  </div>
				   <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div5">
				  <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label">负责楼盘：</label>
				  <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
					 <select class="select2" id="building_id" name="employee.building_id" data-placeholder="请选择房塬类型...">
					 	<option value="${buildings.id }">${buildings.name }</option>
					 	<s:iterator value="#request.buildingsList" var="d">
					      	<option value="${d.id }">${d.name }</option>
		                </s:iterator>
		               
				  	</select>
				  </div>
				</div>

				<div class="form-group">
				  <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label"></label>
				  <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
						<button class="btn btn-primary form-control" id="btn_employee">修改</button>&nbsp;
				  </div>
				</div>
				<br/>
			   
			  </form>
			  
			</div><!-- panel-body -->
			
		</div>
		
</div><!-- contentpanel -->
	


<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=path %>/js/jquery-ui-1.10.3.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/modernizr.min.js"></script>
<script src="<%=path %>/js/jquery.sparkline.min.js"></script>
<script src="<%=path %>/js/toggles.min.js"></script>
<script src="<%=path %>/js/retina.min.js"></script>
<script src="<%=path %>/js/jquery.cookies.js"></script>

<script src="<%=path %>/js/jquery.autogrow-textarea.js"></script>
<script src="<%=path %>/js/bootstrap-timepicker.min.js"></script>
<script src="<%=path %>/js/jquery.maskedinput.min.js"></script>
<script src="<%=path %>/js/jquery.tagsinput.min.js"></script>
<script src="<%=path %>/js/jquery.mousewheel.js"></script>
<script src="<%=path %>/js/select2.min.js"></script>
<script src="<%=path %>/js/dropzone.min.js"></script>
<script src="<%=path %>/js/colorpicker.js"></script>

<script src="<%=path %>/js/custom.js"></script>
<script src="<%=path %>/js/sweetalert-dev.js"></script>
<script src="<%=path %>/js/emp_add.js"></script>
<script>
jQuery(document).ready(function(){
    
    "use strict";
  
  // Tags Input
  jQuery('#tags').tagsInput({width:'auto'});
  
  // Select2
  jQuery(".select2").select2({
    width: '100%'
  });
  jQuery('#open_date').datepicker();
  
 
});

//返回
$("#back").click(function(){
	window.history.back(-1);
})

</script>
</body>
</html>
