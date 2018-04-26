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
		<h2><i class="fa fa-building"></i>楼盘管理 <span>所有楼盘</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	</div>
		<div class="contentpanel panel-email">
		<div class="panel-body" style="padding-bottom:0px;">
		 <form id="formSearch" class="form-horizontal">
			 <input type="hidden" id="asd" value="${agency_id }">
		 </form>
 
 <div id="toolbar" class="btn-group">
	 <button id="btn_look" type="button" class="btn btn-default">
	 	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>详细资料
	 </button>
	 <button id="btn_add" type="button" class="btn btn-default">
	 	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
	 </button>
	 <button id="btn_edit" type="button" class="btn btn-default">
	 	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
	 </button>
	 <button id="btn_addimg" type="button" class="btn btn-default">
	 	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>查看图片
	 </button>
	 
	  <button id="btn_hchart" type="button" class="btn btn-default">
	 	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>查看销售情况
	 </button>
 </div>
 <div class="row">
    <div class="col-md-12">
       <table class="table table-hover" id="cusTable"  
		       data-pagination="true"  
		       data-show-refresh="true"  
		       data-show-toggle="true"
		       data-toolbar="#toolbar"
		       data-showColumns="true">  
		       <thead>  
		          <tr>
		          	  <th data-radio="true"></th>                                                           
		              <th data-field="logo" data-formatter="logoFormatter">封面</th>  
		              <th data-field="name" >楼盘名称</th>
					  <th data-field="area" >所属区域</th>
				  	  <th data-field="floor_area" >占地面积</th>
					  <th data-field="house_type" >房源类型</th>
					  <th data-field="avg_price" >楼盘均价</th>
					  <th data-field="status" data-formatter="logoFormatter2">楼栋状态</th>
					  <th data-field="" data-formatter="logoFormatter3">操作</th>
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
        url: basePath+"/builds/list", //获取数据的Servlet地址  
        striped: true,  //表格显示条纹  
        pagination: true, //启动分页  
        pageSize: 5,  //每页显示的记录数  
        pageNumber:1, //当前第几页  
        pageList: [5, 10, 15, 20, 25],  //记录数可选列表
        clickToSelect: true, //是否启用点击选中行
        search: true,  //是否启用查询  
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
              agency_id: $("#asd").val(),
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
		return "<img src='"+basePath+"/upload/"+row.logo+"' width='100' height='70' class='img-responsive ' alt='图标'>";
  }
  function logoFormatter2(value,row,index){
	  if(row.status=='Y'){
		  return "已启用";
	  }else if(row.status=='N'){
		  return "已禁用";
	  }
  }
  function logoFormatter3(value,row,index){
	  if(row.status=='Y'){
		  return "<a href='javascript:void(0);' onClick='dele(\""+row.id+"\");'>禁用</a>";
	  }else if(row.status=='N'){
		  return "<a href='javascript:void(0);' onClick='dele2(\""+row.id+"\");'>启用</a>";
	  }
  }
  
  $(function(){
	  //查找
		$(".search").click(function(){
		    var searchArgs={
		         name:$("input[name='name']").val(),
		    }
		    bstpTable.inint(searchArgs)
		})
		//查看楼盘
		$("#btn_look").click(function(){
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/builds/look?builds.id="+data[0].id; 
			}else{
				swal("提示", "请选择您要查看的楼盘" );
			}
			
		})
		//新增楼盘
		$("#btn_add").click(function(){
			window.location.href=basePath+"/builds/addInfo";
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
		//新增楼盘图片
		$("#btn_addimg").click(function(){
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/buildings_img/list1?buildings_id="+data[0].id;
			}else{
				swal("提示", "请选择您要查看图片的楼盘" );
			}
		})
		//新增楼盘每月销售量
		$("#btn_hchart").click(function(){
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/builds/sale_chart?builds.id="+data[0].id;
			}else{
				swal("提示", "请选择您要查看的楼盘" );
			}
		})
		
		//新增楼盘图片
		$("#btn_addbuilds").click(function(){
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				swal("提示", "对不起，该功能目前未实现" );
			}else{
				swal("提示", "请选择您要那个楼盘的楼栋" );
			}
		})
		//返回
		$("#back").click(function(){
			window.history.back(-1);
		})
	})
	
	function dele(id){
			  swal({   
				  title: "您确定要冻结该楼盘？",   
				  text: "",
				  type: "warning",   
				  showCancelButton: true,   
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "确定冻结", 
				  cancelButtonText: " 不 冻结 ",
				  closeOnConfirm: false }, 
				  function(isConfirm){   
					  if (isConfirm) {     
						  var url=basePath+"/builds/status";
		        			$.post(url,{
		            			"builds.id":id
		            			},
		            			function(data){
		            				swal(data.msg, "","success");
		            				$('#cusTable').bootstrapTable(('refresh'), url);
		            			},
		            			"json"
		            		);
						  } else {     
							     
			  			} 
					  });
			  
		  }
  function dele2(id){
	  swal({   
		  title: "您确定要激活该楼盘？",   
		  text: "",
		  type: "warning",   
		  showCancelButton: true,   
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "确定激活", 
		  cancelButtonText: " 不 激活 ",
		  closeOnConfirm: false }, 
		  function(isConfirm){   
			  if (isConfirm) {     
				  var url=basePath+"/builds/status";
        			$.post(url,{
            			"builds.id":id
            			},
            			function(data){
            				swal(data.msg, "","success");
            				$('#cusTable').bootstrapTable(('refresh'), url);
            			},
            			"json"
            		);
				  } else {     
					     
	  			} 
			  });
  }
</script>

</body>
</html>
