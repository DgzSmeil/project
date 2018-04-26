<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
    
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
  <link href="<%=path %>/css/sweetalert.css" rel="stylesheet">
  <script type="text/javascript" src="<%=path %>/js/sweetalert-dev.js"></script>
  <title>用户注册</title>

  <link href="<%=path %>/css/style.default.css" rel="stylesheet">
  <link href="<%=path %>/css/bootstrapValidator.min.css" rel="stylesheet">
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="signin" style=" background-color:white">

<section>
  
    <div class="signuppanel">
        
        <div class="row">
            
            <div class="col-md-6">
                
                <div class="signup-info">
                    <div class="logopanel">
                        <h1><span>[</span> <font size="7">房天下</font> <span>]</span></h1>
                    </div><!-- logopanel -->
                
                    <div class="mb20"></div>
                
                   <p class="">已有账号? <a href="<%=path %>/user/loginPage"><strong class="btn  btn-primary btn-sm">直接登录</strong></a></p>
                    <div class="mb20"></div>
                    
                    <div class="feat-list">
                        <h3 class="text-success">你还可以通过以下方法直接登录</h3>
						<br/>
						<i class="fa fa-weibo"></i>&nbsp;
                        <a href="javascript:void(0);"><font size="5">微博登录</font></a>
                    </div>
                    
                    <div class="feat-list">
                        <i class="fa fa-paw"></i>&nbsp;
                        <a href="javascript:void(0);"><font size="5">百度登录</font></a>
                    </div>
                    
                    <div class="feat-list mb20">
                        <i class="fa fa-qq"></i> &nbsp;
                        <a href="javascript:void(0);"><font size="5">QQ登录</font></a>
                    </div>

					 <div class="feat-list mb20">
                        <i class="fa fa-weixin"></i> &nbsp;
                        <a href="javascript:void(0);"><font size="5">微信登录</font></a>
                    </div>
                    
                    <h4 class="mb20"><a href="javascript:void(0);">其它更多...</a></h4>
                
					 <div class="feat-list">
                        <h3 class="text-warning">如果你是经销商,请点击这里注册</h3>
						<br/>
						<a class="btn btn-primary" href="<%=path%>/agency/registered">经销商注册</a>
						<a class="btn btn-success" href="<%=path%>/agency/login">经销商登录</a>
						<a class="btn btn-success" href="<%=path%>/emp/loginpage">员工登录</a>
                    </div>
					<br/>

                </div><!-- signup-info -->
            
            </div><!-- col-sm-6 -->
            
            <div class="col-md-6">
                
               
				<form method="post" id="form1" action="<%=path %>/user/registered">
                    
                    <h3 class="nomargin">用户注册</h3>
                    <br/>
                
                    <div class="mb10" id="div1">
                        <label class="control-label">用户名</label>
                        <input type="text" name="user.nickname" id="name" class="form-control"  placeholder="输入您的姓名..."/>
                    </div>
					<div class="mb10 tips">
                    </div>
                    
                    <div class="mb10" id="div2">
                        <label class="control-label">密&nbsp;&nbsp;码</label>
                        <input type="password" name="user.pwd"  class="form-control" id="pwd"   placeholder="输入您的密码..."/>
                    </div>
                    <div class="mb10 tips">
                    </div>
                    
                    <div class="mb10" id="div3">
                        <label class="control-label">确认密码</label>
                        <input type="password" name="pwd2" class="form-control" onblur=" mdjia();" id="pwd2" placeholder="输入您的确认密码..."/>
                    </div>
                    <div class="mb10 tips">
                    </div>
                    
                    <div class="mb10" id="div4">
                        <label class="control-label"> 手机号码</label>
                        <input type="text" id="phone" maxlength="11" name="user.phone"  class="form-control" id="phone" placeholder="输入您的手机号码..."/>
                    </div>
                    <div class="mb10 tips">
                    </div>
                   
                   <div class="mb10" id="div5">
                        <label class="control-label"> 邮箱</label>
                        <input type="email" name="user.email" class="form-control" id="email"  placeholder="输入您的邮箱地址..."/>
                    </div>
                    <div class="mb10 tips">
                    </div>
                    
                    <div class="mb10" id="div6">
					 <label class="control-label">手机验证码</label>
                    <div class="row mb10">
                        <div class="col-sm-6">
                            <input type="text" onblur="checkyzm()" name="code" id="code"  class="form-control"  placeholder="输入您的手机验证码..."/>
                        </div>

                        <div class="col-sm-6">
                        	<input type="button" style="margin-left:0.6em" value="获取手机验证码" id="vcode" onclick="getPhoneCode();" class="btn btn-default"/>
                        </div>
                        
						 <div class="mb10 tips">
						 </div>
                    </div>
                    </div>


					 <div class="mb10" id="div7">
                        <input type="checkbox" id="xieyi">
						我同意
						<a href="javascript:void(0);">《房天下服务协议》</a>
                    </div>
                    <div class="mb10 tips">
                    </div>
                    <br />
                    
                    <button type="submit" onclick=" return checkregistered()" id="submit_btn" class="btn btn-success btn-block">注册</button>     
                </form>
            </div><!-- col-sm-6 -->
            
        </div><!-- row -->
        
        <br/>
		 <br/>
		  <br/>
        
    </div><!-- signuppanel -->
  
