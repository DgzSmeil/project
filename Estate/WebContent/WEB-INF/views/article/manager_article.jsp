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
		<h2><i class="fa fa-th-list"></i>文章管理 <span>所有文章</span></h2>
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
	  <button id="btn_add" type="button" class="btn btn-default">
	 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>新增
	 </button>
	  <button id="btn_edit" type="button" class="btn btn-default">
	 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
	 </button>
	 </div>
 <div class="row">
    <div class="col-md-12">
        <table class="table table-hover" id="cusTable"  
		       data-show-refresh="true"  
		       data-show-toggle="true"  
		       data-toolbar="#toolbar"
		       data-search="true" 
		       data-showColumns="true">  
		       	  <colgroup>
		       		<col>
		       		<col style="width:150px">
		       		<col style="width:100px">
		       		<col style="width:100px">
		       		<col style="width:100px">
		       		<col style="width:100px">
		       		<col style="width:100px">
		       </colgroup>
		     	<thead> 
		          <tr>
		          	  <th data-radio="true" data-valign="middle"></th>                              
			       	  <th data-field="logo" data-valign="middle" data-formatter="logoFormatter">文章图片路径</th>            
		       		  <th data-field="title"  data-valign="middle">文章标题</th>  
		       		  <th data-field="abstracts"  data-valign="middle">文章摘要</th>  
		       		  <th data-field="created_time" data-valign="middle" data-formatter="formatDate">创建时间</th>            
		       		  <th data-field="status"  data-valign="middle" data-formatter="logoFormatter2">状态</th>  
		       		  <th data-field=""  data-valign="middle" data-formatter="logoFormatter3">操作</th>  
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
						  <label class="col-sm-4 control-label">文章标题：</label>
						  <div class="col-sm-4">
							<input type="text" id="articleTitle" name="article.title" data-placement="right" class="form-control tooltips">
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
<script src="<%=path %>/js/bootstrap_article.js"></script>
<script src="<%=path %>/js/jquery.contextMenu.js"></script>
<script>
$.contextMenu({
	 // define which elements trigger this menu
	 selector: "#cusTable tr",
	 // define the elements of the menu
	 items: {
	 add: {name: "新增", callback: function(key, opt){ 
		 window.location.href=basePath+"/article/articleAddPage";
	 }},
	 housestyle: {name: "修改", callback: function(key, opt){ 
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/article/articleEditPage?article.id="+data[0].id; 
			}else{
				swal("提示信息", "请选中行", "info");
			}
	 }},
	 detailinfo: {name: "详细资料", callback: function(key, opt){ 
		 var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/article/articleLook?article.id="+data[0].id; 
			}else{
				swal("提示信息", "请选中行", "info");
			}
	 }},
	look: {name: "查询", callback: function(key, opt){ 
		$('#myModal').modal('show');
	 }},
	 reset: {name: "取消", callback: function(key, opt){ 
		 }}
	 }
});
</script>
<script type="text/javascript">
  $(document).ready(function () {          
      //调用函数，初始化表格  
      initTable();  
      //当点击查询按钮的时候执行  
      $("#search").bind("click", initTable);  
  });  
</script>
</body>
</html>