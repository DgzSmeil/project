<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>  
    <head>  
        <script type="text/javascript" src="<%=basePath %>/js/jquery-1.4.1.min.js"></script>  
        <script type='text/javascript'>  
            function selectFile(){  
                $("#file").trigger("click");  
            }  
            function getFilePath(){  
                alert($("#file").attr("value"));  
            }  
        </script>  
    </head>  
    <body>  
        <input type="file" id="file" onchange="getFilePath()" style="filter:alpha(opacity=0);opacity:0;width: 0;height: 0;"/>   
        <button onclick="selectFile();">select file</button>  
        <button onclick="getFilePath()">get FilePath</button>  
    </body>  
</html> 