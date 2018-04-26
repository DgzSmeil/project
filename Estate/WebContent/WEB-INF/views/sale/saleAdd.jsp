<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
    
    <% 
    	String path = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
  <link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=path %>/css/bootstrapValidator.min.css" rel="stylesheet">
  <script src="<%=path %>/js/bootstrapValidator.min.js"></script>
  <script src="<%=path %>/js/zh_CN.js"></script>
  <script src="<%=path %>/js/html5shiv.js"></script>
  <script src="<%=path %>/js/respond.min.js"></script>
<title>Insert title here</title>
<link href="<%=path %>/css/style.default.css" rel="stylesheet">
  <link href="<%=path %>/css/fullcalendar.css" rel="stylesheet">
 
</head>
<body style="background-color: white">
<div class="pageheader">
	<h2>销售管理<span>添加销售记录</span></h2>
	
</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
	<form id="form1" class="form-horizontal form-bordered" action="<%=path %>/sale/add" method="post" enctype="multipart/form-data">
		<input type="hidden" id="emp_id" name="sale.emp_id" value="${employee.id}"/>
		<input type="hidden" id="customer_id" name="sale.customer_id" value="${customer.id}">
	  <div class="form-group">
	    <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label">房屋名称</label>
	    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
			<select  class="select2" id="room_id" name="sale.room_id">  
		        <s:iterator value="#request.roomlist" var="d">
		  	   		<option value="${d.id}">${d.name }</option>   
		  		</s:iterator>
			</select>
		</div>
	  </div>
	  <div class="form-group">
	    <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label">销售折扣</label>
	    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
	      <input type="text" class="form-control" id="discount" name="sale.discount" placeholder="销售折扣" placeholder="提成百分比" data-placement="right" title="请输入范围在0~1之间的销售折扣，可填可不填" class="form-control tooltips">
	    </div>
	  </div>
	  <div class="form-group">
	  	<label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label"></label>
	    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
	      <button type="submit" class="btn btn-primary form-control" id="btn_add">新增</button>
	    </div>
	  </div>
</form>
</div>
</div>
</div>
<script>
jQuery(document).ready(function(){
    
  // Select2
  jQuery(".select2").select2({
    width: '100%'
  });
 
});
</script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/select2.min.js"></script>
</body>

</html>