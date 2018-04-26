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
<style type="text/css">
	.asd{
		width:100%;
		height:1500px;
	}
	.mgn{
		width:100%;
		height:2300px;
	}
	.atc{
		width:100%;
		height:2500px;
	}
</style>
       
</head>

<body>



<!-- Preloader -->
<div id="preloader">
    <div id="status"><i class="fa fa-spinner fa-spin"></i></div>
</div>
        <section>

            <div class="leftpanel">

                <div class="logopanel">
                    <h1><span>[</span> 房天下 <span>]</span></h1>
                </div><!-- logopanel -->

                <div class="leftpanelinner">

                   <!-- This is only visible to small devices -->
				   <!-- 这是手机端用户看的 -->
        <div class="visible-xs hidden-sm hidden-md hidden-lg">
            <div class="media userlogged">
                <img alt="" src="<%=path %>/upload/${agency.logo}" class="media-object">
                <div class="media-body">
                    <h4><s:property value="#request.agency.name"/></h4>
                </div>
            </div>

            <h5 class="sidebartitle actitle">账户</h5>
            <ul class="nav nav-pills nav-stacked nav-bracket mb30">
              <li><a href="<%=path %>/agency/personal?agency.id=${agency.id}" target="mainFrame"><i class="fa fa-user"></i> <span>公司资料</span></a></li>
              <li><a href="<%=path %>/agency/mima?agency.id=${agency.id}" target="mainFrame"><i class="fa fa-cog"></i> <span>帐户设置</span></a></li>
              <li><a href=""><i class="fa fa-question-circle" target="mainFrame"></i> <span>帮助</span></a></li>
              <li><a href=""><i class="fa fa-sign-out" target="mainFrame"></i> <span>退出</span></a></li>
            </ul>
        </div>
			
      <h5 class="sidebartitle">导航</h5>
      <ul class="nav nav-pills nav-stacked nav-bracket" id="ul1">
        <li class="active"><a href="<%=path %>/manager/shouye" target="mainFrame" class="qwe"><i class="fa fa-home"></i> <span>首页</span></a></li>
       <li><a href="<%=path%>/builds/mngbuildpage"  target="mainFrame"  class="qwe"><i class="fa fa-th-list"></i> <span>楼盘管理</span></a></li>
        <li><a href="<%=path%>/user/mgnuserpage"  target="mainFrame"  class="ewq"><i class="fa fa-th-list"></i> <span>用户管理</span></a></li>
         <li><a href="<%=path%>/articleType/articleTypePage"  target="mainFrame"  class="ewq"><i class="fa fa-th-list"></i> <span>文章类别管理</span></a></li>
          <li><a href="<%=path%>/ads/adsPage"  target="mainFrame"  class="ewq"><i class="fa fa-th-list"></i> <span>广告管理</span></a></li>
        <li><a href="<%=path%>/article/articlePage"  target="mainFrame"  class="article"><i class="fa fa-th-list"></i> <span>文章管理</span></a></li>
        <li class="nav-parent"><a href="<%=path%>/agency/mgnagency" target="mainFrame"><i class="fa fa-th-list" class="qwe"></i> <span>经销商管理</span></a>
          <ul class="children">
            <li><a href="<%=path%>/agency/mgnagency?checked=Y" target="mainFrame" class="ewq"><i class="fa fa-caret-right"></i>审核通过</a> </li>
            <li><a href="<%=path%>/agency/mgnagency?checked=N" target="mainFrame" class="ewq"><i class="fa fa-caret-right"></i> 未审核</a></li>
            <li><a href="<%=path%>/agency/mgnagency?checked=F" target="mainFrame" class="ewq"><i class="fa fa-caret-right"></i>未通过</a></li>
          </ul>
        </li>
        
        <li class="nav-parent"><a href="" target="mainFrame" class="qwe"><i class="fa fa-th-list"></i> <span>活动管理</span></a>
            <ul class="children">
                <li><a href="<%=path%>/activity/mgnActivitypage?actvt=agc" target="mainFrame" class="ewq"><i class="fa fa-caret-right"></i> 经销商活动</a></li>
                <li><a href="<%=path%>/activity/mgnActivitypage?actvt=mgn" target="mainFrame" class="ewq"><i class="fa fa-caret-right"></i> 管理员活动</a></li>
            </ul>
        </li>
      </ul>

      

    </div><!-- leftpanelinner -->
  </div><!-- leftpanel -->

  <div class="mainpanel">

    <div class="headerbar">

      <a class="menutoggle"><i class="fa fa-bars"></i></a>

      <form class="searchform" action="index.html" method="post">
        <input type="text" class="form-control" name="keyword" placeholder="在这里搜索..." />
      </form>

      <div class="header-right">
       <ul class="headermenu">
          <li>
            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <img src="<%=path %>/images/photos/loggeduser.png" alt="" />
               		${session.manager.name}
              </button>
              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                 <li><a href="<%=path %>/manager/mgnInfo" target="mainFrame"><i class="glyphicon glyphicon-user"></i> 个人资料</a></li>
                <li><a href="<%=path %>/manager/mgnUpPwdPage" target="mainFrame"><i class="glyphicon glyphicon-cog"></i> 修改密码</a></li>
                <li><a href="<%=path %>/manager/logout"><i class="glyphicon glyphicon-log-out"></i>安全退出</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </div><!-- header-right -->

	</div><!-- headerbar -->
		<iframe name="mainFrame" scrolling="no" rameborder="0" src="<%=path %>/manager/shouye"  class="asd"  frameborder="0"  id="iframe1"></iframe>
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

<script src="<%=path %>/js/jquery-ui-1.10.3.min.js"></script>
<script src="<%=path %>/js/fullcalendar.min.js"></script>
<script src="<%=path %>/js/jquery.ui.touch-punch.min.js"></script>

<script src="<%=path %>/js/custom.js"></script>
<script type="text/javascript">
	$(function(){
		$(".nav li").bind("click",function(){
			$(".nav li").removeClass("active");
			$(this).addClass("active");
			
		});
		
		
	})
	$(function(){
		$(".qwe").bind("click",function(){
			document.getElementById( "iframe1" ).className="mgn";
		});
		$(".ewq").bind("click",function(){
			document.getElementById( "iframe1" ).className="asd";
		});
		$(".article").bind("click",function(){
			document.getElementById( "iframe1" ).className="atc";
		});
	})
	
</script>
</body>
</html>
