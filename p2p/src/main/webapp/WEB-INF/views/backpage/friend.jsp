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
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/css/globle.css" />
	<title>Insert title here</title>
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
			url:'<%=path %>/friend/select',
			method:'post'">
		<thead>
			<tr>
				<th data-options="field:'fid',width:80,checkbox:true">编号</th>
				<th data-options="field:'rname',width:150">名称</th>
				<th data-options="field:'furl',width:170">链接</th>
				<th data-options="field:'fpic',width:400,formatter:formatImage">图片</th>
				<th data-options="field:'date',width:150,formatter:formatDate">加入时间</th>
				<shiro:hasPermission name="friend:update,friend:del">
					<th data-options="field:'make',width:200,formatter:NoticeMack">操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="height: auto">
		<shiro:hasPermission name="friend:filesUpload">
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin')">添加</a>
		</shiro:hasPermission>
		<div>
			<form id="searchForm">
				<input class="easyui-textbox" name="rname"
					   data-options="prompt:'请合作伙伴名称',required:false,novalidate:true"/>
				<input class="easyui-datetimebox" name="startTime"
					   data-options="prompt:'请选择最大创建时间',required:false,novalidate:true,showSeconds:true"/>
				<input class="easyui-datetimebox" name="endTime"
					   data-options="prompt:'请选择最小创建时间',required:false,novalidate:true,showSeconds:true"/>
				<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
				<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
			</form>
		</div>
	</div>
	
	<div id="addWin" class="easyui-window" style="width:600px;
		 height: 450px;padding: 20px"
		 title="添加合作伙伴信息" data-options=" closed:true">
		<form id="addForm" action="/friend/filesUpload" method="post" enctype="multipart/form-data">
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="rname" style="width:100%" data-options="label:'名称:',required:true">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="furl" style="width:100%" data-options="label:'链接:',required:true">
			</div>
			<div style="margin-bottom:20px">
					选择图片：
					<div class="preview">
						<img id="imghead" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="120" height="90" onclick="$('#previewImg').click();">
					</div>
					<input type="file" onchange="previewImage(this)" name="file" style="display: none;" id="previewImg"><br>
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-datetimebox" name="date" style="width:100%" data-options="label:'时间:',formatter:formatDate">
			</div>
			<div style="position: absolute;top:80%;left: 35%;margin-top: -20px;margin-left: -20px;">
				<button type="submit" class="easyui-linkbutton c1"  style="width:120px">添加</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="easyui-linkbutton c5" onclick="clearForm()" style="width:120px">重置</a>
			</div>
		</form>
	</div>

<div id="editWin" class="easyui-window" style="width:800px;
		 height: 450px;padding: 20px"
	 title="修改合作伙伴信息" data-options=" closed:true">
	<form id="editForm"  action="/friend/update" method="post" enctype="multipart/form-data">
			<input type="hidden" name="fid"/>
		<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="rname" style="width:100%" data-options="label:'名称:',required:true">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="furl" style="width:100%" data-options="label:'链接:',required:true">
			</div>
			<div style="margin-bottom:20px">
					选择图片：
					<div class="preview">
						<img id="imgheads" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="120" height="90" onclick="$('#previewImg').click();">
					</div>
					<input type="file" onchange="previewImages(this)" name="file" style="display: none;" id="previewImgs"><br>
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-datetimebox" name="date" style="width:100%" data-options="label:'时间:',formatter:formatDate">
			</div>
			<div style="position: absolute;top:80%;left: 35%;margin-top: -20px;margin-left: -20px;">
				<button type="submit" class="easyui-linkbutton c1"  style="width:120px">修改</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="easyui-linkbutton c5" onclick="clearForm()" style="width:120px">重置</a>
			</div>
	</form>
</div>
</body>
<%@include file="../master/easyui/footer.jsp" %>

<script>
	$(function() {
        hashChange();
	});
    function clearForm(){
        $('#addWin').form('clear');
    }
</script>

</html>