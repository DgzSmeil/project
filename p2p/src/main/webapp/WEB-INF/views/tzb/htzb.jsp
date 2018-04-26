<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <%@include file="../master/easyui/header.jsp" %>
</head>
<body style="height:100%">
<table id="list" class="easyui-datagrid"
       data-options="
			toolbar:'#tb',
			rownumbers:true,
			border:false,
			singleSelect:true,
			pagination:true,
			pageSize:10,
			url:'<%=path %>/tzb/hlist',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'tzid',width:80,checkbox:true">编号</th>
        <th data-options="field:'rname',width:100">投资人</th>
        <th data-options="field:'cpname',width:100">产品名称</th>
        <th data-options="field:'money',width:100">投资金额</th>
        <th data-options="field:'nprofit',width:100">年利率</th>
        <th data-options="field:'term',width:100">期限</th>
        <th data-options="field:'way',width:100">还款方式</th>
        <th data-options="field:'time',width:150,formatter:formatDate">投资时间</th>
    </tr>
    </thead>
</table>
<div id="tb" style="height: auto">
    <form id="searchForm">
        <input class="easyui-datetimebox" name="startTime"
               data-options="prompt:'请选择最小投资时间',required:false,novalidate:true,showSeconds:true"/>
        <input class="easyui-datetimebox" name="endTime"
               data-options="prompt:'请选择最大投资时间',required:false,novalidate:true,showSeconds:true"/>
        <br />
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
    </form>
</div>
</body>
<%@include file="../master/easyui/footer.jsp" %>

<script>
    $(function() {
        setPagination("list");
    });

</script>

</html>