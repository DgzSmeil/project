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
		<h2><i class="fa fa-th-list"></i>楼盘管理 <span>所有楼盘</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	</div>



 <div class="contentpanel panel-email">
		<div class="panel-body" style="padding-bottom:0px;">
<div id="toolbar" class="btn-group">
	 <button id="btn_look" type="button" class="btn btn-default">
	     <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>详细资料
	 </button>
	 <button id="btn_search" type="button" class="btn btn-default">
	     <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>查询
	 </button>
	 <button id="btn_lookBudsImg" type="button" class="btn btn-default">
	     <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>查看楼盘图片
	 </button>
	 <button id="btn_lookHsType" type="button" class="btn btn-default">
	     <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>查看户型
	 </button>
	</div>  
 <div class="row">
    <div class="col-md-12">
        <table class="table table-hover" id="cusTable"  
		       data-pagination="true"  
		       data-show-refresh="true"  
		       data-show-toggle="true"  
		        data-toolbar="#toolbar"
		         data-search="true" 
		       data-showColumns="true">  
		       	  <colgroup>
		       		<col>
		       		<col style="width:200px">
		       		<col style="width:100px">
		       		<col style="width:100px">
		       		<col style="width:100px">
		       		<col style="width:80px">
		       		<col style="width:80px">
		       		<col style="width:100px">
		       		<col style="width:80px">
	       			<col style="width:80px">
		       </colgroup>
		     	<thead> 
		          <tr>
		          	  <th data-radio="true" data-valign="middle"></th>                              
			       	  <th data-field="logo"  data-valign="middle" data-formatter="logoFormatter">楼盘封面</th>            
		       		  <th data-field="name"  data-valign="middle">名称</th>  
		       		  <th data-field="area" data-valign="middle" >区域</th>  
					  <th data-field="address" data-valign="middle" >地址</th>    
				      <th data-field="floor_area" data-valign="middle" >占地面积</th>          
					  <th data-field="house_type"  data-valign="middle">房源类型</th>
					  <th data-field="building_type"  data-valign="middle">建筑类型</th>
					  <th data-field="company" data-valign="middle">开发公司</th>  
					   <th data-field="status" data-formatter="logoFormatter2" data-valign="middle">激活状态</th>  
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
<script src="<%=path %>/js/bootstrap_buildings.js"></script>
<script src="<%=path %>/js/jquery.contextMenu.js"></script>
<script type="text/javascript">
  $(document).ready(function () {          
      //调用函数，初始化表格  
      initTable();  

      //当点击查询按钮的时候执行  
      $("#search").bind("click", initTable);  
  });  
  $.contextMenu({
		 // define which elements trigger this menu
		 selector: "#cusTable tr",
		 // define the elements of the menu
		 items: {
		 buildsimg: {name: "查看楼盘图片", callback: function(key, opt){ 
			 var data=$("#cusTable").bootstrapTable("getSelections");
			 if(data.length==1)
			{
				 window.location.href="<%=path %>/buildings_img/mgnBdsImgPage?buildingsImg.buildings_id="+data[0].id;
			}else
			{
				swal("提示信息", "请选中行", "info");
			}
		 }},
		 housestyle: {name: "查看户型", callback: function(key, opt){ 
			 var data=$("#cusTable").bootstrapTable("getSelections");
			 if(data.length==1)
			{
				 window.location.href="<%=path %>/house/mgnhousepage?house.buildings_id="+data[0].id;
			}else
			{
				swal("提示信息", "请选中行", "info");
			}
		 }},
		 detailinfo: {name: "详细资料", callback: function(key, opt){ 
			 var data=$("#cusTable").bootstrapTable("getSelections");
			 if(data.length==1)
			{
				 window.location.href=basePath+"/builds/buildingslook?builds.id="+data[0].id; 
			}else
			{
				swal("提示信息", "请选中行", "info");
			}
		 }},
		look: {name: "查询", callback: function(key, opt){ 
			 $('#myModal').modal('show');
		 }},
		 reset: {name: "取消", callback: function(key, opt){ 
			 }}
		 }
		 // there's more, have a look at the demos and docs...
		});
</script>
</body>
</html>