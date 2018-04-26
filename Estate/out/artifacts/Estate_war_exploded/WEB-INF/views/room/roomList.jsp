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

<title>房天下后台管理-房屋管理</title>

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
		<h2><i class="fa fa-building"></i> 销售管理<span>房屋列表</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	</div>

		<div class="contentpanel panel-email">
		<div class="panel-body" style="padding-bottom:0px;">
 
 <form id="formSearch" class="form-horizontal">
 <input type="hidden" id="asd"  name="buildings_id" value="${buildings_id }">
 </form>
 
 <div id="toolbar" class="btn-group">
	 <button id="btn_edit" type="button" class="btn btn-default">
		 <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
	 </button>
	 <a href="javascript:void(0);" data-toggle="modal" style="display:none" id="href1" data-target="#myModal"></a>
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
		          	  <th  style="text-align:center;" data-radio="true"></th>                                                           
		              <th  style="text-align:center;" data-field="name" >房号名称</th>  
		              <th  style="text-align:center;" data-field="building.name"  >楼栋名称</th>
					  <th  style="text-align:center;" data-field="house.name" >户型名称</th>
					  <th  style="text-align:center;" data-field="house.area" >户型面积</th>
					  <th  style="text-align:center;" data-field="house.unit_price" >户型单价</th>
					  <th  style="text-align:center;" data-field="sale_status" data-formatter="displaycolor">房号状态</th>
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

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
	    <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	      <h4 class="modal-title" id="myModalLabel">修改销售状态</h4>
	    </div>
	    <div class="modal-body">
	<form class="form-inline" id="form1" method="post" action="<%=path%>/room/updatesale_status">
	 <input type="hidden" name="room.id" id="id2"/>
	 <div class="form-group">
	 	<label>销售状态：</label>
 		<select class="form-control" id="sale_status" name="room.sale_status">
 		  <option>待售中</option>
		  <option>销售中</option>
		  <option>已预定</option>
		  <option>已售</option>
		  <option>保留</option>
 		</select>
	</div>
	  </form>
	   </div>
	   <div class="modal-footer">
	     <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	     <button type="button" class="btn btn-primary" id="btn_update">修改</button>
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
        url: basePath+"/room/looklist", //获取数据的Servlet地址  
        striped: true,  //表格显示条纹  
        pagination: true, //启动分页  
        pageSize: 5,  //每页显示的记录数  
        pageNumber:1, //当前第几页  
        pageList: [5, 10, 15, 20, 25],  //记录数可选列表  
        search: false,  //是否启用查询  
        showColumns: true,  //显示下拉框勾选要显示的列  
        showRefresh: true,  //显示刷新按钮  
        sidePagination: "server", //表示服务端请求  
        showExport: true,//显示导出按钮
        search: true,
        toolbar:'#toolbar',
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
              buildings_id:$("#asd").val(),
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
				document.getElementById("href1").click();
				$("#id2").val(data[0].id);
				$("#sale_status").val(data[0].sale_status);
			}else{
				swal("提示","请选择房号");
			}
			
		})
		//提交修改状态
		$("#btn_update").bind("click",function(){
			$("#form1").submit();	
		});
		$("#btn_self").click(function(){
				window.location.href=basePath+"/room/selfadd?agency_id="+$("#asd").val();
		})
		//返回
		$("#back").click(function(){
			window.history.back(-1);
		})
		
	})
  
  $("#btn_query").click(function(e){	
	  initTable(); 
  })
 
  function displaycolor(value,row,index) {  
      var a = "";  
          if(value == "待售中") {  
          	var a = '<span>'+value+'</span>'; 
          }else if(value == "销售中"){  
            var a = '<span style="color:#0000ff">'+value+'</span>'; 
          }else if(value == "已预定") {  
          	var a = '<span style="color:#00ff00">'+value+'</span>';
          }else if(value == "已售"){  
          	var a = '<span style="color:#FF0000">'+value+'</span>';  
          }else{
        	var a = '<span style="color:#00EEEE">'+value+'</span>';
          }
          return a;  
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
