<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息</title>
	<%@include file="../master/easyui/header.jsp" %>
</head>
<body style="height: auto;">
	<table id="list" class="easyui-datagrid"
		data-options="
			toolbar:'#tb',
			rownumbers:true,
			border:false,
			singleSelect:true,
			pagination:true,
			pageSize:10,
			url:'<%=path %>/huser/user_pager_criteria',
			method:'post'">
		<thead>
			<tr>
				<th data-options="field:'uid',width:80,checkbox:true">编号</th>
				<th data-options="field:'uname',width:90">用户名</th>
				<th data-options="field:'phone',width:100">手机号码</th>
				<th data-options="field:'rname',width:80">真实姓名</th>
				<th data-options="field:'sex',width:40,formatter:getsex">性别</th>
				<th data-options="field:'idno',width:150">身份证号</th>
				<th data-options="field:'tzm',width:60">推荐码</th>
				<th data-options="field:'email',width:150">邮箱</th>
				<th data-options="field:'isvip',width:50,formatter:getisvip">是否VIP</th>
			</tr>
		</thead>
	</table>

	<div id="tb" style="height: auto">
		<div>
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="openEditWin('editWin', 'list', 'editForm')">用户详情</a>
			<form id="searchForm">
				<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入用户名',
						required:false,
						novalidate:true" name="uname"/>
				<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入手机号',
						required:false,
						novalidate:true" name="phone"/>
				<input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入真实姓名',
						required:false,
						novalidate:true" name="rname"/>
				<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
				<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
			</form>
		</div>

		<div id="editWin" class="easyui-window large_win" data-options="title:'查看用户详情', closed:true">
			<form id="editForm">
				<table>
					<tr>
						<td width="100px">头像：</td>
						<td>
							<img src="" id="face" style="width: 150px;height:150px"/>
						</td>
					</tr>
					<tr>
						<td width="100px">手机号:</td>
						<td>
							<input class="easyui-textbox easyui-validatebox" name="phone" readonly="readonly" style="width: 400px;height: 32px;">
						</td>
					</tr>
					<tr>
						<td width="100px">真实姓名:</td>
						<td>
							<input class="easyui-textbox easyui-validatebox" name="rname" readonly="readonly" style="width: 400px;height: 32px;">
						</td>
					</tr>
					<tr>
						<td width="100px">年龄:</td>
						<td>
							<input class="easyui-textbox easyui-validatebox" name="age" readonly="readonly" style="width: 400px;height: 32px;">
						</td>
					</tr>
					<tr>
						<td width="100px">学历:</td>
						<td>
							<input class="easyui-textbox easyui-validatebox" name="xl" readonly="readonly" style="width: 400px;height: 32px;">
						</td>
					</tr>
					<tr>
						<td width="100px">婚姻状况:</td>
						<td>
							<input type="text" name="ism" style="border:none;" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td width="100px">毕业院校:</td>
						<td>
							<input class="easyui-textbox easyui-validatebox" name="bschool" readonly="readonly" style="width: 400px;height: 32px;">
						</td>
					</tr>
					<tr>
						<td width="100px">现居住地:</td>
						<td>
							<input class="easyui-textbox easyui-validatebox" readonly="readonly" name="addr" style="width: 400px;height: 32px;">
						</td>
					</tr>
					<tr>
						<td width="100px">职业:</td>
						<td>
							<input class="easyui-textbox easyui-validatebox" readonly="readonly" name="work" style="width: 400px;height: 32px;">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<%@include file="../master/easyui/footer.jsp" %>
<script>
    $(function () {
        setPagination("list");
    });

    function getisvip(isvip){
        return (isvip == 1) ? '否' : ((isvip == 2) ? '是 ' : '');
    }

    function getsex(sex){
        return (sex == 1) ? '男' : '女';
    }

    function openEditWin(winId, listId, formId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            $("#" + formId).form("load", row); // 考虑时间字符串
//            var face = document.getElementById("face");
//            face.src = "../static/upload/"+row.face;
//            $("#phone").val(row.phone);
//            $("#rname").val(row.rname);
//            $("#age").val(row.age);
//            $("#xl").val(row.xl);
//            $("#ism").val((row.ism == 1) ? '已婚' : (row.ism == 2) ? '未婚' : '');
//            $("#bschool").val(row.bschool);
//            $("#addr").val(row.addr);

            var test = $("input[name='ism']").val();
//            $("#work").val(row.work);
			 if (test == 2) {
                 $("input[name='ism']").val('已婚');
            } else if (test == 1) {
                 $("input[name='ism']").val('未婚');
			 }
            openWin(winId);
        } else {
            showInfoAlert("请选择需要查看的数据");
        }
    }
</script>
</html>