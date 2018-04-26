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
<!-- 提示框 -->
  <script src="<%=path %>/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="<%=path %>/css/sweetalert.css">
    </head>

<body style="background-color: white">


<div class="pageheader">
	<h2> 楼盘管理<span>所有楼盘</span><span>添加图片</span></h2>
	
</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path%>/buildings_img/add" id="form1" enctype="multipart/form-data">
				<input type="hidden" name="buildingsImg.buildings_id" value="${buildingsImg.buildings_id}"/>
				
				<div>
				  <div class="col-md-12">
         
				  <p id="addp"></p>
				  <input type="file" id="upload" style="display:none" name="upload" onclick="addElementImg('addp')">
				  <span  class="btn btn-default btn-lg" id="span1"  onclick="F_Open_dialog()">
				  		选择图片
				  </span>
				  
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				

				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
				  		<button type="button" class="btn btn-default btn-lg" id="span2" style="display:none" onclick="F_Open_dialog1()">
				  		继续添加
				  		</button>
				  		<br/>
						<button class="btn btn-primary btn-lg" id="btn_agency"> 开始上传 </button>&nbsp;
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
var i=1;
function addElementImg(obj) {
			var ul = document.getElementById(obj);
			var img = document.createElement("img");
			img.setAttribute("id", "newImg");
			img.setAttribute("style", "width:300px;height:200px;margin:10px");
			img.src = "";
			ul.appendChild(img);
			document.getElementById("span1").style.display='none';
			document.getElementById("span2").style.display='block';
			
			var newInput = document.createElement("input");
			newInput.type="file";   
			newInput.name="upload";
			newInput.setAttribute("id", "upload"+i);
			newInput.setAttribute("onclick", "addElementImg1('addp')");
			newInput.setAttribute("style", "display:none");
			ul.appendChild(newInput);
			
			var input = document.getElementById("upload");
			var $img = $('#newImg');
			input.addEventListener('change',readFile,false);
			function readFile(){
				var file=this.files[0];
				var $file = $(this);
				var fileObj = $file[0];
				var windowURL = window.URL || window.webkitURL;
				var dataURL;
				dataURL = windowURL.createObjectURL(fileObj.files[0]);
				$img.attr('src',dataURL);
		}
	}
	
function addElementImg1(obj) {
	var ul = document.getElementById(obj);
	var img = document.createElement("img");
	i=i+1;
	img.setAttribute("id", "newImg"+i);
	img.setAttribute("style", "width:300px;height:200px;margin:10px");
	img.src = "";
	ul.appendChild(img);
	document.getElementById("span1").style.display='none';
	document.getElementById("span2").style.display='block';
	
	var newInput = document.createElement("input");
	newInput.type="file";   
	newInput.name="upload";
	newInput.setAttribute("id", "upload"+i);
	newInput.setAttribute("onclick", "addElementImg1('addp')");
	//alert("i="+i);
	newInput.setAttribute("style", "display:none");
	ul.appendChild(newInput);
	
	var input = document.getElementById("upload"+(i-1));
	var $img = $('#newImg'+i);
	input.addEventListener('change',readFile,false);
	function readFile(){
		var file=this.files[0];
		var $file = $(this);
		var fileObj = $file[0];
		var windowURL = window.URL || window.webkitURL;
		var dataURL;
		dataURL = windowURL.createObjectURL(fileObj.files[0]);
		$img.attr('src',dataURL);
}
}
	
	function F_Open_dialog(){ 
		document.getElementById("upload").click(); 
	}
	function F_Open_dialog1(){ 
		document.getElementById("upload"+i).click(); 
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
	swal("错误信息", "${error}", "error");
	</script>
</s:if>
<s:if test="#request.success!=null">
	<script type="text/javascript">
		swal("成功信息", "${success}", "success");
	</script>
</s:if>
</body>
</html>
