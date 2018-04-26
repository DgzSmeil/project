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

<title>房天下后台管理-预约管理</title>

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
		<h2><i class="glyphicon glyphicon-user"></i> 预约管理<span>所有预约</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	</div>

		<div class="contentpanel panel-email">
		<div class="panel-body" style="padding-bottom:0px;">
 <div class="panel panel-default">
 <div class="panel-heading">查询条件</div>
 <div class="panel-body">
 <input type="hidden" id="asd"  name="angency_id" value="${angency_id }">
 <form id="formSearch" class="form-horizontal">
 <div id="div1" class="form-group" style="margin-top:15px">
 <label class="control-label col-sm-1" for="txt_search_departmentname">选择员工</label>
 <div class="col-sm-3">
 	   <select id="employee_id" name="employee_id" class="form-control">  
 	   			<option value=""></option>
		    <s:iterator var="s" value="#request.employees" >
				<option value="${s.id}" >${s.name }</option>   
			</s:iterator>
	   </select>
 </div>
 <label class="control-label col-sm-1" for="txt_search_departmentname"  >选择户型</label>
 <div class="col-sm-3">
	<select id="house_id" name="house_id" class="form-control">  
			<option value=""></option>
		<s:iterator var="s" value="#request.houses" >
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
 <div class="row">
    <div class="col-md-12">
       <table class="table table-hover" id="cusTable"  
		       data-pagination="true"  
		       data-show-refresh="true"  
		       data-show-toggle="true"  
		       data-showColumns="true">  
		       <thead>  
		          <tr>
		              <th  data-field="employee.name" >员工名称</th>  
		              <th  data-field="users.name"  >用户名称</th>
		              <th  data-field="app_arrive_time" data-formatter="formatDate">预约时间</th>
		              <th  data-field="arrive_time" data-formatter="formatDate">确认时间</th>
		              <th  data-field="house.name" >户型名称</th>
					  <th  data-field="app_status" >预约状态</th>
					  <th  data-field="created_time" data-formatter="formatDate">创建时间</th>
					  <th  data-field="status" data-formatter="logoFormatter2">状态</th>
		          </tr>  
		       </thead>  
		       <tbody>  
		       </tbody>  
		</table>  
       </div>                
   </div>
 </div>·
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
        url: basePath+"/appointment/listagency", //获取数据的Servlet地址  
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
              angency_id:$("#asd").val(),
              employee_id:$("#employee_id").val(),
              house_id:$("#house_id").val(),
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
  
  $(function(){
		$(".search").click(function(){
		    var searchArgs={
		         name:$("input[name='name']").val(),
		    }
		    bstpTable.inint(searchArgs)
		})
		$("#btn_add").click(function(){
			window.location.href=basePath+"/room/add?agency_id="+$("#asd").val();
		})
		$("#btn_edit").click(function(){
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/room/update?room.id="+data[0].id+"&agency_id="+$("#asd").val();
			}else{
				swal("请选择房号","","warning");
			}
			
		})
		//返回
		$("#back").click(function(){
			window.history.back(-1);
		})
		
	})
	 function p_del() { 
		if (confirm()==true){ 
			 swal("操作成功!", "你已成功完成此操作", "success");
			return true; 
		}else{ 
			swal("操作取消", "你成功取消了操作", "error");
		    return false; 
		} 
	}
  
  $("#btn_query").click(function(e){	
	  initTable(); 
  })
  function logoFormatter2(value,row,index){
	  if(row.status=='Y'){
		  return "启用";
	  }else if(row.status=='N'){
		  return "禁用";
	  }
  }
   function logoFormatter3(value,row,index){
	  if(row.status=='Y'){
		  return "<a href='"+basePath+"/house/status?house.id="+row.id+"&house.status="+row.status+"&agency_id="+$("#asd").val()+"' class='' onClick='javascript:return p_del()'>禁用</a>";
	  }else if(row.status=='N'){
		  return "<a href='"+basePath+"/house/status?house.id="+row.id+"&house.status="+row.status+"&agency_id="+$("#asd").val()+"' class='' onClick='javascript:return p_del()'>启用</a>";
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
	        if (hour < 10) {
	            hour = "0" + hour;
	        }
	        if (minutes < 10) {
	            minutes = "0" + minutes;
	        }
	        if (seconds < 10) {
	            seconds = "0" + seconds;
	        }
	        return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
	    }
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