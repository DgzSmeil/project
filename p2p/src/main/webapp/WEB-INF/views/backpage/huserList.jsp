<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息</title>
	<%@include file="../master/easyui/header.jsp" %>
</head>
<style>
	.td{
		width: 200px;height: 32px;
		border: none;
		readonly:true;
	}
</style>
<body style="height: 100%">

	<table id="list" class="easyui-datagrid" >
		<thead>
			<tr>
				<form id="">
					<table>
						<tr>
							<td>用户名:</td>
							<td>
								<input name="rname" class="td" value="${requestScope.hUser.rname}"/>
							</td>
						</tr>
						<tr>
							<td>手机号:</td>
							<td>
								<input name="phone" class="td" value="${requestScope.hUser.phone}"/>
							</td>
						</tr>
						<tr>
							<td>真实姓名:</td>
							<td>
								<input name="age" class="td" value="${requestScope.hUser.huname}"/>
							</td>
						</tr>
						<tr>
							<td>性别:</td>
							<td id="td1">
								<input name="sex" id="sex" class="td" readonly="readonly" value="${(requestScope.hUser.sex == 0) ? '男':(requestScope.hUser.sex == 1) ? '女':''}"/>
							</td>
							<td style="display: none" id="td2">
									<c:if test="${hUser.sex == 0}">
										<select class="easyui-combobox  easyui-validatebox" style="height: 32px;width: 150px">
											<option value="0" selected>男</option>
											<option value="1">女</option>
										</select>
									</c:if>
									<c:if test="${hUser.sex == 1}">
										<select class="easyui-combobox  easyui-validatebox" style="height: 32px;width: 150px">
											<option value="0" >男</option>
											<option value="1" selected>女</option>
										</select>
									</c:if>
							</td>
						</tr>
						<tr>
							<td>邮箱:</td>
							<td>
								<input name="xl" class="td" value="${requestScope.hUser.email}"/>
							</td>
						</tr>
						<tr style="display: none" id="tr1">
							<td colspan="2">
								<div style="margin:10px 0;"></div>
								<a class="easyui-linkbutton" onclick="">确认</a>
							</td>
						</tr>
					</table>
				</form>
			</tr>
		</thead>
	</table>
</body>

<%@include file="../master/easyui/footer.jsp" %>
<script>
    $(function () {
        $(".td").change(function(){
            $("#tr1").show();
		})
		$("#sex").click(function(){
		    $("#td2").show();
            $("#td1").hide();
		});
    });
</script>
</html>