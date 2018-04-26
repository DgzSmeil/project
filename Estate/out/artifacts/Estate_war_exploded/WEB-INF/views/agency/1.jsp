<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
     	String basepath=request.getRealPath("/upload");
     	out.print(basepath);
    %>
    <%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<img alt="" src="<%=basepath %>/<s:property value="agency.logo"/>" />
</body>
</html>