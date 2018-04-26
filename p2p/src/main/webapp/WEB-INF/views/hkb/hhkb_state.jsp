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
			url:'<%=path %>/hkb/hlist_state',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'hkid',width:80,checkbox:true">编号</th>
        <th data-options="field:'rname',width:100">借款人姓名</th>
        <th data-options="field:'cpname',width:100">产品名称</th>
        <th data-options="field:'djq',width:100">第几期</th>
        <th data-options="field:'ytmoney',width:100">投资金额</th>
        <th data-options="field:'ybx',width:100">应还本息</th>
        <th data-options="field:'rbx',width:100">已还本息</th>
        <th data-options="field:'yfx',width:100">逾期罚款</th>
        <th data-options="field:'hname',width:100">负责人</th>
        <th data-options="field:'ytime',width:150,formatter:formatDate">还款期限</th>
    </tr>
    </thead>
</table>


</body>
<%@include file="../master/easyui/footer.jsp" %>

<script>
    $(function() {
        setPagination("list");
        $("#state").bind("change",function(){
            if($("#state").val()==2){
                $("#asdf").show();
            }else{
                $("#asdf").hide();
            }
        })

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
</script>

</html>