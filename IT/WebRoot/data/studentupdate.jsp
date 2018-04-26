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
			if(form1.studentname.value==""){
				alert("学生名称不能为空！");
				form1.studentname.focus();
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
			var studentmobile = form1.studentmobile.value;
			var studentemail = form1.studentemail.value;
			var studentid = form1.studentid.value;
			var studentsex = document.getElementsByName("studentsex");
			var sex="";
			for(var i=0;i<studentsex.length;i++ ){
				if(studentsex[i].checked == true ){
					sex = studentsex[i].value;
				}
			}
    		location.href="<%=basePath%>studentservlet?order=updateinit&provinceid="+provinceid+"&studentname="+studentname+"&studentmobile="+studentmobile+"&studentemail="+studentemail+"&studentsex="+sex+"&studentid="+studentid;
    	}
	</script>
</head>
<body>
	<div class="panel admin-panel margin-top">
	<div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>我的个人资料</strong></div>
		<div class="body-content">
		<form method="post" name="form1" class="form-x" action="<%=basePath %>studentservlet?order=updatesave" onsubmit="return check();">
			<c:if test="${msg!=null}">
				<script type="text/javascript">
					alert("${msg}");
				</script>
			</c:if>
			<c:if test="${requestScope.studentid==null}">
				<input type="hidden" name="studentid" value="${studentbean.studentid}">				
			</c:if>
			<c:if test="${requestScope.studentid!=null}">
				<input type="hidden" name="studentid" value="${requestScope.studentid}">				
			</c:if>
		<div class="form-group">
        <div class="label">
          <label>用户昵称:</label>
        </div>
        <div class="field">
        	<c:if test="${requestScope.studentname==null}">
  				<input type="text" class="input w50" name="studentname" value="${studentbean.studentname}">
  			</c:if>
  			<c:if test="${requestScope.studentname!=null}">
  				<input type="text" class="input w50" name="studentname" value="<%=new String(request.getAttribute("studentname").toString().getBytes("iso-8859-1"),"utf-8") %>">
  			</c:if>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>用 户  Tel:</label>
        </div>
         <div class="field">
        	<c:if test="${requestScope.studentmobile==null}">
  				<input type="text" class="input w50"  name="studentmobile" value="${studentbean.studentmobile}">
  			</c:if>
  			<c:if test="${requestScope.studentmobile!=null}">
  				<input type="text"  class="input w50" name="studentmobile" value="${requestScope.studentmobile}">
  			</c:if>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>用户性别:</label>
        </div>
        <div class="field">
          <div class="button-group radio">
	          <c:if test="${requestScope.studentsex==null}">
				<c:if test="${studentbean.studentsex==0}">
				 	<span class="icon icon-check"></span>  
				 	 <input name="studentsex" value="0" type="radio" checked="checked" style="font-size:20px">男 
					  <input name="studentsex" value="1" type="radio" >女 
				</c:if>
				<c:if test="${studentbean.studentsex!=0}">
				 	<span class="icon icon-check"></span>  
				 	 <input name="studentsex" value="0" type="radio" >男 
					 <input name="studentsex" value="1" type="radio" checked="checked">女 
				</c:if>
			</c:if>
         	<c:if test="${requestScope.studentsex!=null}">
				<c:if test="${studentbean.studentsex==0}">
				 	<span class="icon icon-check"></span>  
				 	 <input name="studentsex" value="0" type="radio" checked="checked">男 
					  <input name="studentsex" value="1" type="radio" >女 
				</c:if>
				<c:if test="${studentbean.studentsex!=0}">
				 	<span class="icon icon-check"></span>  
				 	 <input name="studentsex" value="0" type="radio" >男 
					 <input name="studentsex" value="1" type="radio" checked="checked">女 
				</c:if>
			</c:if>       
                        
           </div>       
        </div>
     </div>
		<div class="form-group">
			<div class="label">
			  <label>用户邮箱:</label>
			</div>
        <div class="field">
			<c:if test="${requestScope.studentemail==null}">
				<input type="text" class="input" name="studentemail" style="width:260px;height=35px;border-bottom-style: solid;" value="${studentbean.studentemail}">
		    </c:if>
		 	<c:if test="${requestScope.studentemail!=null}">
		  		<input type="text" class="input"  name="studentemail" style="width:260px;height=35px;border-bottom-style: solid;" value="<%=new String(request.getAttribute("studentemail").toString().getBytes("iso-8859-1"),"utf-8") %>">
			</c:if>
        </div>
      </div>
     <div class="form-group">
        <div class="label">
          <label>省份城市：</label>
        </div>
        <div class="field">
          <select name="province" class="input w50" onchange="checkcity(this.value);">
            <option value="">请选择省份</option>
            <c:if test="${requestScope.studentsex !=null}">
            	<c:forEach  items="${provincelist}" var="p">
	          		<c:if test="${p.provinceid == provinceid}">
	           	 		<option value="${p.provinceid}" selected="selected">${p.provinceName}</option>
	          		</c:if>
	          		<c:if test="${p.provinceid != provinceid}">
	           	 		<option value="${p.provinceid}">${p.provinceName}</option>
	          		</c:if>
	        	</c:forEach>
            </c:if>
            <c:if test="${requestScope.studentsex ==null}">
            	<c:forEach  items="${provincelist}" var="p">
	          		<c:if test="${p.provinceid == studentbean.provinceid}">
	           	 		<option value="${p.provinceid}" selected="selected">${p.provinceName}</option>
	          		</c:if>
	          		<c:if test="${p.provinceid != provinceid}">
	           	 		<option value="${p.provinceid}">${p.provinceName}</option>
	          		</c:if>
	        	</c:forEach>
            </c:if>
          </select>
          <div>
          	<select name="cityid" class="input w50">
            	<option value="">请选择城市</option>
            	<c:if test="${requestScope.studentsex!=null}">
            		<c:forEach items="${citylist}" var="c">
						<option value="${c.cityid}">${c.cityname}</option>
					</c:forEach>
            	</c:if>
            	<c:if test="${requestScope.studentsex==null}">
            		<c:forEach  items="${citylist}" var="p">
		          		<c:if test="${p.cityid == studentbean.cityid}">
		           	 		<option value="${p.cityid}" selected="selected">${p.cityname}</option>
		          		</c:if>
		          		<c:if test="${p.cityid == studentbean.cityid}">
		           	 		<option value="${p.cityid}">${p.cityname}</option>
		          		</c:if>
	        		</c:forEach>
              </c:if>
          </select>
          </div>
          <div class="tips">选择省份城市</div>
        </div>
      </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit">修改资料</button>
        </div>
      </div>
</div>
<script type="text/javascript">
function del(id,mid){
	if(confirm("您确定要删除吗?")){			
		
	}
}
</script>
</body>
</html>