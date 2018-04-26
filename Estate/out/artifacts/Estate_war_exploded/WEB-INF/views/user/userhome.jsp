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
  <link rel="shortcut icon" href="<%=path %>/images/favicon.png" type="image/png">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="<%=path %>/css1/font-awesome.min.css" />
  <!-- Custom CSS -->
  <link href="<%=path %>/style.css" rel="stylesheet">
  <title>个人中心</title>
  <!-- 提示框 -->
    <script src="<%=path %>/js/sweetalert-dev.js"></script>
	<link rel="stylesheet" href="<%=path %>/css/sweetalert.css">
	<link href="<%=path %>/css/style.default.css" rel="stylesheet">
	<link href="<%=path %>/css1/buildings_look.css" rel="stylesheet">
	<link href="<%=path %>/css/jquery.gritter.css" rel="stylesheet">
	<link href="<%=path %>/css/morris.css" rel="stylesheet">
	<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet" type="text/css">  
	<link href="<%=path %>/css/bootstrap-table.min.css" rel="stylesheet" type="text/css">  
	<script src="<%=path %>/js/jquery.min.js"></script>  
	<script src="<%=path %>/js/bootstrap.min.js"></script>  
	<script src="<%=path %>/js/bootstrap-table.min.js"></script>  
	<script src="<%=path %>/js/bootstrap-table-zh-CN.js"></script> 
</head>

