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
		<h2><i class="fa fa-th-list"></i>留言管理 <span>所有留言</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	</div>

		<div class="contentpanel panel-email">
		<div class="panel-body" style="padding-bottom:0px;">
 <div class="panel panel-default">
	 <div class="panel-body">
		 <form id="formSearch1" class="form-horizontal">
		 	 <input type="hidden" id="asd" value="${agency_id }">
			 <div class="form-group" style="margin-top:15px">
			 	<label class="control-label col-sm-1" for="txt_search_departmentname">所属楼盘</label>
			 	<div class="col-sm-3">
			 		<select class="form-control" id="buildings_id" name="activity.buildings_id" data-placeholder="请选择房塬类型...">
					 	<option value="1">全部</option>
					 	<s:iterator value="#request.buildingsList" var="d">
		                 <option value="${d.id }">${d.name }</option>
		                </s:iterator>
				  	</select>
			 	</div>
			 </div>
		 </form>
	 </div>
 </div> 
 </div> 
 
 <div id="toolbar" class="btn-group">
	 <button id="btn_look" type="button" class="btn btn-default">
	 	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>详细资料
	 </button>
	 <button id="btn_edit" type="button" class="btn btn-default">
	 	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>回复
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
		              <th data-field="user.headicon" data-formatter="logoFormatter">用户头像</th>  
		              <th data-field="user.nickname" >用户昵称</th>
					  <th data-field="content">留言内容</th>
				  	  <th data-field="reply" data-formatter="logoFormatter4">回复内容</th>
					  <th data-field="buildings.name">留言楼盘</th>
					  <th data-field="status" data-formatter="logoFormatter2">状态</th>
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
        url: basePath+"/message/list", //获取数据的Servlet地址  
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
		return "<img src='"+basePath+"/upload/"+row.user.headicon+"' width='100' height='70' class='img-responsive ' alt='图标'>";
  }
  function logoFormatter1(value,row,index,buildingsList){
		  return buildingsList.name;
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
  function logoFormatter4(value,row,index){
	  if(row.reply==""){
		  return "暂无回复";
	  }else{
		  return row.reply;
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
		//查看
		$("#btn_look").click(function(){
			//获取选中的活动
			var data=$("#cusTable").bootstrapTable("getSelections");
			//判断有没有选中
			if(data.length==1){
				//跳转到action
				window.location.href=basePath+"/message/look?message.id="+data[0].id; 
			}else{
				swal("提示", "请选择您要查看的留言" );
			}
			
		})
		//回复
		$("#btn_edit").click(function(){
			//获取选中的活动
			var data=$("#cusTable").bootstrapTable("getSelections");
			//判断有没有选中
			if(data.length==1){
				if(data[0].reply==null){
					window.location.href=basePath+"/message/update?message.id="+data[0].id;
				}else{
					swal("提示", "该留言已回复" );
				}
				
			}else{
				swal("提示", "请选择您要回复的留言" );
			}
			
		})
		//返回
		$("#back").click(function(){
			window.history.back(-1);
		})
		
		//选择楼盘
		$("#buildings_id").bind("change",function(){
			$('#cusTable').bootstrapTable('destroy');  
		    //初始化表格,动态从服务器加载数据  
		    $("#cusTable").bootstrapTable({  
		        method: "get",  //使用get请求到服务器获取数据  
		        url: basePath+"/message/list2", //获取数据的Servlet地址  
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
		              buildings_id:$("#buildings_id").val(),
		              searchText: params.searchText,
		          };    
		          return param;                   
		        }
		      });
		});
	})
	 function p_del() { 
		var msg = "您真的确定要修改状态吗？\n\n请确认！"; 
		if (confirm(msg)==true){ 
		return true; 
		}else{ 
		return false; 
		} 
	} 
  
	function dele(id){
		  swal({   
			  title: "您确定要冻结该活动？",   
			  text: "",
			  type: "warning",   
			  showCancelButton: true,   
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "确定冻结", 
			  cancelButtonText: " 不冻结 ",
			  closeOnConfirm: false }, 
			  function(isConfirm){   
				  if (isConfirm) {     
					  var url=basePath+"/message/status";
	        			$.post(url,{
	            			"message.id":id
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
	  title: "您确定要激活该活动？",   
	  text: "",
	  type: "warning",   
	  showCancelButton: true,   
	  confirmButtonColor: "#DD6B55",
	  confirmButtonText: "确定激活", 
	  cancelButtonText: " 不激活 ",
	  closeOnConfirm: false }, 
	  function(isConfirm){   
		  if (isConfirm) {     
			  var url=basePath+"/message/status";
			$.post(url,{
    			"message.id":id
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
<s:if test="#request.error!=null">
	<script type="text/javascript">
	swal("错误信息", "${error}", "error");
	</script>
</s:if>
<s:if test="#request.success!=null">
	<script type="text/javascript">
		swal("成功信息", "${success}", "success");
	</script>
</s:if>
</body>
</html>
