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
		return true;
	}
	
</script>
<script  type="text/javascript">
	function checkyouhui(){
		var youhui = form1.discount.value;
		if(youhui>1 || youhui<0){
			alert("课程优惠只能是0~1之间的数字");
			form1.discount.value="";
			return false;
		}else{
			return true;
		}
	}

</script>
</head>
<body>
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>发布课程</strong></div>
  <div class="body-content">
	<form method="post" name="form1" class="form-x" action="<%=basePath %>courseservlet?order=add" enctype="multipart/form-data" onsubmit="return check();">
      <div class="form-group">
        <div class="label">
          <label>课程名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="coursename" placeholder="输入课程名称" data-validate="required:请填写课程名称"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>课程封面：</label>
        </div>
        <div class="form-group">
        <div class="field">
          <input type="file" class="input w50" name="fileup"  placeholder="输入上传课程封面" data-validate="required:请填写课程名称">
          <div class="tips">请对课程的封面进行美化</div>
        </div>
      </div>
    <div class="form-group">
        <div class="label">
          <label>课程寄语：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="courseword"   placeholder="输入课程寄语" data-validate="required:请填写课程寄语"/>
          <div class="tips"></div>
        </div>
      </div>  
      <div class="form-group">
        <div class="label">
          <label>课程简介：</label>
        </div>
        <div class="field">
           <textarea type="text" class="input w50" name="courseindex" style="height:150px;" placeholder="输入课程简介" data-validate="required:请填写课程简介"></textarea>
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>课程课时：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="coursetime"   placeholder="输入课程课时" data-validate="required:请填写课程课时"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>课程价格：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="courseprice"   placeholder="输入课程价格" data-validate="required:请填写课程价格"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>课程优惠：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="discount"   placeholder="输入课程优惠" data-validate="required:请填写课程优惠" onblur="return checkyouhui();"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>是否有效：</label>
        </div>
        <div class="field">
          <input type="radio" class="radio" name="isactive" value="1" checked="checked"/>有效<input type="radio" class="radio" name="isactive" value="0"/>无效
        </div>
      </div>
       <div class="form-group">
        <div class="label">
          <label>排列序号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="xuhao"  placeholder="排列序号" data-validate="required:请填写排列序号"/>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>是否免费：</label>
        </div>
        <div class="field">
          <input type="radio" class="radio" name="isfree" value="0"/>免费<input type="radio" class="radio" name="isfree" value="1"/>会员
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 发 布 课 程</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>