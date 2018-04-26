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
	<h2> 所有活动<span>活动资料</span></h2>
	
</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="row blog-content">
      <div class="col-sm-9">
        
        <div class="panel panel-default panel-blog">
          <div class="panel-body">
            <h3 class="blogsingle-title">${activity.title }</h3>
            <br />
            <div class="blog-img"><img src="<%=path %>/upload/${activity.logo}" class="img-responsive" alt="" /></div>
            <div class="mb20"></div>
          </div><!-- panel-body -->
        </div><!-- panel -->
        
        <div class="mb10"></div>
        <a href="<%=path %>/activity/update?activity.id=${activity.id}" class="btn btn-primary">修改资料</a>
      </div><!-- col-sm-8 -->
      
      <div class="col-sm-3">
        <div class="blog-sidebar">
          <div class="mb30"></div>
          <h4 class="subtitle">详细信息</h4>
          <ul class="sidebar-list">
            <li>开始时间：${activity.start_time }</li><br/>
            <li>结束时间：${activity.start_time }</li><br/>
            <li>活动地址：${activity.address }</li><br/>
            <li>活动内容：${activity.content }</li><br/>
          </ul>
        </div><!-- blog-sidebar -->
        
      </div><!-- col-sm-4 -->
      
      </div><!-- row -->
		
</div><!-- contentpanel -->
	


<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
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
<s:if test="#request.error!=null">
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
