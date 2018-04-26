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
			url:'<%=path %>/logtx/select',
			method:'post'">
		<thead>
			<tr>
				<th data-options="field:'id',width:80,checkbox:true">编号</th>
				<th data-options="field:'rname',width:80">账户名</th>
				<th data-options="field:'phone',width:100">手机号码</th>
				<th data-options="field:'money',width:60">提现金额</th>
				<th data-options="field:'cardno',width:180">提现账号</th>
				<th data-options="field:'proce',width:70">提现手续费</th>
				<th data-options="field:'date',width:160,formatter:formatDate">提现时间</th>
				<th data-options="field:'state',width:80,formatter:getStatus">状态</th>
				<th data-options="field:'make',width:350,formatter:Mack">操作</th>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="height: auto">
		<div>
			<form id="searchForm">
				<input class="easyui-textbox" data-options="prompt:'请输入账户名',
						required:false,
						novalidate:true" name="rname"/>
				<input class="easyui-textbox" data-options="prompt:'请输入手机号',
						required:false,
						novalidate:true" name="phone"/>
				<input class="easyui-combobox" data-options="prompt:'请输入审核状态',
						required:false,valueField:'id',textField:'text',
						data:[{'id':2,'text':'审核成功'},{'id':4,'text':'转账中'},{'id':5,'text':'审核失败'}],
						novalidate:true" name="state"/>
				<input class="easyui-datetimebox"data-options="prompt:'请选择最大提现时间',
				        formatter:formatDate,
						required:false,
						novalidate:true,
						showSeconds:true" name="startTime"/>
				<input class="easyui-datetimebox"data-options="prompt:'请选择最小提现时间',
				        formatter:formatDate,
						required:false,
						novalidate:true,
						showSeconds:true" name="endTime"/>
				<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
			</form>
		</div>
	</div>
	<div id="addWin" class="easyui-window normal_win" data-options="title:'审核详情', closed:true">
		<form id="addForm">
			<table>
				<tr>
					<td>提现人</td>
					<td>
						<input id="rname" class="easyui-textbox easyui-validatebox" data-options="
						required:true,
						novalidate:true"/>
						<input type="hidden" name="txid" id="txid"/>
						<input type="hidden" name="state" id="statu"/>
					</td>
				</tr>

				<tr>
					<td>审核人</td>
					<td>
						<input class="easyui-textbox easyui-validatebox paytype" data-options="
						required:true,
						novalidate:true" value="${sessionScope.huser.rname}"/>
						<input type="hidden" name="huid" value="${sessionScope.huser.huid}">
					</td>
				</tr>
				<tr>
					<td>审核理由</td>
					<td>
						<input class="easyui-textarea  easyui-validatebox" style="height: 130px;width: 170px" data-options="prompt:'审核理由',
						required:true,
						novalidate:true," name="excute"/>
					</td>
				</tr>
				<tr>
					<td><a class="easyui-linkbutton" onclick="MackCommonSuccess('addWin','/logtx/aduits','addForm','list');">提交</a></td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
<%@include file="../master/easyui/footer.jsp" %>
<script>
	$(function (){
        setPagination("list");


    });
</script>
</html>