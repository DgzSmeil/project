<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>手机设置_51CTO支付中心</title>
<meta name="keywords" content="手机设置" />
<meta name="description" content="手机设置" />
<LINK href="/favicon.ico" type="image/x-icon" rel=icon>
<script src="http://pay.51cto.com/static/js/jquery.js" ></script>
<link href="http://pay.51cto.com/static/css/reset.css" rel="stylesheet" type="text/css" />
<link href="http://pay.51cto.com/static/css/style.css?v=1.0.1" rel="stylesheet" type="text/css" />
<style type="text/css">
.footer{ margin-top:75px;}
</style>

</head>

<body>
<div class="topBg">
	<div class="topNav">
	<div class="fl" style="position:relative;">
		<span><a target="_blank" href="http://www.51cto.com">51CTO首页</a></span><span>|</span><span>51CTO社区：</span>
		<a target="_blank" href="http://edu.51cto.com">学院</a> 
		<a target="_blank" href="http://down.51cto.com">下载</a>
		<a target="_blank" href="http://home.51cto.com">家园</a>
		<a target="_blank" href="http://bbs.51cto.com">论坛</a>
		<a target="_blank" href="http://blog.51cto.com">博客</a>
		<div class="addnav">
			<div class="addnavin">
				<a href="#">线下学习<em class="pub_icon"></em></a>
				<b class="line"></b>
				<dl class="hidchannel">
					<dd><a target="_blank" href="http://wot.51cto.com/?pay">WOT峰会</a></dd>
					<dd><a target="_blank" href="http://x.51cto.com/?pay">CTO训练营</a></dd>
					<dd><a target="_blank" href="http://wot.51cto.com/act/bcsl/info?pay">百城沙龙</a></dd>
				</dl>
			</div>
		</div>
	</div>

	<div class="fr">
		<div class="fr">
			<div class="logged" id="login_status"></div>
			<a target="_blank" href="/index.php?do=index&m=mycenter">我的支付中心</a>| <a target="_blank" href="/index.php?do=help">帮助中心</a>
		</div>	
	</div>
	</div>
</div>
<script>
	$(function(){
		$(".addnav").hover(function(){
			if($(this).find(".hidchannel").length>0){
				$(this).addClass("hovercur");
				$(this).find("em").addClass("showdown");
				$(this).find(".hidchannel").show();

			}
		},function(){

			$(this).removeClass("hovercur");
			$(this).find("em").removeClass("showdown");
			$(this).find(".hidchannel").hide();

		});
	})
</script><div class="wrap">
	<div class="header clearfix">
		<div class="logo"><a href="/"><img src="http://pay.51cto.com/static/images/logo.jpg" alt="支付中心" /></a></div>
		<div class="hNav">
			<a href="/index.php?do=index&m=mycenter">我的支付中心</a>
			<a href="/index.php?do=assem">交易记录</a>
			<a href="/">充值中心</a>
			<a href="/index.php?do=account&m=phone" class="cur">账户设置</a>
			<a href="/index.php?do=help">帮助中心</a>
		</div>
	</div>
	<p class="clear"></p><script src="/static/js/phone.js"></script>
<script type="text/javascript">
    var myreg = /^((1[3456789]{1}[0-9]{1})+\d{8})$/;
    var sec = 60;
    var org_title = '';
    var isGetCode = false;
    var foreign_phone ;
    function dumiao(){
        if(0==sec){
            $('#getCode').html('重新获取验证码');
            isGetCode = false;
            sec = 60;
            return;
        }
        sec--;

        $('#getCode').html(sec+'秒后可重新操作');

        setTimeout('dumiao()', 1000);
    }

    function check_form(obj){
        var phone = foreign_phone.checkPhone();
        if(phone == false){
            alert('请输入手机号！');
            return false;
        }

        var cod = $.trim($('#checkCode').val());
        if(''==cod){
            alert('请输入验证码');return false;
        }
        return true;
    }


    function checkImgCode(){
        var checkcode = $.trim($("#checkcode").val());
        if(!checkcode){
            return false;
        }
        var flag = false;
        $.ajax({
            type:"post",
            async: false,
            url:"/index.php?do=account&m=validImgCode",
            data:{checkcode:checkcode},
            dataType:"json",
            success:function(data){
                if(data[2]==1){
                    flag = true;
                }
            }
        });
        return  flag;
    }


    function clearImg(){
        $(".getNext").click();
        $("#checkcode").val('');
    }

    $(function(){
        foreign_phone = $(".foreign_dist").foreignPhone({id:"#phone_container",phone_obj:"#telphone"});

        $('#getCode').bind('click', function(){
            var phone = foreign_phone.checkPhone();
            if(phone == false){
                alert('请输入手机号！');
                return false;
            }

            if(isGetCode){
                return false;
            }
            if(checkImgCode()==false){
                alert('请输入正确图片验证码');
                return false;
            }
            org_title = $(this).html();
            $(this).css('width', '100px');
            phone.t = "bind_phone";
            $.ajax({
                'type':'post',
                'dataType':'json',
                'url':'/index.php?do=account&m=getCheckCode',
                'data': phone,
                'success':function(res){
                    clearImg();
                    if(res[0]){
                        isGetCode = true;
                        dumiao();
                    } else {
                        alert(res[1]);
                    }
                }

            });

        });


        $(".getNext").click(function(){
            $("#VerCode").attr("src","/index.php?do=account&m=imgCode&r="+Math.random());
            return false;
        })

    });
