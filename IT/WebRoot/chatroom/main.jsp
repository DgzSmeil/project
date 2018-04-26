<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="SQLBean.StudentBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<%
	StudentBean studentBean = (StudentBean)session.getAttribute("bean");
%>
<title><%=studentBean.getStudentname() %>在线</title>
<link href="<%=basePath %>chatroom/css/style.css" rel="stylesheet" type="text/css">
<script src="<%=basePath %>chatroom/js/jquery.js"></script>
<script src="<%=basePath %>chatroom/js/index.js"></script>
<script src="<%=basePath %>chatroom/js/superslide.2.1.js"></script>
<script src="<%=basePath %>chatroom/js/nicescroll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#people").bind("click",function(){
			$("#msginfo").css("display","none");
			$("#peopleinfo").css("display","block");
		
		});
		$("#msgdatainfo").bind("click",function(){
			$("#peopleinfo").css("display","none");
			$("#msginfo").css("display","block");
		
		});
		$("#checklogin").bind("click",function(){
			$.post(
			  	"${pageContext.request.contextPath}/chatservlet?order=check",
			  	{
			  		"username":$("#username").val(),
			  		"password":$("#password").val()
			  	},
			  	function(data){
			  		alert(data);
			  		if(data=="用户名或吗，密码错误！" || data=="账户不存在！"){
			  			$("#datainfo").css("display","none");
			  		}else{
			  			$("#datainfo").css("display","block");
			  		}
			  	},
			  	"text"
	  		);
		
		});
		$("#qq-chat-text").bind("mouseover",function(){
			$.post(
			  	"${pageContext.request.contextPath}/chatservlet?order=add",
			  	{
			  		"msg1":""
			  	},
			  	function(data){
			  		$("#getmsg").html(data);
			  	},
			  	"text"
	  		);
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function(){
  $('.qq-xuan li').click(function(){
    $(this).addClass('qq-xuan-li').siblings().removeClass('qq-xuan-li')
  })
  $('.qq-hui-txt').hover(function(){
    var aa = $(this).html()
    $('.qq-hui-txt').attr('title',aa)
  })
  $('.login-close').click(function(){
     $(this).parent().parent().css('display','none')
  })
  $('.qq-hui li').dblclick(function(){
    $('.qq-chat').css('display','block').removeClass('mins')
	$('.qq-chat-t-name').html($(this).find('span').html())
	$('.qq-chat-t-head img').attr('src',$(this).find('img').attr('src'))
	$('.qq-chat-you span').html($(this).find('span').html())
	$('.qq-chat-you i').html($(this).find('.qq-hui-name i').html())
	$('.qq-chat-ner').html($(this).find('.qq-hui-txt').html())
	$("#qq-chat-text").trigger("focus")
	$('.my').remove()
  })
  $('.qq-exe img').dblclick(function(){
    $('.qq-login').css('display','block').removeClass('mins')
  })
  $('.login-but').click(function(){
	if($('.login-txt').find('input').val() == ''){
	  alert('请输入账号或者密码')
	}else if($('login-txt input').val() != ''){
      $('.qq').css('display','block').removeClass('mins')
	  $('.qq-login').css('display','none')
	}
  })
  $('.login-txt input').keydown(function(e){
    if(e.keyCode == 13){
      if($('.login-txt').find('input').val() == ''){
	  alert('请输入账号或者密码')
	}else if($('login-txt input').val() != ''){
      $('.qq').css('display','block').removeClass('mins')
	  $('.qq-login').css('display','none')
	}
    }
  })
  $('.close').click(function(){
    $(this).parent().parent().parent().css('display','none')
  })
  $('.min').click(function(){
    $(this).parent().parent().parent().addClass('mins')
  })
  $('.qq .close').click(function(){
    $('.qq-chat').css('display','none')
  })
  $('#qq-chat-text').keydown(function(e){
    if(e.keyCode == 27){
	  $('.qq-chat').css('display','none')
    }
  })
  $('.fasong').click(function(){
	if($('#qq-chat-text').val()!=''){
      var name = $('.qq-top-name span').html()
	  var ner = $('#qq-chat-text').val()
	  var ners = ner.replace(/\n/g,'<br>')
	  var now=new Date()
      var t_div = now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate()+' '+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
	  $('.qq-chat-txt ul').append('<li class="my"><div class="qq-chat-my"><span>'+name+'</span><i>'+t_div+'</i></div><div class="qq-chat-ner">'+ners+'</div></li>')
	  $(".qq-chat-txt").scrollTop($(".qq-chat-txt")[0].scrollHeight);
	  $('#qq-chat-text').val('').trigger("focus")
	  $.post(
	  	"${pageContext.request.contextPath}/chatservlet?order=add",
	  	{
	  		"msg1":"<li class='my'><div class='qq-chat-my'><span>"+name+"</span><i>"+t_div+"</i></div><div class='qq-chat-ner'>"+ners+"</div></li>"
	  	},
	  	function(data){
	  		$("#getmsg").html(data);
	  	},
	  	"text"
	  );
	}
  })
  $('.close-chat').click(function(){
    $('.qq-chat').css('display','none')
  })
  $(".qq-hui").niceScroll({
    touchbehavior:false,cursorcolor:"#ccc",cursoropacitymax:1,cursorwidth:6,horizrailenabled:true,cursorborderradius:3,autohidemode:true,background:'none',cursorborder:'none'
  });
});


</script>
</head>

<body>
<div class="qq-exe"><img src="images/QQ-ICON.png"><input type="text" value="腾讯QQ" placeholder="腾讯QQ"></div>
<div class="win-bg"><img src="images/win-bg.png"></div>

<div class="qq-login">
  <div class="login-menu">
    <span></span><span></span><span class="login-close"></span>
  </div>
  <div class="login-ner">
    <div class="login-left">
      <div class="login-head"><img src="images/login/head.jpg"></div>
    </div>
    <div class="login-on">
      <div class="login-txt"><input type="text" id="username" placeholder="QQ号码/手机/邮箱"><input id="password" type="password" placeholder="密码"></div>
      <div class="login-xuan"><span class="fl"><input type="checkbox"><i>记住密码</i></span><span class="fr"><input type="checkbox"><i>自动登录</i></span></div>
      <div class="login-but" id="checklogin">安全登录</div>
    </div>
    <div class="login-right">
      <a href="http://zc.qq.com/chs/index.html" target="_blank">注册账号</a><a href="https://aq.qq.com/cn2/findpsw/pc/pc_find_pwd_input_account?pw_type=0&aquin=" target="_blank">找回密码</a>
    </div>
  </div>
</div>
<div class="qq" id="datainfo" style="display:none">
  <div class="qq-top">
    <div class="qq-top-icon">
      <i><img src="images/qq-top.png"></i>
      <span class="qq-top-02 close"><img src="images/qq-top-02.png"></span>
      <span class="qq-top-01 min"><img src="images/qq-top-01.png"></span>
    </div>
    <div class="qq-top-name">
      <span><%=studentBean.getStudentname() %></span>
      <dl><dd><img src="images/zai.png"></dd><dt><img src="images/lv.png"></dt><dt><img src="images/svip.png"></dt></dl>
    </div>
    <div class="qq-top-shuo"><input type="text" value="这两天空间被各种婚礼刷屏了"></div>
    <div class="qq-top-menu">
      <ul>
        <li></li><li></li><li></li><li></li>
      </ul>
      <span class="qq-top-001"></span>
      <span class="qq-top-002"></span>
    </div>
    <div class="qq-serch">搜索：联系人、讨论组、群、企业</div>
  </div>
  <div class="qq-xuan">
    <ul>
      <li class="qq-xuan-li"><span  id="msgdatainfo"></span><i></i></li>
      <li><span id="people"></span><i></i></li>
      <li><span></span><i></i></li>
      <li><span></span><i></i></li>
    </ul>
  </div>
  <div class="qq-hui" id="msginfo" style="display:block;width:400px">
    <ul>
      <li>
        <div class="qq-hui-img"><img src="images/head/01.jpg"><i></i></div>
        <div class="qq-hui-name"><span>室外摄影大师</span><i>16:30</i></div>
        <div class="qq-hui-txt" title="">下次我们去公园拍摄吧~[图片]</div>
      </li>
      <li>
        <div class="qq-hui-img"><img src="images/head/02.jpg"><i></i></div>
        <div class="qq-hui-name"><span class="red">尛伊_6th空白</span><i>16:29</i></div>
        <div class="qq-hui-txt" title="">后天上午十点钟有漫展哦~我有门票你去么[图片]</div>
      </li>
      <li>
        <div class="qq-hui-img"><img src="images/head/03.jpg"><i></i></div>
        <div class="qq-hui-name"><span>一粒沙~白</span><i>16:29</i></div>
        <div class="qq-hui-txt" title="">[图片]怎么样看起来好吃吧</div>
      </li>
      <li>
        <div class="qq-hui-img"><img src="images/head/04.jpg"><i></i></div>
        <div class="qq-hui-name"><span class="red">彡分钟丶热°</span><i>16:26</i></div>
        <div class="qq-hui-txt" title="">恩 拜~</div>
      </li>
      <li>
        <div class="qq-hui-img"><img src="images/head/05.jpg"><i></i></div>
        <div class="qq-hui-name"><span class="red">二次元灬小埋酱</span><i>16:24</i></div>
        <div class="qq-hui-txt" title="">欧尼酱 >~< 下次带我去吃好吃的好不好嘛</div>
      </li>
      <li>
        <div class="qq-hui-img"><img src="images/head/06.jpg"><i></i></div>
        <div class="qq-hui-name"><span>爱思考的逗比</span><i>16:21</i></div>
        <div class="qq-hui-txt" title="">[图片]这个公式我算了一天终于算出来了</div>
      </li>
      <li>
        <div class="qq-hui-img"><img src="images/head/07.jpg"><i></i></div>
        <div class="qq-hui-name"><span>二货青年欢乐多</span><i>16:21</i></div>
        <div class="qq-hui-txt" title="">今天我踢了我前面的同学一脚、被他狠狠地</div>
      </li>
      <li>
        <div class="qq-hui-img"><img src="images/head/08.jpg"><i></i></div>
        <div class="qq-hui-name"><span>喵喵喵喵~喵星人</span><i>16:21</i></div>
        <div class="qq-hui-txt" title="">屁颠屁颠卖萌喵星人驾到、愚蠢的地球人</div>
      </li>
      <li>
        <div class="qq-hui-img"><img src="images/head/01.jpg"><i></i></div>
        <div class="qq-hui-name"><span>室外摄影大师</span><i>16:30</i></div>
        <div class="qq-hui-txt" title="">下次我们去公园拍摄吧~[图片]</div>
      </li>
      <li>
        <div class="qq-hui-img"><img src="images/head/02.jpg"><i></i></div>
        <div class="qq-hui-name"><span class="red">尛伊_6th空白</span><i>16:29</i></div>
        <div class="qq-hui-txt" title="">后天上午十点钟有漫展哦~我有门票你去么[图片]</div>
      </li>
      <li>
        <div class="qq-hui-img"><img src="images/head/03.jpg"><i></i></div>
        <div class="qq-hui-name"><span>一粒沙~白</span><i>16:29</i></div>
        <div class="qq-hui-txt" title="">[图片]怎么样看起来好吃吧</div>
      </li>
      <li>
        <div class="qq-hui-img"><img src="images/head/04.jpg"><i></i></div>
        <div class="qq-hui-name"><span class="red">彡分钟丶热°</span><i>16:26</i></div>
        <div class="qq-hui-txt" title="">恩 拜~</div>
      </li>
      <li>
        <div class="qq-hui-img"><img src="images/head/05.jpg"><i></i></div>
        <div class="qq-hui-name"><span class="red">二次元灬小埋酱</span><i>16:24</i></div>
        <div class="qq-hui-txt" title="">欧尼酱 >~< 下次带我去吃好吃的好不好嘛</div>
      </li>
      <li>
        <div class="qq-hui-img"><img src="images/head/06.jpg"><i></i></div>
        <div class="qq-hui-name"><span>爱思考的逗比</span><i>16:21</i></div>
        <div class="qq-hui-txt" title="">[图片]这个公式我算了一天终于算出来了</div>
      </li>
      <li>
        <div class="qq-hui-img"><img src="images/head/07.jpg"><i></i></div>
        <div class="qq-hui-name"><span>二货青年欢乐多</span><i>16:21</i></div>
        <div class="qq-hui-txt" title="">今天我踢了我前面的同学一脚、被他狠狠地</div>
      </li>
      <li>
        <div class="qq-hui-img"><img src="images/head/08.jpg"><i></i></div>
        <div class="qq-hui-name"><span>喵喵喵喵~喵星人</span><i>16:21</i></div>
        <div class="qq-hui-txt" title="">屁颠屁颠卖萌喵星人驾到、愚蠢的地球人</div>
      </li>
    </ul>
  </div>
  <div class="qq-hui" id="peopleinfo" style="display:none;width:400px">
    <ul>
      <c:forEach items="${studList}" var="s">
      	<li>
	        <div class="qq-hui-img"><img src="${s.studentface}" style="border-radius:50%"><i></i></div>
	        <div class="qq-hui-name"><span>${s.studentname}</span><i>16:30</i></div>
	        <div class="qq-hui-txt" title="">下次我们去公园拍摄吧~[图片]</div>
      	</li>
      </c:forEach>
    </ul>
  </div>
  <div class="qq-bot">
    <div class="qq-menu">
      <ul>
        <li><img src="images/bot-menu/01.png"></li>
        <li><img src="images/bot-menu/02.png"></li>
        <li><img src="images/bot-menu/03.png"></li>
        <li><img src="images/bot-menu/04.png"></li>
        <li><img src="images/bot-menu/05.png"></li>
        <li><img src="images/bot-menu/06.png"></li>
        <li><img src="images/bot-menu/07.png"></li>
        <li><img src="images/bot-menu/08.png"></li>
        <li><img src="images/bot-menu/09.png"></li>
        <li><img src="images/bot-menu/10.png"></li>
      </ul>
    </div>
    <div class="qq-bou-she">
      <ul>
        <li><img src="images/bot-menu/11.png"></li>
        <li><img src="images/bot-menu/12.png"></li>
        <li><img src="images/bot-menu/13.png"></li>
        <li><img src="images/bot-menu/14.png"></li>
        <li><img src="images/bot-menu/15.png"></li>
        <li><img src="images/bot-menu/16.png"><span>查找</span></li>
        <li><img src="images/bot-menu/05.png"><span>应用宝</span></li>
      </ul>
    </div>
  </div>
</div>

<div class="qq-chat" style="width:500px">
  <div class="qq-chat-win">
    <ul>
      <li class="she"></li><li class="min"></li><li class="max"></li><li class="close"></li>
    </ul>
  </div>
  <div class="qq-chat-top">
    <div class="qq-chat-tops">
      <div class="qq-chat-t-head"><img src=""></div>
      <div class="qq-chat-t-name"></div>
      <div class="qq-chat-t-shuo">站在别人的雨季，淋湿自己空弹一出戏.....</div>
    </div>
    <div class="qq-chat-menu">
      <ul>
        <li><span><img src="images/chat/icon-01.png"></span></li>
        <li><span><img src="images/chat/icon-02.png"></span></li>
        <li><span><img src="images/chat/icon-03.png"></span><i></i></li>
        <li><span><img src="images/chat/icon-04.png"></span><i></i></li>
        <li><span><img src="images/chat/icon-05.png"></span><i></i></li>
        <li><span><img src="images/chat/icon-06.png"></span></li>
        <li><span><img src="images/chat/icon-07.png"></span><i></i></li>
      </ul>
    </div>
  </div>
  <div class="qq-chat-bot">
    <div class="qq-chat-txt">
      <ul id="getmsg">
        
      </ul>
    </div>
    <div class="qq-chat-text">
      <ul>
        <li><span><img src="images/chat/menu-01.png"></span></li>
        <li><span><img src="images/chat/menu-02.png"></span></li>
        <li><span><img src="images/chat/menu-03.png"></span></li>
        <li><span><img src="images/chat/menu-04.png"></span></li>
        <li><span><img src="images/chat/menu-05.png"></span><i></i></li>
        <li><span><img src="images/chat/menu-06.png"></span></li>
        <li><span><img src="images/chat/menu-07.png"></span><i></i></li>
        <li><span><img src="images/chat/menu-08.png"></span></li>
        <li><span><img src="images/chat/menu-09.png"></span><i></i></li>
        <li class="fr" style="margin-right:5px;"><span><img src="images/chat/menu-10.png"></span><p>消息记录</p><i></i></li>
      </ul>
      <textarea id="qq-chat-text" name="content"></textarea>
      <div class="qq-chat-but">
        <span class="fasong" onclick="sendmsg();" id="getdata">发送(S)</span>
        <span class="close-chat">关闭(C)</span>
      </div>
    </div>
  </div>
</div>
</body>
</html>
