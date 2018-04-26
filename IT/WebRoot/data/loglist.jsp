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
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 日志列表</strong> </div>
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
        <th align='center'>日志编号</th>
		<th align='center'>操作人</th>
		<th align='center'>操作类型</th>
		<th align='center'>操作备注</th>
		<th align='center'>操作时间</th>
		<th align='center'>所用IP</th>
		<th align='center'>操作</th>
      </tr>
        <tr>
          <c:forEach items="${sysloglist}" var="y">
			<tr height='40'>
				<td align='center'><input type="checkbox" name="id[]" value="" />${y.syslogid}</td>
				<td align='center'>${y.managername}</td>
				<td align='center'>${y.typetext}</td>
				<td align='center'>${y.countent}</td>
				<td align='center'>${y.createdate}</td>
				<td align='center'>${y.ipaddress}</td>
				<td align="center">
					<div class="button-group"> 
						<a  class="button border-red icon-trash-o" href="<%=basePath %>managerservlet?syslogid=${y.syslogid}&order=deletelog" onclick="javascript:if(confirm('删除确认')){return true;}else{return false;}"> 删 除 </a>
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
			<a href="<%=basePath %>managerservlet?order=list&currenpage=${pager.currentpage }&handle=uppage">上一页</a>
			<a href="<%=basePath %>managerservlet?order=list&currenpage=${pager.currentpage }&handle=downpage" >下一页</a>
			<a href="<%=basePath %>managerservlet?order=list&currenpage=${pager.sumpage }&handle=lastpage">尾  页</a> 
		</td>
      </tr>
    </table>
<script type="text/javascript">

//æç´¢
function changesearch(){	
		
}

//åä¸ªå é¤
function del(id,mid,iscid){
	if(confirm("æ¨ç¡®å®è¦å é¤å?")){
		
	}
}

//å¨é
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

//æ¹éå é¤
function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("æ¨ç¡®è®¤è¦å é¤éä¸­çåå®¹åï¼");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("è¯·éæ©æ¨è¦å é¤çåå®¹!");
		return false;
	}
}

//æ¹éæåº
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
		alert("è¯·éæ©è¦æä½çåå®¹!");
		return false;
	}
}


//æ¹éé¦é¡µæ¾ç¤º
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
		alert("è¯·éæ©è¦æä½çåå®¹!");		
	
		return false;
	}
}

//æ¹éæ¨è
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
		alert("è¯·éæ©è¦æä½çåå®¹!");	
		
		return false;
	}
}

//æ¹éç½®é¡¶
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
		alert("è¯·éæ©è¦æä½çåå®¹!");		
	
		return false;
	}
}


//æ¹éç§»å¨
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
		alert("è¯·éæ©è¦æä½çåå®¹!");
		
		return false;
	}
}

//æ¹éå¤å¶
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
	    	alert("åªè½éæ©ä¸æ¡ä¿¡æ¯!");
			$(o).find("option:first").prop("selected","selected");
		}else{
		
			$("#listform").submit();		
		}	
	}
	else{
		alert("è¯·éæ©è¦å¤å¶çåå®¹!");
		$(o).find("option:first").prop("selected","selected");
		return false;
	}
}

</script>
</body>
</html>