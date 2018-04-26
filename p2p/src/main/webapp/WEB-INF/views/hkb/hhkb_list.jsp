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
			url:'<%=path %>/borrowApply/jkb_list',
			method:'post'">
    <thead>
    <tr style="height: 40px;">
        <th data-options="field:'baid',width:80,checkbox:true">编号</th>
        <th data-options="field:'rname',width:100">借款人姓名</th>
        <th data-options="field:'cpname',width:100">产品名称</th>
        <th data-options="field:'ytmoney',width:100">投资金额</th>
        <th data-options="field:'way',width:100">还款方式</th>
        <th data-options="field:'nprofit',width:100">年利率(%)</th>
        <th data-options="field:'term',width:100">借款期限</th>
        <th data-options="field:'mbtime',width:150,formatter:formatDate">满标时间</th>
        <th data-options="field:'asd',width:100,formatter:caozuo">操作</th>
    </tr>
    </thead>
</table>
<div id="tb" style="height: auto">
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="look_hkb('list')">查看详情</a>
    <a href="" id="chakan" style="display: none"></a>
    <div>
        <form id="searchForm">
            <input class="easyui-numberbox easyui-validatebox" data-options="prompt:'请输入最大金额',
						required:false,
						novalidate:true,
						precision:2" name="money"/>
            <input class="easyui-datetimebox" name="startTime"
                   data-options="prompt:'请选择最小满标时间',required:false,novalidate:true,showSeconds:true"/>
            <input class="easyui-datetimebox" name="endTime"
                   data-options="prompt:'请选择最大满标时间',required:false,novalidate:true,showSeconds:true"/>
            <br />
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
        </form>
    </div>
</div>

</body>
<%@include file="../master/easyui/footer.jsp" %>

<script>
    var localObj = window.location;
    var contextPath = localObj.pathname.split("/")[1];
    $(function() {
        setPagination("list");
    });
    function caozuo() {
        var str = '<a href="javascript:void(0);" src="'+contextPath+'/hkb/hhkb" class="site-navi-tab">查看还款</a>';
        return str;
    }
    function look_hkb(listId){
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            window.location.href = '/hkb/hhkb/'+row.baid;
        }else{
            showInfoAlert("请选择需要查看的数据");
        }
    }
</script>

</html>