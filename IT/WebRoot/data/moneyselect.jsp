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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/jquery-easyui-1.3.0/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/jquery-easyui-1.3.0/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-easyui-1.3.0/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-easyui-1.3.0/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-easyui-1.3.0/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		var date = new Date();
		var year = date.getYear()+1900;
		var month = date.getMonth()+1;
		var day = date.getDate();
		var s = year +"-"+month+"-"+day;
		$("#startdate").datebox("setValue",s);
		$("#enddate").datebox("setValue",year +"-"+month+"-"+30);
		$("#startdate").datebox("setValue",${starttime});
		$("#enddate").datebox("setValue",${endtime});
	});
</script>
</head>
<body >
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 充值记录列表</strong> <a href="" style="float:right; display:none;">我要充值</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;" class="pagelist">
        <li>搜索：</li>
        <li><a href="<%=basePath %>moneyservlet?order=findmymoney&ifvalue=week" onclick="timevalue();" style="height:30px"> 本周充值记录</a></li>
        <li><a href="<%=basePath %>moneyservlet?order=findmymoney&ifvalue=month"  onclick="timevalue();" style="height:30px"> 本月充值记录</a></li>
        <li><a href="<%=basePath %>moneyservlet?order=findmymoney&ifvalue=months"  onclick="timevalue();" style="height:30px"> 三个月内充值记录</a></li>
        <li><a href="<%=basePath %>moneyservlet?order=findmymoney&ifvalue=year"  onclick="timevalue();" style="height:30px"> 近三年充值记录</a></li>
		<c:if test="${starttime==null}">
	      	<li><input type="text" id="startdate" Class="easyui-datebox" style="width:180px;height:30px" value="2017-06-01 00:00:00"/>到<input type="text" id="enddate" Class="easyui-datebox" value="2017-06-30 23:59:59" style="width:180px;height:30px" /></li>
		</c:if>
		<c:if test="${starttime!=null}">
	      	<li><input type="text" id="startdate" Class="easyui-datebox" style="width:180px;height:30px" value="${starttime}"/>到<input type="text" id="enddate" Class="easyui-datebox" value="${endtime}" style="width:180px;height:30px" /></li>
		</c:if>
 		<li><a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
 		
      </ul>
    </div>
    <table class="table table-hover text-center">
     <tr>
		<th width="15%">充值编码</th>
		<th width="15%">充值姓名</th>
		<th width="15%">充值金额</th>
		<th width="15%">充值时间</th>
		<th width="15%">充值备注</th>
		<th width="25%">操    作</th>
	 </tr>
        <tr>
          <c:forEach items="${moneylist}" var="y">
			<tr height='40' width="300">
				<td align='center'><input type="checkbox" name="id[]" value="" />${y.recordid}</td>
				<td align='center'>${y.studentname}</td>
				<td align='center'>${y.pay_money}</td>
				<td align='center'>${y.pay_date}</td>
				<td align='center'>${y.remark}</td>
				<td align="center">
					<div class="button-group">
						<a class="button border-red icon-trash-o" href="<%=basePath %>moneyservlet?recordid=${y.recordid}&order=delete&username=${y.studentname}" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}" > 删 除 </a>
					</div>
				</td>
			</tr>
		</c:forEach>
      <tr width="100%">
        <td style="text-align:left; padding:19px 0;padding-left:20px;" colspan="2" >
        <input type="checkbox" id="checkall"/>全选 
        <a href="javascript:void(0)" class="button border-red icon-trash-o" style="padding:5px 15px;" onclick="DelSelect()"> 删   除</a> <a href="javascript:void(0)" style="padding:5px 15px; margin:0 10px;" class="button border-blue icon-edit" onclick="sorts()"> 排序</a> 
		</td>
		<td class="pagelist" colspan="4" align="center">
			<a href="">总记录数&nbsp;&nbsp;${pager.pagebarsum }</a>
			<a href="">页码&nbsp;&nbsp;${pager.currentpage }/${pager.sumpage }页</a>
			<a href="<%=basePath %>moneyservlet?order=list&currenpage=1&handle=firstpage">首   页</a>
			<a href="<%=basePath %>moneyservlet?order=list&currenpage=${pager.currentpage }&handle=uppage">上一页</a>
			<a href="<%=basePath %>moneyservlet?order=list&currenpage=${pager.currentpage }&handle=downpage" >下一页</a>
			<a href="<%=basePath %>moneyservlet?order=list&currenpage=${pager.sumpage }&handle=lastpage">尾  页</a> 
		</td>
      </tr>
    </table>
<script type="text/javascript">

//搜索
function changesearch(){	
	var starttime = $("#startdate").datebox("getValue")+" 00:00:00";
	var endtime = $("#enddate").datebox("getValue")+" 23:59:59";	
	location.href="<%=basePath %>moneyservlet?order=findmymoney&ifvalue=input&starttime="+starttime+"&endtime="+endtime;
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