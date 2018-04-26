<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="<%=path %>/images/favicon.png" type="image/png">

  <title>房地产入驻</title>

  <link href="<%=path %>/css/style.default.css" rel="stylesheet">
  <!-- 提示框 -->
  <script src="<%=path %>/js/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="<%=path %>/css/sweetalert.css">
  <!--  -->
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="horizontal-menu">


<section>
  
  <div class="mainpanel">
    
    <div class="headerbar">
      
      <div class="header-left">
        
        <div class="logopanel">
            <h1><span>[</span> <a href="<%=path%>/user/homepage">房天下</a> <span>]</span></h1>
        </div><!-- logopanel -->
        
      </div><!-- header-left -->
      
      <div class="header-right">
        <ul class="headermenu">
        
          
         
        </ul>
      </div><!-- header-right -->
      
    </div><!-- headerbar -->
        
    <div class="pageheader">
      <h4>免费入驻，填写申请资料</h4>
       <ol class="breadcrumb">
			<li><h4><a href="<%=path%>/agency/login">已经申请，直接登录</a></h4></li>
        </ol><div class="breadcrumb-wrapper">
       
      </div>
    </div>
    
    <div class="contentpanel">
      <!-- content goes here... -->
		<div class="panel panel-default">
			<div class="panel-body panel-body-nopadding">
			  
			  <form class="form-horizontal form-bordered" method="post" action="<%=path %>/agency/add" id="form1"  enctype="multipart/form-data">
				
			   
				
				<div class="form-group" id="div1">
				  <label class="col-sm-3 control-label">公司名称：</label>
				  <div class="col-sm-4">
					<input type="text" id="name" name="agency.name" placeholder="公司名称" data-placement="right" title="与营业执照名称保持一致" class="form-control tooltips" >
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div2">
				  <label class="col-sm-3 control-label">邮箱地址：</label>
				  <div class="col-sm-4">
					<input type="email" id="email" name="agency.email" placeholder="输入邮箱地址" data-placement="right" title="邮箱地址是登录账号" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div3">
				  <label class="col-sm-3 control-label">登录密码：</label>
				  <div class="col-sm-4">
					<input type="password" id="password" name="agency.pwd" placeholder="输入密码" data-placement="right" title="输入不少于6个字符的密码" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div4">
				  <label class="col-sm-3 control-label">确认密码密码：</label>
				  <div class="col-sm-4">
					<input type="password" id="password2" placeholder="输入确认密码" data-placement="right" title="与上面密码保持一致" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div5">
				  <label class="col-sm-3 control-label">申请人姓名：</label>
				  <div class="col-sm-4">
					<input type="text" id="leader" name="agency.leader" placeholder="输入姓名" data-placement="right" title="请输入你的真实姓名" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
			   

				 <div class="form-group" id="div6">
				  <label class="col-sm-3 control-label">固定电话：</label>
				  <div class="col-sm-4">
					<input type="tel" maxlength="7" id="tel" name="agency.tel" placeholder="输入固定电话" data-placement="right" title="请输入公司的固定电话" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				 <div class="form-group" id="div7">
				  <label class="col-sm-3 control-label">公司地址：</label>
				  <div class="col-sm-4">
					     <input type="text" id="address" name="agency.address" placeholder="输入地址" data-placement="right" title="请输入公司的地址"  class="form-control tooltips"></input>
					  </div>
				  <div class="col-sm-4 tips"></div>
				</div>
				
				<div class="form-group" id="div8">
				  <label class="col-sm-3 control-label">公司商标图片：</label>
				  <div class="col-sm-4">
					<p id="addp"></p>
					  <input type="file" id="upload" style="display:none" name="upload" onclick="addElementImg('addp')">
					  <span  class="btn btn-default btn-lg"  onclick="F_Open_dialog()">
					  		选择图片
					  </span>
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div9">
				  <label class="col-sm-3 control-label">手机号码：</label>
				  <div class="col-sm-4">
					<input type="tel" maxlength="11" name="agency.phone" placeholder="输入手机号码" id="phone" data-placement="right" title="请输入开通账号的手机号码" class="form-control tooltips">
				  </div>
				  <div class="col-sm-4 tips"></div>
				</div>

				<div class="form-group" id="div10">
				  <label class="col-sm-3 control-label"> 验证码：&nbsp;&nbsp;</label>
				  <div class="input-group col-sm-4">
					<input type="text" id="code" style="margin-left:0.8em" onblur="checkyzm()" data-placement="right" name="yzm" placeholder="输入验证码"  title="请输入输入验证码" class="form-control tooltips">
					<span class="input-group-btn">
                    	<input type="button" style="margin-left:0.6em" value="获取手机验证码" maxlength="6" id="vcode" onclick="getPhoneCode()" class="btn btn-default">
                  	</span>
                  	<div style="float:left;margin-top:0px;display:none" id="codes"></div>
				  </div>
				</div>
				<div class="form-group" id="div11">
				  <label class="col-sm-3 control-label">公司简介：</label>
				  <div class="col-sm-7">
					<textarea  id="intro" name="agency.intro" class="form-control" rows="5"></textarea>
				  </div>
				  
				</div>

				<div class="form-group">
				  <label class="col-sm-3 control-label"></label>
				  <div class="col-sm-7">
						<button class="btn btn-primary btn-lg" id="btn_agency" onclick=" return checkYZM2()"> 提 交 </button>&nbsp;
						<button class="btn btn-default btn-lg"> 取 消 </button>
				  </div>
				</div>
				<br/>
			   
			  </form>
			  
			</div><!-- panel-body -->
		
			
		</div>
	</div>
    
  </div><!-- mainpanel -->
  
  
  