<body class="horizontal-menu fixed">
<section>
  <div class="leftpanel">
    <div class="logopanel">
        <h1><span>[</span> 房天下 <span>]</span></h1>
    </div><!-- logopanel -->
    
    <div class="leftpanelinner">
        
        <!-- This is only visible to small devices -->
        <div class="visible-xs hidden-sm hidden-md hidden-lg">   
            <div class="media userlogged">
                <img alt="" src="images/photos/loggeduser.png" class="media-object">
                <div class="media-body">
                    <h4>${user.nickname }</h4>
                </div>
            </div>
          
            <h5 class="sidebartitle actitle">账户</h5>
            <ul class="nav nav-pills nav-stacked nav-bracket mb30">
              <li><a href="<%=path %>/user/information">个人资料</a></li>
		      <li><a href="<%=path %>/user/changePwd">修改密码</a></li>
		      <li><a href="<%=path %>/user/exited">退出</a></li>
            </ul>
        </div>

    </div><!-- leftpanelinner -->
  </div><!-- leftpanel -->
  
  <div class="mainpanel">
    
    <div class="headerbar">
      
      <div class="header-left">
        
        <div class="logopanel">
            <h1><span>[</span> <a href="<%=path%>/user/homepage">房天下</a> <span>]</span></h1>
        </div><!-- logopanel -->
        
        <div class="topnav">
            <a class="menutoggle" href=""><i class="fa fa-bars"></i></a>
            <ul class="nav nav-horizontal">
                <li class="active"><a href="<%=path%>/user/home">首页</a></li>
				<li><a href="<%=path%>/builds/allbuilds">所有楼盘</a></li>
				<li><a href="<%=path%>/activity/all">楼盘活动</a></li>
                <li><a href="<%=path%>/agency/all">知名房企</a></li>
				<li><a href="<%=path%>/article/all">新闻中心</a></li>
				<li><a href="<%=path%>/agency/registered" target="_blank">房地产入驻</a></li>
            </ul>
        </div><!-- topnav -->
          
      </div><!-- header-left -->
      <form>
         <input type="hidden" value="${user.id }" id="user_id" />
     </form>
      <div class="header-right">
        <ul class="headermenu">
        
          <li>
            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <img src="<%=path %>/upload/${user.headicon}" alt="" />
             	${user.nickname }
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                <li><a href="<%=path %>/user/look">个人资料</a></li>
			    <li><a href="<%=path %>/user/changePwd">修改密码</a></li>
			    <li><a href="<%=path %>/user/exited">退出</a></li>
              </ul>
            </div> &nbsp;&nbsp;&nbsp;
          </li>
        </ul>
      </div><!-- header-right -->
    </div><!-- headerbar -->
    
    <div class="pageheader">
      <h2>用户中心<span>个人资料</span></h2>
    </div>    
    <div class="contentpanel">
	    <div class="div_left" style="margin-right: 50px;">
	      <ul class="dsa">
			<li class="active"><a href="<%=path %>/user/look">个人资料</a></li>
			<li><a href="<%=path %>/user/information">修改个人资料</a></li>
			<li><a href="<%=path %>/user/changePwd">安全设置</a></li>
			<li><a href="<%=path %>/like/all">我点过的赞</a></li>
			<li><a href="<%=path %>/message/myall">我的留言</a></li>
			<li><a href="<%=path %>/comment/myall">我的评价</a></li>
			<li><a href="<%=path %>/appointment/myall">我的预约</a></li>
			<li><a href="<%=path %>/history/myall">我的足迹</a></li>
		  </ul>
		</div>
		<div class="div_right" style="background-color: #eeeeee;height:600px;margin-left: 30px;">
			<div class="col-md-6">
					<br/>
					<h3 class="nomargin">用户资料</h3>
						<br />
						<div class="row">
							<div class="form-group col-md-4">
								<span class="btn btn-default btn-lg"  onclick="F_Open_dialog()">
								<img id="img" class="img-circle" style="width:80px;height:80px" src="<%=path %>/upload/${user.headicon} " ></span>
							</div>
							
							
						</div>
						<div class="row">
							<div class="mb10" >
								<label class="control-label"> 昵称：</label> 
								<span>${user.nickname }</span>
							</div>
						</div>
						<div class="row">
							<div class="mb10"  >
								<label class="control-label"> 性别 ： </label>
								<span>${user.gender }</span>
							</div>
						</div>
						<div class="row">
							<div class="mb10">
								<label class="control-label"> 生日：</label>
								<span>${user.birthday}</span>
							</div>
						</div>
						<div class="row">
							<div class="mb10 " >
								<label class="control-label"> 手机号码：</label>
								<span>${user.phone}</span>
							</div>
						</div>
						<div class="row">
							<div class="mb10 ">
								<label class="control-label"> 邮箱：</label>
								<span>${user.email}</span>
							</div>
						</div>
						
						<div class="row">
							<div class="mb10">
								<label class="control-label"> 真实姓名：</label>
								<span>${user.name}</span>
							</div>
						</div>
						
						<div class="row">
							<div class="mb10">
								<label class="control-label"> 微信号：</label>
								<span>${user.wechat}</span>
							</div>
						</div>
						<div class="row">
							<div class="mb10">
								<label class="control-label"> QQ号：</label>
								<span>${user.qq}</span>
							</div>
						</div>
						<br />

				</div>
				<!-- col-sm-6 -->
			<br /> <br /> <br />
				</div>
    </div>
    
  </div><!-- mainpanel -->
  
  
  
</section>



<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/modernizr.min.js"></script>
<script src="<%=path %>/js/jquery.sparkline.min.js"></script>
<script src="<%=path %>/js/toggles.min.js"></script>
<script src="<%=path %>/js/retina.min.js"></script>
<script src="<%=path %>/js/jquery.cookies.js"></script>
<!-- 验证 -->
<script src="<%=path%>/js/user_update.js" type="text/javascript"charset="utf-8"></script>

<script>
	jQuery('body').addClass('stickyheader');
</script>
<script src="js/custom.js"></script>
<script type="text/javascript">
var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;
$(function() {
	$("submit_btn").bind("click", function() {
		window.location.href=basePath+"/user/information";
		
	});
	
	//返回
	$("#btn_back").click(function(){
		window.history.back(-1);
	})
})
	
</script>
<s:if test="#request.msg=='success'">
<script type="text/javascript">
	swal("成功修改您的信息", "去其他地方看看吧","success");
</script>
</s:if>
<s:if test="#request.msg=='请核对您的邮箱地址'">
<script type="text/javascript">
	swal("请核对您的邮箱地址", "请输入有效的地址","error");
</script>
</s:if>
<s:if test="#request.msg=='请核对您的手机号码'">
<script type="text/javascript">
	swal("请核对您的手机号码", "手机号码一定要有效","error");
</script>
</s:if>
</body>
</html>

