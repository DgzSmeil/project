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

<title>房天下后台管理-绩效管理</title>

<link href="<%=path %>/css/style.default.css" rel="stylesheet">
<link href="<%=path %>/css/jquery.gritter.css" rel="stylesheet">
<link href="<%=path %>/css/morris.css" rel="stylesheet">
<script src="<%=path %>/js/jquery.min.js"></script> 
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet" type="text/css">  
<link href="<%=path %>/css/bootstrap-table.min.css" rel="stylesheet" type="text/css">   
<script src="<%=path %>/js/bootstrap.min.js"></script>  
<script src="<%=path %>/js/bootstrap-table.min.js"></script>  
<script src="<%=path %>/js/bootstrap-table-zh-CN.js"></script> 

<script src="<%=path %>/js/sweetalert-dev.js"></script>
<link href="<%=path %>/css/sweetalert.css" rel="stylesheet">
<style type="text/css">
	table thead th{
		 text-align:center;
	}
	table tbody tr td{
		text-align: center;
		font-size: 18px;
	}
</style>
</head>

<body>

	<div class="pageheader">
		<h2><i class="fa fa-suitcase"></i>绩效管理<span>绩效查看</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	</div>
		<div class="contentpanel panel-email">
		<div class="panel-body" style="padding-bottom:0px;">
		 <form id="formSearch" class="form-horizontal">
		 	<input type="hidden" id="asd" value="${emp_id }">
		 </form> 
 <div id="toolbar" class="btn-group">
 	<s:if test="#request.agency_id!=null">
	 <button id="btn_edit" type="button" class="btn btn-default">
	 	<span class="glyphicon glyphicon-pencil" aria-hidden="true"><i></i></span>修改
	 </button>
	 </s:if>
	 <a href="javascript:void(0);" data-toggle="modal" style="display:none" id="href1" data-target="#myModal2"></a>
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
					<th data-field="quantity">员工任务量</th>
					<th data-field="monthes">月份</th>
					<th data-field="employee.name">员工姓名</th>
					<th data-field="bonus_percent">销售提成</th>
					<th data-field="sales">销售量</th>
					<th data-field="salary">工资</th>
					<th data-field="yearmonth">年月</th>
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
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
	    <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	      <h4 class="modal-title" id="myModalLabel">修改任务</h4>
	    </div>
	    <div class="modal-body">
		 <form class="form-inline" id="form2" method="post" action="<%=path%>/mission/updatepage">
	 <input type="hidden" name="mission.id" id="id2"/>
	 <div class="form-group">
	 <label>旧任务量：</label>
	           <input type="text" class="form-control" id="quantity1" readonly="readonly">
	         </div>
	         <div class="form-group">
	           <label>新任务量：</label>
	           <input type="text" class="form-control" id="quantity2" name="mission.quantity" placeholder="输入新任务量">
	         </div>
	       </form>
	   </div>
	   <div class="modal-footer">
	     <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	     <button type="button" class="btn btn-primary" id="btn_addmoney">修改</button>
	   </div>
	 </div><!-- modal-content -->
	</div><!-- modal-dialog -->
</div><!-- modal -->
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
        url:"<%=path%>/mission/pager", //获取数据的Servlet地址  
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
              emp_id: $("#asd").val(),
              agency_id:$("#agency_id").val(),
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
  
  $(function(){
		$(".search").click(function(){
		    var searchArgs={
		         name:$("input[name='name']").val(),
		    }
		    bstpTable.inint(searchArgs)
		})
		
		$("#btn_edit").click(function(){
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				document.getElementById("href1").click();
				$("#id2").val(data[0].id);
				$("#quantity1").val(data[0].quantity)
			}else{
				swal("请选中数据");
			}
			
		})
		//提交修改员工任务
		$("#btn_addmoney").bind("click",function(){
			if($("#quantity2").val()==""){
				swal("提示", "请输入新新任务量" );
				$("#quantity2").focus();
				return false;
			}else{
				$("#form2").submit();
			}
		});
		$("#btn_delete").click(function(){
			var data=$("#tb").bootstrapTable("getSelections");
			if(data.length==1){
				$.post("EstateSales/admin/articleTypeDelte",
						{"articleType.id":data[0].id},
						function(msg){
							$("#tb").bootstrapTable("refresh",{url:"EstateSales/admin/articleTypeList"});
						},
						"json")
			}else{
				swal("请选中数据");
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
<s:if test="#request.msg!=null">
	<script type="text/javascript">
	swal("提示", "${msg}", "info");
	</script>
</s:if>
</body>
</html>
