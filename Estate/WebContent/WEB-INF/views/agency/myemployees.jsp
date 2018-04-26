<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
    
    <%
	Agency agency = (Agency)session.getAttribute("agency");
%>
<%@page import="com.gs.pojo.Agency"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<%=path %>/images/favicon.png" type="image/png">
<link rel="stylesheet" href="<%=path %>/easyui/themes/default/easyui.css" />
<link rel="stylesheet" href="<%=path %>/easyui/themes/icon.css" />
<link rel="stylesheet" href="<%=path %>/css/main.css" />
<title>房天下后台管理-员工管理</title>

<link href="<%=path %>/css/style.default.css" rel="stylesheet">
<link href="<%=path %>/css/jquery.gritter.css" rel="stylesheet">

</head>

<body style="background-color: white">





	<div class="pageheader">
		<h2><i class="glyphicon glyphicon-user"></i> 员工管理</h2>
		
	</div>

		<div class="contentpanel panel-email">
		<!-- 内容 -->
			 <div class="row">
            
            
            <div class="col-sm-12">
                
                <div class="panel panel-default">
                    <div class="panel-body">
                        
                        <div class="pull-right">
                            <div class="btn-group mr10">
                                <button class="btn btn-sm btn-white tooltips" type="button" data-toggle="modal" data-target="#myModal" title="添加员工"><i class="glyphicon glyphicon-plus"></i></button>
                                <button class="btn btn-sm btn-white tooltips" type="button" data-toggle="tooltip" title="按业绩排序"><i class="glyphicon glyphicon-exclamation-sign"></i></button>
                                <button class="btn btn-sm btn-white tooltips" type="button" data-toggle="tooltip" title="批量指派任务"><i class="glyphicon glyphicon-send"></i></button>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-sm btn-white tooltips" type="button" data-toggle="tooltip" title="上一页"><i class="glyphicon glyphicon-chevron-left"></i></button>
                                <button class="btn btn-sm btn-white tooltips" type="button" data-toggle="tooltip" title="下一页"><i class="glyphicon glyphicon-chevron-right"></i></button>
                            </div>
                        </div><!-- pull-right -->
                        
                        <h5 class="subtitle mb5">所有员工</h5>
                        
                        <div class="table-responsive">
                            <table id="list" style="height:400px;width:100%;" class="easyui-datagrid"
								data-options="
									toolbar:'#tb',
									rownumbers:true,
									border:false,
									singleSelect:true,
									pagination:true,
									pageSize:20,
									url:'<%=path %>/agency/myemployees?agency.id=${agency.id }',
									method:'get'">
								<thead>
									<tr>
										<th data-options="field:'headicon',width:100">头像</th>
										<th data-options="field:'name',width:100">名称</th>
										<th data-options="field:'email',width:100">邮箱</th>
										<th data-options="field:'phone',width:100">手机号码</th>
										<th data-options="field:'basic_salary',width:100">基础工资</th>
										<th data-options="field:'intro',width:100">简介</th>
										<th data-options="field:'valid',width:100" formatter="formatValid">状态</th>
									</tr>
								</thead>
							</table>
                            
                        </div><!-- table-responsive -->
                    </div><!-- panel-body -->
                </div><!-- panel -->
            </div><!-- col-sm-9 -->
        </div><!-- row -->
	</div><!-- contentpanel -->
	
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">添加员工</h4>
      </div>
      <div class="modal-body">
			 <form class="form-inline" id="form1" method="post" action="<%=path%>/agency/employeesAdd">
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




<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/modernizr.min.js"></script>
<script src="<%=path %>/js/jquery.sparkline.min.js"></script>
<script src="<%=path %>/js/toggles.min.js"></script>
<script src="<%=path %>/js/retina.min.js"></script>
<script src="<%=path %>/js/jquery.cookies.js"></script>
<script src="<%=path %>/js/jquery-ui-1.10.3.min.js"></script>
<script src="<%=path %>/js/fullcalendar.min.js"></script>
<script src="<%=path %>/js/jquery.ui.touch-punch.min.js"></script>
<script src="<%=path %>/js/custom.js"></script>
<script src="<%=path %>/easyui/jquery.easyui.min.js"></script>
<script src="<%=path %>/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="<%=path %>/js/main2.js"></script>

<script>
    jQuery(document).ready(function(){
        
        "use strict"
    
        //Check
        jQuery('.ckbox input').click(function(){
            var t = jQuery(this);
            if(t.is(':checked')){
                t.closest('tr').addClass('selected');
            } else {
                t.closest('tr').removeClass('selected');
            }
        });
        
        // Star
        jQuery('.star').click(function(){
            if(!jQuery(this).hasClass('star-checked')) {
                jQuery(this).addClass('star-checked');
            }
            else
                jQuery(this).removeClass('star-checked');
            return false;
        });
        
        // Read mail
        jQuery('.table-email .media').click(function(){
            location.href="read.html";
        });
        
        
        
    });
</script>
<script type="text/javascript">
	$(function(){
		$("#btn_add").bind("click",function(){
			if($("#name").val()==""){
				alert("请输入员工姓名");
				$("#name").focus();
				return false;
			}else if($("#phone").val()==""){
				alert("请输入手机号码");
				$("#phone").focus();
				return false;
			}else if($("#email").val()==""){
				alert("请输入邮箱地址");
				$("#email").focus();
				return false;
			}else if($("#basic_salary").val()==""){
				alert("请输入基础工资");
				$("#basic_salary").focus();
				return false;
			}else{
				$("#form1").submit();
			}
		});
		
	})
</script>
<script>
	$(function() {
		setPagination("list");
	});
</script>
</body>
</html>
