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

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>

<body style="background-color: white">


<div class="pageheader">
		<h2>管理员资料</h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path %>/manager/mgnUpPage" id="form1"  enctype="multipart/form-data">
				
				  <input type="hidden" id="id" name="manager.id" value="${manager.id }" />
				  <input type="hidden" id="pwd" name="manager.pwd" value="${manager.pwd }" />
			   
				
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">姓名：</label>
				  <div class="col-sm-4">
				  <label class="col-sm-3 control-label">${manager.name }</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div2">
				  <label class="col-sm-3 control-label">邮箱：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-3 control-label">${manager.email }</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				 <div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">电话：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-3 control-label">${manager.phone }</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				 <div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">固定电话：</label>
				  <div class="col-sm-4">
				  	<label class="col-sm-3 control-label">${manager.tel }</label>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				 <div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button class="btn btn-primary btn-lg" id="btn_manager"> 修改 </button>&nbsp;
						<button class="btn btn-default btn-lg"> 取 消 </button>
				  </div>
				</div>
			  </form>
			</div><!-- panel-body -->
		</div>
		
</div><!-- contentpanel -->
	


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
	swal("注册错误", "${error}", "error");
	</script>
</s:if>
<s:if test="#request.success!=null">
	<script type="text/javascript">
		swal("成功信息", "${success}", "success");
	</script>
</s:if>
<script>
//返回
$("#back").click(function(){
	window.history.back(-1);
});
</script>
</body>
</html>
