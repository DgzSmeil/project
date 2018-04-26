<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <title>完整demo</title>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
<div>
		<textarea id="editor" type="text/plain" style="width:1024px;height:500px;"></textarea>
</div>
<script type="text/javascript">
    var ue = UE.getEditor('editor');
</script>
</body>
</html>