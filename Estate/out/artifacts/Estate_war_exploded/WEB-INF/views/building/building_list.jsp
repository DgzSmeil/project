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
<link href="<%=path %>/css/sweetalert.css" rel="stylesheet" type="text/css" >

<script src="<%=path %>/js/jquery.min.js"></script>  
<script src="<%=path %>/js/bootstrap.min.js"></script>  
<script src="<%=path %>/js/bootstrap-table.min.js"></script>  
<script src="<%=path %>/js/bootstrap-table-zh-CN.js"></script> 
<script src="<%=path %>/js/sweetalert-dev.js"></script> 
<script src="<%=path %>/js/bootstrap-table-export.js"></script> 
<script src="<%=path %>/js/tableExport.js"></script> 

<style type="text/css">
	table tbody tr td{
		text-align: center;
		font-size: 18px;
	}
</style>
</head>

<body>

	<div class="pageheader">
		<h2><i class="glyphicon glyphicon-user"></i> 楼栋管理<span>所有楼栋</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	</div>

		<div class="contentpanel panel-email">
		<div class="panel-body" style="padding-bottom:0px;">
 <div class="panel panel-default">
 <div class="panel-heading">查询条件</div>
 <div class="panel-body">
 <form id="formSearch" class="form-horizontal">
 <input type="hidden" id="asd" name="agency_id" value="${agency_id}">
 <div id="div1" class="form-group" style="margin-top:15px">
 <label class="control-label col-sm-1" for="txt_search_departmentname">楼栋名称</label>
 <div class="col-sm-3">
 	<select id="building_id" name="building_id" class="form-control">  
			<option value=""></option>
		<s:iterator var="s" value="#request.buildList" >
			<option value="${s.id}" >${s.name }</option>   
		</s:iterator>
	 </select>
 </div>
 <label class="control-label col-sm-1" for="txt_search_departmentname"  >楼盘名称</label>
 <div class="col-sm-3">
 	<select id="buildings_id" name="buildings_id" class="form-control">  
			<option value=""></option>
		<s:iterator var="s" value="#request.buildings" >
			<option value="${s.id}" >${s.name }</option>   
		</s:iterator>
	 </select>
 </div>
 <div class="col-sm-4" style="text-align:left;">
 <button type="button" id="btn_query" class="btn btn-primary">查询</button>
 </div>
 </div>
 </form>
 </div>
 </div> 
 
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
		       data-showColumns="true">  
		       <thead>  
		          <tr>
		          	  <th data-radio="true"></th>                                                           
		              <th data-field="name" >楼栋名称</th>  
		              <th data-field="buildings.name" >所属楼盘</th> 
		              <th data-field="total_floor" >总层数</th>
					  <th data-field="total_lift" >电梯数</th>
				  	  <th data-field="floor_rooms" >每层用户数</th>
					  <th data-field="total_room" >总用户数</th>
					  <th data-field="created_time" data-formatter="formatDate">创建时间</th>
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
</body>
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
        url: basePath+"/build/list", //获取数据的Servlet地址  
        striped: true,  //表格显示条纹  
        pagination: true, //启动分页  
        pageSize: 5,  //每页显示的记录数  
        pageNumber:1, //当前第几页  
        pageList: [5, 10, 15, 20, 25],  //记录数可选列表  
        search: true,  //是否启用查询  
        showColumns: true,  //显示下拉框勾选要显示的列  
        showRefresh: true,  //显示刷新按钮  
        sidePagination: "server", //表示服务端请求  
        showExport: true,//显示导出按钮
        clickToSelect:true,//设置true 将在点击行时，自动选择行
        toolbar:'#toolbar',
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
              building_id:$("#building_id").val(),
              searchText: params.searchText
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
  
  function logoFormatter2(value,row,index){
	  if(row.status=='Y'){
		  return "启用";
	  }else if(row.status=='N'){
		  return "禁用";
	  }
  }
  function logoFormatter3(value,row,index){
	  if(row.status=='Y'){
		  return "<a href='javascript:void(0);' onClick='dele(\""+row.id+"\");'>禁用</a>";
	  }else if(row.status=='N'){
		  return "<a href='javascript:void(0);' onClick='dele2(\""+row.id+"\");'>启用</a>";
	  }
  }
  
  function formatDate(value) {
	    if (value == undefined || value == null || value == '') {
	        return "";
	    } else {
	        var date = new Date(value); // 获取js的Date对象
	        var year = date.getFullYear().toString();
	        var month = (date.getMonth() + 1);
	        var day = date.getDate().toString();
	        var hour = date.getHours().toString();
	        var minutes = date.getMinutes().toString();
	        var seconds = date.getSeconds().toString();
	        if (month < 10) {
	            month = "0" + month;
	        }
	        if (day < 10) {
	            day = "0" + day;
	        }
	        return year + "-" + month + "-" + day;
	    }
	}
  
  $(function(){
		$(".search").click(function(){
		    var searchArgs={
		         name:$("input[name='name']").val(),
		    }
		    bstpTable.inint(searchArgs)
		})
		$("#btn_add").click(function(){
			window.location.href=basePath+"/build/add?agency_id="+$("#asd").val();
		})
		$("#btn_edit").click(function(){
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/build/update?id="+data[0].id+"&agency_id="+$("#asd").val();
			}else{
				swal("请选择楼栋","","warning");
			}
			
		})
		//返回
		$("#back").click(function(){
			window.history.back(-1);
		})
		
		$('#btn_query').click(function(){
	    	initTable();
	   	})
	})
  
  function dele(id){
	  swal({   
		  title: "您确定要冻结该楼栋？",   
		  text: "",
		  type: "warning",   
		  showCancelButton: true,   
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "确定冻结", 
		  cancelButtonText: " 不 冻结 ",
		  closeOnConfirm: false }, 
		  function(isConfirm){   
			  if (isConfirm) {     
				  var url=basePath+"/build/status";
        			$.post(url,{
            			"building.id":id
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
  title: "您确定要激活该楼栋？",   
  text: "",
  type: "warning",   
  showCancelButton: true,   
  confirmButtonColor: "#DD6B55",
  confirmButtonText: "确定激活", 
  cancelButtonText: " 不 激活 ",
  closeOnConfirm: false }, 
  function(isConfirm){   
	  if (isConfirm) {     
		  var url=basePath+"/build/status";
			$.post(url,{
    			"building.id":id
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
<s:if test="#request.msg!=null">
	<script type="text/javascript">
		swal("成功信息", "${msg}", "success");
	</script>	
</s:if>
  
</body>
</html>
