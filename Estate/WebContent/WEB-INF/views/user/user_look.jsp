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

  <title>个人中心</title>
  <!-- 提示框 -->
  <script src="<%=path %>/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="<%=path %>/css/sweetalert.css">
  <link href="<%=path %>/css/style.default.css" rel="stylesheet">
  <link href="<%=path %>/css1/buildings_look.css" rel="stylesheet">
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
      <h2>用户中心<span>修改个人资料</span></h2>
      
    </div>    
    
    <div class="contentpanel">
	    <div class="div_left">
	      <ul class="asd">
			<li><a href="<%=path %>/user/look">个人资料</a></li>
			<li class="active"><a href="<%=path %>/user/information">修改个人资料</a></li>
			<li><a href="<%=path %>/user/changePwd">安全设置</a></li>
			<li><a href="<%=path %>/like/all">我点过的赞</a></li>
			<li><a href="<%=path %>/message/myall">我的留言</a></li>
			<li><a href="<%=path %>/comment/myall">我的评价</a></li>
			<li><a href="<%=path %>/appointment/myall">我的预约</a></li>
			<li><a href="<%=path %>/history/myall">我的足迹</a></li>
		  </ul>
		</div>
		<div class="div_right" style="background-color: #eeeeee" >
			<div class="col-md-6">
					<form method="post" id="form1" action="<%=path%>/user/update" enctype="multipart/form-data">
					<input type="hidden" name="user.id" value="${user.id}"/>
					<input type="hidden" name="user.pwd" value="${user.pwd}"/>
						<h3 class="nomargin">完善用户资料</h3>
						<br />
						<div class="row">
							<div class="mb10 col-md-8" >
								<label class="control-label"> 昵称：</label> <input type="text"
									name="user.nickname" id="nickname" class="form-control"value="${user.nickname }" placeholder="输入您的邮箱地址..." />
							</div>
							<div class="form-group col-md-4">
								<span class="btn btn-default btn-lg"  onclick="F_Open_dialog()">
								<img id="img" class="img-circle" style="width:80px;height:80px" src="<%=path %>/upload/${user.headicon} " ></span>
								<input type="file" id="headicon" name="upload" placeholder="请选择头像" data-placement="right" style="display:none"  title="请选择头像" class="form-control tooltips">
								<input type="hidden" id="headicon2" name="user.headicon" value="${user.headicon} "/> 
							</div>
						</div>
						<div class="row">
							<div class="mb10"  >
								<label class="control-label"> 性别：  </label>
								<s:if test='user.gender=="女"'>
									<input type="radio" name="user.gender" id="gender" class="form-contorl" value="男" />男&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="user.gender" id="gender"  class="form-contorl" value="女" checked="checked"/>女
								</s:if>
								<s:else>
									<input type="radio" name="user.gender" id="gender" value="男"  class="form-contorl" checked="checked"/>男
									<input type="radio" name="user.gender" id="gender" value="女" class="form-contorl" />女
								</s:else>
							</div>
						</div>
						<div class="row">
							<div class="mb10">
								<label class="control-label"> 生日：</label> 
								<input type="date" name="user.birthday" id="brithday"value="${user.birthday}" class="form-control" placeholder="输入您的邮箱地址..." />
							</div>
						</div>
						<div class="row">
							<div class="mb10 " >
								<label class="control-label"> 手机号码：</label> 
								<input type="text" name="user.phone" id="phone" class="form-control"value="${user.phone}" placeholder="输入您的手机号码..." />
							</div>
						</div>
						<div class="row">
							<div class="mb10 ">
								<label class="control-label"> 邮箱：</label> 
								<input type="email" name="user.email" id="email" class="form-control"value="${user.email}" placeholder="输入您的邮箱地址..." />
							</div>
						</div>
						
						<div class="row">
							<div class="mb10">
								<label class="control-label"> 真实姓名：</label> 
								<input type="text" name="user.name" id="name"class="form-control"value="${user.name}" placeholder="请输入您的真实姓名" />
							</div>
						</div>
						
						<div class="row">
							<div class="mb10">
								<label class="control-label"> 微信号：</label> 
								<input type="text" name="user.wechat" id="wechat" class="form-control" value="${user.wechat}" placeholder="输入您的微信号..." />
							</div>
						</div>
						<div class="row">
							<div class="mb10">
								<label class="control-label"> QQ号：</label> 
								<input type="text" name="user.qq" id="QQ" class="form-control" value="${user.qq}" placeholder="输入您的QQ号..." />
							</div>
						</div>
						<br />

						<button type="submit" id="submit_btn" class="btn btn-success">保存</button>
						<button type="button" id="btn_back" class="btn btn-success">取消</button>
					</form>
				</div>
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
$(function() {
	$("submit_btn").bind("click", function() {
		$("#form1").submit();
		
	});
	
	//返回
	$("#btn_back").click(function(){
		window.history.back(-1);
	})
})
	var input = document.getElementById("headicon");
	var $img = $('#img');
	//文件域选择文件时, 执行readFile函数
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
function F_Open_dialog(){ 
	document.getElementById("headicon").click(); 
} 
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

