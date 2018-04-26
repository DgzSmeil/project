<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/27
  Time: 8:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>新增后台用户</title>
    <%@include file="../master/easyui/header.jsp"%>
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
			url:'<%=path %>/huser/pager_criteria',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'huid',width:80,checkbox:true">编号</th>
        <th data-options="field:'rname',width:100">真实姓名</th>
        <th data-options="field:'sex',width:100,formatter:formattersex">性别</th>
        <th data-options="field:'phone',width:150">电话</th>
        <th data-options="field:'huname',width:100">昵称</th>
        <th data-options="field:'email',width:150">电子邮箱</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height: auto">
    <div>
        <shiro:hasPermission name="roleUser:save">
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin')">新增</a>
        </shiro:hasPermission>
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEditWin('editWin', 'list', 'editForm')">修改</a>
        <shiro:hasPermission name="roleUser:remove">
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" onclick="del('list')">删除</a>
        </shiro:hasPermission>
        <form id="searchForm">
            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入真实姓名',
						required:false,
						novalidate:true" name="rname"/>
            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入电话',
						required:false,
						novalidate:true" name="phone"/>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
        </form>
    </div>

    <div id="addWin" class="easyui-window normal_win" data-options="title:'新增普通管理员', closed:true">
        <form id="addForm" enctype="multipart/form-data">
            <input type="hidden" name="rid" value="2"/>
            <table>
                <tr>
                    <td>真实姓名:</td>
                    <td>
                        <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入员工正实姓名',
                               required:true,
                        novalidate:true" name="rname"/>
                    </td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td>
                        <select class="easyui-combobox  easyui-validatebox" style="width: 172px"  data-options="prompt:'请选择员工性别',
                                required:true,
                        novalidate:true" name="sex">
                            <option value="0" selected>男</option>
                            <option value="1">女</option>
                        </select>
                    </td>
                </tr>
                    <tr>
                    <td>电话号码:</td>
                    <td>
                        <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入员工手机号',
                                   required:true,
                            novalidate:true ,validType:['length[11,11]']" name="phone"/>
                    </td>
                </tr>
                <tr>
                    <td>昵称:</td>
                    <td>
                        <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入昵称',
                               required:true,
                        novalidate:true" name="huname"/>
                    </td>
                </tr>
                <tr>
                    <td>邮箱:</td>
                    <td>
                        <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入邮箱',
                               required:true,
                        novalidate:true" name="email"/>
                    </td>
                </tr>
                <tr>
                    <td><a class="easyui-linkbutton" onclick="save('/huser/save', 'addForm', 'addWin', 'list');">确认</a></td>
                </tr>
            </table>
        </form>
    </div>

    <div id="editWin" class="easyui-window normal_win" data-options="title:'编辑用户角色', closed:true">
        <form id="editForm">
            <input type="hidden" name="huid" />
            <table>
                <tr>
                    <td>真实姓名:</td>
                    <td>
                        <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入员工正实姓名',
                               required:true,
                        novalidate:true" name="rname"/>
                    </td>
                </tr>
                <tr>
                    <td>性别:</td>
                    <td>
                        <select class="easyui-combobox  easyui-validatebox" style="width: 172px"  data-options="prompt:'请选择员工性别',
                                required:true,
                        novalidate:true" name="sex">
                            <option value="0" selected>男</option>
                            <option value="1">女</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>电话号码:</td>
                    <td>
                        <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入员工手机号',
                                   required:true,
                            novalidate:true ,validType:['length[11,11]']" name="phone"/>
                    </td>
                </tr>
                <tr>
                    <td>昵称:</td>
                    <td>
                        <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入昵称',
                               required:true,
                        novalidate:true" name="huname"/>
                    </td>
                </tr>
                <tr>
                    <td>邮箱:</td>
                    <td>
                        <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入邮箱',
                               required:true,
                        novalidate:true" name="email"/>
                    </td>
                </tr>
                <tr>
                    <td><a class="easyui-linkbutton" onclick="edit('/huser/update', 'editForm', 'editWin', 'list');">确认</a></td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>
<%@include file="../master/easyui/footer.jsp"%>
<script>
    $(function () {
        setPagination("list");
    });
    function openEditWin(winId, listId, formId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            $("#" + formId).form("load", row); // 考虑时间字符串
            $("#huid").combobox("select", row.huid);
            openWin(winId);
        } else {
            showInfoAlert("请选择需要修改的数据");
        }
    }
    function del(listId){
        var rows = $("#" + listId).datagrid("getSelected");
        if(rows){
            if(confirm("你确定要删除此用户")){
                $.post(
                    "<%= path%>/huser/remove/"+ rows.huid,
                    function (data) {
                        if(data.result==='ok'){
                            window.location.href = contextPath + "/huser/page";
                        }else{
                            showInfoAlert("删除失败！");
                        }
                    },
                    "json"
                );
            }else{
                return false;
            }
        }else{
            showInfoAlert("请选择你要删除的角色用户！")
        }

    }

    function formattersex(value) {
        if(value == 0){
            return "男"
        }else{
            return "女"
        }
    }

</script>
</html>
