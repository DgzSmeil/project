<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>角色添加</title>
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
			url:'<%=path %>/role/pager_criteria',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'rid',width:80,checkbox:true">编号</th>
        <th data-options="field:'rname',width:250">角色名称</th>
        <th data-options="field:'content',width:250">角色描述</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height: auto">
    <div>
        <shiro:hasPermission name="role:save">
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin')">新增</a>
        </shiro:hasPermission>
        <shiro:hasPermission name="role:update">
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" onclick="openEditWin('editWin', 'list', 'editForm')">修改</a>
        </shiro:hasPermission>
        <form id="searchForm">
            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入角色名称',
						required:false,
						novalidate:true" name="rname"/>
            <input class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入角色描述',
						required:false,
						novalidate:true" name="content"/>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
        </form>
    </div>

    <div id="addWin" class="easyui-window medium_win" data-options="title:'新增角色权限', closed:true">
        <form id="addForm" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>角色名称：</td>
                    <td>
                        <input style="width:360px;" class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入角色名称',
						required:true,
						validType:['length[2,20]'],
						novalidate:true" name="rname"/>
                    </td>
                </tr>
                <tr>
                    <td>角色描述：</td>
                    <td>
                        <input style="width:360px;" class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入角色描述',
                               required:true,
                               validType:['length[2,25]'],
                        novalidate:true" name="content"/>
                    </td>
                </tr>
                <tr>
                    <td>选择权限：</td>
                    <td>
                        <div class="easyui-accordion" style="width:360px;height:300px;">
                            <a class="easyui-linkbutton" id="check">选中所有</a>
                            <a class="easyui-linkbutton" id="deselect">取消所选</a>
                            <div title="后台权限" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
                                <label id="asd">

                                </label>
                            </div>
                            <div title="前台权限" data-options="iconCls:'icon-help'" style="padding:10px;">
                                <label id="input1">

                                </label>
                            </div>
                            <div title="其他权限" data-options="iconCls:'icon-search'" style="padding:10px;">
                                <label id="input2">

                                </label>
                            </div>
                        </div>
                    </td>

                </tr>
                <tr>
                    <td><a class="easyui-linkbutton" id="add" onclick="save('/role/save', 'addForm', 'addWin', 'list');">确认</a></td>
                </tr>
            </table>
        </form>
    </div>

    <div id="editWin" class="easyui-window medium_win" data-options="title:'编辑角色', closed:true">
        <form id="editForm">
            <input type="hidden" name="rid" />
            <table>
                <tr>
                    <td>角色名称：</td>
                    <td>
                        <input style="width:360px;" class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入角色名称',
						required:true,
						validType:['length[2,30]'],
						novalidate:true" name="rname"/>
                    </td>
                </tr>
                <tr>
                    <td>角色描述：</td>
                    <td>
                        <input style="width:360px;" class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入角色描述',
                               required:true,
                               validType:['length[2,30]'],
                        novalidate:true" name="content"/>
                    </td>
                </tr>
                <tr>
                    <td>权限选择：</td>
                    <td>
                        <div class="easyui-accordion" style="width:360px;height:300px;">
                            <div title="后台权限" data-options="iconCls:'icon-ok'" style="overflow:auto;padding:10px;">
                                <label id="edit">

                                </label>
                            </div>
                            <div title="前台权限" data-options="iconCls:'icon-help'" style="padding:10px;">
                                <label id="edit1">

                                </label>
                            </div>
                            <div title="其他权限" data-options="iconCls:'icon-search'" style="padding:10px;">
                                <label id="edit2">

                                </label>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><a class="easyui-linkbutton" id="editor">确认</a></td>
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
        $.get("<%= path%>/jur/all",
            function (data) {
                var input="";
                var input1="";
                var input2="";
                for (var i=0; i<data.length;i++){
                    if(i<30){
                        input+="<input type='checkbox' name='jids' value='"+data[i].jid+"'>"+data[i].content+"&nbsp;&nbsp;&nbsp;";
                        if(i % 3 == 0 && i != 0){
                            input +="<br/>";
                        }
                    }else if(i>=30 && i<60){
                        input1+="<input type='checkbox' name='jids' value='"+data[i].jid+"'>"+data[i].content+"&nbsp;&nbsp;&nbsp;";
                        if(i % 3 == 0 && i != 0){
                            input1 +="<br/>";
                        }
                    }else{
                        input2+="<input type='checkbox' name='jids' value='"+data[i].jid+"'>"+data[i].content+"&nbsp;&nbsp;&nbsp;";
                        if(i % 3 == 0 && i != 0){
                            input2 +="<br/>";
                        }
                    }
                }
                $("#asd").html(input);
                $("#input1").html(input1);
                $("#input2").html(input2)
            },
            "json"
        );
    });
    $("#add").click(function () {
        $('input[type=checkbox]:checked').map(function(){return this.value}).get().join(',');
    });
    $("#editor").click(function () {
        if(confirm("你确定要修改？")){
            edit('/role/update', 'editForm', 'editWin', 'list');
        }else{
            return false;
        }

    });
    $("#check").click(function(){
        $("input[name='jids']").prop("checked","true");
    });
    $("#deselect").click(function(){
        $("input[name='jids']").removeProp("checked");
    });
    function openEditWin(winId, listId, formId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            $("#" + formId).form("load", row); // 考虑时间字符串
            $.get("<%= path%>/jur/all",
                function (data) {
                    var input="";
                    var input1="";
                    var input2="";
                    for (var i=0; i<data.length;i++){
                        if(i<30){
                            input+="<input type='checkbox' name='jids' value='"+data[i].jid+"'>"+data[i].content+"&nbsp;&nbsp;&nbsp;";
                            if(i % 3 == 0 && i != 0){
                                input +="<br/>";
                            }
                        }else if(i>=30 && i<60){
                            input1+="<input type='checkbox' name='jids' value='"+data[i].jid+"'>"+data[i].content+"&nbsp;&nbsp;&nbsp;";
                            if(i % 3 == 0 && i != 0){
                                input1 +="<br/>";
                            }
                        }else{
                            input2+="<input type='checkbox' name='jids' value='"+data[i].jid+"'>"+data[i].content+"&nbsp;&nbsp;&nbsp;";
                            if(i % 3 == 0 && i != 0){
                                input2 +="<br/>";
                            }
                        }
                    }
                    $("#edit").html(input);
                    $("#edit1").html(input1);
                    $("#edit2").html(input2);
                    getCheckbox(row.rid);
                },
                "json"
            );

            openWin(winId);
        } else {
            showInfoAlert("请选择需要修改的数据");
        }
    }
    function getCheckbox(rid){
        $.ajax({
            type: "post",
            url: "/jur/listAll/"+rid,
            async:true,
            dataType: "json",
            success: function(data){
                for(var i=0;i<data.length;i++){
                    $(function(){
                        $(":checkbox[value='"+data[i]+"']").prop("checked",true);
                    });
                }
            }
        });
    };
</script>
</html>
