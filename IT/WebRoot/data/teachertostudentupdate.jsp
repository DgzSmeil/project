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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>讲师申请进度</strong></div>
  <div class="body-content">
	<form method="post" class="form-x" action="<%=basePath %>studentservlet?order=shenqing">
     <c:if test="${msg!=null}">
     	<script type="text/javascript">
     		alert("${msg}");
     	</script>
     </c:if>
      <input type="hidden" name="teacherid" value="${teacherbean.teacherid}">
      <input type="hidden" name="name" value="${requestScope.teachername}">
      <input type="hidden" name="status" value="${teacherbean.status}">
      <div class="form-group">
        <div class="label">
          <label>审核进度：</label>
        </div>
        <div class="field">
          <c:if test="${teacherbean.status==0}">
          	<label>未审核。。。。</label>
          </c:if>
          <c:if test="${teacherbean.status==1}">
          	<label>已审核。。。。</label>
          </c:if>
          <c:if test="${teacherbean.status==2}">
          	<label>对不起！审核未通过。。。。</label>
          </c:if>
          <c:if test="${teacherbean.status==3}">
          	<label>正在以洪荒之力审核中，请等待。。。。</label>
          </c:if>
          <div class="tips"></div>
        </div>
      </div>
      <c:if test="${teacherbean.status==2}">
          	<div class="form-group">
		        <div class="label">
		          <label>未通过原因：</label>
		        </div>
		        <div class="field">
		          <textarea type="text" class="input w50" name="reason" style="height:150px;" >${teacherbean.reason}</textarea>
		        </div>
	      </div>
       </c:if>
       <c:if test="${teacherbean.status==1}">
          	<div class="form-group">
		        <div class="label">
		          <label>通过消息：</label>
		        </div>
		        <div class="field">
		           <label>你已成为讲师！下次登录即可升级为讲师：</label>
		        </div>
	      </div>
       </c:if>
      <div class="form-group">
        <div class="label">
          <label>教师昵称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teachername" value="${teacherbean.teachername}" placeholder="输入讲师名称" data-validate="required:请填写讲师名称"/>
          <div class="tips"></div>
        </div>
      </div>
    <div class="form-group">
        <div class="label">
          <label>教 师 Tel：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teachermobile" value="${teacherbean.teachermobile}"  placeholder="输入教师Tel" data-validate="required:请填写教师Tel"/>
          <div class="tips"></div>
        </div>
      </div>  
      <div class="form-group">
        <div class="label">
          <label>教师性别:</label>
        </div>
        <div class="field">
      		<c:if test="${teacherbean.teachersex==0}">
				 <input type="radio"  name="teachersex" value="0"  placeholder="输入教师性别" checked="checked"/>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="teachersex" value="1"  placeholder="输入教师性别" />女
			</c:if>
			<c:if test="${teacherbean.teachersex!=0}">
				 <input type="radio"  name="teachersex" value="0"  placeholder="输入教师性别" />男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="teachersex" value="1"  placeholder="输入教师性别" checked="checked"/>女
			</c:if>
         
          <div class="tips"></div>
        </div>
      </div> 
            <div class="form-group">
        <div class="label">
          <label>教师邮箱：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacheremail" value="${teacherbean.teacheremail}"  placeholder="输入教师邮箱" data-validate="required:请填写教师邮箱"/>
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>教师简介：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacherjianjie" value="${teacherbean.teacherjianjie}"  placeholder="输入教师简介" data-validate="required:请填写教师简介"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>教师学历：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacheredution"  value="${teacherbean.teachereducation}"  placeholder="输入教师学历" data-validate="required:请填写教师学历"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>教师教龄：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacherjiaolin" value="${teacherbean.teacherjiaolin}"  placeholder="输入教师教龄" data-validate="required:请填写教师教龄"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>教师专长：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacherspecial" value="${teacherbean.teacherspecial}"  placeholder="输入教师专长" data-validate="required:请填写教师专长"/>
          <div class="tips"></div>
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>教师等级：</label>
        </div>
        <div class="field">
          <select name="greadid" class="input w50">
            <option value="">请选择教师等级</option>
            <c:forEach items="${greadlist}" var="g">
				<c:if test="${g.greadid == teacherbean.gradeid}">
					<option value="${g.greadid}" style="width:260px;height=35px;border-bottom-style: solid;" selected="selected">${g.greadname}</option>
				</c:if>
				<c:if test="${g.greadid != teacherbean.gradeid}">
					<option value="${g.greadid}" style="width:260px;height=35px;border-bottom-style: solid;">${g.greadname}</option>
				</c:if>
			</c:forEach>
          </select>
        </div>
        </div>
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
          <label>教师地址：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="teacheraddress"  value="${teacherbean.teacheraddress}"  placeholder="输入教师地址" data-validate="required:请填写教师地址"/>
          <div class="tips"></div>
        </div>
      </div> 
      <c:if test="${teacherbean.status!=1}">
	      	<div class="form-group">
	        <div class="label">
	          <label></label>
	        </div>
	        <div class="field">
	          <button class="button bg-main icon-check-square-o" type="submit"> 继 续 申 请 </button>
	        </div>
	      </div>
      </c:if>
    </form>
  </div>
</div>
</body>
</html>