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
			url:'<%=path %>/letter/select',
			method:'post'">
		<thead>
			<tr>
				<th data-options="field:'lid',width:40,checkbox:true">编号</th>
				<th data-options="field:'hid',width:90">发送人编号</th>
				<th data-options="field:'phone',width:170">接收人账户</th>
				<th data-options="field:'uid',width:170,formatter:formatterStart">发送类型</th>
				<th data-options="field:'title',width:150">标题</th>
				<th data-options="field:'content',width:300">内容</th>
				<th data-options="field:'date',width:200,formatter:formatDate">时间</th>
				<shiro:hasPermission name="letter:update,letter:delete">
					<th data-options="field:'make',width:200,formatter:LetterMack">操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
	</table>
	
	<div id="tb" style="height: auto">
		<shiro:hasPermission name="letter:save">
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin')">添加</a>
		</shiro:hasPermission>
		<div>
			<form id="searchForm">
				<input class="easyui-textbox" name="title"
					   data-options="prompt:'请输入标题',required:false,novalidate:true"/>
				<input class="easyui-textbox" name="phone"
					   data-options="prompt:'请输入接收人账户',required:false,novalidate:true"/>
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
		 title="编辑发送信息" data-options=" closed:true">
		<form id="addForm">
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="title" style="width:100%" data-options="label:'标题:',required:true">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="type" style="width:100%" value="单发" data-options="label:'发送类型:',required:true">
				<input type="hidden" name="uid" value="1"/>
			</div>
			<div id="select-phone" style="margin-bottom:20px">
				<input class="easyui-textbox phone " name="phone" style="width:100%" data-options="label:'接收人账户:',required:true,validType:'length[11,11]'">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-textbox" name="content" style="width:100%;height:60px" data-options="label:'内容:',multiline:true,required:true">
			</div>
			<div style="margin-bottom:20px">
				<input class="easyui-datetimebox" name="date" style="width:100%" data-options="label:'时间:',formatter:formatDate,required:true">
			</div>
			<div style="position: absolute;top:80%;left: 35%;margin-top: -20px;margin-left: -20px;">
				<a type="submit" class="easyui-linkbutton c1" onclick="save('/letter/save', 'addForm', 'addWin', 'list')"  style="width:120px">发送</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="easyui-linkbutton c5" onclick="clearForm()" style="width:120px">重置</a>
			</div>
		</form>
	</div>

<div id="editWin" class="easyui-window" style="width:800px;
		 height: 450px;padding: 20px"
	 title="修改合作伙伴信息" data-options=" closed:true">
	<form id="editForm">
			<input type="hidden" name="lid"/>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox" name="title" style="width:100%" data-options="label:'标题:',required:true">
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox" name="type" style="width:100%" value="单发" data-options="label:'发送类型:',required:true">
			<input type="hidden" name="uid" value="1"/>
			<%--<label class="textbox-label textbox-label-before" style="text-align: left; height: 26px; line-height: 26px;">发送类型:</label>
			<select class="selects" id="selects" name="uid"  style="width:451px;height: 30px;border: 1px solid;">
				<option value="0">群发</option>
				<option value="1">单发</option>
			</select>--%>
		</div>
		<div id="select-phones" style="margin-bottom:20px">
			<input class="easyui-textbox phone"  name="phone" style="width:100%" data-options="label:'接收人账户:',required:true">
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-textbox" name="content" style="width:100%;height:60px" data-options="label:'内容:',multiline:true">
		</div>
		<div style="margin-bottom:20px">
			<input class="easyui-datetimebox" name="date" style="width:100%" data-options="label:'时间:',formatter:formatDate,required:true">
		</div>
		<div style="position: absolute;top:80%;left: 35%;margin-top: -20px;margin-left: -20px;">
			<a href="#" class="easyui-linkbutton c1" onclick="edit('/letter/update', 'editForm', 'editWin', 'list')"  style="width:120px">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" class="easyui-linkbutton c5" onclick="clearForm()" style="width:120px">重置</a>
		</div>
	</form>
</div>
</body>
<%@include file="../master/easyui/footer.jsp" %>

<script>
	$(function() {
        hashChange();
       /* var obj = document.getElementById('select-phone');
        var objs = document.getElementById('select-phones');
        obj.style.display='none';
        $(".selects").bind("change",function(){
            if($(this).val() == 1) {
                obj.style.display='block';
                objs.style.display='block';
            }else if($(this).val() == 0) {
               $('.phone').textbox('setValue','');
                obj.style.display='none';
                objs.style.display='none';
			}
		})*/
	});

    function clearForm(){
        $('#addForm').form('clear');
    }

</script>

</html>