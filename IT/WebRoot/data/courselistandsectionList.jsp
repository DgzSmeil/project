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
<link rel="stylesheet" href="data/css/style1.css" type="text/css">
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
    <div class="panel-head">
     <a href="<%=basePath %>courselistservlet?order=list" style="float:left;"><strong class="icon-reorder"> 所有课程</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="data/study.jsp" style="float:left;"><strong class="icon-reorder"> 如何开始学习</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="data/money.jsp" style="float:left;"><strong class="icon-reorder"> 支付与退款</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="data/fenqi.jsp" style="float:left;"><strong class="icon-reorder"> 课程分期支付</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="data/youhui.jsp" style="float:left;"><strong class="icon-reorder"> 优惠券</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="data/study.jsp" style="float:left;"><strong class="icon-reorder"> 承诺与保障</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <strong style="float:left;">&nbsp;&nbsp;&nbsp;->->&nbsp;&nbsp;&nbsp;</strong>
     <a href="data/plan.jsp" style="float:left;"><strong class="icon-reorder"> 名师计划</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
     </div>
	   	<marquee><font size="6" color="red">本课程打<%=request.getAttribute("price") %>折</font></marquee>
   <div class="box">
   <div style="width:800px;height:340px">
	   	<div style="float:left;">
	   		<img src="${o.picture_url}" width="550px" height="260px">
	   	</div>
	   	<div style="float:right;">
	   		<h1 align="center">${o.course_name}【永久学习】</h1><br>
   			<b >购买人数：9人</b>&nbsp;&nbsp;&nbsp;&nbsp;
   			<b >好评度：70%</b>&nbsp;&nbsp;&nbsp;&nbsp;
   			<hr>
		   	<h4>支持随时学习！2018年6月过期！</h4>
		   	<a href="youhuijuan/choujiang.jsp" style="width:30px;height:10px;"><font color="blue">领取优惠券</font></a>
		   	<hr>
		   	<div style="float:left;"><font size="6" color="red">￥${o.price}</font></div>
		   	<hr>
		   	 <div class="head-l"  style="float:left;"><a class="button button-little bg-green" href="<%=basePath %>courselistservlet?order=buy"><span class="icon-home"></span> 我要付款</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="button button-little bg-green" href="<%=basePath %>courselistservlet?order=gouwuche"><span class="icon-home"></span> 加入购物车</a>&nbsp; 
	   	</div>
   </div>
   <hr>
   <h1 align="center">详细信息</h1>
   <table width="800">
   		<tr>
   			<td><img src="image/00.gif">课程名称：${o.course_name}</td>
   			<td><img src="image/00.gif">讲师寄语：${o.one_word}</td>
   			<td><img src="image/00.gif">课程简介：${o.introduce}</td>
   		</tr>
   		<tr>
	   		<td><img src="image/00.gif">课程节数：${o.course_count}</td>
	   		<td><img src="image/00.gif">课程价格：${o.price}</td>
	   		<td><img src="image/00.gif">发布人称：${o.replay_username}</td>
   		</tr>
	   		<tr><td><img src="image/00.gif">章节名称：${o.sectionname}</td>
	   		<td><img src="image/00.gif">视频时间：${o.timelength}</td>
	   		<td><img src="image/00.gif">章节说明：${o.sectionremark}</td>
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