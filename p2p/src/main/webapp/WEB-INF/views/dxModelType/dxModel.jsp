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
    <title>短信模板</title>
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
			pageNo:1,
			pageSize:10,
			url:'<%=path %>/dxModel/pager',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'dxid',width:80,checkbox:true">编号</th>
        <th data-options="field:'content',width:300">短信模板</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height: auto">
    <shiro:hasPermission name="dxModel:delete">
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" onclick="deleteWin('list');">删除</a>
    </shiro:hasPermission>
</div>


</body>
<%@include file="../master/easyui/footer.jsp" %>

<script>
    function deleteWin(listId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            var id = row.dxid;
            $.messager.confirm('删除提示', '您确定要删除选中的记录吗?', function (r) {
                if (r) {
                    $.post('/dxModel/delete?id=' + id,
                        function (data) {
                            if (data.result == "ok") {
                                showInfoAlert(data.message);
                                $("#" + listId).datagrid("reload");
                            } else {
                                showInfoAlert(data.message);
                            }
                        },
                        "json"
                    );
                }
            });
        } else {
            $.messager.alert('信息提示', '请选择要删除的记录!');
        }
    }

</script>

</html>