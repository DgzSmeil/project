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

<body style="background-color: white">

	<div class="pageheader">
		<h2><i class="glyphicon glyphicon-user"></i> 员工管理<span>所有员工</span></h2>
		<div class="breadcrumb-wrapper">
			<span class="label"><a href="javascript:void(0);" id="back">返回</a></span>
		</div>
	</div>

		<div class="contentpanel panel-email">
		<!-- 内容 -->
			 <div class="panel-body" style="padding-bottom:0px;">
		 <form id="formSearch" class="form-horizontal">
			 <input type="hidden" id="asd" value="${agency_id }">
		 </form>
			  <input type="hidden" id="asd" value="${agency_id }">
 
		 
 <div id="toolbar" class="btn-group">
	 <button id="btn_look" type="button" class="btn btn-default">
	 	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>详细资料
	 </button>
	 <button id="btn_add" type="button" class="btn btn-default">
	 	<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>添加员工
	 </button>
	 <button id="btn_edit" type="button" class="btn btn-default">
	 	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>加减薪水
	 </button>
	 <button id="btn_edit1" type="button" class="btn btn-default">
	 	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改员工
	 </button>
	 <a href="javascript:void(0);" data-toggle="modal" style="display:none" id="href1" data-target="#myModal2"></a>
	 <button id="btn_addimg" type="button" class="btn btn-default">
	 	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>指派任务
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
		              <th data-field="headicon" data-formatter="logoFormatter">头像</th>  
		              <th data-field="name" >姓名</th>
					  <th data-field="email" >邮箱</th>
				  	  <th data-field="phone" >手机号码</th>
					  <th data-field="basic_salary" >基本工资</th>
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
 
 <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">指派任务</h4>
      </div>
      <div class="modal-body">
			 <form class="form-inline" id="form1" method="post" action="<%=path%>/emp/employeesAdd">
			 <input type="hidden" name="employee.angency_id" value="${agency.id }">
			 <div class="form-group">
              <input type="text" class="form-control" id="name" name="employee.name" placeholder="员工姓名">
            </div><br/><br/>
            <div class="form-group">
              <input type="email" class="form-control" id="phone" name="employee.phone" placeholder="输入手机号码">
            </div><br/><br/>
            <div class="form-group">
              <input type="email" class="form-control" id="email" name="employee.email" placeholder="输入邮箱地址">
            </div><br/><br/>
            <div class="form-group">
              <input type="email" class="form-control" id="basic_salary" name="employee.basic_salary" placeholder="输入基础工资">
            </div>
            
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="btn_add">添加</button>
      </div>
    </div><!-- modal-content -->
  </div><!-- modal-dialog -->
  </div><!-- modal -->
  
  <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	  <div class="modal-content">
	    <div class="modal-header">
	      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	      <h4 class="modal-title" id="myModalLabel">加薪</h4>
	    </div>
	    <div class="modal-body">
		 <form class="form-inline" id="form2" method="post" action="<%=path%>/emp/addmoney">
	 <input type="hidden" name="employee.id" id="id2"/>
	 <div class="form-group">
	 <label>原有工资：</label>
	           <input type="text" class="form-control" id="basic_salary1" readonly="readonly"  placeholder="新工资">
	         </div>
	         <div class="form-group">
	           <label>&nbsp;新&nbsp;工&nbsp;资：</label>
	           <input type="text" class="form-control" id="basic_salary2" name="employee.basic_salary" placeholder="输入新工资">
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
        url: basePath+"/emp/myemployees", //获取数据的Servlet地址  
        striped: true,  //表格显示条纹  
        pagination: true, //启动分页  
        pageSize: 5,  //每页显示的记录数  
        pageNumber:1, //当前第几页  
        pageList: [5, 10, 15, 20, 25],  //记录数可选列表
        pageList: [5, 10, 15, 20, 25],  //记录数可选列表  
        clickToSelect: true, //是否启用点击选中行
        search: true,  //是否启用查询  
        search: true,  //是否启用查询  
        showColumns: true,  //显示下拉框勾选要显示的列  
        showRefresh: true,  //显示刷新按钮  
        sidePagination: "server", //表示服务端请求  
        //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder  
        //设置为limit可以获取limit, offset, search, sort, order  
        queryParamsType : "undefined", 
        toolbar:'#toolbar',
        clickToSelect:true,//设置true 将在点击行时，自动选择行
        formatter: function (value, row, index) {  
            return index+1;  
        },
        queryParams: function queryParams(params) {   //设置查询参数  
          var param = {    
        	  
        	  pageNumber: params.pageNumber,    
              pageSize: params.pageSize,
              agency_id: $("#asd").val(),
              searchText: params.searchText,
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
  
  function logoFormatter(value,row,index){
		return "<img src='"+basePath+"/upload/"+row.headicon+"' width='100' height='70' class='img-rounded' alt='图标'>";
		
  }
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
	  //查找
		$(".search").click(function(){
		    var searchArgs={
		         name:$("input[name='name']").val(),
		    }
		    bstpTable.inint(searchArgs)
		})
		//查看员工
		$("#btn_look").click(function(){
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/emp/look?employee.id="+data[0].id; 
			}else{
				swal("提示", "请选择您要查看的员工" );
			}
			
		})
		//新增员工
		$("#btn_add").click(function(){
			window.location.href=basePath+"/emp/add?agency_id="+$("#asd").val();
		})
		//修改基本工资
		$("#btn_edit").click(function(){
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				document.getElementById("href1").click();
				$("#id2").val(data[0].id);
				$("#basic_salary1").val(data[0].basic_salary);
			}else{
				swal("提示", "请选择您要修改的员工" );
			}
			
		})
		//提交修改工资
		$("#btn_addmoney").bind("click",function(){
			if($("#basic_salary2").val()==""){
				swal("提示", "请输入新工资" );
				$("#basic_salary2").focus();
				return false;
			}else{
				$("#form2").submit();
			}
		});
		//修改员工资料
		$("#btn_edit1").click(function(){
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/emp/employeeUpdatePage?id="+data[0].id+"&agency_id="+data[0].angency_id;
			}else{
				swal("提示", "请选择您要修改的员工" );
			}
			
		})
		//指派任务
		$("#btn_addimg").click(function(){
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/mission/addpage?emp_id="+data[0].id+"&agency_id="+data[0].angency_id;
			}else{
				swal("提示", "请选择您要给哪个员工指派任务" );
			}
		})
		//查看工资
		$("#btn_salary").click(function(){
			var data=$("#cusTable").bootstrapTable("getSelections");
			if(data.length==1){
				window.location.href=basePath+"/mission/findSalary?emp_id="+data[0].id+"&agency_id="+data[0].angency_id;
			}else{
				swal("提示", "请选择您要查看的员工" );
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
  

	function dele(id){
			  swal({   
				  title: "您确定要冻结该员工？",   
				  text: "",
				  type: "warning",   
				  showCancelButton: true,   
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "确定冻结", 
				  cancelButtonText: " 不冻结 ",
				  closeOnConfirm: false }, 
				  function(isConfirm){   
					  if (isConfirm) {     
						  var url=basePath+"/emp/status";
		        			$.post(url,{
		            			"employee.id":id
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
		  title: "您确定要激活该员工？",   
		  text: "",
		  type: "warning",   
		  showCancelButton: true,   
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "确定激活", 
		  cancelButtonText: " 不激活 ",
		  closeOnConfirm: false }, 
		  function(isConfirm){   
			  if (isConfirm) {     
				  var url=basePath+"/emp/status";
      			$.post(url,{
          			"employee.id":id
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
<s:if test="#request.msg!=null">
	<script type="text/javascript">
	swal("错误信息", "${error}", "error");
	</script>
</s:if>
<s:if test="#request.tip!=null">
	<script type="text/javascript">
	swal("提示", "${tip}", "success");
	</script>
</s:if>
<s:if test="#request.success!=null">
	<script type="text/javascript">
		swal("成功信息", "${success}", "success");
	</script>
</s:if>
</body>
</html>
