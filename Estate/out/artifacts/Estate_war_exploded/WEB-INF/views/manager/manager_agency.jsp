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
	<s:if test="#session.checked=='Y'.toString()">
		<h2><i class="fa fa-th-list"></i>经销商管理 <span>已审核</span></h2>
	</s:if>
	<s:if test="#session.checked=='N'.toString()">
		<h2><i class="fa fa-th-list"></i>经销商管理 <span>未审核</span></h2>
	</s:if>
	<s:if test="#session.checked=='F'.toString()">
		<h2><i class="fa fa-th-list"></i>经销商管理 <span>未通过</span></h2>
	</s:if>
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
	<s:if test="#session.checked=='Y'.toString()">
		 <button id="btn_edit" type="button" class="btn btn-default">
		 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
		 </button>
	 </s:if>
	 <button id="btn_search" type="button" class="btn btn-default">
	 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>查询
	 </button>
	 <s:if test="#session.checked=='F'.toString()">
		 <button id="btn_delbytime" type="button" class="btn btn-default">
		 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>删除
		 </button>
	 </s:if>
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
		       		<col style="width:100px">
		       		<col style="width:80px">
		       		<col style="width:80px">
		       		<s:if test="#session.checked=='Y'.toString()">
		       			<col style="width:100px">
		       		</s:if>
		       		
		       </colgroup>
		       <thead> 
		          <tr>
		          	  <th data-radio="true" data-valign="middle"></th>                              
		       		<th data-field="logo"  data-valign="middle" data-formatter="logoFormatter">商标</th>                            
		              <th data-field="name"  data-valign="middle">名称</th>
					  <th data-field="leader" data-valign="middle" >领导人</th>
					  <th data-field="phone" data-valign="middle" >手机</th>
					  <th data-field="tel" data-valign="middle">电话</th>
					    <th data-field="address" data-valign="middle">地址</th>  
					   <s:if test="#session.checked=='Y'.toString()">
					  		<th data-field="status" data-valign="middle" data-formatter="logoFormatter2">激活状态</th>
					  </s:if>
					  <s:if test="#session.checked=='Y'.toString()">
		          			<th data-field="" data-valign="middle" data-formatter="logoFormatter3">操作</th>
		          	</s:if>
		          	 <s:if test="#session.checked=='N'.toString()">
		          			<th data-field="" data-valign="middle" data-formatter="logoFormatter5">操作</th>
		          	</s:if>
		          	 <s:if test="#session.checked=='F'.toString()">
		          			<th data-field="" data-valign="middle" data-formatter="logoFormatter6">操作</th>
		          	</s:if>
		          </tr>  
		       </thead>  
		       <tbody>  
		       </tbody>  
		</table>  
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
							<input type="text" id="agencyname" name="agency.name"  value=""  data-placement="right"  class="form-control tooltips">
						  </div>
						  <div class="col-sm-4 tips"></div>
						</div>
						
						<div class="form-group" id="div5">
						  <label class="col-sm-4 control-label">邮箱：</label>
						  <div class="col-sm-4">
							<input type="text" id="agencyemail" name="agency.email"  value=""  data-placement="right"  class="form-control tooltips">
						  </div>
						  <div class="col-sm-4 tips"></div>
						</div>
					                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
			
						 <div class="form-group" id="div6">
						  <label class="col-sm-4 control-label">领导人：</label>
						  <div class="col-sm-4">
							<input type="text" id="agencyleader" name="agency.leader"  value=""  data-placement="right"  class="form-control tooltips">
						  </div>
						  <div class="col-sm-4 tips"></div>
						</div>
						
						 <div class="form-group" id="div6">
						  <label class="col-sm-4 control-label">手机：</label>
						  <div class="col-sm-4">
							<input type="text" id="agencyphone" name="agency.phone"  value=""  data-placement="right"  class="form-control tooltips">
						  </div>
						  <div class="col-sm-4 tips"></div>
						</div>
						
						<div class="form-group" id="div6">
						  <label class="col-sm-4 control-label">固定电话：</label>
						  <div class="col-sm-4">
							<input type="text" id="agencytel" name="agency.tel"  value=""  data-placement="right"  class="form-control tooltips">
						  </div>
						  <div class="col-sm-4 tips"></div>
						</div>
						
					<div class="form-group" id="div6">
						  <label class="col-sm-4 control-label">地址：</label>
						  <div class="col-sm-4">
							<input type="text" id="agencyaddress" name="agency.address"  value="" data-placement="right" class="form-control tooltips">
						  </div>
						  <div class="col-sm-4 tips"></div>
						</div>
					
					
						<!-- 
							<div class="form-group" id="div2">
						  <label class="col-sm-4 control-label">创建时间：</label>
						  <div class="col-sm-4">
							
							<input type="text" id="agencycreated_time" style="width:270px;height:35px;" name="agency.created_time"  value="" data-options="sharedCalendar:'#cc'"  data-placement="right"  class="form-control tooltips easyui-datebox">
						  	<div id="cc" class="easyui-calendar"></div>
						  </div>
						  <div class="col-sm-4 tips"></div>
						</div>
						
						<div class="form-group" id="div2">
						  <label class="col-sm-4 control-label">截止时间：</label>
						  <div class="col-sm-4">
							
							<input type="text" id="endtime" style="width:270px;height:35px;" name="endtime"  value="" data-options="sharedCalendar:'#cc2'"  data-placement="right"  class="form-control tooltips easyui-datebox">
						  	<div id="cc2" class="easyui-calendar"></div>
						  </div>
						  <div class="col-sm-4 tips"></div>
						</div>
						
							<div class="form-group" id="div2">
						  <label class="col-sm-4 control-label">激活状态：</label>
						  <div class="col-sm-4">
						  		<label class="btn btn-primary active">
					           		<input type="radio" id="agencystatus"  name="agency.status" data-placement="right"  class=" " value="Y"  checked>激活
						        </label>
						        <label class="btn btn-primary">
						            <input type="radio" id="agencystatus"  name="agency.status" data-placement="right"  class=" " value="N" >冻结
						        </label>
						  </div>
						  <div class="col-sm-4 tips"></div>
						</div>
						 -->
						
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

