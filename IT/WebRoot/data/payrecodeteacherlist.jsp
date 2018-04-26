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
    <div class="panel-head"><strong class="icon-reorder"> 提现列表</strong> <a href="" style="float:right; display:none;">继续购买</a></div>
    <div class="padding border-bottom">
    </div>
    <table class="table table-hover text-center">
     <tr>
		<th align='center'>讲师名称</th>
		<th align='center'>章节名称</th>
		<th align='center'>金    额</th>
		<th align='center'>付款方式</th>
		<th align='center'>付款账户</th>
		<th align='center'>付款主人</th>
		<th align='center'>缴费状态</th>
		<th align='center'>是否提现</th>
		<th align='center'>操   作</th>
	</tr>
        <tr>
          <c:forEach items="${paylist}" var="y">
				<tr height='40'>
				<td align='center'>${y.replay_username}</td>
				<td align='center'>${y.course_name}:${y.sectionname}</td>
				<td align='center'>${y.paymoney}</td>
				<td align='center'>
				<c:if test="${y.paytype==0}">
						余额支付
					</c:if>
					<c:if test="${y.paytype==1}">
						微信支付
					</c:if>
					<c:if test="${y.paytype==2}">
						支付宝支付
					</c:if>
				</td>
				<td align='center'>${y.cardnum}</td>
				<td align='center'>${y.payer}</td>
				<td align='center'>
					<c:if test="${y.paystatus==0}">
						未缴费
					</c:if>
					<c:if test="${y.paystatus==1}">
						已缴费
					</c:if>
				</td>
				<td align='center'>
					<c:if test="${y.isCash==1}">
						已提现
					</c:if>
					<c:if test="${y.isCash==0}">
						未提现
					</c:if>
					<c:if test="${y.isCash==2}">
						提现审核中。。。。
					</c:if>
					<c:if test="${y.isCash==3}">
						已审核！但不通过。。。
					</c:if>
				</td>
				<td align="center">
					<div class="button-group"> 
						<c:if test="${y.status==0}">
							<a href="<%=basePath %>payrecodeservlet?payrecodeid=${y.payrecordid}&order=delete"  class="button border-red icon-trash-o" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}">删除宝贝</a>
							<!--  <a class="button border-main icon-edit" href="<%=basePath %>payrecodeservlet?order=info&payrecodeid=${y.payrecordid}&teacherid=<%=request.getParameter("teacherid") %>">详情</a>-->
						</c:if>
						<c:if test="${y.status==1}">
							<a class="button border-main icon-edit" href="<%=basePath %>payrecodeservlet?order=shenqingtixian&payrecodeid=${y.payrecordid}&teacherid=<%=request.getParameter("teacherid") %>">申请提现</a>
						</c:if>
						<a href="<%=basePath %>payrecodeservlet?payrecodeid=${y.payrecordid}&order=delete"  class="button border-red icon-trash-o" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}">删除宝贝</a>
					</div>
				</td>
			</tr>
		</c:forEach>
      <tr width="100%" align="right">
		<td class="pagelist" colspan="10" align="right">
			<span class="current">总记录数&nbsp;&nbsp;${pager.pagebarsum }</span>
			<span class="current">页码&nbsp;&nbsp;${pager.currentpage }/${pager.sumpage }页</span>
			<a href="<%=basePath %>payrecodeservlet?order=tixian&currenpage=1&handle=firstpage&teacherid=<%=request.getParameter("teacherid") %>">首   页</a>
			<a href="<%=basePath %>payrecodeservlet?order=tixian&currenpage=${pager.currentpage }&handle=uppage&teacherid=<%=request.getParameter("teacherid") %>">上一页</a>
			<a href="<%=basePath %>payrecodeservlet?order=tixian&currenpage=${pager.currentpage }&handle=downpage&teacherid=<%=request.getParameter("teacherid") %>">下一页</a>
			<a href="<%=basePath %>payrecodeservlet?order=tixian&currenpage=${pager.sumpage }&handle=lastpage&teacherid=<%=request.getParameter("teacherid") %>">尾  页</a> 
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