<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>讲师银行账户修改</strong></div>
  <div class="body-content">
	<form method="post" class="form-x" action="<%=basePath %>teacherservlet?order=updatabanksave">
     <c:if test="${msg!=null}">
     	<script type="text/javascript">
     		alert("${msg}");
     	</script>
     </c:if>
      <input type="hidden" name="teacherid" value="${teacherbean.teacherid}">
      <input type="hidden" name="name" value="${requestScope.teachername}">
        <div class="form-group">
        <div class="label">
          <label>银行名称：</label>
        </div>
        <div class="field">
          <select name="bankid" class="input w50" >
            <option value="">请选择银行名称</option>
            <c:forEach items="${banklist}" var="b">
				<c:if test="${b.bank_id == teacherbean.bankid}">
					<option value="${b.bank_id}" style="width:260px;height=35px;border-bottom-style: solid;" selected="selected">${b.bank_name}</option>
				</c:if>
				<c:if test="${b.bank_id != teacherbean.bankid}">
					<option value="${b.bank_id}" style="width:260px;height=35px;border-bottom-style: solid;">${b.bank_name}</option>
				</c:if>
			</c:forEach>
          </select>
        </div>
        </div>
        <div class="form-group">
        <div class="label">
          <label>银行账户：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacherbanknumber" value="${teacherbean.teacherbanknumber}"  placeholder="输入银行账户" data-validate="required:请填写银行账户"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>银行户主：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacherbankname" value="${teacherbean.teacherbankname}"  placeholder="输入银行户主" data-validate="required:请填写银行户主"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 保存修改 </button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>