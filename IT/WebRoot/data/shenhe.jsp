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
<script type="text/javascript">
	function check(){
		var filename = form1.fileup.value;
		var port = filename.indexOf(".")+1;
		if(port>0){
			filename = filename.substring(port);
			if(filename!="jpg" && filename!="JPG" && filename!="png" && filename!="PNG"){
				alert("文件上传只支持jsp,png格式");
				return false;
			}
		}
		filename = form1.fileup1.value;
		port = fiename.indexOf(".")+1;
		if(port>0){
			filename = filename.substring(port);
			if(filename!="jpg" && filename!="JPG" && filename!="png" && filename!="PNG"){
				alert("文件上传只支持jsp,png格式");
				return false;
			}
		}
		return true;
	}
</script>
</head>
<body>
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>讲师申请资料的填写</strong></div>
  <div class="body-content">
	<form method="post" class="form-x" action="<%=basePath %>studentservlet?order=checkteachersave"  onsubmit="return check();">
      <input type="hidden" name="teacherid" value="${teacherbean.teacherid}">
      <input type="hidden" name="studentid" value="${studentbean.studentmobile}">
      <div class="form-group">
        <div class="label">
          <label>审核操作：</label>
        </div>
        <div class="field">
          <select name="status" class="input w50">
            <option value="0">请选择审核操作</option>
	            <option value="0">未审核</option>
	            <option value="1">审核通过</option>
	            <option value="2">审核驳回</option>
	            <option value="3">封号</option>
          </select>
          <div class="tips">不选择默认未审核</div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>真实姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teachername" value="${teacherbean.teachername}" placeholder="输入真实姓名" data-validate="required:请填写真实姓名"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>讲师头像：</label>
        </div>
        <div class="field">
          <img src="${teacherbean.teacherpictureurl}" width="50px" height="50px"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>电子邮件：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacheremail" value="${teacherbean.teacheremail}"  placeholder="输入电子邮件" data-validate="required:请填写电子邮件"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>培训经历：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacherjianjie" value="${teacherbean.teacherjianjie}"  placeholder="输入培训经历" data-validate="required:请填写培训经历"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>擅长技术：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacherspecial" value="${teacherbean.teacherspecial}"  placeholder="输入擅长技术" data-validate="required:请填写擅长技术"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>讲师教龄：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacherjiaolin" value="${teacherbean.teacherjiaolin}"  placeholder="输入讲师教龄" data-validate="required:请填写讲师教龄"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>讲师学历：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacheredution" value="${teacherbean.teachereducation}"   placeholder="输入讲师学历" data-validate="required:请填写讲师学历"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>银行名称：</label>
        </div>
        <div class="field">
          <select name="bankid" class="input w50">
            <option value="">请选择银行名称</option>
            <c:forEach items="${banklist}" var="b">
            	<c:if test="${teacher.teacherbankid == b.bank_id}">
            		<option value="${b.bank_id}" selected="selected">${b.bank_name}</option>
            	</c:if>
            	<c:if test="${teacher.teacherbankid != b.bank_id}">
            		<option value="${b.bank_id}">${b.bank_name}</option>
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
          <input type="text" class="input w50" name="teacherbanknumber" value="${teacherbean.teacherbanknumber}"    placeholder="输入银行账户" data-validate="required:请填写银行账户"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>申请等级：</label>
        </div>
        <div class="field">
          <select name="greadid" class="input w50">
            <option value="">请选择你申请的等级</option>
            <c:forEach items="${greadlist}" var="g">
            	<c:if test="${teacher.teachergradeid == b.greadid}">
            		<option value="${g.greadid}" selected="selected">${g.greadname}</option>
            	</c:if>
            	<c:if test="${teacher.teachergradeid != b.greadid}">
            		<option value="${g.greadid}" >${g.greadname}</option>
            	</c:if>
            </c:forEach>
          </select>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>详细地址：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacheraddress"  value="${teacherbean.teacheraddress}"   placeholder="输入详细地址" data-validate="required:请填写详细地址"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>备注原因：</label>
        </div>
        <div class="field">
          <textarea type="text" class="input w50" name="reason" style="height:150px;" ></textarea>
        </div>
	  </div>
	  <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 审 核 通 过 </button> <button class="button bg-main icon-check-square-o" type="submit"> 审 核 驳 回  </button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>