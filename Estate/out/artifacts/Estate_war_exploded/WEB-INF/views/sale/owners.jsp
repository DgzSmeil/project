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

      <title>房屋业主信息</title>

<link href="<%=path %>/css/style.default.css" rel="stylesheet">
<link href="<%=path %>/css/prettyPhoto.css" rel="stylesheet">

</head>

<body style="background-color: white">

<div class="pageheader">
	<h2>销售管理<span>业主资料</span></h2>
	
</div>

	<div class="contentpanel">
		<div class="panel panel-default">
  		<div class="panel-body">
        <div class="col-sm-4">
          <h2 class="profile-name">${customer.name }</h2>
          <p></p>
          <div class="profile-location"><span>性别：</span> ${customer.gender }</div>
          <p></p>
          <div class="profile-location"><span>生日：</span> ${customer.birthday }</div>
          <p></p>
          <div class="profile-location"><span>身份证号：</span> ${customer.identity_id }</div>
          <p></p>
          <p></p>
          <ul class="profile-social-list">
          	<li><div class="profile-location"><i class="glyphicon glyphicon-phone"></i> ${customer.phone }</div></li>
          	<li><div class="profile-location"><i class="fa fa-envelope"></i>${customer.email }</div></li>
          	<li><div class="profile-position"><i class="fa fa-map-marker"></i> ${customer.address }</div></li>
          </ul>
        </div>
        
        <div class="col-sm-4">
          
          <h3 class="profile-name">户型详情</h3>
      		<div class="profile-location"><img src="<%=path %>/upload/${house.logo}" class="thumbnail img-responsive" alt="" style="width:200px;height:200px;"/></div>
      	</div>
      	<div class="col-sm-4">
      	<h3 class="profile-name">房屋详情</h3>
      	  <p></p>
          <div class="profile-location"><span>房名:</span> ${room.name }</div>
          <p></p>
          <p>房屋简介：${house.intro }</p>
          <div class="profile-location"><span>房屋面积：</span> ${house.area }平方米</div>
          <p></p>
          <div class="profile-location"><span>房屋单价：</span> ${house.unit_price }元</div>
          <p></p>
          <div class="profile-location"><span>房屋总价：</span> ${sale.total_cost }元</div>
          <p></p>
          <div class="profile-location"><span>销售员工：</span> ${employee.name}</div>
          <p></p>
          <p>所属楼盘：${buildings.name}</p>
    	</div>
   </div>  
</div>
</div>


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
