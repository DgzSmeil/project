<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
			url:'<%=path %>/home/pager_criteria',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'hid',width:80,checkbox:true">编号</th>
        <th data-options="field:'pic1',width:160,formatter:pic1Img">轮播图一</th>
        <th data-options="field:'pic2',width:160,formatter:pic2Img">轮播图二</th>
        <th data-options="field:'pic3',width:160,formatter:pic3Img">轮播图三</th>
        <th data-options="field:'l1',width:90">链接一</th>
        <th data-options="field:'l2',width:90">链接二</th>
        <th data-options="field:'l3',width:90">链接三</th>
        <th data-options="field:'phone',width:70">电话</th>
        <th data-options="field:'ewm',width:90,formatter:ewmimg">二维码</th>
        <th data-options="field:'make',width:100,formatter:operation">操作</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height: auto">
    <shiro:hasPermission name="home:save">
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin');">添加</a>
    </shiro:hasPermission>

</div>

<div id="addWin" style="width:900px;height:550px;" class="easyui-window normal_win" data-options="title:'新增首页信息', closed:true">
    <form id="addForm">
        <table>
            <tr>
                <td style="width:9%;">轮播图一</td>
                <td style="height:7%;">
                    <div class="preview">
                        <img id="img1" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="300" height="90" onclick="$('#previewImg1').click();">
                    </div>
                    <input type="file"  onchange="previewImage1(this)" name="file" style="display: none;" id="previewImg1"><br>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">轮播图二</td>
                <td style="height:7%;">
                    <div class="preview">
                        <img id="img2" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="300" height="90" onclick="$('#previewImg2').click();">
                    </div>
                    <input type="file"  onchange="previewImage2(this)" name="file" style="display: none;" id="previewImg2"><br>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">轮播图三</td>
                <td style="height:7%;">
                    <div class="preview">
                        <img id="img3" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="300" height="90" onclick="$('#previewImg3').click();">
                    </div>
                    <input type="file"  onchange="previewImage3(this)" name="file" style="display: none;" id="previewImg3"><br>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">二维码</td>
                <td style="height:7%;">
                    <div class="preview">
                        <img id="img4" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="300" height="90" onclick="$('#previewImg4').click();">
                    </div>
                    <input type="file"  onchange="previewImage4(this)" name="file" style="display: none;" id="previewImg4"><br>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">链接一</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" style="width:97%;"  data-options="prompt:'请输入轮播图链接',
							required:true,novalidate:true" name="l1"/>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">链接二</td>
                <td>
                    <input class="easyui-textbox " style="width:97%;"  data-options="prompt:'请输入轮播图链接',
							required:true,novalidate:true" name="l2"/>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">链接三</td>
                <td>
                    <input class="easyui-textbox " style="width:97%;"  data-options="prompt:'请输入轮播图链接',
							required:true,novalidate:true" name="l3"/>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">电话</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" style="width:97%;"  data-options="prompt:'请输入联系电话',
							required:true,novalidate:true" name="phone"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <a class="easyui-linkbutton" onclick="savehome('addForm','addWin','list','/home/save');">  确   认 </a>&nbsp;&nbsp;
                </td>
            </tr>
        </table>
    </form>
</div>


