<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title></title>
</head>
<body>

加载中，请稍后...

<div id="bizQQ_WPA" style="display: none;"></div>
<script charset="utf-8" src="<%=basePath %>js/wpa.php"></script>
<script type="text/javascript">
BizQQWPA.addCustom({aty: '0',a: '1001',
nameAccount: '4008519651',
selector: 'bizQQ_WPA'});
BizQQWPA.visitor({nameAccount: '4008519651'});

window.onload = function(){
  setTimeout(function(){
    console.log(1)
    document.getElementById('bizQQ_WPA').click()
    // setTimeout(function(){
    //   window.close()
    // },3000)
    
  },500)
  
}

</script>

</body>
</html>