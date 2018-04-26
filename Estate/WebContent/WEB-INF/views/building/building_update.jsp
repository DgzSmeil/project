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

  <title>楼栋修改</title>

  <link href="<%=path %>/css/style.default.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body style="background-color: white">
	<div class="pageheader">
	<h2><i class="glyphicon glyphicon-user"></i> 楼栋管理<span>修改楼栋</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
</div>
    <div class="contentpanel">
      <!-- content goes here... -->
		<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path %>/build/updatesave" id="form1" >
				<input type="hidden" id="bud" name="building.id" value="${building.id }"></input>
				<input type="hidden"  name="building.created_time" value="${building.created_time}"></input>
				<input type="hidden" name="building.status" value="${building.status }"></input>
				<input type="hidden" name="building.buildings_id" value="${building.buildings_id }"></input>
				<input type="hidden" name="agency_id" value="${agency_id }"></input>
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">楼栋名称：</label>
				  <div class="col-sm-4">
					<input type="text" value="${building.name }" id="name" name="building.name"  data-placement="right" title="请输入楼栋名称" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div2">
				  <label class="col-sm-3 control-label">总层数：</label>
				  <div class="col-sm-4">
					<input type="number" value="${building.total_floor }" id="total_floor" name="building.total_floor"  data-placement="right" title="请输入总层数" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div3">
				  <label class="col-sm-3 control-label">电梯数：</label>
				  <div class="col-sm-4">
					<input type="number" id="total_lift" value="${building.total_lift }" name="building.total_lift"  data-placement="right" title="请输入电梯数" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div4">
				  <label class="col-sm-3 control-label">每层用户数：</label>
				  <div class="col-sm-4">
					<input type="number" id="floor_rooms" value="${building.floor_rooms }" name="building.floor_rooms"  data-placement="right" title="请输入每层用户数" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">总用户数：</label>
				  <div class="col-sm-4">
					<input type="number" id="total_room" value="${building.total_room }" name="building.total_room"  data-placement="right" title="请输入总用户数" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
			   
				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button class="btn btn-primary btn-lg" id="btn_build"> 提 交 </button>&nbsp;
						<a href="<%=path%>/build/strap?agency_id=${agency_id }" class="btn btn-default btn-lg" > 取消 </a>
				  </div>
				</div>
				<br/>
			   
			  </form>
			  
			</div><!-- panel-body -->
		
			
		</div>
	</div>
    
  
  


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
<script src="<%=path %>/js/build.js"></script>


</body>
</html>
