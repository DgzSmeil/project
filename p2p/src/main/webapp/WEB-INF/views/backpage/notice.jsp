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
	<link rel="stylesheet" href="<%=path %>/static/plugin/easyui/themes/default/easyui.css" />
	<link rel="stylesheet" href="<%=path %>/static/plugin/easyui/themes/icon.css" />
	<!-- 配置文件 -->
	<script type="text/javascript" src="<%=path %>/static/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="<%=path %>/static/ueditor/ueditor.all.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/ueditor/themes/default/css" />
	<%@include file="../master/easyui/header.jsp" %>
</head>
<body>
<table id="list" class="easyui-datagrid"
	   data-options="
			toolbar:'#tb',
			fitColumns:true,
			border:false,
			singleSelect:true,
			pagination:true,
			pageSize:10,
			resizable:true,
			url:'<%=path %>/notice/select',
			method:'post'">
	<thead>
	<tr>
		<th data-options="field:'dyid',width:80,checkbox:true">编号</th>
		<th data-options="field:'title',width:150">标题</th>
		<th data-options="field:'content',width:550">内容</th>
		<th data-options="field:'date',width:150,formatter:formatDate">时间</th>
		<shiro:hasPermission name="notice:update,notice:del">
			<th data-options="field:'make',width:350,formatter:NoMack">操作</th>
		</shiro:hasPermission>
	</tr>
	</thead>
</table>

<div id="tb" style="height: auto">
	<shiro:hasPermission name="notice:save">
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin')">添加</a>
	</shiro:hasPermission>
	<div>
		<form id="searchForm">
			<input class="easyui-textbox" name="title"
				   data-options="prompt:'请创建标题',required:false,novalidate:true"/>
			<input class="easyui-datetimebox" name="startTime"
				   data-options="prompt:'请选择最大创建时间',required:false,novalidate:true,showSeconds:true"/>
			<input class="easyui-datetimebox" name="endTime"
				   data-options="prompt:'请选择最小创建时间',required:false,novalidate:true,showSeconds:true"/>
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
		</form>
	</div>
</div>

<div id="addWin" class="easyui-window" style="width:800px;
		 height: 450px;padding: 20px"
	 title="添加公告信息" data-options=" closed:true">
	<form id="addForm">
		<table>
			<tr>
				<td style="width:7%;">标题</td>
				<td>
					<input class="easyui-textbox easyui-validatebox" style="width:70%;"  data-options="prompt:'请输入内容',
							required:true,
						novalidate:true" name="title"/>
				</td>
			</tr>
			<tr>
				<td style="width:7%;">内容</td>
				<td>
					<div>
						<textarea id="editors" type="text/plain" style="width:100%; height:220px;"name="content"></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td style="width:7%;">时间</td>
				<td>
					<input class="easyui-datetimebox easyui-validatebox" style="width:70%;"  data-options="prompt:'请输入时间',
							formatter:formatDate,
							required:true,
						novalidate:true" name="date"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a class="easyui-linkbutton" onclick="save('/notice/save', 'addForm', 'addWin', 'list');">确认</a></td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" style="width:800px;
		 height: 450px;padding: 20px"
	 title="修改公告信息" data-options=" closed:true">
	<form id="editForm">
		<input type="hidden" name="nid"/>
		<table>
			<tr>
				<td style="width:7%;">标题</td>
				<td>
					<input class="easyui-textbox easyui-validatebox" style="width:70%;"  data-options="prompt:'请输入内容',
							required:true,
						novalidate:true" name="title"/>
				</td>
			</tr>
			<tr>
				<td style="width:7%;">内容</td>
				<td>
					<div>
						<textarea id="editor" type="text/plain" style="width:100%; height:220px;"name="content"></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td style="width:7%;">时间</td>
				<td>
					<input class="easyui-datetimebox easyui-validatebox" style="width:70%;"  data-options="prompt:'请输入时间',
							formatter:formatDate,
							required:true,
						novalidate:true" name="date"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><a class="easyui-linkbutton" onclick="edit('/notice/update', 'editForm', 'editWin', 'list');">确认</a></td>
			</tr>
		</table>
	</form>
</div>
</body>
<%@include file="../master/easyui/footer.jsp" %>
<!--ueditor获取实例-->
<script type="text/javascript">
    var ue = UE.getEditor('editors');
    ue.setContent("dddd")
</script>
<script>
    $(function() {
        setPagination("list");
    });

</script>

</html>