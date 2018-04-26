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
    <div class="panel-head"><strong class="icon-reorder"> 章节列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="<%=basePath %>sectionservlet?order=add&courseid=<%=request.getParameter("courseid") %>"> 发布章节视频</a> </li>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr height='40'>
		<th align='center'>课程名称</th>
		<th align='center'>章节名称</th>
		<th align='center'>是否免费</th>
		<th align='center'>审核状态</th>
		<th align='center'>原    因</th>
		<th align='center'>操作</th>
	</tr>
        <tr>
          <c:forEach items="${sectionlist}" var="y">
			<tr height='40'>
				<td align='center'>${y.coursename}</td>
				<td align='center'>${y.sectionname}</td>
				<td align='center'>
					<c:if test="${y.isfree ==0 }">
						免费
					</c:if>
					<c:if test="${y.isfree !=0 }">
						会员
					</c:if>
				<td align='center'>
					<c:if test="${y.status ==0 }">
						未审核
					</c:if>
					<c:if test="${y.status ==1 }">
						已审核
					</c:if>
					<c:if test="${y.status ==2 }">
						审核未通过
					</c:if>
				</td>
				<td align='center'>${y.reason}</td>
				<td align="center">
						<a class="button border-main icon-edit"  href="<%=basePath %>sectionservlet?sectionid=${y.sectionid}&order=update&courseid=<%=request.getParameter("courseid") %>"> 修改章节</a>
						<a  class="button border-red icon-trash-o" href="<%=basePath %>sectionservlet?sectionid=${y.sectionid}&order=delete" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}"> 删除本章节</a>
					<c:if test="${y.status ==0 }">
						<a class="button border-main icon-edit"  href="<%=basePath %>sectionservlet?sectionid=${y.sectionid}&order=shenhe&courseid=<%=request.getParameter("courseid") %>"> 提交审核</a>
					</c:if>
					<c:if test="${y.status ==2 }">
						<a class="button border-main icon-edit"  href="<%=basePath %>sectionservlet?sectionid=${y.sectionid}&order=shenhe"> 查看审核原因</a>
					</c:if>
					<c:if test="${y.isfree ==0 }">
						<a class="button border-main icon-edit"  href="<%=basePath %>sectionservlet?sectionid=${y.sectionid}&order=isfree&isfree=1&courseid=<%=request.getParameter("courseid") %>">改为付费</a>
					</c:if>
					<c:if test="${y.isfree !=0 }">
						<a class="button border-main icon-edit"  href="<%=basePath %>sectionservlet?sectionid=${y.sectionid}&order=isfree&isfree=0&courseid=<%=request.getParameter("courseid") %>">改为免费</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
      <tr width="100%">
        <td style="text-align:left; padding:19px 0;padding-left:20px;" colspan="4">
        <input type="checkbox" id="checkall"/>全选 
        <a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 删除</a> <a href="javascript:void(0)" style="padding:5px 15px; margin:0 10px;" class="button border-blue icon-edit" onclick="sorts()"> 排序</a> 
		</td>
		<td class="pagelist" colspan="8" align="center">
			<a href="">总记录数&nbsp;&nbsp;${pager.pagebarsum }</a>
			<a href="">页码&nbsp;&nbsp;${pager.currentpage }/${pager.sumpage }页</a>
			<a href="<%=basePath %>sectionservlet?order=list&currenpage=1&handle=firstpage&courseid=<%=request.getParameter("courseid") %>">首   页</a>
			<a href="<%=basePath %>sectionservlet?order=list&currenpage=${pager.currentpage }&handle=uppage&courseid=<%=request.getParameter("courseid") %>">上一页</a>
			<a href="<%=basePath %>sectionservlet?order=list&currenpage=${pager.currentpage }&handle=downpage&courseid=<%=request.getParameter("courseid") %>" >下一页</a>
			<a href="<%=basePath %>sectionservlet?order=list&currenpage=${pager.sumpage }&handle=lastpage&courseid=<%=request.getParameter("courseid") %>">尾  页</a> 
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