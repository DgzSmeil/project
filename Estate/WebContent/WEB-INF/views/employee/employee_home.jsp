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
<!-- 提示框 -->
  <script src="<%=path %>/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="<%=path %>/css/sweetalert.css">
    <title>房天下后台管理</title>

<link href="<%=path %>/css/style.default.css" rel="stylesheet">
<link href="<%=path %>/css/fullcalendar.css" rel="stylesheet">
<style type="text/css">
	.asd{
		width:100%;
		height:1100px;
	}
	.dsa{
		width:100%;
		height:2100px;
	}
	.cxz{
		width:100%;
		height:900px;
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
                <div class="media-body">
                    <h4><s:property value="#request.employee.name"/></h4>
                </div>
            </div>

            <h5 class="sidebartitle actitle">账户</h5>
            <ul class="nav nav-pills nav-stacked nav-bracket mb30">
              <li><a href="<%=path %>/emp/employeepage?employee.id=${employee.id}" target="mainFrame"><i class="fa fa-file-text"></i><span>个人信息</span></a></li>
              <li><a href="<%=path %>/emp/updatepage?employee.id=${employee.id}" target="mainFrame"><i class="fa fa-user"></i><span>修改信息</span></a></li>
              <li><a href="<%=path %>/emp/changepwdpage?employee.id=${employee.id}" target="mainFrame"><i class="fa fa-cog"></i> <span>密码设置</span></a></li>
              <li><a href="<%=path %>/emp/exit"><i class="fa fa-sign-out"></i><span>安全退出</span></a></li>
            </ul>
        </div>
			
      <ul class="nav nav-pills nav-stacked nav-bracket" id="ul1">
        <li class="active"><a href="<%=path %>/agency/shouye" target="mainFrame" class="qwe"><i class="fa fa-home"></i> <span>首页</span></a></li>
        <li class="nav-parent"><a href=""target="mainFrame"><i class="fa fa-edit" class="qwe"></i> <span>客户管理</span></a>
        	<ul class="children">
        		<li><a href="<%=path%>/customer/page" target="mainFrame" class="qwe"><i class="fa fa-caret-right"></i> <span>添加客户</span></a></li>
        		<li><a href="<%=path%>/customer/list?employee_id=${employee.id}" target="mainFrame" class="qwe"><i class="fa fa-caret-right"></i> <span>客户列表</span></a></li>
        	</ul>
        </li>
        <li class="nav-parent"><a href="" target="mainFrame"><i class="fa fa-building" class="qwe"></i><span>销售管理</span></a>
          <ul class="children">
          	<li><a href="<%=path %>/room/look?emp_id=${employee.id}" target="mainFrame" class="qwe"><i class="fa fa-caret-right"></i>房屋列表</a></li>
			<li><a href="<%=path %>/sale/list?emp_id=${employee.id}" target="mainFrame" class="qwe"><i class="fa fa-caret-right"></i>销售记录</a></li>
         </ul>
          
        </li>
        <li class="nav-parent"><a href="" target="mainFrame" class="qwe"><i class="fa fa-suitcase"></i> <span>绩效管理</span></a>
          <ul class="children">
            <li><a href="<%=path %>/mission/list?emp_id=${employee.id}" target="mainFrame" class="qwe"><i class="fa fa-caret-right"></i>绩效查看</a></li>
            <li><a href="<%=path %>/mission/emp_chart?emp_id=${employee.id}" target="mainFrame" class="qwe"><i class="fa fa-caret-right"></i>报表查看</a></li>
          </ul>
        </li>
        <li class="nav-parent"><a href="" target="mainFrame" class="qwe"><i class="fa fa-laptop"></i> <span>预约管理</span></a>
            <ul class="children">
                <li><a href="<%=path %>/appointment/list?emp_id=${employee.id}" target="mainFrame" class="qwe"><i class="fa fa-caret-right"></i>预约列表</a></li>
            </ul>
        </li>
        <li class="nav-parent"><a href="layouts.html" target="mainFrame" class="qwe"><i class="glyphicon glyphicon-cog"></i><span>账户设置</span></a>
            <ul class="children">
            	<li><a href="<%=path %>/emp/employeepage?employee.id=${employee.id}" target="mainFrame"><i class="fa fa-file-text"></i><span>个人信息</span></a></li>
                <li><a href="<%=path %>/emp/updatepage?employee.id=${employee.id}" target="mainFrame" class="qwe"><i class="fa fa-user"></i>修改信息</a></li>
                <li><a href="<%=path %>/emp/changepwdpage?employee.id=${employee.id}" target="mainFrame" class="qwe"><i class="fa fa-cog"></i>修改密码</a></li>
                <li><a href="<%=path %>/emp/exit" class="qwe"><i class="fa fa-sign-out"></i>安全退出</a></li>
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
                <img src="<%=path%>/upload/${employee.headicon }" alt=""/>
              		${employee.name}
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                <li><a href="<%=path %>/emp/employeepage?employee.id=${employee.id}" target="mainFrame"><i class="fa fa-file-text"></i><span>个人信息</span></a></li>
                <li><a href="<%=path %>/emp/updatepage?employee.id=${employee.id}" target="mainFrame"><i class="glyphicon glyphicon-user"></i>修改信息</a></li>
                <li><a href="<%=path %>/emp/changepwdpage?employee.id=${employee.id}" target="mainFrame"><i class="glyphicon glyphicon-cog"></i>修改密码</a></li>
                <li><a href="<%=path %>/emp/exit"><i class="glyphicon glyphicon-log-out"></i>安全退出</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </div><!-- header-right -->
	
	</div><!-- headerbar -->
		<iframe name="mainFrame" src="<%=path %>/agency/shouye"  class="asd" id="iframe1"></iframe>	
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

<s:if test="#request.msg!=null">
	<script type="text/javascript">
		alert("${msg}");
	</script>
</s:if>
<script type="text/javascript">
	$(function(){
		$(".nav li").bind("click",function(){
			$(".nav li").removeClass("active");
			$(this).addClass("active");
			
		});
		
		
	})
	$(function(){
		$(".qwe").bind("click",function(){
			document.getElementById( "iframe1" ).className="asd";
		});
		$(".ewq").bind("click",function(){
			document.getElementById( "iframe1" ).className="dsa";
		});
		
	})
	
</script>
</body>
</html>