</section>


<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/modernizr.min.js"></script>
<script src="<%=path %>/js/jquery.sparkline.min.js"></script>
<script src="<%=path %>/js/jquery.cookies.js"></script>

<script src="<%=path %>/js/toggles.min.js"></script>
<script src="<%=path %>/js/retina.min.js"></script>

<script src="<%=path %>/js/select2.min.js"></script>

<script src="<%=path %>/js/custom.js"></script>
<!-- 验证 -->
<script src="<%=path %>/js/user_registered.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=path %>/js/jquery.md5.js" type="text/javascript"></script>
<script type="text/javascript">

$(function(){
	$("submit_btn").bind("click",function(){
	});
})
function mdjia(){
	if($("#pwd").val()!=""){
		var pwd = $("#pwd").val();
		var password = $.md5(pwd);
		$("#pwd").val(password);
	}
	if($("#pwd2").val()!=""){
		var pwd2 = $("#pwd2").val();
		var password2 = $.md5(pwd2);
		$("#pwd2").val(password2);
	}
	
}

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
		$('#phone').focus();
		swal("请输入正确的手机号码", "无效的格式", "error");
		return;
	}else if($('#phone').val().substr(0,3)!=138&&$('#phone').val().substr(0,3)!=130&&$('#phone').val().substr(0,3)!=131
			&&$('#phone').val().substr(0,3)!=132&&$('#phone').val().substr(0,3)!=155
			&&$('#phone').val().substr(0,3)!=156&&$('#phone').val().substr(0,3)!=185&&$('#phone').val().substr(0,3)!=186
			&&$('#phone').val().substr(0,3)!=134&&$('#phone').val().substr(0,3)!=135&&$('#phone').val().substr(0,3)!=136
			&&$('#phone').val().substr(0,3)!=137&&$('#phone').val().substr(0,3)!=139
			&&$('#phone').val().substr(0,3)!=147&&$('#phone').val().substr(0,3)!=150&&$('#phone').val().substr(0,3)!=151
			&&$('#phone').val().substr(0,3)!=152&&$('#phone').val().substr(0,3)!=157
			&&$('#phone').val().substr(0,3)!=159&&$('#phone').val().substr(0,3)!=182
			&&$('#phone').val().substr(0,3)!=187&&$('#phone').val().substr(0,3)!=133
			&&$('#phone').val().substr(0,3)!=153&&$('#phone').val().substr(0,3)!=180&&$('#phone').val().substr(0,3)!=181
			&&$('#phone').val().substr(0,3)!=189&&$('#phone').val().substr(0,3)!=158
			&&$('#phone').val().substr(0,3)!=188||$('#phone').val().length!=11){
			$('#phone').focus();	
			swal("请输入正确的手机号码", "无效的格式", "error");
		 	return;
		}else if(checkPhoneIsExist()){
			$('#phone').focus();
			swal("手机号码已注册", "无效的格式", "error");
			 return;
		}else{
			$('#phone').focus();
			swal("请先输入手机号码", "无效的格式", "error");
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
     var url = path+"/user/yzm";
			$.ajax({
	            type: "POST",
	            url: url,
	            data: {
	            	"user.phone":phone
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
   
function checkyzm(){
	 var yzm =  $('#code').val();
	 if($('#code').val().length==0){
			swal("验证码不能为空", "无效的输入", "error");
			return;
		 }else if(yzm!=mobile_code){
			swal("验证码错误 ", "无效的输入", "error");
			return;
	 }else{
		 	$('#code').parent().next("div").text("");
			document.getElementById( "div6" ).className = "form-group has-success";
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
}
	
</script>
<s:if test="#request.msg=='该手机号码已注册'">
<script type="text/javascript">
	swal("该手机号码已注册", "您可以直接登录", "info");
</script>
</s:if>
<s:if test="#request.msg=='请填写有效的邮箱地址'">
<script type="text/javascript">
	swal("请填写有效的邮箱地址", "这个地址已经注册了哦","error");
</script>
</s:if>
<s:if test="#request.msg=='success'">
<script type="text/javascript">
	swal("恭喜你，注册成功", "登录看看吧","success");
</script>
</s:if>

</body>
</html>
