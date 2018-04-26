<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="SQLBean.TeacherBean"%>
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
<link rel="stylesheet" href="data/css/pintuer.css">
<link rel="stylesheet" href="data/css/admin.css">
<script src="data/js/jquery.js"></script>
<script src="data/js/pintuer.js"></script>
</head>
<body>
<%TeacherBean teacherbean = (TeacherBean)session.getAttribute("teacherbean2"); %>
<form method="post" action="<%=basePath %>activeservlet?order=activeadd" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 留言列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center" border="0">
      <tr>
		<th align='center' width="10%">提问用户</th>
		<th align='center' width="10%">回答用户</th>
		<th align='center' width="30%">内    容</th>
		<th align='center' width="10%">时    间</th>
		<th align='center' width="10%">类    别</th>
		<th align='center' width="30%">操    作</th>
      </tr>
        <tr>
          <c:forEach items="${forlist}" var="y">
			<tr height='40'>
				<td align='center'>${y.username}</td>
				<td align='center'>${teacherbean.teachername}</td>
				<td align='center'>${y.countent}</td>
				<td align='center'>${y.forumdate}</td>
				<c:if test="${y.fourmtype==0}">
					<td align='center'>提问</td>
				</c:if>
				<c:if test="${y.fourmtype==1}">
					<td align='center'>回答</td>
				</c:if>
				<td align="center">
					<div class="button-group">
						<a class="button border-main icon-edit"  href="<%=basePath %>courselistservlet?forumid=${y.forumid}&order=updateliuyan" target="_blank"> 修 改 </a>&nbsp;&nbsp;&nbsp;
						<c:if test="${y.fourmtype==0}">
							<a class="button border-main icon-edit"  href="<%=basePath %>courselistservlet?forumid=${y.forumid}&order=huida" target="_blank">回答</a>&nbsp;&nbsp;&nbsp;
						</c:if>
						<a class="button border-red icon-trash-o" href="<%=basePath %>courselistservlet?forumid=${y.forumid}&order=deleteliuyan&id=${requestScope.replayid}" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}" > 删 除 </a>
					</div>
				</td>
			</tr>
		</c:forEach>
      <tr width="100%">
        <td style="text-align:left; padding:19px 0;padding-left:20px;" colspan="2">
	        <a href="<%=basePath %>courselistservlet?order=liuyanlist&currenpage=1&handle=firstpage&id=${requestScope.replayid}" class="button border-red icon-edit" style="padding:5px 15px;">升序</a> <a href="<%=basePath %>courselistservlet?order=liuyanlist&currenpage=1&handle=firstpage&id=${requestScope.replayid}&sc=desc" style="padding:5px 15px; margin:0 10px;" class="button border-blue icon-edit" onclick="sorts()">降序</a> 
		</td>
		<td class="pagelist" colspan="5" align="center">
			<a href="">总记录数&nbsp;&nbsp;${pager.pagebarsum }</a>
			<a href="">页码&nbsp;&nbsp;${pager.currentpage }/${pager.sumpage }页</a>
			<a href="<%=basePath %>courselistservlet?order=liuyanlist&currenpage=1&handle=firstpage&id=${requestScope.replayid}&sc=${requestScope.sc}">首   页</a>
			<a href="<%=basePath %>courselistservlet?order=liuyanlist&currenpage=${pager.currentpage }&handle=uppage&id=${requestScope.replayid}&sc=${requestScope.sc}">上一页</a>
			<a href="<%=basePath %>courselistservlet?order=liuyanlist&currenpage=${pager.currentpage }&handle=downpage&id=${requestScope.replayid}&sc=${requestScope.sc}" >下一页</a>
			<a href="<%=basePath %>courselistservlet?order=liuyanlist&currenpage=${pager.sumpage }&handle=lastpage&id=${requestScope.replayid}&sc=${requestScope.sc}">尾  页</a> 
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
		alert("排序完成....");
		return true;
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