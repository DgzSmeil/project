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
<style type="text/css">
	table tbody tr td{
		text-align: center;
		font-size: 18px;
	}
</style>

<!-- 提示框 -->
  <script src="<%=path %>/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="<%=path %>/css/sweetalert.css">
</head>

<body>

	<div class="pageheader">
		<h2><i class="fa fa-building"></i>楼盘管理 <span>楼盘图片</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	</div>

		<div class="contentpanel panel-email">
		<div class="panel-body" style="padding-bottom:0px;">
		 <form id="formSearch" class="form-horizontal">
			 <input type="hidden" id="asd" value="${buildings_id }">
		 </form>
 
 <div id="toolbar" class="btn-group">
	 <button id="btn_add" type="button" class="btn btn-default">
	 	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
	 </button>
	 <button id="btn_edit" type="button" class="btn btn-default">
	 	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
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
		       <thead>  
		          <tr>
		          	  <th data-radio="true" data-valign="middle"></th>                                                           
		              <th data-field="img_path" data-formatter="logoFormatter">图片</th>  
		              <th data-field="img_des" >图片描述</th>
					  <th data-field="buildings.name" >所属楼盘</th>
				  	  <th data-field="created_time" >创建时间</th>
		          </tr>  
		       </thead>  
		       <tbody>  
		       </tbody>  
		</table>  
       </div>                
   </div>
 </div>
 </div>
<script type="text/javascript">
var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;
function initTable() {  
    //先销毁表格  
    $('#cusTable').bootstrapTable('destroy');  
    //初始化表格,动态从服务器加载数据  
    $("#cusTable").bootstrapTable({  
        method: "get",  //使用get请求到服务器获取数据  
        url: basePath+"/buildings_img/list", //获取数据的Servlet地址  
        striped: true,  //表格显示条纹  
        pagination: true, //启动分页  
        pageSize: 5,  //每页显示的记录数  
        clickToSelect: true, //是否启用点击选中行
        pageNumber:1, //当前第几页  
        pageList: [5, 10, 15, 20, 25],  //记录数可选列表  
        showColumns: true,  //显示下拉框勾选要显示的列  
        showRefresh: true,  //显示刷新按钮  
        sidePagination: "server", //表示服务端请求  
        //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder  
        //设置为limit可以获取limit, offset, search, sort, order  
        queryParamsType : "undefined", 
        formatter: function (value, row, index) {  
            return index+1;  
        },
        queryParams: function queryParams(params) {   //设置查询参数  
          var param = {    
        	  
        	  pageNumber: params.pageNumber,    
              pageSize: params.pageSize,
              buildings_id: $("#asd").val(),
              searchText: params.searchText,
          };    
          return param;                   
        }
      });  
  }  
  
  $(document).ready(function () {          
      //调用函数，初始化表格  
      initTable();  

      //当点击查询按钮的时候执行  
      $("#search").bind("click", initTable);  
  });  
  
  function logoFormatter(value,row,index){
		return "<img src='"+basePath+"/upload/"+row.img_path+"' width='100' height='70' class='img-responsive ' alt='图标'>";
  }
  
  $(function(){
	  //查找
		$(".search").click(function(){
		    var searchArgs={
		         name:$("input[name='name']").val(),
		    }
		    bstpTable.inint(searchArgs)
		})
		
		//新增楼盘
		$("#btn_add").click(function(){
			window.location.href=basePath+"/buildings_img/addInfo?buildingsImg.buildings_id="+$("#asd").val();
		})
		//修改楼盘
		$("#btn_edit").click(function(){
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/builds/update?builds.id="+data[0].id;
			}else{
				swal("提示", "请选择您要修改的楼盘" );
			}
			
		})
		
		//返回
		$("#back").click(function(){
			window.history.back(-1);
		})
	})
	 function p_del() { 
		var msg = "您真的确定要修改状态吗？\n\n请确认！"; 
		if (confirm(msg)==true){ 
		return true; 
		}else{ 
		return false; 
		} 
	} 
</script>

</body>
</html>
