
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
	<h2><i class="glyphicon glyphicon-user"></i> 户型管理<span>详细资料</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="row blog-content">
      <div class="col-sm-9">
        
        <div class="panel panel-default panel-blog">
          <div class="panel-body">
            <h3 class="blogsingle-title">${house.name }户型</h3>
            
            <ul class="blog-meta">
              <li>创建于</li>
              <li>${house.created_time }</li>
            </ul>
            
            <br />
            <div class="blog-img"><img src="<%=path %>/upload/${house.logo}" class="img-responsive" alt="" /></div>

          </div><!-- panel-body -->
        </div><!-- panel -->
              
           
          
        
              
      
      </div><!-- col-sm-8 -->
      
      <div class="col-sm-3">
        <div class="blog-sidebar">
          
          <h5 class="subtitle">	户型信息</h5>
          <ul class="sidebar-list">
            <li>户型介绍：${house.intro }</li>
            <li>建筑面积：${house.area }</li>
          </ul>
          
          <div class="mb30"></div>
          
          <h5 class="subtitle">户型特点</h5>
	        <span class="label label-primary">在售</span>
			<span class="label label-success">南北通透</span>
			<span class="label label-info">飘窗</span>
			<span class="label label-warning">平层</span>
          <div class="mb30"></div>
          <h5 class="subtitle">销售信息</h5>
          <ul class="sidebar-list">
          	<li>参考单价：  ${house.unit_price }元/套</li>
          </ul>
          
         </div>  
          
      </div><!-- col-sm-4 -->
      
      </div><!-- row -->
		
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
		alert("${msg}");
	</script>
</s:if>
</body>
</html>
