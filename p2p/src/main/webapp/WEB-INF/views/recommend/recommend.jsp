<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
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
			url:'<%=path %>/recommend/pager_criteria',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'id',width:80,checkbox:true">编号</th>
        <th data-options="field:'tname',width:100">推荐人姓名</th>
        <th data-options="field:'rname',width:100">被推荐人姓名</th>
        <th data-options="field:'tzm',width:100">推荐码</th>
        <th data-options="field:'date',width:150,formatter:formatDate">推荐时间</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height: auto">

    <shiro:hasPermission name="recommend:export">
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit"
           onclick="exportExcel('/recommend/export', 'searchForm')">导出Excel</a>
    </shiro:hasPermission>
    <shiro:hasPermission name="recommend:remove">
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" onclick="del('list')">删除</a>
    </shiro:hasPermission>
    <div>
        <form id="searchForm">

            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入推荐人姓名',
						required:false,
						novalidate:true" name="tname"/>

            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入被推荐人姓名',
						required:false,
						novalidate:true" name="rname"/>
            <input class="easyui-datetimebox"
                   data-options="prompt:'请选择开始时间',
					   required:false,
					   novalidate:true,
					   showSeconds:true" name="startTime"/>
            <input class="easyui-datetimebox"
                   data-options="prompt:'请选择结束时间',
					   required:false,
					   novalidate:true,
					   showSeconds:true" name="endTime"/>
            <br/>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search"
               onclick="doSearch('list', 'searchForm');">搜索</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search"
               onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
        </form>
    </div>
</div>

</body>
<%@include file="../master/easyui/footer.jsp" %>

<script>
    $(function () {
        setPagination("list");
        $(".cashTypeParent").combobox(
            {
                url: contextPath + '/cash_type/get/0',
                valueField: 'tid',
                textField: 'text',
                onSelect: function (record) {
                    $(".cashType").combobox(
                        {
                            url: contextPath + '/cash_type/get/' + record.id,
                            valueField: 'tid',
                            textField: 'text'
                        }
                    );
                }
            }
        );
        $(".payType").combobox(
            {
                url: contextPath + '/pay_type/all',
                valueField: 'tid',
                textField: 'text'
            }
        );
    });

    function del(listId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row == null) {
            $.messager.alert("提示", "请先选中要删除的行!");
            return false;
            }
        $.messager.confirm("提示", "确定要删除么?", function (r) {
            if (r) {
                $.ajax({
                    type: "POST",
                    url: "../recommend/remove",
                    data: {"id": row.id},
                    datatype: "json",
                    beforeSend: function () { },
                    success: function (data) {
                        var data = JSON.parse(data);
                        if (data.msg == "1") {
                            $("#div_Add").dialog('close', false);//关闭窗口
                            $("#" + listId).datagrid('reload');//刷新页面
                        }
                    $.messager.alert("提示", data.msgbox);
                    },
                });
                $("#" + listId).datagrid('reload');//刷新页面
                }
            });
        }
    function openEditWin(winId, listId, formId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            row.cashTime = formatDate(row.cashTime);
            $("#" + formId).form("load", row);
            $("#cashTypeParent").combobox("select", row.cashTypePid);
            $("#cashType").combobox("select", row.cashTypeId);
            $("#payType").combobox("select", row.payTypeId);
            openWin(winId);
        } else {
            showInfoAlert("请选择需要修改的数据");
        }
    }

    function exportExcel(url, formId) {
        var form = $("#" + formId);
        form.attr('action', contextPath + url);
        form.submit();
    }
</script>

</html>