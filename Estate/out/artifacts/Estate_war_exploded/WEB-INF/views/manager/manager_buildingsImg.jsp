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

<title>房天下后台管理-员工管理</title>

<link href="<%=path %>/css/style.default.css" rel="stylesheet">
<link href="<%=path %>/css/jquery.gritter.css" rel="stylesheet">
<link href="<%=path %>/css/morris.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet" type="text/css">  
<link href="<%=path %>/css/bootstrap-table.min.css" rel="stylesheet" type="text/css">  
<script src="<%=path %>/js/jquery.min.js"></script>  
<script src="<%=path %>/js/bootstrap.min.js"></script>  
<script src="<%=path %>/js/bootstrap-table.min.js"></script>  
<script src="<%=path %>/js/bootstrap-table-zh-CN.js"></script> 
<script src="<%=path %>/js/bootstrap-table-export.js"></script> 
	<script src="<%=path %>/js/tableExport.js"></script> 
	<link rel="stylesheet" href="<%=path %>/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" href="<%=path %>/easyui/themes/icon.css" />
	<link rel="stylesheet" href="<%=path %>/css/main.css" />
	<link rel="stylesheet" href="<%=path %>/css/jquery.contextMenu.css" />
	 <link href="<%=path %>/css/sweetalert.css" rel="stylesheet">
	  <script type="text/javascript" src="<%=path %>/js/sweetalert-dev.js"></script>
	   <link rel="stylesheet" href="<%=path %>/css/lightbox.css" media="screen"/>
	<script src="<%=path %>/js/lightbox-2.6.min.js"></script>
<style type="text/css">
	table tbody tr td{
		text-align: center;
		font-size: 11px;
	}
	.table{
	table-layout:fixed;
	}
	.table>thead>tr>th { text-align: center;}
</style>
</head>

<body>

	<div class="pageheader">
		<h2><i class="fa fa-th-list"></i>楼盘管理管理 <span>所有楼盘</span><span>查看楼盘图片</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	</div>



 <div class="contentpanel panel-email">
		<div class="panel-body" style="padding-bottom:0px;">
	  
 <div class="row">
    <div class="col-md-12">
        <table class="table table-hover" id="cusTable"  
		       data-pagination="true"  
		       data-show-refresh="true"  
		       data-show-toggle="true"  
		       data-showColumns="true">  
		       	  <colgroup>
		       		<col>
		       		<col style="width:200px">
		       		<col style="width:650px">
		       </colgroup>
		     	<thead> 
		         <tr>
		          	  <th data-radio="true" data-valign="middle"></th>                                                           
		              <th data-field="img_path" data-valign="middle" data-formatter="logoFormatter">图片</th>  
		              <th data-field="img_des"  data-valign="middle">图片描述</th>
		          </tr>  
		       </thead>  
		       <tbody>  
		       </tbody>  
		</table>  
       </div>                
   </div>
  </div>
  </div>
 
<!-- 模态框的使用 -->
 <!-- 查询的模态对话框 -->
 <div id="myModal" class="modal fade"  role="dialog"   aria-hidden=true>
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">
                    <i class="icon-pencil"></i>
                    <span id="lblAddTitle" style="font-weight:bold">条件查询</span>
                </h4>
            </div>
                <div class="modal-body" style="text-align:center;">
			   	<form class="form-horizontal form-bordered" method="post" action="<%=path %>/agency/agcedit" id="form1"  enctype="multipart/form-data">
						<div class="form-group" id="div2">
						  <label class="col-sm-4 control-label">名称：</label>
						  <div class="col-sm-4">
							<input type="text" id="buildsname" name="builds.nickname"  value=""  data-placement="right"  class="form-control tooltips">
						  </div>
						  <div class="col-sm-4 tips"></div>
						</div>
						
						<div class="form-group" id="div2">
						  <label class="col-sm-4 control-label">区域：</label>
						  <div class="col-sm-4">
							<input type="text" id="building_area" name="builds.name"  value=""  data-placement="right"  class="form-control tooltips">
						  </div>
						  <div class="col-sm-4 tips"></div>
						</div>
			
						 <div class="form-group" id="div6">
						  <label class="col-sm-4 control-label">地址：</label>
						  <div class="col-sm-4">
							<input type="text" id="buildsaddress" name="builds.email"  value=""  data-placement="right"  class="form-control tooltips">
						  </div>
						  <div class="col-sm-4 tips"></div>
						</div>
						
						<div class="form-group" id="div6">
						  <label class="col-sm-4 control-label">开发公司：</label>
						  <div class="col-sm-4">
							<input type="text" id="company" name="builds.phone"  value=""  data-placement="right"  class="form-control tooltips">
						  </div>
						  <div class="col-sm-4 tips"></div>
						</div>
					  </form>
                </div>
                 <div class="modal-footer bg-info">
                    <input type="hidden" id="ID" name="ID" class="col-sm-3"/>
                    <div class="col-sm-7">
						<button id="bysearch" type="submit" class="btn btn-primary" >确定</button>
						<button type="button" class="btn green" data-dismiss="modal">取消</button>
				  </div>
				  <label class="col-sm-2 control-label"></label>
                </div>
        </div>
    </div>
</div>

</body>
<script src="<%=path %>/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/js/bootstrapt_buildingsImg.js"></script>
<script type="text/javascript">
  $(document).ready(function () {          
      //调用函数，初始化表格  
      initTable();  
      //当点击查询按钮的时候执行  
      $("#search").bind("click", initTable);  
  });  
</script>
<script type="text/javascript">
  $("#back").click(function(){
		window.history.back(-1);
	})
</script>

</body>
</html>