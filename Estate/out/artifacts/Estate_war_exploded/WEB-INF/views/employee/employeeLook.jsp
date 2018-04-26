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
<link href="<%=path %>/css/prettyPhoto.css" rel="stylesheet">

</head>

<body style="background-color: white">

<div class="pageheader">
	<h2> 员工管理<span>详细资料</span></h2>
	
</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="row">
        <div class="col-sm-3">
          <img src="<%=path %>/upload/${employee.headicon}" class="thumbnail img-responsive" alt="" />
          
          <div class="mb30"></div>
          
          <h5 class="subtitle">个人资料</h5>
          <p class="mb30">${employee.des }</p>
          
          <h5 class="subtitle">连接</h5>
          <ul class="profile-social-list">
          	<li><i class="fa fa-envelope"></i> <a href="javascript:void(0);">${employee.email }</a></li>
            <li><i class="fa fa-qq"></i> <a href="javascript:void(0);">${employee.qq }</a></li>
            <li><i class="fa  fa-weixin"></i> <a href="javascript:void(0);">${employee.wechat }</a></li>
          </ul>
          
          <div class="mb30"></div>
          
        </div><!-- col-sm-3 -->
        <div class="col-sm-9">
          
          <div class="profile-header">
            <h2 class="profile-name">${employee.name }</h2>
            <div class="profile-location"><span>性别：</span> ${employee.gender }</div>
            <div class="profile-location"><i class="glyphicon glyphicon-phone"></i> ${employee.phone }</div>
            <div class="profile-position"><i class="fa fa-map-marker"></i> ${employee.address }</div>
            <div class="profile-position"><p>基本工资:${employee.basic_salary }</p></div>
            <div class="profile-position"><p>所属楼盘:${buildings.name }</p></div>
            <div class="mb20"></div>
            
            <a href="<%=path %>/mission/list?emp_id=${employee.id}&agency_id=${employee.angency_id}" target="mainFrame"><button class="btn btn-success mr5"><i class="fa fa-paper-plane"></i> 分配任务</button></a>
            <a href="<%=path %>/appointment/list?emp_id=${employee.id}&agency_id=${employee.angency_id}"><button class="btn btn-white"><i class="fa fa-envelope-o"></i> 预约消息</button></a>
          </div><!-- profile-header -->
          
          <!-- Nav tabs -->
        <ul class="nav nav-tabs nav-justified nav-profile">
          <li class="active"><a href="#activities" data-toggle="tab"><strong>个人说明</strong></a></li>
          <li><a href="#followers" data-toggle="tab"><strong>工作经验</strong></a></li>
        </ul>
     
        <!-- Tab panes -->
        <div class="tab-content">
          <div class="tab-pane active" id="activities">
            <div class="activity-list">
              ${employee.des }
              
            </div><!-- activity-list -->

          </div>
          <div class="tab-pane" id="followers">
            
            <div class="follower-list">
              ${employee.exp }
              
            </div><!--follower-list -->
            
          </div>
          
          
        </div><!-- tab-content -->
          
        </div><!-- col-sm-9 -->
      </div><!-- row -->
		
</div><!-- contentpanel -->
	


<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/modernizr.min.js"></script>
<script src="<%=path %>/js/jquery.sparkline.min.js"></script>
<script src="<%=path %>/js/toggles.min.js"></script>
<script src="<%=path %>/js/retina.min.js"></script>
<script src="<%=path %>/js/jquery.cookies.js"></script>
<script src="<%=path %>/js/jquery.prettyPhoto.js"></script>
<script src="<%=path %>/js/holder.js"></script>
<script src="<%=path %>/js/custom.js"></script>

<s:if test="#request.msg!=null">
	<script type="text/javascript">
		alert("${msg}");
	</script>
</s:if>
</body>
</html>
