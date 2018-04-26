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
<link rel="stylesheet" href="data/css/pintuer.css">
<link rel="stylesheet" href="data/css/admin.css">
<script src="data/js/jquery.js"></script>
<script src="data/js/pintuer.js"></script>
</head>
<body>
<form method="post" action="<%=basePath %>activeservlet?order=activeadd" id="listform">
<input type="hidden" name="teachername" value="<%=request.getParameter("teachername") %>"/>
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li>活动名称：</li>
        <li>
          <input type="text" placeholder="请输入活动名称" name="activityname" class="input" style="width:250px; line-height:17px;display:inline-block" />
           <li>活动简介：</li>
        <li>
          <input type="text" placeholder="请输入活动简介" name="activitydesc" class="input" style="width:250px; line-height:17px;display:inline-block" />
      	<li> <button class="button bg-main icon-check-square-o" type="submit">发布活动</button></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
		<th align='center' width="15%">活动名称</th>
		<th align='center' width="15%">活动记录</th>
		<th align='center' width="20%">活动时间</th>
		<th align='center' width="50%">操作</th>
      </tr>
        <tr>
          <c:forEach items="${activelist}" var="y">
			<tr height='40'>
				<td align='center'>${y.activity_name}</td>
				<td align='center'>${y.activity_desc}</td>
				<td align='center'>${y.activity_date}</td>
				<td align="center">
					<div class="button-group">
						<a class="button border-main icon-edit"  href="<%=basePath %>activeservlet?activeid=${y.activity_id}&order=update"> 修 改 </a>&nbsp;&nbsp;&nbsp;
						<a class="button border-main icon-edit"  href="<%=basePath %>exchangecodeservlet?activityid=${y.activity_id}&order=list&teachername=<%=new String(request.getParameter("teachername").getBytes("iso-8859-1"),"utf-8") %>">优惠券管理</a>&nbsp;&nbsp;&nbsp;
						<a class="button border-red icon-trash-o" href="<%=basePath %>activeservlet?activeid=${y.activity_id}&order=delete" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}" > 删 除 </a>
					</div>
				</td>
			</tr>
		</c:forEach>
      <tr width="100%">
        <td style="text-align:left; padding:19px 0;padding-left:20px;" colspan="2">
        <input type="checkbox" id="checkall"/>全选 
        <a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()">删除</a> <a href="javascript:void(0)" style="padding:5px 15px; margin:0 10px;" class="button border-blue icon-edit" onclick="sorts()">排序</a> 
		</td>
		<td class="pagelist" colspan="2" align="center">
			<span class="current">总记录数&nbsp;&nbsp;${pager.pagebarsum }</span>
			<span class="current">页码&nbsp;&nbsp;${pager.currentpage }/${pager.sumpage }页</span>
			<a href="<%=basePath %>activeservlet?order=list&currenpage=1&handle=firstpage&teachername=<%=new String(request.getParameter("teachername").getBytes("iso-8859-1"),"utf-8") %>">首   页</a>
			<a href="<%=basePath %>activeservlet?order=list&currenpage=${pager.currentpage }&handle=uppage&teachername=<%=new String(request.getParameter("teachername").getBytes("iso-8859-1"),"utf-8") %>">上一页</a>
			<a href="<%=basePath %>activeservlet?order=list&currenpage=${pager.currentpage }&handle=downpage&teachername=<%=new String(request.getParameter("teachername").getBytes("iso-8859-1"),"utf-8") %>" >下一页</a>
			<a href="<%=basePath %>activeservlet?order=list&currenpage=${pager.sumpage }&handle=lastpage&teachername=<%=new String(request.getParameter("teachername").getBytes("iso-8859-1"),"utf-8") %>">尾  页</a> 
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