<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="<%=path %>/images/favicon.png" type="image/png">

  <title>404!</title>

  <link href="<%=path %>/css/style.default.css" rel="stylesheet">
</head>

<body class="notfound">
<section>
  
  <div class="notfoundpanel">
    <h1>404!</h1>
    <h3>你正在寻找的页面还没有找到！</h3>
    <h4>您正在寻找的页面可能已经被删除，它的名称已经更改，或者不可用。也许你可以试一试:</h4>
    <form action="search-results.html">
        <input type="text" class="form-control" placeholder="搜索页面" /> <button class="btn btn-success">搜寻</button>
    </form>
  </div><!-- notfoundpanel -->
  
</section>


<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/modernizr.min.js"></script>
<script src="<%=path %>/js/jquery.sparkline.min.js"></script>
<script src="<%=path %>/js/jquery.cookies.js"></script>

<script src="<%=path %>/js/toggles.min.js"></script>
<script src="<%=path %>/js/retina.min.js"></script>

<script src="<%=path %>/js/custom.js"></script>
<div style="text-align:center;">
<p><a href="javascript:void(0);" id="btn_back">返回</a></p>
</div>
<script>
    jQuery(document).ready(function(){
        "use strict";
        
        // Do not use the code below
        // For demo purposes only
        var c = jQuery.cookie('change-skin');
        if (c && c == 'katniss') {
            jQuery('.btn-success').addClass('btn-primary').removeClass('btn-success');
        }
        $("#btn_back").click(function(){
			window.history.back(-1);
		})
    });
</script>

</body>
</html>
