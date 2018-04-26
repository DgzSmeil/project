<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@  taglib prefix="s"  uri="/struts-tags" %>
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
  <link rel="shortcut icon" href="images/favicon.png" type="image/png">

  <title>后台登录</title>

  <link href="<%=path %>/css/style.default.css" rel="stylesheet">
  <script src="<%=path %>/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="<%=path %>/css/sweetalert.css">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="notfound" style="background:white">





<section>
  
    <div class="lockedpanel">
        <div class="locked">
            <h1>房天下后台</h1>
        </div>
		<div id="div1">
			<div class="logged">	
				<small class="text-muted"><span class="btn btn-success-alt" id="btn_code">手机动态登录</span></small>
				<small class="text-muted"><a href="<%=path %>/agency/registered" class="btn btn-info-alt"> 免费入驻 </a></small>
			</div>
			<form method="post" action="<%=path %>/agency/loginInfo" id="form1">
				
				<input type="text" name="agency.email" id="email" placeholder="输入邮箱地址" data-placement="right" title="邮箱地址为登陆账号" class="form-control tooltips"/>
				<br/>
				<input type="password" name="agency.pwd" id="pwd" placeholder="输入你的密码"  data-placement="right" title="输入你的登陆密码" class="form-control tooltips"/>
				<br/>
				<a href="<%=path%>/emp/loginpage"><small>员工登录</small></a>
				<button class="btn btn-success btn-block" onclick=" return checklogin2()" id="btn1">登录</button>
			</form>
		</div>

		<div id="div2" style="display: none;">
			<div class="logged">	
				<small class="text-muted"><span class="btn btn-success-alt" id="btn_email">邮箱登录</span></small>
				<small class="text-muted"><a href="<%=path %>/agency/registered" class="btn btn-info-alt"> 免费入驻 </a></small>
			</div>
			<form method="post" action="<%=path %>/agency/loginphone" onclick=" return clicks();">
				
				<input type="text" maxlength="11" placeholder="输入手机号码" name="agency.phone" id="phone" data-placement="right" title="请输入你的手机号码" class="form-control tooltips"/>
				<div class="row " id="div3">
                        <div class="col-sm-6" style="text-align: center;margin-top:12px; ">
                            <input type="text" id="code" onblur="checkyzm()" name="yzm" class="form-control "  placeholder="输入验证码..."/>
                        </div>
                        <div class="col-sm-6">
                           <input type="button" maxlength="6" value="获取手机验证码" id="vcode" onclick="getPhoneCode()" class="btn btn-default">
                        </div>
                </div>
				<br/>
				<button class="btn btn-success btn-block" id="btn2"  onclick=" return checklogin()" >登录</button>
			</form>
		</div>
    </div><!-- lockedpanel -->
  
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
<script>
	$(function(){
		
		$("#btn_code").bind("click",function(){
			document.getElementById("div1").style.display='none';
			document.getElementById("div2").style.display='block';
		});

		$("#btn_email").bind("click",function(){
			document.getElementById("div1").style.display='block';
			document.getElementById("div2").style.display='none';
		});
	})


</script>
<script >
var path="/Estate";
var mobile_code="";
var InterValObj;
var count=60;
var curcount;
function getPhoneCode(){
	curcount=count;
	var phone = $('#phone').val();
	if(phone.length==11){
		$('#vcode').attr("disabled",true);
		$('#vcode').val(curcount+"秒后重发验证码");
		InterValObj = window.setInterval(setRemainTime, 1000);
		checkPhoneIsExist();
		
	}else if(phone.length != 11){
		swal("手机号码格式错误", "无效的格式", "error");
		return;
	}else if(!myreg.test(phone)){
		 swal("手机号码格式错误", "无效的格式", "error");
		 return;
	}else if(checkPhoneIsExist()){
		 swal("手机号错误", "已被注册", "error");
		 return;
	}else{
		 swal("手机号错误", "无效的输入", "error");
		 return;
	}
}	

 function setRemainTime() {  

	    if (curcount == 0) {  
	        clearInterval(InterValObj);//停止计时器  
	        $("#vcode").removeAttr("disabled");//启用按钮  
	        $("#vcode").val("重新发送验证码");   
	        code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效      
	    }  
	    else {  
	    	  curcount--;  
	    	  $("#vcode").val(curcount + "秒后可重发验证码");  
	    }  
	}  

function checkPhoneIsExist(){
     var phone = $('#phone').val();
     var url = path+"/agency/yzm";
			$.ajax({
	            type: "POST",
	            url: url,
	            data: {
	            	"agency.phone":phone
	            },
	            dataType: "text",
	            success: function(data) {  
	            	if(data!=0){
	            		mobile_code=data;
	            	}
	            },
	            error: function() {
	                alert("错误");             
	            }
	        }); 
   }
   
function checklogin(){
	 var yzm =  $('#code').val()+"";
	 if($('#phone').val().length==0){
		 swal("手机号错误", "无效的输入", "error");
		 return false;
	 }else if($('#phone').val().length!=11){
		 swal("手机号错误", "格式错误", "error");
		 return false;
	 }else if($('#code').val().length==0){
		 swal("验证码错误", "无效的输入", "error");
		 return false;
	 }else if($('#code').val()!=mobile_code){
		 swal("验证码错误", "请输入正确的验证码", "error");
		 return false;
	 }
	 return true;
}
function checklogin2(){
	 if($('#email').val().length==0){
		 swal("邮箱错误", "无效的输入", "error");
		 return false;
	 }else if($('#pwd').val().length==0){
		 swal("密码错误", "无效的输入", "error");
		 return false;
	 }
	 return true;
}
</script>
<s:if test="#request.error!=null">
	<script type="text/javascript">
		swal("登录错误", "${error}", "error");
	</script>
</s:if>
<s:if test="#request.success!=null">
	<script type="text/javascript">
		swal("成功信息", "${success}", "success");
	</script>
</s:if>
</body>
</html>
