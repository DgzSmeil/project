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

<title>房天下后台管理-客户管理</title>

<link href="<%=path %>/css/style.default.css" rel="stylesheet">
<link href="<%=path %>/css/jquery.gritter.css" rel="stylesheet">
<link href="<%=path %>/css/morris.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet" type="text/css">  
<link href="<%=path %>/css/bootstrap-table.min.css" rel="stylesheet" type="text/css">  
<script src="<%=path %>/js/jquery.min.js"></script>  
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
		<h2><i class="fa fa-laptop"></i>预约管理<span>预约查看</span></h2>
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
 	<button id="btn_add" type="button" class="btn btn-default">
	 	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加客户
	 </button>
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
		       data-toolbar="#toolbar" 
		       data-showColumns="true">  
		       <thead>  
		          <tr>
					<th data-radio="true"></th>
					<th data-field="employee.name">员工姓名</th>
					<th data-field="users.name">用户姓名</th>
					<th data-field="app_arrive_time" data-formatter="formatDate">预约时间</th>
					<th data-field="arrive_time" data-formatter="formatDate">看房时间</th>
					<th data-field="house.name">户型名称</th>
					<th data-field="app_status" data-formatter="displaycolor">预约状态</th>
					<th data-field="status" data-formatter="logoFormatter">状态</th>
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
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
	    <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	      <h4 class="modal-title" id="myModalLabel">修改预约状态</h4>
	    </div>
	    <div class="modal-body">
	<form class="form-inline" id="form1" method="post" action="<%=path%>/appointment/update">
	 <input type="hidden" name="appointment.id" id="id2"/>
	 <div class="form-group">
	 	<label>看房时间：</label>
	 	<input type="date" id="arrive_time" name="appointment.arrive_time" value="${appointment.arrive_time}"></input>
	 </div>
	 <div class="form-group">
	 	<label>预约状态：</label>
 		<select class="form-control" id="app_status" name="appointment.app_status">
 		  <option>已预约</option>
		  <option>已联系</option>
		  <option>已看房</option>
		  <option>已购房</option>
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
        url: basePath+"/appointment/pager", //获取数据的Servlet地址  
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
  
  function logoFormatter1(value,row,index){
		return "<img src='"+basePath+"/upload/' width='100' height='70' class='img-responsive ' alt='图标'>";
  }
  function logoFormatter(value,row,index){
	  if(row.status=='Y'){
		  return "激活";
	  }else if(row.status=='N'){
		  return "冻结";
	  }
  }
  function logoFormatter3(value,row,index){
	  if(row.status=='Y'){
		  return "<a href='javascript:void(0);' onclick='p_del(\""+row.id+"\")'>冻结</a>";
	  }else if(row.status=='N'){
		  return "<a href='javascript:void(0);' onclick='p_del(\""+row.id+"\")'>激活</a>";
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
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/appointment/judge?appointment.id="+data[0].id;
			}else {
				swal("提示","请选中行");
			}
		})
		$("#btn_edit").click(function(){
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				document.getElementById("href1").click();
				$("#id2").val(data[0].id);
				$("#arrive_time").val(data[0].arrive_time);
				$("#app_status").val(data[0].app_status);
			}else{
				swal("提示","请选中行");
			}
			
		})
		//提交修改状态
		$("#btn_update").bind("click",function(){
			$("#form1").submit();	
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
	  function p_del(id) { 
	  	swal({
	  		 title: "您确定要修改状态？",   
			  text: "",
			  type: "warning",   
			  showCancelButton: true,   
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "确定修改", 
			  cancelButtonText: " 不 修改 ",
			  closeOnConfirm: false }, 
			function(isConfirm){   
			  if (isConfirm) {     
				  var url=basePath+"/appointment/status";
	       			$.post(url,{
	       				"appointment.id":id
	           			},
	           			function(data){
	           				swal("提示", "成功修改状态","success");
	           				$('#cusTable').bootstrapTable(('refresh'), url);
	           			},
	           			"json"
	           		);
			  } else {     
				  swal("提示", "修改状态失败","error");
  		      } 
		});
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

    function displaycolor(value,row,index) {  
        var a = "";  
            if(value == "已预约") {  
            	var a = '<span>'+value+'</span>'; 
            }else if(value == "已联系"){  
                var a = '<span style="color:#0000ff">'+value+'</span>'; 
            }else if(value == "已看房") {  
            	var a = '<span style="color:#00ff00">'+value+'</span>';
            }else{  
            	var a = '<span style="color:#FF0000">'+value+'</span>';  
            }  
            return a;  
        }
</script>
<s:if test="#request.msg!=null">
	<script type="text/javascript">
		swal("警告", "${msg}", "warning");
	</script>
</s:if>
<s:if test="#request.tip!=null">
	<script type="text/javascript">
		alert("${msg}");
	</script>
</s:if>
</body>
</html>
