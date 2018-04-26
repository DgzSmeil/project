<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="SQLBean.ManagerBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="data/css/pintuer.css">
<link rel="stylesheet" href="data/css/admin.css">
<script src="data/js/jquery.js"></script>
<script src="data/js/pintuer.js"></script>
</head>
<body>
<%
	ManagerBean managerbean = (ManagerBean)session.getAttribute("managerbean");
%>
<form method="post" action="" id="listform">
  <c:if test="${msg!=null}">
  	<c:if test="${msg!=null}">
   		<script type="text/javascript">
   			alert("${msg}");
   		</script>
  </c:if>
  
  </c:if>
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="data/manageradd1.jsp"> 新增管理员</a> </li>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th align='center'>管理员编号</th>
		<th align='center'>管理员账号</th>
		<th align='center'>管理员名称</th>
		<th align='center'>管理员性别</th>
		<th align='center'>管理员Tel</th>
		<th align='center'>管理员类别</th>
		<th align='center'>管理员状态</th>
		<th align='center'>操作</th>
      </tr>
        <tr>
          <c:forEach items="${managerlist}" var="y">
			<tr height='40'>
				<td align='center'><input type="checkbox" name="id[]" value="" />${y.manager_id}</td>
				<td align='center'>${y.manager_account}</td>
				<td align='center'>${y.manager_name}</td>
				<td align='center'>
					<c:if test="${y.manager_sex ==0 }">
						男
					</c:if>
					<c:if test="${y.manager_sex !=0 }">
						女
					</c:if>
				</td>
				<td align='center'>
					<c:if test="${y.manager_status ==0 }">
						禁用
					</c:if>
					<c:if test="${y.manager_status !=0 }">
						启用
					</c:if>
				</td>
				<td align='center'>${y.manager_contact}</td>
				<td align='center'>
					<c:if test="${y.manager_leibie ==0 }">
						普通管理员
					</c:if>
					<c:if test="${y.manager_leibie ==1 }">
						超级管理员
					</c:if>
					<c:if test="${y.manager_leibie ==2 }">
						超级管理员申请中。。。
					</c:if>
				</td>
				<td align="center">
					<div class="button-group"> 
						<a  class="button border-main icon-edit" href="<%=basePath %>managerservlet?managerid=${y.manager_id}&order=update" > 修 改 </a>&nbsp;&nbsp;&nbsp;
						<a  class="button border-red icon-trash-o" href="<%=basePath %>managerservlet?managerid=${y.manager_id}&order=delete" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}"> 删 除 </a>
						<a  class="button border-main" href="<%=basePath %>managerservlet?managerid=${y.manager_id}&order=initpassword" > 初始化密码 </a>&nbsp;&nbsp;&nbsp;
						<c:if test="${y.manager_status ==0 }">
							<a  class="button border-red" href="<%=basePath %>managerservlet?managerid=${y.manager_id}&order=updatestatus&status=1" >启用</a> 
						</c:if>
						<c:if test="${y.manager_status !=0 }">
							<a  class="button border-red" href="<%=basePath %>managerservlet?managerid=${y.manager_id}&order=updatestatus&status=0" >禁用</a>
						</c:if>
						<c:if test="${y.manager_leibie==1}">
							<a  class="button border-main icon-edit" href="<%=basePath %>managerservlet?managerid=${y.manager_id}&order=updateleibie" >详情</a>
						</c:if>
					</div>
				</td>
			</tr>
		</c:forEach>
      <tr width="100%">
        <td style="text-align:left; padding:19px 0;padding-left:20px;" colspan="4">
        <input type="checkbox" id="checkall"/>全选 
        <a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()">删除</a> <a href="javascript:void(0)" style="padding:5px 15px; margin:0 10px;" class="button border-blue icon-edit" onclick="sorts()">排序</a> 
		</td>
		<td class="pagelist" colspan="8" align="center">
			<a href="">总记录数&nbsp;&nbsp;${pager.pagebarsum }</a>
			<a href="">页码&nbsp;&nbsp;${pager.currentpage }/${pager.sumpage }页</a>
			<a href="<%=basePath %>managerservlet?order=list&currenpage=1&handle=firstpage">首   页</a>
			<a href="<%=basePath %>managerservlet?order=list&currenpage=${pager.currentpage }&handle=uppage">上一页</a> <span class="current">1</span>
			<a href="<%=basePath %>managerservlet?order=list&currenpage=${pager.currentpage }&handle=downpage" >下一页</a>
			<a href="<%=basePath %>managerservlet?order=list&currenpage=${pager.sumpage }&handle=lastpage">尾  页</a> 
		</td>
      </tr>
    </table>
<script type="text/javascript">

//搜索
function changesearch(){	
		
}

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

//批量排序
function sorts(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		return false;
	}
}


//批量首页显示
function changeishome(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}

//批量推荐
function changeisvouch(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");	
		
		return false;
	}
}

//批量置顶
function changeistop(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}


//批量移动
function changecate(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		
		return false;
	}
}

//批量复制
function changecopy(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		var i = 0;
	    $("input[name='id[]']").each(function(){
	  		if (this.checked==true) {
				i++;
			}		
	    });
		if(i>1){ 
	    	alert("只能选择一条信息!");
			$(o).find("option:first").prop("selected","selected");
		}else{
		
			$("#listform").submit();		
		}	
	}
	else{
		alert("请选择要复制的内容!");
		$(o).find("option:first").prop("selected","selected");
		return false;
	}
}

</script>
</body>
</html>