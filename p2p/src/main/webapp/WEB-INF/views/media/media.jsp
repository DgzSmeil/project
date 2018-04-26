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
	<!-- 配置文件 -->
	<script type="text/javascript" src="<%=path %>/static/ueditor/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="<%=path %>/static/ueditor/ueditor.all.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=path %>/static/ueditor/themes/default/css"/>
</head>
<body>
<table id="list" style="width: 100%; height: 600px;" class="easyui-datagrid"
	   data-options="
			toolbar:'#tb',
			rownumbers:true,
			border:false,
			singleSelect:true,
			pagination:true,
			pageSize:10,
			url:'<%=path %>/media/select',
			method:'post'">
	<thead>
	<tr>
		<th data-options="field:'mid',width:80,checkbox:true">编号</th>
		<th data-options="field:'pic',width:100,formatter:picImg">封面图片</th>
		<th data-options="field:'title',width:230">标题</th>
		<th data-options="field:'content',width:230,formatter:streplace">内容</th>
		<th data-options="field:'date',width:150,formatter:formatDate">时间</th>
		<th data-options="field:'url',width:180">报道的URL地址</th>
		<th data-options="field:'make',width:100,formatter:operation">操作</th>
	</tr>
	</thead>
</table>

<div id="tb" style="height: auto">
	<shiro:hasPermission name="media:save">
		<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" onclick="openWin('addWin')">添加</a>
	</shiro:hasPermission>
	<div>
		<form id="searchForm">
			<input class="easyui-textbox" name="title"
				   data-options="prompt:'请输入要查找的标题',required:false,novalidate:true,showSeconds:true"/>
			<input class="easyui-datetimebox" name="starttime"
				   data-options="prompt:'请选择最大创建时间',required:false,novalidate:true,showSeconds:true"/>
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
			<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
		</form>
	</div>
</div>

<div id="addWin" class="easyui-window" style="width:900px;height:550px;" title="添加媒体信息" data-options=" closed:true">
	<form id="addForm" enctype="multipart/form-data" method="post">
		<table>
			<tr>
				<td style="width:10%;">标题</td>
				<td>
					<input class="easyui-textbox" style="width:97%;"   data-options="prompt:'请输入内容',
							required:true" name="title"/>
				</td>
			</tr>
			<tr>
				<td style="width:10%;">封面图片</td>
				<td style="height:7%;">
					<div class="preview">
						<img id="imghead" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="120" height="90" onclick="$('#previewImg').click();">
					</div>
					<input type="file"  onchange="previewImage(this)" name="file" style="display: none;" id="previewImg"><br>
				</td>
			</tr>
			<tr>
				<td style="width:10%;">原文地址</td>
				<td>
					<input class="easyui-textbox" style="width:97%;"  data-options="prompt:'请输入原文地址',
						required:true
						" name="url"/>
				</td>
			</tr>
			<tr>
				<td style="width:10%;">内容</td>
				<td>
					<div>
						<textarea id="addEditor" type="text/plain" style="width:97%; height:300px;"name="content"></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a class="easyui-linkbutton" onclick="savemedia('addForm','addWin','list','/media/save');">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="editWin" class="easyui-window" style="width:900px;height:550px;" title="修改媒体信息" data-options=" closed:true ">
	<form id="editForm" enctype="multipart/form-data" method="post">
		<table>
			<input type="hidden" name="mid" />
			<tr>
				<td style="width:10%;">标题</td>
				<td>
					<input class="easyui-textbox easyui-validatebox" style="width:97%;"   data-options="prompt:'请输入内容',
							required:true,
						novalidate:true" name="title"/>
				</td>
			</tr>
			<tr>
				<td style="width:10%;">封面图片</td>
				<td style="height:7%;">
					<div class="preview">
						<img id="imgheads" name="fpic" border="0" src="http://www.jq22.com/img/cs/500x300.png" width="120" height="90" onclick="$('#previewImgs').click();">
					</div>
					<input type="file"  onchange="previewImages(this)" name="file1" style="display: none;" id="previewImgs"><br>
				</td>
			</tr>
			<tr>
				<td style="width:10%;">原文地址</td>
				<td>
					<input class="easyui-textbox easyui-validatebox" style="width:97%;"  data-options="prompt:'请输入原文地址',
						required:true,
						novalidate:true" name="url"/>
				</td>
			</tr>
			<tr>
				<td style="width:10%;">内容</td>
				<td>
					<div>
						<textarea id="editor" type="text/plain" style="width:97%; height:300px;"name="content"></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a class="easyui-linkbutton" onclick="savemedia('editForm','editWin','list','/media/update');">确认</a>
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="inforWin" class="easyui-window" style="width:900px;height:550px;" title="查看媒体信息" data-options=" closed:true">
	<form id="inforFrom">
		<input type="hidden" name="mid" />
		<table>
			<tr>
				<td style="width:10%;">标题</td>
				<td>
					<input class="easyui-textbox easyui-validatebox" style="width:97%;" readonly= "true"name="title"/>
				</td>
			</tr>
			<tr>
				<td style="width:10%;">封面图片</td>
				<td style="height:7%;">
					<img style="width: 100px;height: 90px" src="" id="pic">
				</td>
			</tr>
			<tr>
				<td style="width:10%;">原文地址</td>
				<td>
					<input style="width:97%;"class="easyui-textbox easyui-validatebox" readonly= "true" name="url"/>
				</td>
			</tr>
			<tr>
				<td style="width:10%;">内容</td>
				<td>
					<div>
						<textarea id="content-pane" type="text/plain" style="width:97%; height:300px;"name="content"></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<a class="easyui-linkbutton" onclick="closeWin('inforWin');">关闭窗口</a>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
