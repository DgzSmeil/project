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
<script type="text/javascript">
		function check(){
			if(form1.studentname.value==""){
				alert("学生名称不能为空！");
				form1.studentname.focus();
				return false;
			}
			if(form1.studentpassword.value==""){
				alert("学生密码不能为空！");
				form1.studentpassword.focus();
				return false;
			}
			if(form1.studentpassword1.value==""){
				alert("确认密码不能为空！");
				form1.studentpassword1.focus();
				return false;
			}
			if(form1.studentpassword.value!=form1.studentpassword1.value){
				alert("学生密码和确认密码不一致！");
				return false;
			}
			if(form1.studentmobile.value==""){
				alert("学生Tel不能为空！");
				form1.studentmobile.focus();
				return false;
			}
			if(isNaN(form1.studentmobile.value) || form1.studentmobile.value.length>11 || form1.studentmobile.value.length<0){
				alert("学生Tel只能为11位的数字！");
				form1.studentname.focus();
				return false;
			}
			if(form1.studentemail.value==""){
				alert("学生邮箱不能为空！");
				form1.studentemail.focus();
				return false;
			}
			return true;
		}
		function checkcity(provinceid){
			var studentname = form1.studentname.value;
			var studentpassword = form1.studentpassword.value;
			var studentpassword1 = form1.studentpassword1.value;
			var studentmobile = form1.studentmobile.value;
			var studenthomeaddress = form1.studenthomeaddress.value;
			var studentemail = form1.studentemail.value;
			var studentsex = document.getElementsByName("studentsex");
			var sex="";
			for(var i=0;i<studentsex.length;i++ ){
				if(studentsex[i].checked == true ){
					sex = studentsex[i].value;
				}
			}
    		location.href="<%=basePath%>studentservlet?order=add&provinceid="+provinceid+"&studentname="+studentname+"&studentpassword="+studentpassword+"&studentpassword1="+studentpassword1+"&studentmobile="+studentmobile+"&studentemail="+studentemail+"&studentsex="+sex+"&studenthomeaddress="+studenthomeaddress;
    	}
	</script>
</head>
<body>
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>讲师申请资料的填写</strong></div>
  <div class="body-content">
	<form method="post" class="form-x" action="<%=basePath %>studentservlet?order=addsave"  enctype="multipart/form-data" onsubmit="return check();">
      <input type="hidden" name="studentname" value="${param.studentname}">
      <input type="hidden" name="cishu" value="<%=request.getParameter("cishu") %>">
      <input type="hidden" name="status" value="5">
      <div class="form-group">
        <div class="label">
          <label>用户姓名：</label>
        </div>
        <div class="field">
	        <c:if test="${requestScope.studentname==null}">
  				<input type="text" class="input w50" name="studentname" value="${requestScope.studentname}" data-validate="required:请填写真实姓名"/>
  			</c:if>
  			<c:if test="${requestScope.studentname!=null}">
  				<input type="text" class="input w50" name="studentname" value="${requestScope.studentname}" data-validate="required:请填写真实姓名"/>
  				<td width="120">学生昵称:</td><td><input type="text" name="studentname" style="width:260px;height=35px" value="<%=new String(request.getAttribute("studentname").toString().getBytes("iso-8859-1"),"utf-8") %>"></td>
  			</c:if>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>电子邮件：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacheremail"   placeholder="输入电子邮件" data-validate="required:请填写电子邮件"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>培训经历：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacherjianjie"   placeholder="输入培训经历" data-validate="required:请填写培训经历"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>擅长技术：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacherspecial"   placeholder="输入擅长技术" data-validate="required:请填写擅长技术"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>讲师教龄：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacherjiaolin"   placeholder="输入讲师教龄" data-validate="required:请填写讲师教龄"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>讲师学历：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacheredution"   placeholder="输入讲师学历" data-validate="required:请填写讲师学历"/>
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
            	<option value="${b.bank_id}">${b.bank_name}</option>
            </c:forEach>
          </select>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>银行账户：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacherbanknumber"   placeholder="输入银行账户" data-validate="required:请填写银行账户"/>
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
            	<option value="${g.greadid}">${g.greadname}</option>
            </c:forEach>
          </select>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>详细地址：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacheraddress"   placeholder="输入详细地址" data-validate="required:请填写详细地址"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 申请为讲师</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>