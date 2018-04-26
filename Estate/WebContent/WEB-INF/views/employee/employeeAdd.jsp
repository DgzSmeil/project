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

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>

<body style="background-color: white">


<div class="pageheader">
	<h2> 员工管理<span>添加员工</span></h2>
	<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
</div>

	<div class="contentpanel">
		<!-- content goes here... -->

     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path%>/emp/employeesAdd" id="form1">
				<input type="hidden" name="employee.angency_id" value="${agency.id }">
				<input type="hidden" name="employee.id" value="${employee.id}"/>
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">员工姓名：</label>
				  <div class="col-sm-4">
					<input type="text" id="name" name="employee.name" placeholder="请输入员工姓名" data-placement="right" title="与实际员工姓名保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div2">
				  <label class="col-sm-3 control-label">手机号码：</label>
				  <div class="col-sm-4">
					<input type="text" maxlength="11" id="phone" name="employee.phone" placeholder="输入手机号码" data-placement="right" title="与实际手机号码保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div3">
				  <label class="col-sm-3 control-label">邮箱地址：</label>
				  <div class="col-sm-4">
					<input type="email" id="email" name="employee.email" placeholder="输入邮箱地址" data-placement="right" title="与实际邮箱保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div4">
				  <label class="col-sm-3 control-label">基础工资：</label>
				  <div class="col-sm-4">
					<input type="number" id="basic_salary" name="employee.basic_salary" placeholder="输入基础工资" data-placement="right" title="与实际基础工资保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">负责楼盘：</label>
				  <div class="col-sm-4">
					 <select class="select2" id="building_id" name="employee.building_id" data-placeholder="请选择房塬类型...">
					 	<option value=""></option>
					 	<s:iterator value="#request.buildingsList" var="d">
		                 <option value="${d.id }">${d.name }</option>
		                </s:iterator>
				  	</select>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
			   

				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button class="btn btn-primary btn-lg" id="btn_employee"> 添加 </button>&nbsp;
						<button type="reset" class="btn btn-default btn-lg"> 重置 </button>
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

<s:if test="#request.msg!=null">
	<script type="text/javascript">
		alert("${msg}");
	</script>
</s:if>
</body>
</html>
