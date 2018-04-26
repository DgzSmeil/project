<%@page import="com.gs.pojo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
    <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
  <link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=path %>/css/bootstrapValidator.min.css" rel="stylesheet">
  <script src="<%=path %>/js/bootstrapValidator.min.js"></script>
  <script src="<%=path %>/js/zh_CN.js"></script>
	<script src="<%=path %>/js/html5shiv.js"></script>
	<script src="<%=path %>/js/respond.min.js"></script>
  <title>添加客户</title>
<link href="<%=path %>/css/style.default.css" rel="stylesheet">
  <link href="<%=path %>/css/fullcalendar.css" rel="stylesheet">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
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
        	  'customer.name': {
                  message: '姓名验证失败',
                  validators: {
                      notEmpty: {
                          message: '姓名不能为空'
                      }
                  }
              },
              'customer.email': {
                  validators: {
                      notEmpty: {
                          message: '邮箱地址不能为空'
                      },
                      emailAddress: {
                          message: '邮箱地址格式有误'
                      }
                  }
              },
              'customer.phone': {
	              validators: {
	                  notEmpty: {
	                      message: '手机号不能为空'
	                  },
		              stringLength: {
		                  min: 11,
		                  max: 11,
		                  message: '请输入11位手机号码'
		              },
		              regexp: {
	                         regexp: /^1[3|5|8]{1}[0-9]{9}$/,
	                         message: '请输入正确的手机号码'
	                  }
	              },
	          },
	          'customer.address': {
	              validators: {
	                  notEmpty: {
	                      message: '联系地址不能为空'
	                  }
	              }
	          }
          }
      });
  });
  </script>
</head>
<body style="background-color: white">


<div class="pageheader">
	<h2><i class="glyphicon glyphicon-user"></i>客户管理<span>添加客户</span></h2>
</div>
	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
	
	<form name="form" id="form1" class="form-horizontal" style="width:400px;" action="<%=path %>/customer/add" method="post" enctype="multipart/form-data">
	  <input type="hidden" id="id" name="customer.id" value="${user.id }"></input>
	  <input type="hidden" id="employee_id" name="customer.employee_id" value="${employee.id}">
	  <div class="form-group">
	    <label for="name" class="col-sm-4 control-label">姓名</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="name" name="customer.name" value="${user.name }" placeholder="客户姓名">
	    </div>
	  </div>
	  
	  <div class="form-group">
	  	<label class="col-sm-4 control-label">性别</label>
	  	<s:if test='user.gender=="男"'>
		    <label class="checkbox-inline">
		    	<input type="radio" name="customer.gender" id="gender" value="男" checked>男
		    	<input type="radio" name="customer.gender" id="gender" value="女">女
		  	</label>
	  	</s:if>
	  	<s:if test='user.gender=="女"'>
	  		<label class="checkbox-inline">
		    	<input type="radio" name="customer.gender" id="gender" value="男">男
		    	<input type="radio" name="customer.gender" id="gender" value="女" checked>女
	  		</label>
	  	</s:if>
	  	<s:if test='user==null'>
	     <label class="checkbox-inline">
	    	<input type="radio" name="customer.gender" id="gender" value="男" checked>男
	    	<input type="radio" name="customer.gender" id="gender" value="女">女
	  	</label>
	  	</s:if>
	  </div>
	 
	 <div class="form-group">
	    <label for="birthday" class="col-sm-4 control-label">生日</label>
	    <div class="col-sm-8">
	      <input type="date" class="form-control" id="birthday" name="customer.birthday" value="${user.birthday}" placeholder="生日">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="identity_id" class="col-sm-4 control-label">身份证号</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="identity_id" name="customer.identity_id" placeholder="身份证号码">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="email" class="col-sm-4 control-label">邮箱</label>
	    <div class="col-sm-8">
	      <input type="email" class="form-control" id="email" name="customer.email" value="${user.email}" placeholder="邮箱地址">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="phone" class="col-sm-4 control-label">手机号</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="phone" name="customer.phone" value="${user.phone}" placeholder="手机号码">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="address" class="col-sm-4 control-label">地址</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="address" name="customer.address" placeholder="联系地址">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="customer_type" class="col-sm-4 control-label">客户类型</label>
	    <div class="col-sm-8" id="customer_type">
		    <select class="select2" name="customer.customer_type">
			  <option>预约客户</option>
			  <option>预定客户</option>
			  <option>购房客户</option>
			</select>
		</div>
	  </div>
	  <div class="form-group">
	    <label for="together" class="col-sm-4 control-label">购房人姓名</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" id="together" name="customer.together" placeholder="共同购房人姓名">
	    </div>
	  </div>
	  <div class="form-group">
	    <label class="col-sm-4 control-label">购房合同</label>
	   	<div class="col-sm-8">
	    	<input type="file" id="contract" name="upload">
	    	<p class="help-block">电子版购房合同</p>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="archives" class="col-sm-4 control-label">客户档案</label>
	    <div class="col-sm-8">
	    	<input type="file" id="archives" name="upload">
	    	<p class="help-block">zip电子档案路径</p>
	    </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-4 col-sm-8">
	      <button type="submit" class="btn btn-primary form-control">添加</button>
	    </div>
	  </div>
	 </form>
</div>
</div>
</div>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/distpicker.data.js"></script>
<script src="<%=path %>/js/distpicker.js"></script>
<script src="<%=path %>/js/select2.min.js"></script>
</body>
<script type="text/javascript">
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
jQuery(document).ready(function(){
    
  // Select2
  jQuery(".select2").select2({
    width: '100%'
  });
 
});
jQuery(document).ready(function(){
    
	  // Select2
	  jQuery(".select2").select2({
	    width: '100%'
	  });
	 
});
</script>
</html>