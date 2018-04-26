<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    	String path=request.getContextPath();
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body onload="autologin();">
<script type="text/javascript">
	function autologin()
	{
			window.location.href="<%=path %>/manager/login";	
	}
</script>
</body>
</html>