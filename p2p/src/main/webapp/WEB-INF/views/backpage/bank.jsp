<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    String path = request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
	<%@include file="../master/easyui/header.jsp" %>
</head>
<body>
	<table id="list" class="easyui-datagrid"
		data-options="
			toolbar:'#tb',
			rownumbers:true,
			border:false,
			singleSelect:true,
			pagination:true,
			pageSize:10,
			url:'<%=path %>/bank/selectpage',
			method:'post'">
		<thead>
			<tr>
				<th data-options="field:'bcid',width:80,checkbox:true">编号</th>
				<th data-options="field:'cardno',width:150,formatter:encodeBank">卡号</th>
				<th data-options="field:'rname',width:100">姓名</th>
				<th data-options="field:'idno',width:160">身份证号码</th>
				<th data-options="field:'type',width:180">银行类型</th>
				<th data-options="field:'state',width:80,formatter:formtterBankStart">状态</th>
				<th data-options="field:'date',width:180,formatter:formatDate">绑定时间</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="height: auto">
		<div>
			<form id="searchForm">
				<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入搜索名称',
						required:false,
						novalidate:true" name="rname"/>
				<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入银行类型',
						required:false,
						novalidate:true" name="type"/>
				<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入银行卡号',
						required:false,
						novalidate:true" name="cardno"/>
				<input class="easyui-datetimebox easyui-validatebox "data-options="prompt:'请选择最大支付时间',
						required:false,
						novalidate:true,
						showSeconds:true" name="cashTime"/>
				<input class="easyui-datetimebox easyui-validatebox " data-options="prompt:'请选择最大创建时间',
						required:false,
						novalidate:true,
						showSeconds:true" name="createTime"/>
				<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
				<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>

			</form>
		</div>
	</div>

	
</body>
<%@include file="../master/easyui/footer.jsp" %>
<script>
	$(function (){
        setPagination("list");

    });
</script>
</html>