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
<form method="post" action="<%=basePath %>exchangecodeservlet?order=addsave" id="listform">
<input type="hidden" name="activityid" value="${requestScope.acticityid}">
<input type="hidden" name="teachername" value="<%=request.getParameter("teachername") %>"/>
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 我的优惠券列表</strong> </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li>优惠金额：</li>
        <li>
          <input type="text" placeholder="请输入优惠金额" name="codemoney" class="input" style="width:160px; line-height:17px;display:inline-block" />
      	<li>优惠券数量：</li>
        <li>
          <input type="text" placeholder="请输入优惠券数量" name="codenum" class="input" style="width:160px; line-height:17px;display:inline-block" />
          <li>有效期：</li>
        <li>
          <input type="text" placeholder="请输入有效期" name="codedate" class="input" style="width:160px; line-height:17px;display:inline-block" />
      	<li> <button class="button bg-main icon-check-square-o" type="submit">发布优惠券</button></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
		<th align='center'>活动名称</th>
		<th align='center'>领取用户</th>
		<th align='center'>兑换编码</th>
		<th align='center'>兑换金额</th>
		<th align='center'>兑换状态</th>
		<th align='center'>兑换时间</th>
		<th align='center'>有效期</th>
		<th align='center'>操作${y.userid}</th>
      </tr>
        <tr>
          <c:forEach items="${exchangecodelist}" var="y">
			<tr height='40'>
				<td align='center'>${y.activity_name}</td>
				<td align='center'>
					<c:if test="${y.userid==null}">
						未领取
					</c:if>
					<c:if test="${y.userid!=0}">
						${y.userid}
					</c:if>
				</td>
				<td align='center'>${y.exchangecode}</td>
				<td align='center'>${y.exchangemeony}</td>
				<td align='center'>
					<c:if test="${y.exchangestatus==0}">
						未兑换
					</c:if>
					<c:if test="${y.exchangestatus==1}">
						已兑换
					</c:if>
					<c:if test="${y.exchangestatus==2}">
						已过期
					</c:if>
					<c:if test="${y.exchangestatus==3}">
						已作废
					</c:if>
				</td>
				<td align='center'>
					<c:if test="${y.exchangedate=='0'}">
						无记录
					</c:if>
					<c:if test="${y.exchangedate!='0'}">
						${y.exchangedate}
					</c:if>
				</td>
				<td align='center'>
					${y.date}
				</td>
				<td align="center">
					<div class="button-group">
						<a class="button border-main icon-edit"  href="<%=basePath %>exchangecodeservlet?exchangecodeid=${y.exchangecodeid}&order=updatestatus&activityid=${requestScope.acticityid}"> 作 废 </a>&nbsp;&nbsp;&nbsp;
						<a class="button border-red icon-trash-o" href="<%=basePath %>exchangecodeservlet?exchangecodeid=${y.exchangecodeid}&order=delete" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}" > 删 除 </a>
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
			<span class="current">总记录数&nbsp;&nbsp;${pager.pagebarsum }</span>
			<span class="current">页码&nbsp;&nbsp;${pager.currentpage }/${pager.sumpage }页</span>
			<a href="<%=basePath %>exchangecodeservlet?order=list&currenpage=1&handle=firstpage&activityid=${requestScope.acticityid}&teachername=<%=new String(request.getParameter("teachername").getBytes("iso-8859-1"),"utf-8") %>">首   页</a>
			<a href="<%=basePath %>exchangecodeservlet?order=list&currenpage=${pager.currentpage }&handle=uppage&activityid=${requestScope.acticityid}&teachername=<%=new String(request.getParameter("teachername").getBytes("iso-8859-1"),"utf-8") %>">上一页</a>
			<a href="<%=basePath %>exchangecodeservlet?order=list&currenpage=${pager.currentpage }&handle=downpage&activityid=${requestScope.acticityid}&teachername=<%=new String(request.getParameter("teachername").getBytes("iso-8859-1"),"utf-8") %>" >下一页</a>
			<a href="<%=basePath %>exchangecodeservlet?order=list&currenpage=${pager.sumpage }&handle=lastpage&activityid=${requestScope.acticityid}&teachername=<%=new String(request.getParameter("teachername").getBytes("iso-8859-1"),"utf-8") %>">尾  页</a> 
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