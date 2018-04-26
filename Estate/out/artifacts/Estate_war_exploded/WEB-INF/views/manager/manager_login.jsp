<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@taglib prefix="s" uri="/struts-tags" %>
 <%
 	String path=request.getContextPath();
 %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="<%=path %>/images/favicon.png" type="image/png">
  <title>管理员登入</title>

  <link href="<%=path %>/css/style.default.css" rel="stylesheet">
  <link href="<%=path %>/css/sweetalert.css" rel="stylesheet">

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
  <style>
html,body {
	margin:0;
	overflow:hidden;
	width:100%;
	height:100%;
	cursor:none;
	background:black;
	background:linear-gradient(to bottom,#000000 0%,#5788fe 100%);
}
.filter {
	width:100%;
	height:100%;
	position:absolute;
	top:0;
	left:0;
}
@keyframes colorChange {
	0%,100% {
	opacity:0;
}
50% {
	opacity:.9;
}
}.landscape {
	position:absolute;
	bottom:0px;
	left:0;
	width:100%;
	height:100%;
	/*background-image:url(https://openclipart.org/image/2400px/svg_to_png/250847/Trees-Landscape-Silhouette.png);
	*/
background-image:url('http://www.jq22.com/css/img/xkbg.png');
	background-size:1000px 250px;
	background-repeat:repeat-x;
	background-position:center bottom;
}
</style>
</head>
<script type="text/javascript">
		function autologin()
		{
			var autologin=$("#autoName").val();
			if(autologin!="")
			{
				window.location.href="<%=path %>/manager/login";
			}
		}
</script>

<body onload="autologin();">

<div class="landscape">
	
</div>
<div class="filter">
	<section>
  
    <div class="signinpanel">
        
        <div class="row">
            
            <div class="col-md-7">
                
                <div class="signin-info">
                    <div class="logopanel">
                        <h1><span>[</span> <a href=""><font color="white">房天下</font></a> <span>]</span></h1>
                    </div><!-- logopanel -->
                
                    <div class="mb20"></div>
                
                    <h5><strong>房天下会员享有的特权</strong></h5>
                    <ul>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i> 转向购房补贴</li>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i> 房天下保障</li>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i> 免费在线报价</li>
                        <li><i class="fa fa-arrow-circle-o-right mr5"></i> 专享购房预约</li>
                    </ul>
                    <div class="mb20"></div>
                    <a href="signup.html"><font color="white"> 没有账号?注册</font></a>
                </div><!-- signin0-info -->
            </div><!-- col-sm-7 -->
            <div class="col-md-5">
                 <!-- Nav tabs -->
        <ul class="nav nav-tabs nav-justified">
          <li class="active"><a href="#home3" data-toggle="tab"><strong>账号登录</strong></a></li>
          <li><a href="#profile3" data-toggle="tab"><strong>手机验证登录</strong></a></li>
        </ul>
        
        <!-- Tab panes -->
        <div class="tab-content">
          <div class="tab-pane active" id="home3">
           <form method="post" action="<%=path %>/manager/login">
                    <h4 class="nomargin">账号登录</h4>
                	<input type="hidden" id="autoName" name="autoName" value="${session.users.userName}"/>
                    <input type="text" id="name" name="manager.name" class="form-control uname" placeholder="用户名" />
                    <div class="col-sm-20 tips"></div>
                    <input type="hidden" id="pwd" name="manager.pwd">
                    <input type="password" id="password" name="password" onblur="mdjia()" class="form-control pword" placeholder="密码" />
                    <div class="col-sm-20 tips"></div>
                    <input type="checkbox" id="remmbercode" name="remmberpassword" value="1"/>记住密码<br/>
                    <a href=""><small>忘记密码?</small></a>
                    <button class="btn btn-success btn-block" name="accountlogin" onclick="return checklogin();">登录</button>
                    
                </form>
          </div>
          <div class="tab-pane" id="profile3">
               <form method="post" action="<%=path%>/manager/phonelogin">
                    <h4 class="nomargin">手机验证登录</h4>
                    <h5 id="phoneerror" class="nomargin">${phonenumbererror}</h5>
                    <input type="text" id="phonenumber" name="manager.phone" class="form-control uname" placeholder="手机号码" />
                    <div class="col-sm-20 tips" id="aa1"></div>
	                    <div class="row " id="div3">
	                        <div class="col-sm-5" style="text-align: center;">
	                            <input type="text" id="phonecode" name="phonecode"  class="form-control "  placeholder="验证码"/>
	                        	<div class="col-sm-30 tips"></div>
	                        </div>
	                        <div class="col-sm-7">
	                           <input type="button" value="获取验证码"  id="getcode" onclick="getPhoneCode()" class="btn btn-default">
	                        </div>
	                	</div>
                    <input type="checkbox" id="remmbercode" name="remmberpassword" value="1"/>记住密码<br/>
                    <button class="btn btn-success btn-block" name="phonelogin">登录</button>
                </form>
          </div>
        </div>
            </div><!-- col-sm-5 -->
        </div><!-- row -->
    </div><!-- signin -->
</section>
</div>
<canvas id="canvas"></canvas>
<script>
function Star(id, x, y){
	this.id = id;
	this.x = x;
	this.y = y;
	this.r = Math.floor(Math.random()*2)+1;
}
Star.prototype.draw = function() {
	ctx.fillStyle = this.color;
	ctx.shadowBlur = this.r * 2;
	ctx.beginPath();
	ctx.arc(this.x, this.y, this.r, 0, 2 * Math.PI, false);
	ctx.closePath();
	ctx.fill();
}

Star.prototype.move = function() {
	this.y -= .15;
	if (this.y <= -10) this.y = HEIGHT + 10;
	this.draw();
}

Star.prototype.die = function() {
    stars[this.id] = null;
    delete stars[this.id];
}


function Dot(id, x, y, r) {
	this.id = id;
	this.x = x;
	this.y = y;
	this.r = Math.floor(Math.random()*5)+1;
	this.maxLinks = 2;
	this.speed = .5;
	this.a = .5;
	this.aReduction = .005;
	this.color = "rgba(255,255,255,"+this.a+")";
	this.linkColor = "rgba(255,255,255,"+this.a/4+")";

	this.dir = Math.floor(Math.random()*140)+200;
}

Dot.prototype.draw = function() {
	ctx.fillStyle = this.color;
	ctx.shadowBlur = this.r * 2;
	ctx.beginPath();
	ctx.arc(this.x, this.y, this.r, 0, 2 * Math.PI, false);
	ctx.closePath();
	ctx.fill();
}

Dot.prototype.link = function() {
	if (this.id == 0) return;
	var previousDot1 = getPreviousDot(this.id, 1);
	var previousDot2 = getPreviousDot(this.id, 2);
	var previousDot3 = getPreviousDot(this.id, 3);
	if (!previousDot1) return;
	ctx.strokeStyle = this.linkColor;
	ctx.moveTo(previousDot1.x, previousDot1.y);
	ctx.beginPath();
	ctx.lineTo(this.x, this.y);
	if (previousDot2 != false) ctx.lineTo(previousDot2.x, previousDot2.y);
	if (previousDot3 != false) ctx.lineTo(previousDot3.x, previousDot3.y);
	ctx.stroke();
	ctx.closePath();
}

function getPreviousDot(id, stepback) {
	if (id == 0 || id - stepback < 0) return false;
	if (typeof dots[id - stepback] != "undefined") return dots[id - stepback];
	else return false;//getPreviousDot(id - stepback);
}

Dot.prototype.move = function() {
	this.a -= this.aReduction;
	if (this.a <= 0) {
		this.die();
		return
	}
	this.color = "rgba(255,255,255,"+this.a+")";
	this.linkColor = "rgba(255,255,255,"+this.a/4+")";
	this.x = this.x + Math.cos(degToRad(this.dir))*this.speed,
	this.y = this.y + Math.sin(degToRad(this.dir))*this.speed;

	this.draw();
	this.link();
}

Dot.prototype.die = function() {
    dots[this.id] = null;
    delete dots[this.id];
}


var canvas  = document.getElementById('canvas'),
	ctx = canvas.getContext('2d'),
	WIDTH,
	HEIGHT,
	mouseMoving = false,
	mouseMoveChecker,
	mouseX,
	mouseY,
	stars = [],
	initStarsPopulation = 80,
	dots = [],
	dotsMinDist = 2,
	maxDistFromCursor = 50;

setCanvasSize();
init();

function setCanvasSize() {
	WIDTH = document.documentElement.clientWidth,
    HEIGHT = document.documentElement.clientHeight;                      

	canvas.setAttribute("width", WIDTH);
	canvas.setAttribute("height", HEIGHT);
}

function init() {
	ctx.strokeStyle = "white";
	ctx.shadowColor = "white";
	for (var i = 0; i < initStarsPopulation; i++) {
		stars[i] = new Star(i, Math.floor(Math.random()*WIDTH), Math.floor(Math.random()*HEIGHT));
		//stars[i].draw();
	}
	ctx.shadowBlur = 0;
	animate();
}

function animate() {
    ctx.clearRect(0, 0, WIDTH, HEIGHT);

    for (var i in stars) {
    	stars[i].move();
    }
    for (var i in dots) {
    	dots[i].move();
    }
    drawIfMouseMoving();
    requestAnimationFrame(animate);
}

window.onmousemove = function(e){
	mouseMoving = true;
	mouseX = e.clientX;
	mouseY = e.clientY;
	clearInterval(mouseMoveChecker);
	mouseMoveChecker = setTimeout(function() {
		mouseMoving = false;
	}, 100);
}


function drawIfMouseMoving(){
	if (!mouseMoving) return;

	if (dots.length == 0) {
		dots[0] = new Dot(0, mouseX, mouseY);
		dots[0].draw();
		return;
	}

	var previousDot = getPreviousDot(dots.length, 1);
	var prevX = previousDot.x; 
	var prevY = previousDot.y; 

	var diffX = Math.abs(prevX - mouseX);
	var diffY = Math.abs(prevY - mouseY);

	if (diffX < dotsMinDist || diffY < dotsMinDist) return;

	var xVariation = Math.random() > .5 ? -1 : 1;
	xVariation = xVariation*Math.floor(Math.random()*maxDistFromCursor)+1;
	var yVariation = Math.random() > .5 ? -1 : 1;
	yVariation = yVariation*Math.floor(Math.random()*maxDistFromCursor)+1;
	dots[dots.length] = new Dot(dots.length, mouseX+xVariation, mouseY+yVariation);
	dots[dots.length-1].draw();
	dots[dots.length-1].link();
}
//setInterval(drawIfMouseMoving, 17);

function degToRad(deg) {
	return deg * (Math.PI / 180);
}
</script>
<script type="text/javascript" src="<%=path %>/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=path %>/js/bootstrap.min.js"></script>
<script src="<%=path %>/js/modernizr.min.js"></script>
<script src="<%=path %>/js/jquery.sparkline.min.js"></script>
<script src="<%=path %>/js/jquery.cookies.js"></script>

<script src="<%=path %>/js/toggles.min.js"></script>
<script src="<%=path %>/js/retina.min.js"></script>

<script src="<%=path %>/js/custom.js"></script>

<script type="text/javascript" src="<%=path %>/js/jquery.md5.js"></script>
<script type="text/javascript" src="<%=path %>/js/sweetalert-dev.js"></script>
<script type="text/javascript" src="<%=path %>/js/login.js"></script>
<s:if test="#request.loginerror=='1'.toString()">
	<script type="text/javascript">
		swal("提示信息","账号或密码错误！", "info");
	</script>
</s:if>
<s:if test="#request.loginerror=='2'.toString()">
	<script type="text/javascript">
		swal("提示信息","账号或密码不存在！", "info");
	</script>
</s:if>
<script>
    jQuery(document).ready(function(){
        // Please do not use the code below
        // This is for demo purposes only
        var c = jQuery.cookie('change-skin');
        if (c && c == 'greyjoy') {
            jQuery('.btn-success').addClass('btn-orange').removeClass('btn-success');
        } else if(c && c == 'dodgerblue') {
            jQuery('.btn-success').addClass('btn-primary').removeClass('btn-success');
        } else if (c && c == 'katniss') {
            jQuery('.btn-success').addClass('btn-primary').removeClass('btn-success');
        }
    });
</script>
</body>

<script type="text/javascript">
function mdjia(){
	  var password=$("#password").val();
	 var pwd=$.md5(password);
	  $("#pwd").val(pwd);
}

</script>
<script >
var path="/Estate";
var mobile_code="";
var InterValObj;
var count=60;
var curcount;
function getPhoneCode(){
	
	if($("input[name='manager.phone']").val().length==0){			
		$("input[name='manager.phone']").next("div").text("此处不能为空");
		$("input[name='manager.phone']").next("div").css("color",'red');
		$("input[name='manager.phone']").focus();
		return false;
	}else if($("input[name='manager.phone']").val().substr(0,3)!=138&&$("input[name='manager.phone']").val().substr(0,3)!=130&&$("input[name='manager.phone']").val().substr(0,3)!=131
		&&$("input[name='manager.phone']").val().substr(0,3)!=132&&$("input[name='manager.phone']").val().substr(0,3)!=155
		&&$("input[name='manager.phone']").val().substr(0,3)!=156&&$("input[name='manager.phone']").val().substr(0,3)!=185&&$("input[name='manager.phone']").val().substr(0,3)!=186
		&&$("input[name='manager.phone']").val().substr(0,3)!=134&&$("input[name='manager.phone']").val().substr(0,3)!=135&&$("input[name='manager.phone']").val().substr(0,3)!=136
		&&$("input[name='manager.phone']").val().substr(0,3)!=137&&$("input[name='manager.phone']").val().substr(0,3)!=139
		&&$("input[name='manager.phone']").val().substr(0,3)!=147&&$("input[name='manager.phone']").val().substr(0,3)!=150&&$("input[name='manager.phone']").val().substr(0,3)!=151
		&&$("input[name='manager.phone']").val().substr(0,3)!=152&&$("input[name='manager.phone']").val().substr(0,3)!=157
		&&$("input[name='manager.phone']").val().substr(0,3)!=159&&$("input[name='manager.phone']").val().substr(0,3)!=182
		&&$("input[name='manager.phone']").val().substr(0,3)!=187&&$("input[name='manager.phone']").val().substr(0,3)!=133
		&&$("input[name='manager.phone']").val().substr(0,3)!=153&&$("input[name='manager.phone']").val().substr(0,3)!=180&&$("input[name='manager.phone']").val().substr(0,3)!=181
		&&$("input[name='manager.phone']").val().substr(0,3)!=189&&$("input[name='manager.phone']").val().substr(0,3)!=158
		&&$("input[name='manager.phone']").val().substr(0,3)!=188||$("input[name='manager.phone']").val().length!=11){
		$("input[name='manager.phone']").next("div").text("手机号格式不正确");
		$("input[name='manager.phone']").next("div").css("color",'red');
		$("input[name='manager.phone']").focus();
			return false;
	}else {
			curcount=count;
			var phone = $("#phonenumber").val();
			$('#getcode').attr("disabled",true);
			$('#getcode').val(curcount+"秒后重发验证码");
			InterValObj = window.setInterval(setRemainTime, 1000);
			checkPhoneIsExist();
			return true;
	}
	
}	

 function setRemainTime() {  

	    if (curcount == 0) {  
	        clearInterval(InterValObj);//停止计时器  
	        $("#getcode").removeAttr("disabled");//启用按钮  
	        $("#getcode").val("重新发送验证码");   
	        $("#phonecode").val(""); //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效      
	    }  
	    else {  
	    	  curcount--;  
	    	  $("#getcode").val(curcount + "秒后可重发验证码");  
	    }  
	}  

function checkPhoneIsExist(){
     var phone = $('#phonenumber').val();
     var url = path+"/manager/getvalidatecode";
			$.ajax({
	            type: "POST",
	            url: url,
	            data: {
	            	"manager.phone":phone
	            },
	            dataType: "text",
	            success: function(data) {  
	            	if(data!=0){
	            		mobile_code=data;
	            	}else if((data==0)){
	            		$("#aa1").html("<font color='red'>手机不存在请重新输入！</font>");
	            		clearInterval(InterValObj);//停止计时器  
	         	        $("#getcode").removeAttr("disabled");//启用按钮  
	         	        $("#getcode").val("重新发送验证码");   
	         	        $("#phonecode").val(""); //清除验证码。如果不清除，过时间后，输入收到的验证码依然有效   
	            	}
	            },
	            error: function() {
	            	swal("错误信息", "请求失败", "error");
	            }
	        }); 
   }
   
$("button[name='phonelogin']").click(function(e){		
	if($("input[name='manager.phone']").val().length==0){			
		$("input[name='manager.phone']").next("div").text("此处不能为空");
		$("input[name='manager.phone']").next("div").css("color",'red');
		$("input[name='manager.phone']").focus();
		return false;
	}else if($("input[name='manager.phone']").val().substr(0,3)!=138&&$("input[name='manager.phone']").val().substr(0,3)!=130&&$("input[name='manager.phone']").val().substr(0,3)!=131
		&&$("input[name='manager.phone']").val().substr(0,3)!=132&&$("input[name='manager.phone']").val().substr(0,3)!=155
		&&$("input[name='manager.phone']").val().substr(0,3)!=156&&$("input[name='manager.phone']").val().substr(0,3)!=185&&$("input[name='manager.phone']").val().substr(0,3)!=186
		&&$("input[name='manager.phone']").val().substr(0,3)!=134&&$("input[name='manager.phone']").val().substr(0,3)!=135&&$("input[name='manager.phone']").val().substr(0,3)!=136
		&&$("input[name='manager.phone']").val().substr(0,3)!=137&&$("input[name='manager.phone']").val().substr(0,3)!=139
		&&$("input[name='manager.phone']").val().substr(0,3)!=147&&$("input[name='manager.phone']").val().substr(0,3)!=150&&$("input[name='manager.phone']").val().substr(0,3)!=151
		&&$("input[name='manager.phone']").val().substr(0,3)!=152&&$("input[name='manager.phone']").val().substr(0,3)!=157
		&&$("input[name='manager.phone']").val().substr(0,3)!=159&&$("input[name='manager.phone']").val().substr(0,3)!=182
		&&$("input[name='manager.phone']").val().substr(0,3)!=187&&$("input[name='manager.phone']").val().substr(0,3)!=133
		&&$("input[name='manager.phone']").val().substr(0,3)!=153&&$("input[name='manager.phone']").val().substr(0,3)!=180&&$("input[name='manager.phone']").val().substr(0,3)!=181
		&&$("input[name='manager.phone']").val().substr(0,3)!=189&&$("input[name='manager.phone']").val().substr(0,3)!=158
		&&$("input[name='manager.phone']").val().substr(0,3)!=188||$("input[name='manager.phone']").val().length!=11){
		$("input[name='manager.phone']").next("div").text("手机号格式不正确");
		$("input[name='manager.phone']").next("div").css("color",'red');
		$("input[name='manager.phone']").focus();
			return false;
	}else if($("input[name='phonecode']").val().length==0){			
		$("input[name='phonecode']").next("div").text("此处不能为空");
		$("input[name='phonecode']").next("div").css("color",'red');
		$("input[name='phonecode']").focus();
		e.preventDefault();
		return false;
	}else if($("input[name='phonecode']").val().length>0 && $("input[name='phonecode']").val().length!=6){
		$("input[name='phonecode']").next("div").text("长度只能为6个字符");
		$("input[name='phonecode']").next("div").css("color",'red');
		return false;
	}else if($("#phonecode").val()!=mobile_code){
		$("input[name='phonecode']").next("div").text("请输入正确的验证码");
		$("input[name='phonecode']").next("div").css("color",'red');
		$("input[name='phonecode']").focus();
		 return false;
	 }else{
		 return true;
	}
});


</script>
</html>
