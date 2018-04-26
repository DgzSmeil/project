<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    
    <script>
	$(function () {
	  $('form').bootstrapValidator({
	　　　　　	message: 'This value is not valid',
			feedbackIcons: {
			　　　　valid: 'glyphicon glyphicon-ok',
			　　　　invalid: 'glyphicon glyphicon-remove',
			　　　　validating: 'glyphicon glyphicon-refresh'
			   },
          fields: {
        	  'mission.quantity': {
                  validators: {
                      notEmpty: {
                          message: '员工任务不能为空'
                      }
                  }
              },
	          'mission.bonus_percent': {
	              validators: {
	                  notEmpty: {
	                      message: '提成百分比不能为空'
	                  },
		              stringLength: {/*长度提示*/
		                  min: 1,
		                  max: 2,
		                  message: '请输入1~100之间的提成百分比'
		              },
	              },
	          }
          }
      });
  });
  </script>
</head>
<body style="background-color: white">
<div class="pageheader">
	<h2>绩效管理<span>绩效查看</span></h2>
</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
	<form class="form-horizontal form-bordered" action="<%=path %>/mission/add" method="post">
		<input type="hidden" id="emp_id" name="mission.emp_id" value="${employee.id}"/>
	 	<div class="form-group">
	    <label class="ccol-lg-3 col-md-4 col-sm-6 col-xs-12 control-label">员工任务量</label>
	    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
	      <input type="number" class="form-control" id="quantity" name="mission.quantity" placeholder="员工任务量" data-placement="right" title="请输入员工任务量" class="form-control tooltips">
	    </div>
	  </div>
	  <div class="form-group">
	    <label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label">提成百分比</label>
	    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
	      <input type="number" class="form-control" id="bonus_percent" name="mission.bonus_percent" placeholder="提成百分比" data-placement="right" title="请输入范围在0~100之间的提成百分比" class="form-control tooltips">
	    </div>
	  </div>	  
	  <div class="form-group">
	  	<label class="col-lg-3 col-md-4 col-sm-6 col-xs-12 control-label"></label>
	    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
	      <button type="submit" class="btn btn-primary form-control">新增</button>
	    </div>
	  </div>
</form>
</div>
</div>
</div>
<script src="<%=path %>/js/bootstrap.min.js"></script>
</body>
</html>