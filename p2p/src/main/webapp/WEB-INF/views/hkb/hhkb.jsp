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
			url:'<%=path %>/hkb/hlist/${baid}',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'hkid',width:80,checkbox:true">编号</th>
        <th data-options="field:'rname',width:100">借款人姓名</th>
        <th data-options="field:'cpname',width:100">产品名称</th>
        <th data-options="field:'djq',width:100">第几期</th>
        <th data-options="field:'ytmoney',width:100">投资金额</th>
        <th data-options="field:'ybx',width:100">应还本息</th>
        <th data-options="field:'ytime',width:150,formatter:formatDate">还款期限</th>
        <th data-options="field:'state',width:100,formatter:getstate">状态</th>

    </tr>
    </thead>
</table>
<div id="tb" style="height: auto">
    &nbsp;
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="back_last()">返回</a>
</div>

</body>
<%@include file="../master/easyui/footer.jsp" %>

<script>
    $(function() {
        setPagination("list");

    });
    function getstate(state) {
        var str = "";
        if (state==1){
            str += "未还款";
        }else if(state==2){
            str += "已还款";
        }else if(state==3){
            str += "已逾期";
        }
        return str;
    }
    function back_last(){
        window.history.back();
    }
</script>

</html>