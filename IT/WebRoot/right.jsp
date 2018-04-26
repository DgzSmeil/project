<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'right.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Refresh" content="1;url=right.jsp">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body background="img/555.gif">
  <h1 align="center">聊天成员</h1>
  <hr color="blue" size="10px">
  		<br/>
    <%
    	request.setCharacterEncoding("utf-8");
    	int n=0;
    	HashSet list = (HashSet)application.getAttribute("list");
    	if(list!=null){
    		Iterator<Integer> iterator1 = list.iterator();
    		while (iterator1.hasNext()) {
    			for(int i=list.size();i>0;i--){
    				out.println("IP:"+iterator1.next()+"&nbsp;&nbsp;&nbsp;&nbsp;你是第"+i+"个用户登录"+"<br/>");
    			}
    		}
    		
    	}
	    
    %>
  </body>
  
</html>
