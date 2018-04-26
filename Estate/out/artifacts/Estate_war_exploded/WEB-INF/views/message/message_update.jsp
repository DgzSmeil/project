<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
<!-- 提示框 -->
  <script src="<%=path %>/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="<%=path %>/css/sweetalert.css">
    </head>

<body style="background-color: white">


<div class="pageheader">
	<h2> 活动管理<span>修改活动</span></h2>
	
</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path%>/message/updateSave" id="form1" enctype="multipart/form-data">
			  	<input type="hidden" name="message.id" value="${message.id }"/>
			  	<input type="hidden" name="message.status" value="${message.status }"/>
			  	<input type="hidden" name="message.agency_id" value="${message.agency_id }"/>
			  	<input type="hidden" name="message.buildings_id" value="${message.buildings_id }"/>
			  	<input type="hidden" name="message.user_id" value="${message.user_id }"/>
			  	<input type="hidden" name="message.content" value="${message.content }"/>
			  	<input type="hidden" name="message.leave_time" value="${message.leave_time }"/>
				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">用户头像：</label>
				  <div class="col-sm-4">
				  <img id="img" src="<%=path%>/upload/${message.user.headicon }" class="img-rounded" style="width:100px;height:80px">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">用户昵称：</label>
				  <div class="col-sm-4">
				  	<input type="text" value="${message.user.nickname }" class="form-control" disabled="" />
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">留言时间：</label>
				  <div class="col-sm-4">
				  	<input type="text" name="message.leave_time" value="${message.leave_time }" class="form-control" disabled="" />
				  </div>
				  <div class="col-sm-4 tips"></div>
				  
				</div>
			   
			   <div class="form-group" id="div11">
				  <label class="col-sm-3 control-label">留言内容：</label>
				  <div class="col-sm-7">
				  	<textarea  id="content" name="message.content" class="form-control" rows="5" disabled="">${message.content }</textarea>
				  </div>
				</div>
				
				<div class="form-group" id="div11">
				  <label class="col-sm-3 control-label">回复内容：</label>
				  <div class="col-sm-7">
					<textarea  id="content" name="message.reply" class="form-control" rows="5">${message.reply }</textarea>
				  </div>
				</div>
			   

				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button  class="btn btn-primary btn-lg" id="btn_agency"> 确定</button>&nbsp;
						<button type="button" class="btn btn-default btn-lg" id="btn_back"> 取消 </button>
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
<script>
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
	function F_Open_dialog(){ 
		document.getElementById("headicon").click(); 
	} 
	$(function(){
		$("#btn_agency").bind("click",function(){
			if($("#name").val()==""){
				alert("请输入员工姓名");
				$("#name").focus();
				return false;
			}else if($("#phone").val()==""){
				alert("请输入手机号码");
				$("#phone").focus();
				return false;
			}else if($("#email").val==""){
				alert("请输入邮箱地址");
				$("#email").focus();
				return false;
			}else if($("#basic_salary").val==""){
				alert("请输入基础工资");
				$("#basic_salary").focus();
				return false;
			}else if($("#building_id").val()==""){
				alert("请选择负责楼盘");
				$("#building_id").focus();
				return false;
			}else{
				$("#form1").submit();
			}
			
		});
		
		//返回
		$("#back").click(function(){
			window.history.back(-1);
		});
	})


</script>
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
</script>

<s:if test="#request.msg!=null">
	<script type="text/javascript">
	swal("注册错误", "${error}", "error");
	</script>
</s:if>
<s:if test="#request.success!=null">
	<script type="text/javascript">
		swal("成功信息", "${success}", "success");
	</script>
</s:if>
</body>
</html>
