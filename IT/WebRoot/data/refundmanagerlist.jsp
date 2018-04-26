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
    <div class="panel-head"><strong class="icon-reorder"> 退款列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <table class="table table-hover text-center">
      <tr>
		<th align='center' width="20%">课程封面</th>
		<th align='center' width="10%">课程名称</th>
		<th align='center' width="10%">价格</th>
		<th align='center' width="10%">学生名称</th>
		<th align='center' width="10%">退款状态</th>
		<th align='center' width="15%">退款理由</th>
		<th align='center' width="25%">操作</th>
      </tr>
        <tr>
          <c:forEach items="${refundlist}" var="y">
			<tr height='40'>
				<td align='center'><img src="${y.picture_url}" alt="查看详情" style="height:80px;width:140px"/></td>
				<td align='center'>${y.course_name}</td>
				<td align='center'>${y.price}</td>
				<td align='center'>${y.studentname}</td>
				<td align='center'>
					<c:if test="${y.status==0}">
						正在退款
					</c:if>
					<c:if test="${y.status==1}">
						同意退款
					</c:if>
					<c:if test="${y.status==2}">
						退款驳回
					</c:if>
					<c:if test="${y.status==3}">
						拒绝退款
					</c:if>
					<c:if test="${y.status==4}">
						提交管理员处理
					</c:if>
				<td align='center'>${y.reason}</td>
				<td align="center">
					<div class="button-group">
						<a class="button border-main icon-edit"  href="<%=basePath %>refundservlet?refundid=${y.refundid}&order=refundteacher&courseid=${y.courseid}&sectionid=${y.sectionid}&refundid=${y.refundid}"> 查看详情 </a>&nbsp;&nbsp;&nbsp;
						<a class="button border-red icon-trash-o" href="<%=basePath %>refundservlet?refundid=${y.refundid}&order=delete" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}" > 删 除 </a>
					</div>
				</td>
			</tr>
		</c:forEach>
      <tr width="100%">
        <td style="text-align:left; padding:19px 0;padding-left:20px;" colspan="3">
        <input type="checkbox" id="checkall"/>全选 
        <a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()">删除</a> <a href="javascript:void(0)" style="padding:5px 15px; margin:0 10px;" class="button border-blue icon-edit" onclick="sorts()">排序</a> 
		</td>
		<td class="pagelist" colspan="4" align="center">
			<span class="current">总记录数&nbsp;&nbsp;${pager.pagebarsum }</span>
			<span class="current">页码&nbsp;&nbsp;${pager.currentpage }/${pager.sumpage }页</span>
			<a href="<%=basePath %>refundservlet?order=mylist&currenpage=1&handle=firstpage">首   页</a>
			<a href="<%=basePath %>refundservlet?order=mylist&currenpage=${pager.currentpage }&handle=uppage">上一页</a>
			<a href="<%=basePath %>refundservlet?order=mylist&currenpage=${pager.currentpage }&handle=downpage" >下一页</a>
			<a href="<%=basePath %>refundservlet?order=mylist&currenpage=${pager.sumpage }&handle=lastpage">尾  页</a> 
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