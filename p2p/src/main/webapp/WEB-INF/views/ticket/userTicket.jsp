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
			singleSelect:true,
			pagination:true,
			pageSize:10,
			url:'<%=path %>/uticket/pager_criteria',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'id',width:80,checkbox:true">编号</th>
        <th data-options="field:'uname',width:100">领券用户</th>
        <th data-options="field:'phone',width:100">用户手机号</th>
        <th data-options="field:'type',formatter:qtype,width:100">优惠券类型</th>
        <th data-options="field:'tkmoney',width:100">优惠金额</th>
        <th data-options="field:'yxtime',width:150,formatter:formatDate">领券时间</th>
        <th data-options="field:'tktime',width:150,formatter:formatDate">券有效期</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height: auto">
    <!--
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin');">删除</a>
    -->
    <div>
        <form id="searchForm">
            <input class="easyui-textbox easyui-validatebox"
                   data-options="prompt:'请输入优惠券类型',required:false,
				   novalidate:true" name="type"/>
            <input class="easyui-textbox easyui-validatebox"
                   data-options="prompt:'请输入用户名称',required:false,
				   novalidate:true" name="uname"/>
            <input class="easyui-textbox easyui-validatebox"
                   data-options="prompt:'请输入用户手机号',required:false,
				   novalidate:true" name="phone"/>
            <input class="easyui-textbox easyui-validatebox"
                   data-options="prompt:'请输入最大优惠金额',required:false,
				   novalidate:true" name="tkmoney"/>
            <!--
            <input class="easyui-datetimebox easyui-validatebox "
                   data-options="prompt:'请选择最大领取时间',required:false,
				   novalidate:true,showSeconds:true" name="tktime"/>
            <input class="easyui-datetimebox easyui-validatebox "
                   data-options="prompt:'请选择最大有效时间',required:false,
				   novalidate:true,showSeconds:true" name="yxtime"/>
		    -->
            <a href="javascript:void(0);" class="easyui-linkbutton"
               iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
        </form>
    </div>
</div>


</body>
<%@include file="../master/easyui/footer.jsp" %>
<script>
    $(function (){
        setPagination("list");
    });

    function qtype(value,row,index) {
        if(value == 1){
            return '代金券';
        }else if(value == 2){
            return '现金券';
        }else if(value == 3){
            return '加息券';
        }else if(value == 4) {
            return '体验金';
        }
        return value;
    }
</script>
</html>