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
	<h2> 公司资料</h2>
	
</div>

	<div class="contentpanel">
		<!-- content goes here... -->
      
     	<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path %>/agency/update" id="form1"  enctype="multipart/form-data">
				
				  <input type="hidden" id="id" name="agency.id" value="${agency.id }" />
				  <input type="hidden" id="pwd" name="agency.pwd" value="${agency.pwd }" />
				  <input type="hidden" id="logo" name="agency.logo" value="${agency.logo }" />
				  <input type="hidden" id="created_time" name="agency.created_time" value="${agency.created_time }" />
				  <input type="hidden" id="checked_status" name="agency.checked_status" value="${agency.checked_status }" />
				  <input type="hidden" id="status" name="agency.status" value="${agency.status }" />
			   
				
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">公司名称：</label>
				  <div class="col-sm-4">
					<input type="text" id="name" value="${agency.name }" name="agency.name" placeholder="公司名称">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div2">
				  <label class="col-sm-3 control-label">邮箱地址：</label>
				  <div class="col-sm-4">
					<input type="email" id="email" value="${agency.email }" name="agency.email" placeholder="输入邮箱地址">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				
				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">申请人姓名：</label>
				  <div class="col-sm-4">
					<input type="text" id="leader" value="${agency.leader }" name="agency.leader" placeholder="输入姓名">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
			   

				 <div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">固定电话：</label>
				  <div class="col-sm-4">
					<input type="text" maxlength="7" id="tel" value="${agency.tel }" name="agency.tel" placeholder="输入固定电话" >
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				 <div class="form-group" id="div7">
				  <label class="col-sm-3 control-label">公司地址：</label>
				  <div class="col-sm-4">
					<input type="text" id="address" value="${agency.address }" name="agency.address" placeholder="输入公司地址">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div9">
				  <label class="col-sm-3 control-label">手机号码：</label>
				  <div class="col-sm-4">
					<input type="tel" maxlength="11" name="agency.phone" value="${agency.phone }" placeholder="输入手机号码" id="phone" >
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>


				<div class="form-group" id="div11">
				  <label class="col-sm-3 control-label">公司简介：</label>
				  <div class="col-sm-7">
					<textarea  id="intro" name="agency.intro" class="form-control" rows="5">${agency.intro }</textarea>
				  </div>
				  
				</div>

				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button class="btn btn-primary btn-lg" id="btn_agency"> 修改 </button>&nbsp;
						<button class="btn btn-default btn-lg"> 取 消 </button>
				  </div>
				</div>
				<br/>
			   
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
<script>
	$(function(){
		
		
		$("#btn_agency").bind("click",function(){
			if($("#email").val()==""){
				alert("请输入登录邮箱");
				$("#email").focus();
				return;
			}else if($("#name").val()==""){
				alert("请输入公司名称");
				$("#name").focus();
				return;
			}else if($("#leader").val==""){
				alert("请输入申请人姓名");
				$("#leader").focus();
				return;
			}else if($("#tel").val==""){
				alert("请输入固定电话");
				$("#tel").focus();
				return;
			}else if($("#address").val==""){
				alert("请输入公司地址");
				$("#address").focus();
				return;
			}else if($("#phone").val==""){
				alert("请输入手机号码");
				$("#phone").focus();
				return;
			}else if($("#intro").val==""){
				alert("请输入公司简介");
				$("#intro").focus();
				return;
			}else{
				$("#form1").submit();
			}
			
		});
	})


</script>
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
</body>
</html>
