<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="<%=path %>/images/favicon.png" type="image/png">

  <title>房地产入驻</title>

  <link href="<%=path %>/css/style.default.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="horizontal-menu">





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
                    <h4>凤求凰</h4>
                    <span>"生活就是这样..."</span>
                </div>
            </div>
          
            <h5 class="sidebartitle actitle">账户</h5>
            <ul class="nav nav-pills nav-stacked nav-bracket mb30">
              <li><a href="profile.html"><i class="fa fa-user"></i> <span>用户资料</span></a></li>
              <li><a href=""><i class="fa fa-cog"></i> <span>账户设置</span></a></li>
              <li><a href=""><i class="fa fa-question-circle"></i> <span>帮助</span></a></li>
              <li><a href="signout.html"><i class="fa fa-sign-out"></i> <span>安全退出</span></a></li>
            </ul>
        </div>
    </div><!-- leftpanelinner -->
  </div><!-- leftpanel -->
  
  <div class="mainpanel">
    
    <div class="headerbar">
      
      <div class="header-left">
        
        <div class="logopanel">
            <h1><span>[</span> <a href="">房天下</a> <span>]</span></h1>
        </div><!-- logopanel -->
        
        <div class="topnav">
            <a class="menutoggle"><i class="fa fa-bars"></i></a>
            
            <ul class="nav nav-horizontal">
                <li><a href="index.html"> <span>首页</span></a></li>
                <li><a href="email.html"><span>所有楼盘</span></a></li>
				<li><a href="email.html"><span>楼盘活动</span></a></li>
				<li><a href="email.html"><span>知名房企</span></a></li>
				<li><a href="email.html"><span>业主论坛</span></a></li>
				<li><a href="email.html"><span>新闻中心</span></a></li>
				<li class="active"><a href="email.html"><span>房地产入驻</span></a></li>
                
                <li><a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-search"></i></a>
                    <div class="dropdown-menu">
                        <form action="index.html" method="post">
                            <input type="text" class="form-control" name="keyword" placeholder="在这里搜索..." />
                        </form>
                    </div>
                </li>
            </ul>
        </div><!-- topnav -->
          
      </div><!-- header-left -->
      
      <div class="header-right">
        <ul class="headermenu">
        
          <li>
            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <img src="images/photos/loggeduser.png" alt="" />
               		 凤囚凰灬
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                <li><a href="profile.html"><i class="glyphicon glyphicon-user"></i> 个人资料</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-cog"></i> 账户设置</a></li>
                <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> 帮助</a></li>
                <li><a href="signin.html"><i class="glyphicon glyphicon-log-out"></i>安全退出</a></li>
              </ul>
            </div> &nbsp;&nbsp;&nbsp;
          </li>
         
        </ul>
      </div><!-- header-right -->
      
    </div><!-- headerbar -->
        
    <div class="pageheader">
      <h4>免费入驻，填写申请资料</h4>
       <ol class="breadcrumb">
			<li><h4><a href="<%=path%>/agency/login">已经申请，直接登录</a></h4></li>
        </ol><div class="breadcrumb-wrapper">
       
      </div>
    </div>
    
    <div class="contentpanel">
      <!-- content goes here... -->
		<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered">
				
			   
				
				<div class="form-group">
				  <label class="col-sm-3 control-label">管理员名称：</label>
				  <div class="col-sm-4">
					<input type="text" name="manager.name" placeholder="公司名称" data-placement="right" title="与营业执照名称保持一致" class="form-control tooltips">
				  </div>
				  
				</div>

				<div class="form-group">
				  <label class="col-sm-3 control-label">邮箱地址：</label>
				  <div class="col-sm-4">
					<input type="text" name="manager.email" placeholder="输入邮箱地址" data-placement="right" title="邮箱地址是登录账号" class="form-control tooltips">
				  </div>
				  
				</div>

				<div class="form-group">
				  <label class="col-sm-3 control-label">登录密码：</label>
				  <div class="col-sm-4">
					<input type="password" name="manager.password"  placeholder="输入密码" data-placement="right" title="输入不少于6个字符的密码" class="form-control tooltips">
				  </div>
				  
				</div>

				<div class="form-group">
				  <label class="col-sm-3 control-label">确认密码密码：</label>
				  <div class="col-sm-4">
					<input type="password" placeholder="输入确认密码" data-placement="right" title="与上面密码保持一致" class="form-control tooltips">
				  </div>
				</div>
				 <div class="form-group">
				  <label class="col-sm-3 control-label">固定电话：</label>
				  <div class="col-sm-4">
					<input type="text" name="manager.tel" placeholder="输入固定电话" data-placement="right" title="请输入公司的固定电话" class="form-control tooltips">
				  </div>
				</div>

				
				<div class="form-group">
				  <label class="col-sm-3 control-label">管理员图片：</label>
				  <div class="col-sm-4">
					<input type="file" name="manager.headicon" placeholder="选择公司商标图片" data-placement="right" title="请选择公司商标图片" class="form-control tooltips">
				  </div>
				</div>

				<div class="form-group">
				  <label class="col-sm-3 control-label">手机号码：</label>
				  <div class="col-sm-4">
					<input type="text" name="manager.phone" placeholder="输入手机号码" id="phone" data-placement="right" title="请输入开通账号的手机号码" class="form-control tooltips">
				  </div>
				</div>

				<div class="form-group">
				  <label class="col-sm-3 control-label">验证码：&nbsp;&nbsp;</label>
				  <div class="input-group col-sm-4">
					<input type="text" name="email" placeholder="输入手机号码" class="form-control">
					<span class="input-group-btn">
                    <button type="button" class="btn btn-default">获取手机验证码</button>
                  </span>
				  </div>
				</div>
				
				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button class="btn btn-primary btn-lg"> 提 交 </button>&nbsp;
						<button class="btn btn-default btn-lg"> 取 消 </button>
				  </div>
				</div>
				<br/>
			   
			  </form>
			  
			</div><!-- panel-body -->
		
			
		</div>
	</div>
    
  </div><!-- mainpanel -->
  
  
  
</section>



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

<script>
	jQuery('body').addClass('stickyheader');
</script>
<script src="js/custom.js"></script>

<script>
jQuery(document).ready(function(){
  // Input Masks
  jQuery("#date").mask("9999/99/99");
  jQuery("#phone").mask("(999) 9999-9999");
  jQuery("#ssn").mask("999-99-9999");
  
});
</script>
</body>
</html>
