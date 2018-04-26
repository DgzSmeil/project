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
	<h2> 所有楼盘<span>详细资料</span></h2>
	
</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="row blog-content">
      <div class="col-sm-9">
        
        <div class="panel panel-default panel-blog">
          <div class="panel-body">
            <h3 class="blogsingle-title">${builds.name }楼盘</h3>
            
            <ul class="blog-meta">
              <li>创建于</li>
              <li>${builds.created_time }</li>
            </ul>
            
            <br />
            <div class="blog-img"><img src="<%=path %>/upload/${builds.logo}" class="img-responsive" alt="" /></div>
            <div class="mb20"></div>
            
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${builds.intro }</p>  
          
          </div><!-- panel-body -->
        </div><!-- panel -->
        
        <div class="authorpanel">
          <div class="media">
            
            <div class="media-body event-body">
              <h4 class="subtitle">交通状况</h4>
              <p>${builds.traffic }</p>
            </div><br/>
            <div class="media-body event-body">
              <h4 class="subtitle">周边配置</h4>
              <p>${builds.equipments }</p>
            </div>
          </div><!-- media -->
        </div><!-- authorpanel -->
        
        <div class="mb10"></div>
        
        <div class="mb30"></div>
      
        <div class="mb30"></div>
        
              
      
      </div><!-- col-sm-8 -->
      
      <div class="col-sm-3">
        <div class="blog-sidebar">
          
          <h5 class="subtitle">类型信息</h5>
          <ul class="sidebar-list">
            <li>房源类型：${builds.house_type }</li>
            <li>建筑类型：${builds.building_type }</li>
          </ul>
          
          <div class="mb30"></div>
          
          <h5 class="subtitle">位置信息</h5>
          <ul class="sidebar-list">
           	<li>所属区域： ${builds.area }</li>
            <li>楼盘位置：  ${builds.address }</li>
            <li>占地面积： ${builds.floor_area }平方米</li>
            <li>建筑面积：  ${builds.building_area }平方米</li>
          </ul>
          
          <div class="mb30"></div>
          <h5 class="subtitle">销售信息</h5>
          <ul class="sidebar-list">
          	<li>楼盘均价：  ${builds.avg_price }元/㎡ </li>
          	<li>总套数：  ${builds.total_rooms }</li>
           	<li>咨询电话：  ${builds.tel }</li>
            <li>开 发  商： ${builds.company }</li>
            <li>开盘时间：  ${builds.open_date }</li>
            <li>售楼地址：  ${builds.reception_address }</li>
          </ul>
          
          <div class="mb30"></div>
          <h5 class="subtitle">规划信息</h5>
          <ul class="sidebar-list">
           <li>占地面积：  ${builds.floor_area }平方米</li>
            <li>建筑面积：  ${builds.building_area }平方米</li>
            <li>绿 化  率： ${builds.green_ratio }%</li>
            <li>容积率：  ${builds.plot_ratio }</li>
          </ul>
          
          <div class="mb30"></div>
          <h5 class="subtitle">配套信息</h5>
          <ul class="sidebar-list">
           	<li>物业公司：  ${builds.property_company }</li>
            <li>物 业  费：  ${builds.property_fee }元/平方米·月</li>
            <li>停  车   位： ${builds.car_station }个</li>
          </ul>
          
          
          
        </div><!-- blog-sidebar -->
        
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
