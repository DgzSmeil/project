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
                <img alt="" src="<%=path %>/upload/${agency.logo}" class="media-object">
                <div class="media-body">
                    <h4><s:property value="#request.agency.name"/></h4>
                </div>
            </div>

            <h5 class="sidebartitle actitle">账户</h5>
            <ul class="nav nav-pills nav-stacked nav-bracket mb30">
              <li><a href="<%=path %>/agency/personal?agency.id=${agency.id}" target="mainFrame"><i class="fa fa-user"></i> <span>公司资料</span></a></li>
              <li><a href="<%=path %>/agency/mima?agency.id=${agency.id}" target="mainFrame"><i class="fa fa-cog"></i> <span>帐户设置</span></a></li>
              <li><a href="<%=path %>/agency/exited"><i class="fa fa-sign-out"></i> <span>退出</span></a></li>
            </ul>
        </div>
			
      <h5 class="sidebartitle">导航</h5>
      <ul class="nav nav-pills nav-stacked nav-bracket" id="ul1">
        <li class="active"><a href="<%=path %>/agency/shouye" target="mainFrame" class="qwe"><i class="fa fa-home"></i> <span>首页</span></a></li>
        <li class="nav-parent"><a href="" target="mainFrame"><i class="glyphicon glyphicon-user"></i> <span>员工管理</span></a>
        	<ul class="children">
            <li><a href="<%=path%>/emp/list?agency_id=${agency.id}" target="mainFrame" class="zxc"><i class="fa fa-caret-right"></i> 所有员工</a></li>
            <li><a href="<%=path%>/emp/add?agency_id=${agency.id}" id="asd" target="mainFrame" class="zxc"><i class="fa fa-caret-right"></i> 添加员工</a></li>
          </ul>
        </li>
        <li class="nav-parent"><a href="" target="mainFrame" class="qwe"><i class="fa fa-file-text"></i> <span>员工绩效</span></a>
          <ul class="children">
            <li><a href="<%=path %>/mission/strap?agency_id=${agency.id}" target="mainFrame" class="zxc"><i class="fa fa-caret-right"></i> 员工绩效</a></li>
          </ul>
        </li>
        <li class="nav-parent"><a href="" target="mainFrame"><i class="fa fa-building" class="qwe"></i> <span>楼盘管理</span></a>
          <ul class="children">
            <li><a href="<%=path%>/builds/list1?agency_id=${agency.id}" target="mainFrame" class="ewq"><i class="fa fa-caret-right"></i> 所有楼盘</a></li>
            <li><a href="<%=path%>/builds/addInfo" id="asd" target="mainFrame" class="ewq"><i class="fa fa-caret-right"></i> 添加楼盘</a></li>
          </ul>
        </li>
		<li class="nav-parent"><a href="" target="mainFrame"><i class="fa fa-building" class="zxc"></i> <span>楼栋管理</span></a>
          <ul class="children">
            <li><a href="<%=path%>/build/strap?agency_id=${agency.id}" target="mainFrame" class="zxc"><i class="fa fa-caret-right"></i> 所有楼栋</a></li>
            <li><a href="<%=path%>/build/add?agency_id=${agency.id}" id="asd" target="mainFrame" class="zxc"><i class="fa fa-caret-right"></i> 添加楼栋</a></li>
          </ul>
        </li>
         <li class="nav-parent"><a href="layouts.html" target="mainFrame" class="zxc"><i class="fa fa-building"></i> <span>房号管理</span></a>
            <ul class="children">
                <li><a href="<%=path %>/room/strap?agency_id=${agency.id}" target="mainFrame" class="zxc"><i class="fa fa-caret-right"></i> 房号管理</a></li>
                <li><a href="<%=path%>/room/add?agency_id=${agency.id}" id="asd" target="mainFrame" class="zxc"><i class="fa fa-caret-right"></i> 添加房号</a></li>
            </ul>
        </li>
        <li class="nav-parent"><a href="" target="mainFrame" class="qwe"><i class="fa fa-th-list"></i> <span>活动管理</span></a>
          <ul class="children">
            <li><a href="<%=path %>/activity/list1?agency_id=${agency.id}" target="mainFrame" class="zxc"><i class="fa fa-caret-right"></i> 所有活动</a></li>
            <li><a href="<%=path %>/activity/addInfo?agency.id=${agency.id}" target="mainFrame" class="zxc"><i class="fa fa-caret-right"></i> 发布活动</a></li>
          </ul>
        </li>
        <li><a href="<%=path %>/message/list1?agency_id=${agency.id}" target="mainFrame" class="zxc"><i class="glyphicon glyphicon-star-empty"></i> <span>留言管理</span></a></li>
        <li class="nav-parent"><a href="" target="mainFrame" class="zxc"><i class="fa fa-users"></i> <span>购房用户</span></a>
            <ul class="children">
                <li><a href="<%=path %>/sale/strap?angency_id=${agency.id}" target="mainFrame" class="zxc"><i class="fa fa-caret-right"></i> 所有用户</a></li>
            </ul>
        </li>
         <li class="nav-parent"><a href="" target="mainFrame" class="qwe"><i class="fa fa-file-text"></i> <span>购房预约</span></a>
          <ul class="children">
            <li><a href="<%=path %>/appointment/strap?angency_id=${agency.id}" target="mainFrame" class="zxc"><i class="fa fa-caret-right"></i> 预约用户</a></li>
          </ul>
        </li>
        <li class="nav-parent"><a href="layouts.html" target="mainFrame" class="qwe"><i class="fa fa-laptop"></i> <span>户型管理</span></a>
            <ul class="children">
                <li><a href="<%=path %>/house/strap?agency_id=${agency.id}" target="mainFrame" class="zxc"><i class="fa fa-caret-right"></i> 户型管理</a></li>
                <li><a href="<%=path%>/house/add?agency_id=${agency.id}" id="asd" target="mainFrame" class="zxc"><i class="fa fa-caret-right"></i> 添加户型</a></li>
            </ul>
        </li>
       
        
		    <li><a href="<%=path %>/builds/ditu?agency_id=${agency.id}" target="mainFrame" class="qwe"><i class="fa fa-map-marker"></i> <span>楼盘地图</span></a></li>
     <li><a href="<%=path %>/sale/sale_chart?agency_id=${agency.id}" target="mainFrame" class="qwe"><i class="fa fa-bar-chart-o"></i> <span>销售记录</span></a></li>
     
      </ul>

      

    </div><!-- leftpanelinner -->
  </div><!-- leftpanel -->

  <div class="mainpanel">

    <div class="headerbar">

      <a class="menutoggle"><i class="fa fa-bars"></i></a>


      <div class="header-right">
        <ul class="headermenu">
          
          <li>
            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <img src="<%=path %>/upload/${agency.logo}" alt="" />
              		${agency.name}
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                <li><a href="<%=path %>/agency/personal?agency.id=${agency.id}" target="mainFrame"><i class="glyphicon glyphicon-user"></i> 公司资料</a></li>
                <li><a href="<%=path %>/agency/mima?agency.id=${agency.id}" target="mainFrame"><i class="glyphicon glyphicon-cog"></i> 账户设置</a></li>
                <li><a href="<%=path %>/agency/exited"><i class="fa fa-sign-out"></i> <span>退出</span></a></li>
              </ul>
            </div>
          </li>
        </ul>
      </div><!-- header-right -->

	</div><!-- headerbar -->

	
		<iframe name="mainFrame" scrolling="no" rameborder="0" src="<%=path %>/agency/shouye"  class="asd" frameborder="0" id="iframe1"></iframe>
	
			
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
		$(".zxc").bind("click",function(){
			document.getElementById( "iframe1" ).className="cxz";
		});
		
	})
	
</script>
</body>
</html>