</section>



<script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=path %>/js/jquery-ui-1.10.3.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/modernizr.min.js"></script>
<script src="<%=path %>/js/jquery.sparkline.min.js"></script>
<script src="<%=path %>/js/toggles.min.js"></script>
<script src="<%=path %>/js/retina.min.js"></script>
<script src="<%=path %>/js/jquery.cookies.js"></script>


<script src="<%=path %>/js/jquery.autogrow-textarea.js"></script>
<script src="<%=path %>/js/bootstrap-timepicker.min.js"></script>
<script src="<%=path %>/js/jquery.maskedinput.min.js"></script>
<script src="<%=path %>/js/jquery.tagsinput.min.js"></script>
<script src="<%=path %>/js/jquery.mousewheel.js"></script>
<script src="<%=path %>/js/select2.min.js"></script>
<script src="<%=path %>/js/dropzone.min.js"></script>
<script src="<%=path %>/js/colorpicker.js"></script>

<script src="<%=path %>/js/agency_registered.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

var i=true;
function addElementImg(obj) {
		if(i){
			var ul = document.getElementById(obj);
			var img = document.createElement("img");
			img.setAttribute("id", "newImg");
			img.setAttribute("style", "width:113px;height:50px");
			img.src = "";
			ul.appendChild(img);
			i=false;
			var input = document.getElementById("upload");
			var $img = $('#newImg');
			input.addEventListener('change',readFile,false);
			function readFile(){
				var file=this.files[0];
				var $file = $(this);
				var fileObj = $file[0];
				var windowURL = window.URL || window.webkitURL;
				var dataURL;
				dataURL = windowURL.createObjectURL(fileObj.files[0]);
				$img.attr('src',dataURL);
		 	}
		}
	}
	
	function F_Open_dialog() 
	{ 
		document.getElementById("upload").click(); 
	} 
</script>
<s:if test="#request.msg!=null">
	<script type="text/javascript">
	swal("注册错误", "${msg}", "error");
	</script>
</s:if>
<s:if test="#request.success!=null">
	<script type="text/javascript">
		swal("成功信息", "${success}", "success");
	</script>
</s:if>


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
	 
	    if (curcount >0) {  
	    	 curcount--; 
	    	  $("#vcode").val(curcount + "秒后可重发验证码");  
	    	
	    }  
	    else {  
	    	window.clearInterval(InterValObj);//停止计时器  
	        $("#vcode").removeAttr("disabled");//启用按钮  
	        $("#vcode").val("重新发送验证码");   
	        code = ""; //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效      
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
	            	 swal("错误", "无效的输入", "error");   
	            	 return;
	            }
	        }); 
   }


 function checkyzm(){
	 var yzm =  $('#code').val();
	 if($('#code').val().length==0){
		 	document.getElementById("codes").style.display="none";
			$("#codes").html("");
			return;
	 }else if(yzm!=mobile_code){
		    document.getElementById("codes").style.display="block";
			$("#codes").css("color",'red');
			$("#codes").html("验证码错误");
		// 	document.getElementById( "div10" ).className = "form-group has-error";
	//		$('#vcode').parent().next("div").text("验证码错误 请重新输入");
			$('#code').parent().next("div").css("color",'red');
			return;
	 }else{
		 	document.getElementById("codes").style.display="none";
			$("#codes").html("");
	 }		
	
 }
 function checkYZM2(){
	 var yzm =  $('#code').val();
	 if($('#code').val().length==0){
		 	document.getElementById("codes").style.display="block";
			$("#codes").html("请输入验证码");
			return false;
	 }else if(yzm!=mobile_code){
		    document.getElementById("codes").style.display="block";
			$("#codes").css("color",'red');
			$("#codes").html("验证码错误");
		// 	document.getElementById( "div10" ).className = "form-group has-error";
	//		$('#vcode').parent().next("div").text("验证码错误 请重新输入");
			$('#code').parent().next("div").css("color",'red');
			return false;
	 }else{
		 	document.getElementById("codes").style.display="none";
			$("#codes").html("");
			return true;
	 }		
}
	
</script>


</body>
</html>
