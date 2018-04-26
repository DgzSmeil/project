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
			singleSelect:false,
			pagination:true,
			pageSize:10,
			url:'<%=path %>/option/pager_criteria',
			method:'post'">

    <thead>
    <tr>
        <th data-options="field:'opid',width:80,checkbox:true">编号</th>
        <th data-options="field:'phone',width:100">手机号码</th>
        <th data-options="field:'content',width:200">反馈内容</th>
        <th data-options="field:'date',width:150,formatter:formatDate">反馈时间</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height: auto">
    <!--
    <a href="javascript:deleteOption()" class="easyui-linkbutton"
       iconCls="icon-remove" plain="true">删除</a>
    -->
    <div>
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search"
           onclick="openEditWin('editWin', 'list', 'editForm')">反馈详情</a>
        <form id="searchForm">
            <input class="easyui-textbox easyui-validatebox"
                   data-options="prompt:'请输入内容关键字',
                   required:false,novalidate:true" name="content"/>
            <input class="easyui-datetimebox easyui-validatebox"
                   data-options="prompt:'请选择最大反馈时间',required:false,
                   novalidate:true,showSeconds:true" name="date"/>
            <a href="javascript:void(0);" class="easyui-linkbutton"
               iconCls="icon-search" id="search" onclick="doSearch('list', 'searchForm');">搜索</a>
        </form>
    </div>

    <div id="editWin" class="easyui-window large_win" data-options="title:'查看用户反馈详情', closed:true">
        <form id="editForm">
            <table>
                <tr>
                    <td>反馈内容：</td>
                    <td>
                        <div style="margin:10px 0;"></div>
                        <input class="easyui-textbox" data-options="multiline:true"
                               readonly="readonly" name="content" style="width:400px;height:150px;">
                    </td>
                </tr>
            </table>
        </form>
    </div>


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
            showInfoAlert("请选择需要查看的数据！");
        }
    }


    function deleteOption() {
        var selectedRows = $('#list').datagrid('getSelections');
        if (selectedRows.length == 0) {
            $.messager.alert("系统提示", "请选择要删除的数据！");
            return;
        }
        var strIds = [];
        for ( var i = 0; i < selectedRows.length; i++) {
            strIds.push(selectedRows[i].id);
        }
        var ids = strIds.join(",");
        alert(ids);
        $.messager.confirm("系统提示", "您确定要删除这<font color=red>"
            + selectedRows.length + "</font>条数据吗？", function(r) {
            if (r) {
                $.post("${pageContext.request.contextPath}/option/remove", {
                    ids : ids
                }, function(data) {
                    if (data.result === "ok") {
                        $("#list").datagrid("reload");
                    } else {
                        $.messager.alert("系统提示", "数据删除失败，请稍后再试！");
                    }
                }, "json");
            }
        });
    }


</script>
</html>