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
			url:'<%=path %>/userMoney/list',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'umid',width:80,checkbox:true">编号</th>
        <th data-options="field:'uname',width:100">用户昵称</th>
        <th data-options="field:'zmoney',width:100">总资产</th>
        <th data-options="field:'kymoney',width:100">可用余额</th>
        <th data-options="field:'symoney',width:100">收益总额</th>
        <th data-options="field:'tzmoney',width:100">投资总额</th>
        <th data-options="field:'djmoney',width:100">冻结金额</th>
        <th data-options="field:'dsmoney',width:100">待收金额</th>
        <th data-options="field:'jlmoney',width:100">奖励金额</th>
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

</script>

</html>