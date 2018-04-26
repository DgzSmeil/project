<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>收入明细</title>
<link rel="stylesheet" href="systemvo/css/pintuer.css">
<link rel="stylesheet" href="systemvo/css/admin.css">
<script src="systemvo/js/jquery.js"></script>
<script src="systemvo/js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel margin-top">
		<div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>我的余额</strong></div>
		<div class="body-content">
			<h1>你的收入为：￥${teacherMoneyBean.summoney}</h1>
		</div>
	</div>
	<div>&nbsp;&nbsp;</div>
	<div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 收入明细</strong> <a href="" style="float:right; display:none;">继续购买</a></div>
    <div class="padding border-bottom">
    </div>
    <table class="table table-hover text-center" style="font-size:12px;">
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
					<c:if test="${y.paytype==1}">
						微信支付
					</c:if>
					<c:if test="${y.effective!=1}">
						支付宝支付
					</c:if>
					<c:if test="${y.paytype==0}">
						余额支付
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
				</td>
				<td align="center">
					<div class="button-group"> 
						<c:if test="${y.isCash==1}">
							<a class="button border-main icon-edit" href="<%=basePath %>payrecodeservlet?order=info&payrecodeid=${y.payrecordid}&teacherid=<%=request.getParameter("teacherid") %>">详情</a>
						</c:if>
						<c:if test="${y.isCash==0}">
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
			<a href="<%=basePath %>payrecodeservlet?order=mymoney&currenpage=1&handle=firstpage&teacherid=<%=request.getParameter("teacherid") %>">首   页</a>
			<a href="<%=basePath %>payrecodeservlet?order=mymoney&currenpage=${pager.currentpage }&handle=uppage&teacherid=<%=request.getParameter("teacherid") %>">上一页</a>
			<a href="<%=basePath %>payrecodeservlet?order=mymoney&currenpage=${pager.currentpage }&handle=downpage&teacherid=<%=request.getParameter("teacherid") %>">下一页</a>
			<a href="<%=basePath %>payrecodeservlet?order=mymoney&currenpage=${pager.sumpage }&handle=lastpage&teacherid=<%=request.getParameter("teacherid") %>">尾  页</a> 
		</td>
      </tr>
    </table>
</body>
</html>