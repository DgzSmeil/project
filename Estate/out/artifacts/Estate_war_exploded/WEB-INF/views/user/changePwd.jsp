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

  <title>Bracket Responsive Bootstrap3 Admin</title>
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
      <h2>用户中心<span>安全设置</span></h2>
    </div>    
    
    <div class="contentpanel">
	    <div class="div_left">
	      <ul class="asd">
			<li><a href="<%=path %>/user/look">个人资料</a></li>
			<li><a href="<%=path %>/user/information">修改个人资料</a></li>
			<li class="active"><a href="<%=path %>/user/changePwd">安全设置</a></li>
			<li><a href="<%=path %>/like/all">我点过的赞</a></li>
			<li><a href="<%=path %>/message/myall">我的留言</a></li>
			<li><a href="<%=path %>/comment/myall">我的评价</a></li>
			<li><a href="<%=path %>/appointment/myall">我的预约</a></li>
			<li><a href="<%=path %>/history/myall">我的足迹</a></li>
		  </ul>
		</div>
		<div class="div_right2" style="background-color: #eeeeee" >
			<br/><br/><br/>
			<div class="col-md-6">
			<form method="post" action="<%=path %>/user/updatePwd" id="form1"  enctype="multipart/form-data">
			  <input type="hidden" id="id" name="user.id" value="${user.id }" />
			  <input type="hidden" id="oldpwd2" value="${user.pwd }" />
		   
			<br/><br/>
			<div class="form-group" id="div1">
			  <label class="col-sm-3 control-label">旧密码：</label>
			  <div class="col-sm-4">
				<input type="password" style="width:230px;height:35px;" id="oldpwd" onblur="mdjia();" placeholder="输入旧密码">
			  </div>
			  <div class="col-sm-4 tips"></div>
			</div>

			<div class="form-group" id="div2">
			  <label class="col-sm-3 control-label">新密码：</label>
			  <div class="col-sm-4">
				<input type="password" id="pwd" style="width:230px;height:35px;" name="user.pwd" placeholder="输入新密码">
			  </div>
			  <div class="col-sm-4 tips"></div>
			</div>
			<div class="form-group" id="div5">
			  <label class="col-sm-3 control-label">确认密码：</label>
			  <div class="col-sm-4">
				<input type="password" id="pwd2" onblur="mdjia1();" style="width:230px;height:35px;" placeholder="输入确认密码">
			  </div>
			  <div class="col-sm-4 tips"></div>
			</div>
		   
			<div class="form-group">
			  <label class="col-sm-3 control-label"></label>
			  <div class="col-sm-7">
					<button type="button" class="btn btn-primary btn-lg" id="btn_agency"> 修改 </button>&nbsp;
					<button type="button" class="btn btn-default btn-lg" id="btn_back"> 取 消 </button>
			  </div>
			</div>
			<br/>
		   
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
<script src="<%=path %>/js/jquery.md5.js" type="text/javascript"></script>
<script>
	function mdjia() {
		if($("#oldpwd").val()!=""){
			var pwd = $("#oldpwd").val();
			var password = $.md5(pwd);
			$("#oldpwd").val(password);
		}
		
	}
	function mdjia1() {
		if($("#pwd2").val()!=""){
			var pwd2 = $("#pwd2").val();
			var password2 = $.md5(pwd2);
			$("#pwd2").val(password2);
			var pwd1 = $("#pwd").val();
			var password1 = $.md5(pwd1);
			$("#pwd").val(password1);
		}
	}
	$(function() {
		$("#btn_agency").bind("click", function() {
			if ($("#oldpwd").val() == "") {
				swal("提示信息", "请输入旧密码", "warning");
				$("#oldpwd").focus();
				return false;
			} else if ($("#pwd").val() == "") {
				swal("提示信息", "请输入新密码", "warning");
				$("#pwd").focus();
				return false;
			} else if ($("#pwd2").val() == "") {
				swal("提示信息", "请输入确认密码", "warning");
				$("#pwd2").focus();
				return false;
			} else if ($("#pwd").val() != $("#pwd2").val()) {
				swal("新密码与确认密码不一致", "请核对密码", "error");
				$("#pwd").focus();
				return false;
			} else if ($("#oldpwd").val() != $("#oldpwd2").val()) {
				swal("旧密码错误", "请核对密码", "error");
				$("#oldpwd").focus();
				return false;
			} else {
				$("#form1").submit();
			}

		});
		$("#btn_back").click(function(){
			window.history.back(-1);
		})
	})
</script>
<s:if test="#request.msg!=null">
	<script type="text/javascript">
		alert("${msg}");
	</script>
</s:if>
</body>
</html>