<%@include file="../master/easyui/footer.jsp" %>
<script type="text/javascript">
    var ue = UE.getEditor('addEditor');
</script>
<script>
    $(function() {
        setPagination("list");
    });
    function savemedia(formId,winId,listId,url) {
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
                    $('#'+formId).form('clear');
                    closeWin(winId);
                    showInfoAlert(data.message);
                    $("#" + listId).datagrid("reload");
                } else {
                    showInfoAlert("添加失败！");
                }
            },
            error : function(e) {
                showInfoAlert("出错了、请稍后重试！！");
            }
        });
    };
    //打开修改窗口
    function openEditWin(winId, listId, formId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            $("#" + formId).form("load", row);
            var ue = UE.getEditor('editor');
            ue.setContent("");//清空ueditor内容
            ue.setContent(row.content);//赋值
            $('#imgheads').attr("src","<%=path%>/static/upload/picimg/"+row.pic);
            openWin(winId);
        } else {
            showInfoAlert("请选择需要修改的数据");
        }
    };
    //查看详细信息
    function getInformation(winId,list,formId){
        var row = $("#"+list).datagrid("getSelected");
        if (row){
            $("#" + formId).form("load", row);
            var ue = UE.getEditor('content-pane',{readonly:true,});
            ue.setContent("");
            ue.setContent(row.content);
            $('#pic').attr("src","<%=path%>/static/upload/picimg/"+row.pic);
            $("#"+winId).window("refresh");
            openWin(winId);
        }else{
            showInfoAlert("请选择要查看的数据！")
        }
    };
    //操作
    function operation() {
        var str = '<button class="button button1" onclick="return openEditWin('+"'editWin'"+','+"'list'"+','+"'editForm'"+');">修改</button>';
        str += '<button class="button button3" onclick="return getInformation('+"'inforWin'"+','+"'list'"+','+"'inforFrom'"+');">查看</button>';
        return str;
    };
    //图片展示
    function picImg(value, row, index){
        return "<img  style='width: 100px; height: 70px;' src='<%=path%>/static/upload/picimg/"+row.pic+"'>";
    };
    //内容裁剪
    function streplace(value,row,index) {
        var str = row.content;
        var oStr = str.replace(/<[^>]+>|\n+\s&nbsp;/g, "");
        if (oStr.length > 60) {
            return oStr.substring(0, 60) + '...';
        } else {
            return oStr;
        }
    };
</script>


</html>