<!-- 审核意见框 -->
 <div id="bytimeFm" class="modal fade"  role="dialog"    aria-hidden=true>
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">
                    <i class="icon-pencil"></i>
                    <span id="lblAddTitle" style="font-weight:bold">由时间删除</span>
                </h4>
            </div>
                <div class="modal-body" style="text-align:center;">
					  <form class="form-horizontal form-bordered" method="post" action="" id="ckform" >
					  	<div class="form-group" id="div2">
						  <label class="col-sm-4 control-label">创建时间：</label>
						  <div class="col-sm-4">
							
							<input type="text" id="createstart" style="width:270px;height:35px;" name="createstart"  value="" data-options="sharedCalendar:'#cc'"  data-placement="right"  class="form-control tooltips easyui-datebox">
						  	<div id="cc" class="easyui-calendar"></div>
						  </div>
						  <div class="col-sm-4 tips"></div>
						</div>
						
						<div class="form-group" id="div2">
						  <label class="col-sm-4 control-label">截止时间：</label>
						  <div class="col-sm-4">
							
							<input type="text" id="createend" style="width:270px;height:35px;" name="createend"  value="" data-options="sharedCalendar:'#cc2'"  data-placement="right"  class="form-control tooltips easyui-datebox">
						  	<div id="cc2" class="easyui-calendar"></div>
						  </div>
						  <div class="col-sm-4 tips"></div>
						</div>
					  </form>
                </div>
                <div class="modal-footer bg-info">
                
                    <input type="hidden" id="ID" name="ID" class="col-sm-3"/>
                    <div class="col-sm-7">
						<button id="btn_delbytimeFn" type="submit" class="btn btn-primary" >确定</button>
						<button type="button" class="btn green" data-dismiss="modal">取消</button>
				  </div>		 
				  <label class="col-sm-2 control-label"></label>
                </div>
        </div>
    </div>
</div>
 </div>
</div>

<!--由时间删除框 -->
 <div id="checkMsg" class="modal fade"  role="dialog"   aria-hidden=true>
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">
                    <i class="icon-pencil"></i>
                    <span id="lblAddTitle" style="font-weight:bold">审核意见</span>
                </h4>
            </div>
                <div class="modal-body" style="text-align:center;">
					  <form class="form-horizontal form-bordered" method="post" action="" id="ckform" >
					  <input type="hidden" id="agencyid" name="agency.id" value="">
						<div class="form-group" id="div6">
						<label class="col-sm-1 control-label">审核意见：</label>
						  <div class="col-sm-11">
							<textarea id="agencychecked_reason" name="agency.checked_reason"  style="width:700px;height:400px;"  data-placement="right"  class="form-control tooltips"></textarea>
						  </div>
						</div>
					  </form>
                </div>
                <div class="modal-footer bg-info">
                
                    <input type="hidden" id="ID" name="ID" class="col-sm-3"/>
                    <div class="col-sm-7">
						<button id="ckreason" type="submit" class="btn btn-primary" >确定</button>
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
<script src="<%=path %>/js/bootstrap_agency.js"></script>
<script src="<%=path %>/js/jquery.contextMenu.js"></script>
<s:if test="#session.checked=='Y'.toString()">
<script>
$.contextMenu({
	 // define which elements trigger this menu
	 selector: "#cusTable tr",
	 // define the elements of the menu
	 items: {
	 housestyle: {name: "修改", callback: function(key, opt){ 
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/agency/agceditpage?agency.id="+data[0].id; 
			}else{
				swal("提示信息", "请选中行", "info");
			}
	 }},
	 detailinfo: {name: "详细资料", callback: function(key, opt){ 
		 var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/agency/agclook?agency.id="+data[0].id; 
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
</s:if>

<s:elseif test="#session.checked=='F'.toString()">
<script>
$.contextMenu({
	 // define which elements trigger this menu
	 selector: "#cusTable tr",
	 // define the elements of the menu
	 items: {
	 detailinfo: {name: "详细资料", callback: function(key, opt){ 
		 var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/agency/agclook?agency.id="+data[0].id; 
			}else{
				swal("提示信息", "请选中行", "info");
			}
	 }},
	look: {name: "查询", callback: function(key, opt){ 
		$('#myModal').modal('show');
	 }},
	del: {name: "删除", callback: function(key, opt){ 
		$('#bytimeFm').modal('show');
	 }},
	 reset: {name: "取消", callback: function(key, opt){ 
		 }}
	 }
});
</script>
</s:elseif>
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