<div id="editWin" style="width:900px;height:550px;" class="easyui-window normal_win" data-options="title:'修改首页信息', closed:true">
    <form id="editForm">
        <table>
            <input type="hidden" name="hid"/>
            <tr>
                <td style="width:9%;">轮播图一</td>
                <td style="height:7%;">
                    <div class="preview">
                        <img id="imgs1" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="300" height="90" onclick="$('#previewImgs1').click();">
                    </div>
                    <input type="file"  onchange="previewImages1(this)" name="files" style="display: none;" id="previewImgs1"><br>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">轮播图二</td>
                <td style="height:7%;">
                    <div class="preview">
                        <img id="imgs2" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="300" height="90" onclick="$('#previewImgs2').click();">
                    </div>
                    <input type="file"  onchange="previewImages2(this)" name="files" style="display: none;" id="previewImgs2"><br>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">轮播图三</td>
                <td style="height:7%;">
                    <div class="preview">
                        <img id="imgs3" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="300" height="90" onclick="$('#previewImgs3').click();">
                    </div>
                    <input type="file"  onchange="previewImages3(this)" name="files" style="display: none"  id="previewImgs3"><br>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">二维码</td>
                <td style="height:7%;">
                    <div class="preview">
                        <img id="imgs4" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="300" height="90" onclick="$('#previewImgs4').click();">
                    </div>
                    <input type="file"  onchange="previewImages4(this)" name="files" style="display: none;" id="previewImgs4"><br>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">链接一</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" style="width:97%;"  data-options="prompt:'请输入轮播图链接',
							required:true,novalidate:true" name="l1"/>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">链接二</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" style="width:97%;"  data-options="prompt:'请输入轮播图链接',
							required:true,novalidate:true" name="l2"/>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">链接三</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" style="width:97%;"  data-options="prompt:'请输入轮播图链接',
							required:true,novalidate:true" name="l3"/>
                </td>
            </tr>
            <tr>
                <td style="width:7%;">电话</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" style="width:97%;"  data-options="prompt:'请输入联系电话',
							required:true,novalidate:true" name="phone"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <a class="easyui-linkbutton" onclick="savehome('editForm','editWin','list','/home/update');">  确   认 </a>&nbsp;&nbsp;
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
<%@include file="../master/easyui/footer.jsp" %>
<script>
    $(function() {
        setPagination("list");
    });
    function savehome(formId,winId,listId,url) {
        var param = document.getElementById(formId);
        var formData = new FormData(param);
        $.ajax({
            url : contextPath + url,
            type : "post",
            data :formData,
            processData : false,
            contentType : false,
            success : function(data) {
                if (data.result === 'ok') {
                    closeWin(winId);
                    showInfoAlert(data.message);
                    $("#" + listId).datagrid("reload");
                } else {
                    showInfoAlert("操作失败！");
                }
            },
            error : function(e) {
                showInfoAlert("出错了、请稍后重试！！");
            }
        });
    };
$.ajax({
    url:"",
    type:"",
    data:"",
    success:function (data) {},
    error:function (e) {}
});
    function openEditHomeWin(winId, listId, formId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            $("#" + formId).form("load", row);
            $('#imgs1').attr("src","<%=path%>/static/upload/picimg/"+row.pic1);
            $('#imgs2').attr("src","<%=path%>/static/upload/picimg/"+row.pic2);
            $('#imgs3').attr("src","<%=path%>/static/upload/picimg/"+row.pic3);
            $('#imgs4').attr("src","<%=path%>/static/upload/picimg/"+row.ewm);
            openWin(winId);
        } else {
            showInfoAlert("请选择需要修改的数据");
        }
    };
    //删除
    function removeById(listId,url) {
        var row = $("#" + listId).datagrid("getSelected");
        $.post(url,
            {hid:row.hid},
            function (data) {
                if(data.result == "ok") {
                    showInfoAlert(data.message);
                    $("#" + listId).datagrid("reload");
                }
            },
            'json'
        );
    };
    //操作
    function operation() {
        var str = '<button class="button button1" onclick="return openEditHomeWin('+"'editWin'"+','+"'list'"+','+"'editForm'"+');">修改</button>';
        str += '<button class="button button3" onclick="return removeById('+"'list'"+','+"'/home/remove'"+');">删除</button>';
        return str;
    };

    function pic1Img(value, row, index){
        return "<img  style='width: 150px; height: 70px;' src='<%=path%>/static/upload/picimg/"+row.pic1+"'>";
    };
    function pic2Img(value, row, index){
        return "<img  style='width: 150px; height: 70px;' src='<%=path%>/static/upload/picimg/"+row.pic2+"'>";
    };
    function pic3Img(value, row, index){
        return "<img  style='width: 150px; height: 70px;' src='<%=path%>/static/upload/picimg/"+row.pic3+"'>";
    };
    function ewmimg(value, row, index){
        return "<img  style='width: 150px; height: 70px;' src='<%=path%>/static/upload/picimg/"+row.ewm+"'>";
    };
</script>
</html>