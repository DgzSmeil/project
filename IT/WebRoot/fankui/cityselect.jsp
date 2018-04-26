<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="SQLBean.Citybean"%>
<%@page import="SQLBean.PagingBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<body>
<%
	int counter = 10;
%>
<c:if test="${counter==null}">
<c:set var="isOdd" value="true"></c:set>
</c:if>
<c:choose>
<c:when test="${isOdd==true}">it’s an odd </c:when>
<c:otherwise>it’s an even </c:otherwise>
</c:choose>
</body>
</html>
