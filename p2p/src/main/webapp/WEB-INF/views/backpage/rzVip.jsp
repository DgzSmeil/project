<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<style>
	.normal_win input{
		border: none;
	}
</style>
<html>
<head>
	<title>Title</title>
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
			url:'<%=path %>/rzvip/pager_criteria',
			method:'post'">
	<thead>
	<tr>
		<th data-options="field:'uid',width:80,checkbox:true">编号</th>
		<th data-options="field:'uname',width:100">用户名</th>
		<th data-options="field:'phone',width:100">手机号</th>
		<th data-options="field:'rname',width:100">真实姓名</th>
		<th data-options="field:'idno',width:160">身份证号</th>
		<th data-options="field:'sex',width:40,formatter:getsex">性别</th>
		<th data-options="field:'xl',width:100">学历</th>
		<th data-options="field:'addr',width:100">居住地址</th>
		<th data-options="field:'work',width:100">当前职业</th>
		<th data-options="field:'ispass',width:100,formatter:getstate">状态</th>
	</tr>
	</thead>
</table>

<div id="tb" style="height: auto">
	<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="openLookWin('lookWin', 'list', 'lookForm')">查看详情</a>
	<%--<shiro:hasPermission name="rzvip:shenhe">--%>
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="openEditwin('shenhe', 'list', 'shenheId')">审 核</a>
	<%--</shiro:hasPermission>--%>
	<div>
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
</div>

<div id="lookWin" class="easyui-window normal_win" data-options="title:'查看详细资料', closed:true" style="width: 800px;height: auto;">
	<form id="lookForm">
		<table>
			<tr height="40px">
				<td width="200px">真实姓名：</td>
				<td width="260px">
					<input id="rname" readonly="readonly"/>
				</td>
				<td width="150px">身份证号：</td>
				<td width="260px">
					<input id="idno" readonly="readonly"/>
				</td>
			</tr>
			<tr height="40px">
				<td width="100px">学历：</td>
				<td width="260px">
					<input id="xl" readonly="readonly"/>
				</td>
				<td width="100px">婚姻状况：</td>
				<td width="260px">
					<input id="ism" readonly="readonly"/>
				</td>
			</tr>
			<tr height="40px">
				<td width="100px">年龄：</td>
				<td width="260px">
					<input id="age" readonly="readonly"/>
				</td>
				<td width="100px">毕业院校：</td>
				<td width="260px">
					<input id="bschool" readonly="readonly"/>
				</td>
			</tr>
			<tr height="40px">
				<td width="100px">居住地：</td>
				<td width="260px">
					<input id="addr" readonly="readonly"/>
				</td>
				<td width="100px">当前职位：</td>
				<td width="260px">
					<input id="work" readonly="readonly"/>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="shenhe" class="easyui-window normal_win" data-options="title:'审核', closed:true">
	<form id="shenheId">
		<input type="hidden" id="uid" name="uid">
		<table>
			<tr>
				<td>状态：</td>
				<td>
					<select name="isok" id="isok" style="width: 170px;height: 40px">
						<option value="2">审核通过</option>
						<option value="4">审核不通过</option>
					</select>
				</td>
			</tr>
			<tr id="asdf" style="display: none;">
				<td>审核理由：</td>
				<td>
					<textarea id="excute" style="width: 200px;height:100px;" name="excute"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<a class="easyui-linkbutton" onclick="save('/rzvip/shenhe', 'shenheId', 'shenhe', 'list');">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
<%@include file="../master/easyui/footer.jsp" %>
<script>
    $(function() {
        setPagination("list");
        $("#isok").bind("change",function(){
            if($("#isok").val()==4){
                $("#asdf").show();
            }else{
                $("#asdf").hide();
            }
        })
    });

    function openLookWin(winId, listId, formId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            $("#" + formId).form("load", row); // 考虑时间字符串
            $("#uid").val(row.uid);
 			$("#rname").val(row.rname);
            $("#idno").val(row.idno);
            $("#xl").val(row.xl);
            $("#ism").val((row.ism == 1) ? '已婚' : '未婚');
            $("#age").val(row.age);
            $("#bschool").val(row.bschool);
            $("#addr").val(row.addr);
            $("#work").val(row.work);
            openWin(winId);
        } else {
            showInfoAlert("请选择需要查看的数据");
        }
    }

    function getstate(state){
        return ((state == 3) ? '未审核' : ((state == 4) ? '审核失败' : ''));
    }

    function getsex(sex){
        return ((sex == 1) ? '男' : '女');
    }

    function openEditwin(winId, listId,formId){
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            row.cashTime = formatDate(row.cashTime);
            $("#" + formId).form("load", row); // 考虑时间字符串
            $("#uid").val(row.uid);
            openWin(winId);
        } else {
            showInfoAlert("请选择需要审核的数据");
        }
    }
</script>

</html>