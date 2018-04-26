<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="systemvo/css/pintuer.css">
<link rel="stylesheet" href="systemvo/css/admin.css">
<script src="systemvo/js/jquery.js"></script>
<script src="systemvo/js/pintuer.js"></script>
</head>
<body>
<form method="post" action="" id="listform">
<c:if test="${msg!=null}">
	<script type="text/javascript">
		alert("${msg}");
	</script>
  </c:if>
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 公告列表</strong> <a href="" style="float:right; display:none;">发布公告</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="<%=basePath %>data/add.jsp"> 发布公告</a> </li>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
     <tr>
		<th align='center'>公告封面</th>
		<th align='center'>公告主题</th>
		<th align='center'>是否有效</th>
		<th align='center'>类    别</th>
		<th align='center'>发布人名</th>
		<th align='center'>浏    览</th>
		<th align='center'>发布时间</th>
		<th align='center' >操作</th>
	</tr>
        <tr>
          <c:forEach items="${msglist}" var="y">
			<tr height='40'>
				<td align='center'><img src="${y.imageurl}" width="40px" height="40px" style="border-radius:50%"></td>
				<td align='center'>${y.oneword}</td>
				<td align='center'>
					<c:if test="${y.effective==1}">
						有效
					</c:if>
					<c:if test="${y.effective!=1}">
						无效
					</c:if>
				</td>
				<td align='center'>
					<c:if test="${y.newsType==1}">
						公告
					</c:if>
					<c:if test="${y.newsType!=1}">
						通知
					</c:if>
				</td>
				<td align='center'>${y.publishusername}</td>
				<td align='center'><a href="${y.msgcontenturl}" target="_blank">预览</a></td>
				<td align='center'>${y.publishdate}</td>
				<td align="center">
					<div class="button-group"> 
						<a class="button border-main icon-edit" href="<%=basePath %>newmsgservlet?newmsgid=${y.newmsgid}&order=update"> 修改公告 </a>&nbsp;&nbsp;
						<a class="button border-red icon-trash-o" href="<%=basePath %>newmsgservlet?newmsgid=${y.newmsgid}&order=delete"  class="button border-red icon-trash-o" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}">删除公告</a>
					</div>
				</td>
			</tr>
		</c:forEach>
      <tr width="100%">
		<td class="pagelist" colspan="12" align="center">
			<span class="current">总记录数&nbsp;&nbsp;${pager.pagebarsum }</span>
			<span class="current">页码&nbsp;&nbsp;${pager.currentpage }/${pager.sumpage }页</span>
			<a href="<%=basePath %>newmsgservlet?order=list&currenpage=1&handle=firstpage">首   页</a>
			<a href="<%=basePath %>newmsgservlet?order=list&currenpage=${pager.currentpage }&handle=uppage">上一页</a>
			<a href="<%=basePath %>newmsgservlet?order=list&currenpage=${pager.currentpage }&handle=downpage">下一页</a>
			<a href="<%=basePath %>newmsgservlet?order=list&currenpage=${pager.sumpage }&handle=lastpage">尾  页</a> 
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