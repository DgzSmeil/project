<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<c:if test="${msg!=null}">
	<script type="text/javascript">
		alert("${msg}");
	</script>
</c:if>
	<div class="panel admin-panel margin-top">
	<div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>你的余额</strong></div>
	<div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="<%=basePath %>datainfo/chongzhimoney.jsp?userid=${requestScope.userid}" target="_blank"> 我要充值</a> </li>
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>	
		<div class="body-content">
			<h1>你的余额为：￥${moneybean.summoney}</h1>
		</div>
		<hr/>
		<table class="table table-hover text-center" style="font-size:14px">
     <tr>
		<th width="20%">充值编码</th>
		<th width="20%">充值姓名</th>
		<th width="20%">充值金额</th>
		<th width="20%">充值时间</th>
		<th width="20%">操    作</th>
	 </tr>
        <tr>
          <c:forEach items="${moneylist}" var="y">
			<tr height='40' width="300">
				<td align='center'><input type="checkbox" name="id[]" value="" />${y.recordid}</td>
				<td align='center'>${y.studentname}</td>
				<td align='center'>${y.pay_money}</td>
				<td align='center'>${y.pay_date}</td>
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
		<td class="pagelist" colspan="3" align="center">
			<a href="">总记录数&nbsp;&nbsp;${pager.pagebarsum }</a>
			<a href="">页码&nbsp;&nbsp;${pager.currentpage }/${pager.sumpage }页</a>
			<a href="<%=basePath %>studentservlet?order=summoney&currenpage=1&handle=firstpage">首   页</a>
			<a href="<%=basePath %>studentservlet?order=summoney&currenpage=${pager.currentpage }&handle=uppage">上一页</a>
			<a href="<%=basePath %>studentservlet?order=summoney&currenpage=${pager.currentpage }&handle=downpage" >下一页</a>
			<a href="<%=basePath %>studentservlet?order=summoney&currenpage=${pager.sumpage }&handle=lastpage">尾  页</a> 
		</td>
      </tr>
    </table>
</div>
</body>
</html>