</script>
<div class="Asidenav">
<H3>账户设置</H3>
<ul>
<li  index="paypwd"><a href="?do=account&m=paypwd">设置支付密码</a></li>
</ul>
</div>
<script>
  $(".Asidenav li").each(function(){
  	  var index = $(this).attr("index");
  	  if(location.href.indexOf("m="+index) > -1){
  	  	 $(this).addClass("cur");
  	  	 return 0;
  	  }
  })
</script><div class="Acontent">
        <style>
        .foreign_prex,.foreign_phone{
            width: 148px;
            height: 20px;
            line-height: 20px;
            border: 1px solid #9ab2ca;
            padding-left:2px;
        }
    </style>
    <div class="tit">绑定手机</div>
    <form role="form" method="post" action="/index.php?do=account&m=doBindMyPhoneNumber" onsubmit="return check_form(this)">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td height="30" colspan="3" align="right" valign="middle">&nbsp;</td>
            </tr>
            <tr>
                <td width="10%" height="30" align="right" valign="middle"  style="padding-right:5px">手机号</td>
                <td width="45%" align="left" >
                    <span  id="phone_container"> <input type="text" name="telphone" id="telphone" maxlength="11"  class="inp148"/> </span>
                    <a class="foreign_dist" href="javascript:void(0)">海外手机号</a>
                </td>
                <td width="73%">&nbsp;</td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:5px">图片验证码</td>
                <td align="left" valign="middle">
                    <input type="text" name="checkcode" id="checkcode"  class="inp148" style="width:68px;float:left;margin-right:10px;" maxlength="11"/>
                    <img src="/index.php?do=account&m=imgCode" class="getNext" style="height:21px;width:70px;float:left;margin-right:10px;border:none;cursor:pointer;" id="VerCode" />
                    <p style="float:left;line-height:24px;"><span style="color:#999999;">看不清？</span><a class="getNext" href="javascript:void(0)" style="color:#305999;">换一张</a></p>
                </td>
                <td></td>
            </tr>
            <tr>
                <td height="30" align="right" valign="middle" style="padding-right:5px">验证码</td>
                <td align="left"><input type="text" name="checkCode" id="checkCode" style="width:68px;float:left;"  class="inp148"/><a class="btn3 f1" id="getCode" href="javascript:void(0);" style="display:block;float:left;margin-left:10px;">获取验证码</a><span id="jiadedianhua"></span></td>
                <td></td>
            </tr>
            <tr>
                <td align="right" valign="middle">&nbsp;</td>
                <td height="35">
			<span class="fl">
				<input type="submit" value="提交"  class="btn"/>
			</span>
                    <span style="color:red;margin-left:10px;"></span>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td align="right" valign="middle">&nbsp;</td>
                <td height="80" colspan="2" class="lh22 c_gray2">温馨提示：<br />绑定密保手机，可以在大额支付时有效的保障资金的安全性。</td>
            </tr>
        </table>
    </form>
    </div>
</div>
<div class="footer">
	<a href="http://www.51cto.com/about/aboutus.html" target="_blank">关于我们</a>&nbsp;
	<a href="http://www.51cto.com/about/zhaopin.html" target="_blank">诚聘英才</a>&nbsp; 
	<a href="http://www.51cto.com/about/contactus.html" target="_blank">了解我们</a>&nbsp;
	<a href="http://www.51cto.com/about/history2011.html" target="_blank">网站大事</a>&nbsp; 
	<a href="http://www.51cto.com/about/guestbook/" target="_blank">意见反馈</a>&nbsp; 
	<a href="http://www.51cto.com/about/map.htm" target="_blank">网站地图</a><br />
	Copyright @ 2005-2017 51CTO.COM 版权所有
</div>
</body>
<script charset="utf-8" src="http://pay.51cto.com/index.php?do=juser&m=userStatus&reback=http%3A%2F%2Fpay.51cto.com%2Findex.php%3Fdo%3Daccount%26m%3Dphone"></script>
<script> 
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){ 
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o), 
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m) 
})(window,document,'script','//www.google-analytics.com/analytics.js','ga'); 

ga('create', 'UA-56422726-1', 'auto'); 
ga('send', 'pageview'); 

</script>
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F3fe9272bf48a68ad34ff7d08e600bc4b' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
	var uid = "12569085";
	var _educto = _educto || [];
	_educto.push(['_setUserId',uid]);
</script>

<script type="text/javascript">
	document.write(decodeURI("%3Cscript src='https://tongji.51cto.com/cto.js/d2e038922df3c3aad532cc5b230727b4' type='text/javascript'%3E%3C/script%3E"));
</script>
</html>