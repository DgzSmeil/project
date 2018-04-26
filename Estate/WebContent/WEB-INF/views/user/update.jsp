<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="<%=path%>/images/favicon.png"
	type="image/png">

<title>完善用户资料</title>

<link href="<%=path%>/css/style.default.css" rel="stylesheet">
<style>
#code {
	display: inline-block;
	width: 100px;
	height: 40px;
	vertical-align: middle;
	background-color: black;
	font-size: 25px;
	color: #fff;
	text-align: center;
	line-height: 40px;
	cursor: pointer;
}
</style>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="signin" style="background-color: #eeeeee" >
	<section>
		<div class="signuppanel">
		<div class="logopanel" style="height:100px;"> 
            <h1 style="font-size:80px;"><span>[</span> <a href="">房天下</a> <span>]</span></h1>
        </div><!-- logopanel -->
        <div>
        	<ul></ul>
        </div>
        <div>
			<ul class="breadcrumb col-md-11">
				<li><span class="divider">首页</span></li>
				<li><span class="divider">完善用户资料</span></li>
				<li><a href="<%=path %>/user/homepage?user.id=${user.id}">返回</a></li>
			</ul>

		</div>
				<div class="col-md-10">
					<form method="post" id="form1" action="<%=path%>/user/update" enctype="multipart/form-data">
					<input type="hidden" name="user.id" value="${user.id}"/>
					<input type="hidden" name="user.pwd" value="${user.pwd}"/>
						<h3 class="nomargin">完善用户资料</h3>
						<br />
						<div class="row">
							<div class="mb10 col-md-8" >
								<label class="control-label"> 昵称</label> <input type="text"
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
								<label class="control-label"> 性别  </label>
								<s:if test='user.gender=="女"'>
									<input type="radio" name="user.gender" id="gender" class="form-contorl" value="男" />男
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
								<label class="control-label"> 生日</label> <input type="date"
									name="user.birthday" id="brithday"value="${user.birthday}" class="form-control" placeholder="输入您的邮箱地址..." />
							</div>
						</div>
						<div class="row">
							<div class="mb10 " >
								<label class="control-label"> 手机号码</label> <input type="text"
									name="user.phone" id="phone" maxlength="11" class="form-control"value="${user.phone}" placeholder="输入您的手机号码..." />
							</div>
						</div>
						<div class="row">
							<div class="mb10 ">
								<label class="control-label"> 邮箱</label> <input type="email"
									name="user.email" id="email" class="form-control"value="${user.email}" placeholder="输入您的邮箱地址..." />
							</div>
						</div>
						
						<div class="row">
							<div class="mb10">
								<label class="control-label"> 真实姓名</label> <input type="text"
									name="user.name" id="name"class="form-control"value="${user.name}" placeholder="请输入您的真实姓名" />
							</div>
						</div>
						
						<div class="row">
							<div class="mb10">
								<label class="control-label"> 微信号</label> <input type="text"
									name="user.wechat" id="wechat" class="form-control" value="${user.wechat}" placeholder="输入您的微信号..." />
							</div>
						</div>
						<div class="row">
							<div class="mb10">
								<label class="control-label"> QQ号</label> <input type="text"
									name="user.qq" id="QQ" class="form-control" value="${user.qq}" placeholder="输入您的QQ号..." />
							</div>
						</div>
						<br />

						<button type="submit" id="submit_btn" class="btn btn-success">保存</button>
						<button type="button" id="btn_back" class="btn btn-success">取消</button>
					</form>
				</div>
				<!-- col-sm-6 -->
			<br /> <br /> <br />
		</div>
		<!-- signuppanel -->

	</section>


	<script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
	<script src="<%=path%>/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="<%=path%>/js/bootstrap.min.js"></script>
	<script src="<%=path%>/js/modernizr.min.js"></script>
	<script src="<%=path%>/js/jquery.sparkline.min.js"></script>
	<script src="<%=path%>/js/jquery.cookies.js"></script>

	<script src="<%=path%>/js/toggles.min.js"></script>
	<script src="<%=path%>/js/retina.min.js"></script>

	<script src="<%=path%>/js/select2.min.js"></script>

	<script src="<%=path%>/js/custom.js"></script>
	<!-- 验证 -->
	<script src="<%=path%>/js/user_update.js" type="text/javascript"charset="utf-8"></script>
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
		function F_Open_dialog() 
		{ 
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
<s:if test="#request.msg=='success'">
<script type="text/javascript">
	swal("请核对您的手机号码", "手机号码一定要有效","error");
</script>
</s:if>
</body>
</html>
