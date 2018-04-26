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
			url:'<%=path %>/ticket/pager_criteria',
			method:'post'">
		<thead>
		<tr>
			<th data-options="field:'id',width:80,checkbox:true">编号</th>
			<th data-options="field:'type',formatter:qtype,width:100">优惠券类型</th>
			<th data-options="field:'tkmoney',width:100">优惠金额</th>
			<th data-options="field:'tktime',width:150,formatter:formatDate">有效期</th>
		</tr>
		</thead>
	</table>
	
	<div id="tb" style="height: auto">
		<shiro:hasPermission name="ticket:save">
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin');">添加</a>
		</shiro:hasPermission>
		<shiro:hasPermission name="ticket:update">
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEditWin('editWin', 'list', 'editForm')">修改</a>
		</shiro:hasPermission>
		<div>
			<form id="searchForm">
				<!--
				<input class="easyui-textbox easyui-validatebox"
					   data-options="prompt:'请输入优惠券类型',
					   required:false,novalidate:true" name="type"/> -->
				<input class="easyui-textbox easyui-validatebox"
					   data-options="prompt:'请输入最大金额',
					   required:false,novalidate:true" name="tkmoney"/>
				<input class="easyui-datetimebox easyui-validatebox"
					   data-options="prompt:'请选择最大有效期',required:false,
					   novalidate:true,showSeconds:true" name="tktime"/>
				<a href="javascript:void(0);" class="easyui-linkbutton"
				   iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
			</form>
		</div>
	</div>
	
	<div id="addWin" class="easyui-window normal_win" data-options="title:'添加优惠券', closed:true">
		<form id="addForm">
			<table>
				<tr>
					<td>类型</td>
					<td>
						<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入类型',
						required:true,
						novalidate:true" name="type"/>
					</td>
				</tr>
				<tr>
					<td>金额</td>
					<td>
						<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入金额',
						required:true,
						novalidate:true" name="tkmoney"/>
					</td>
				</tr>
				<tr>
					<td>有效期</td>
					<td>
						<input class="easyui-datetimebox easyui-validatebox" data-options="prompt:'请输入有效期',
						required:true,
						novalidate:true,
						showSeconds:true" name="tktime"/>
					</td>
				</tr>
				<tr>
					<td><a class="easyui-linkbutton" onclick="save('/ticket/save', 'addForm', 'addWin', 'list');">保存</a></td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="editWin" class="easyui-window normal_win" data-options="title:'编辑优惠券', closed:true">
		<form id="editForm">
			<input type="hidden" name="kid" />
			<table>
				<tr>
					<td>金额</td>
					<td>
						<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入金额',
						required:true,
						novalidate:true" name="tkmoney"/>
					</td>
				</tr>
				<tr>
					<td>有效期</td>
					<td>
						<input class="easyui-datetimebox easyui-validatebox" data-options="prompt:'请输入有效期',
						required:true,
						novalidate:true,
						showSeconds:true" name="tktime"/>
					</td>
				</tr>
				<tr>
					<td><a class="easyui-linkbutton" onclick="edit('/ticket/update', 'editForm', 'editWin', 'list');">保存</a></td>
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

    function openEditWin(winId, listId, formId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            row.tktime = formatDate(row.tktime);
            $("#" + formId).form("load", row);
            openWin(winId);
        } else {
            showInfoAlert("请选择需要修改的数据！");
        }
    }

    function qtype(value,row,index) {
        if(value == 1){
            return '代金券';
        }else if(value == 2){
            return '现金券';
        }else if(value == 3){
            return '加息券';
        }else if(value == 4) {
            return '体验金';
        }
        return value;
    }
</script>
</html>