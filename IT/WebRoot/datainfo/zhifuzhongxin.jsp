<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="SQLBean.StudentBean"%>
<%@page import="SQLBean.CourseBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-param" content="_csrf">
    <meta name="csrf-token" content="UGJZWG5sSlk6KQAKPCMYCgkHGgBcCh8NICkwDwY7HywiGGg5FycIEA==">
    <title>订单确认IT课堂</title>
    <meta name="keywords" content="IT实战培训,IT在线培训,IT教育培训,IT在线教育,微信开发,PHP,Java,Unity3D,Linux,Hadoop,虚拟化">
<meta name="description" content="中国最大的IT实战在线教育培训平台：拥有云计算，大数据，移动开发，游戏开发，系统/运维，考试认证，编程语言，Web开发，软件研发，网络技术，服务器存储，数据库，嵌入式，企 业信息化，Office，设计，大学MOOC，其它等各种IT领域实战培训课程视频。！">    <script type="text/javascript">_centerURL='http://edu.51cto.com/center/',imgpath='https://static.edu.51cto.com/images/whitestyle/'</script>
    <script src="https://static.edu.51cto.com/center/js/jquery.min.js"></script><script src="https://static.edu.51cto.com/center/js/prototype_create.js"></script><script src="https://static.edu.51cto.com/center/js/plugins.js?v=1.0.2"></script><script src="https://static.edu.51cto.com/plugin/mbox.js"></script><script src="https://static.edu.51cto.com/center/js/jquery.nicescroll.min.js"></script><script src="https://static.edu.51cto.com/center/js/nice_select.js"></script><script src="https://static.edu.51cto.com/center/js/order.js"></script><link href="https://static.edu.51cto.com/center/css/base.css?v=2.3.24" rel="stylesheet"><link href="https://static.edu.51cto.com/css/gen_top.css?v=2.2.36" rel="stylesheet"><link href="https://static.edu.51cto.com/center/css/nice_select.css" rel="stylesheet"><link href="https://static.edu.51cto.com/center/css/order.css" rel="stylesheet"></head>
<body>
<%
	StudentBean studentBean = (StudentBean)session.getAttribute("bean");
	int num=0;
	if(session.getAttribute("num")!=null){
		num = Integer.parseInt(session.getAttribute("num").toString());
	}
	CourseBean coursebean =(CourseBean)session.getAttribute("coursebean");
	//ExchangeCodeBean exbean = (ExchangeCodeBean)session.getAttribute("exbean");
%>
        <div class="GenTopHeader" style="margin-top: 0px;">
    <ul class="Page"  id="GenTopBar">
        <li class="fl f14"><a href="http://edu.51cto.com/">中国最大的IT技能学习平台</a></li>
        <li class="fr navi"><a href="http://edu.51cto.com/sitemap.html" target="_blank" style="background-color:none;">网站导航</a>
            <ul class="navigates">
                <li><a href="<%=basePath %>courselistservlet?order=list" target="_blank">首页</a></li>
                <li><a href="<%=basePath %>datainfo/login.jsp" target="_blank">登录界面</a></li>
                <li style="border-bottom: 1px solid #FFF;"><a href="<%=basePath %>datainfo/zhuce.jsp" target="_blank">注册界面</a></li>
                <li><a href="<%=basePath %>studentservlet?order=teacher&studentname=${studentbean.studentname}" target="right">申请开课</a></li>
                <c:if test="<%=studentBean!=null %>">
                	<li><a href="<%=basePath %>studentservlet?order=teacher&studentname=${studentbean.studentname}" target="right">申请开课</a></li>
                	<li><a href="<%=basePath %>datainfo/myface.jsp" target="_blank">个人主页</a></li>
                </c:if>
            </ul>
        </li>
 <c:if test="${studentBean!=null}">
        	<li class="fr"><a target="_blank" href="<%=basePath %>loginservlet?order=loginin&name=${studentBean.studentmobile}">学习中心</a></li>
        </c:if>
        <li class="fr apps"><a href="<%=basePath %>courselistservlet?order=app" target="_blank" style="background:none;">课堂APP</a>
            <ul>
                <li><a  target="_blank">Android</a></li>
                <li><a  target="_blank">iPhone</a></li>
                <li><a   target="_blank">iPad</a></li>
            </ul>
        </li>
        <li class="fr" id="TopCart">
            <a href="<%=basePath %>courselistservlet?order=mycar1" target="_blank" class="red">购物车<span>${requestScope.num}</span></a>
        </li>
        <li class="fr reg"><a href="<%=basePath %>datainfo/zhuce.jsp" target="_blank">注册</a></li>
        <c:if test="${studentBean==null}">
        	<li class="fr"><a href="<%=basePath %>datainfo/login.jsp">登录</a></li>
        </c:if>
       <c:if test="${studentBean!=null}">
       		 <li class="fr"><a href="<%=basePath %>loginservlet?order=exit">安全退出</a></li>
       		 <c:if test="<%=studentBean.getVIP()!=1 %>">
       		 	<li class="fr reg"><a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>" target="_blank"><%=studentBean.getStudentname() %>&nbsp;<img src="<%=basePath %>images/vip_grey2.png" style="float: right; margin-top: 13px;height:20px;width:20px;border-radius:50%"/></a></li>
       		 </c:if>
       		 <c:if test="<%=studentBean.getVIP()==1 %>">
       		 	<li class="fr reg"><a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>" target="_blank"><%=studentBean.getStudentname() %>&nbsp;<img src="<%=basePath %>images/vipred.png" style="float: right; margin-top: 13px;height:20px;width:20px;border-radius:50%";/></a></li>
       		 </c:if>
       </c:if>
    </ul>
</div>

    <div class="Header">
    <div class="Page">
        <div class="Logo fl">
            <a href="<%=basePath %>courselistservlet?order=list" title="IT学院"><img src="<%=basePath %>image/itlogo.png" class="fl"></a>
        </div>
        <ul class="Navigate fl">
            <li><a href="<%=basePath %>courselistservlet?order=list" target="_blank">首页</a></li>
            <li><a href="<%=basePath %>datainfo/login.jsp" target="_blank">登录界面</a></li>
            <li style="border-bottom: 1px solid #FFF;"><a href="<%=basePath %>datainfo/zhuce.jsp" target="_blank">注册界面</a></li>
            <li><a href="<%=basePath %>studentservlet?order=teacher&studentname=<%=studentBean.getStudentname() %>" target="right">申请开课</a></li>
            <li><a  target="_blank">IT课堂主站</a></li>
        </ul>
        <div class="Search fr">

            <form class="form-search" id="q-form" method="post" action="<%=basePath %>courselistservlet?order=hedui&codeid=${param.courseid}&courseid=${requestScope.courseid}">
                <input name="do" type="hidden" value="search">
                <input name="m" type="hidden" value="course">
                <input name="lastmoney" type="hidden" value="${requestScope.lastmoney}"/>
                <button class="fr">核对</button>
                <input type="text" class="fr" placeholder="输入优惠券编码" name="code" id="q" />
            </form>
        </div>
    </div>
</div>
    <input id="noact_price" type="hidden" value="0">
<input id="pay_price" type="hidden" value="139">
<input id="canUseScore" type="hidden" value="0" >
<div class="Page Confirm">
  <div class="Title">
  <h1 class="fl f18">订单确认</h1>
  <img src="https://static.edu.51cto.com/center/images/cart_setp2.png" class="fr">
  <div class="clear"></div>
</div>  
<form name="form1" id="flowForm" method="post" action="<%=basePath %>courselistservlet?order=fukuan&courseid=<%=request.getAttribute("courseid") %>">
  <table class="GoodList">
    <tbody>
      <tr>
        <th class="name">商品</th>
        <th class="price">原价</th>
        <th class="priceNew">价格</th>
      </tr>
    </tbody>
        <tbody>
      <tr>
        <td colspan="3" class="Title red f18 fb"><p>限时折扣</p></td>
      </tr>
            <tr>
        <td colspan="3" class="teacher">讲师：${teacherbean.teachername}</td>
      </tr>
            <tr class="good">
        <td class="name First">
          <a target="_blank" href=''><img src="${coursebean.picture_url}"></a>
          <div class="goodInfo">
            <a target="_blank" href=''>${coursebean.course_name}</a>
                      </div>
        </td>
        <td class="price">
          <p>￥<strong>${requestScope.courseprice}</strong></p>
          <span class="discName red">限时${requestScope.price}折</span>
          </td>
        <td class="red priceNew Last">￥<strong>${requestScope.lastmoney}</strong></td>
      </tr>
            <tr>
        <td class="Billing tr" colspan="3">
          <div class="tr">
            <p>共 <strong class="red">1</strong> 件商品,合计<span class="red f20">￥<strong>${requestScope.lastmoney}</strong></span></p>
          </div>
        </td>
      </tr>
    </tbody>
      </table>
  <div class="Finish">
    <div class="check fr" id="AgreeDiv">
      <input type="checkbox" id="Agree" checked="checked">
      <label for="Agree"><p class="on">我已阅读并同意<a  target="_blank">《IT课堂购买协议》</a></p></label>
    </div>
    <div class="clear"></div>
    <div class="Main fl">
      <div class="fl">
      		<c:if test="${requestScope.message==null}">
           		<a href="">欢迎下次光临！我会想你喔！如有疑问请拨打下方的客服电话</a>
      		</c:if>
      		<c:if test="${requestScope.message!=null}">
           		<a href=""><font color="red" size="5">${requestScope.message}</font></a>
      		</c:if>
      </div>
      <div class="fr">
        <p>共 <strong class="red">1</strong> 件商品,合计<span class="red f20">￥<strong>${requestScope.lastmoney}</strong></span></p>
      </div>
    </div>
    <input name="studentid" value="${bean.studentid}" type="hidden"/>
    <input name="coursename" value="${coursebean.course_name}" type="hidden"/>
    <input name="teachername" value="${teacherbean.teachername}" type="hidden"/>
    <input name="youhui" value="${requestScope.price}" type="hidden"/>
    <input name="money" value="${requestScope.courseprice}"  type="hidden" id="usedScore" />
   	<input name="lastmoney" type="hidden" value="${requestScope.lastmoney}"/>
    <button class="fr redb" type="submit" id="submit">去支付</button>
    <div class="clear"></div>
  </div>
  </form>
</div>
    <div class="Footer">
    <div class="Page">
        <table class="QRcode tc">
            <caption>
                <a href="<%=basePath%>courselistservlet?order=list" title="IT课堂"><img src="<%=basePath %>image/itlogo.png" alt="IT课堂" width="194" height="40"/>
            </caption>
            <tr>
                <td>
                    <img src="https://static.edu.51cto.com/center/images/qrcode.png" alt="学院APP" width="110" height="110"/>
                    <p>学院APP</p>
                </td>
                <td>
                    <img src="https://static.edu.51cto.com/center/images/qrcode2.png" alt="官方微信" width="110" height="110"/>
                    <p>官方微信</p>
                </td>
            </tr>
        </table>
        <div class="Info fl">
            <div class="Map">
 <a href="<%=basePath %>courselistservlet?order=guanyu" target="_blank">关于我们</a>
                <span>|</span>
                <a href="<%=basePath %>courselistservlet?order=help" target="_blank">帮助中心</a>
                <span>|</span>
                <a href="<%=basePath %>courselistservlet?order=fankui1" target="_blank">意见反馈</a>
                <span>|</span>
                <a href="<%=basePath %>courselistservlet?order=lianxi" target="_blank"  title="联系我们">联系我们</a>
                <span>|</span>
                <a href="<%=basePath %>courselistservlet?order=dengji" target="_blank">课程登记</a>
                <span>|</span>
                <a href="<%=basePath %>courselistservlet?order=gushi" target="_blank">学员故事</a>
                <span>|</span>
                <a href="<%=basePath %>courselistservlet?order=jiaoliu" target="_blank"  title="学员交流">学员交流</a>
            </div>
            <p class="Call fl red">176-0797-5702</p>
            <p class="fl callTime">09:00 - 19:00</p>
            <div class="clear"></div>
            <p class="copy">Copyright &copy; 2005-2017 <a  target="_blank">51CTO.com</a></p>
        </div>
        <div class="clear"></div>
    </div>

</div>
<img src="https://static.edu.51cto.com/images/whitestyle/qqbm_bs.png" style="position: fixed;right:10px;bottom:100px;z-index: 99;cursor: pointer;" onclick="$('#AdviceMask').show();$('#Advice').show();">
<div class="mask disp-n" id="AdviceMask"></div>
<div class="Advice disp-n" id="Advice">
    <div class="Main">
        <button class="close" onclick="$('#AdviceMask').hide();$('#Advice').hide();">&nbsp;</button>
        <h3>可以开发票么？</h3>
        <p>可以的，购买课程或者充值余额后都是可以开具发票的，具体详情点击：<a href="http://bbs.51cto.com/thread-1472105-1.html" target="_blank">我要开发票</a></p>
        <h3>购买的课程可以下载么？</h3>
        <p>目前PC端暂不支持下载课程视频，请手机或者平板电脑下载“51CTO学院”APP后再下载视频哦！</p>
        <h3>优惠券如何使用？</h3>
        <p>非折扣课程（不包含1元课程/套餐）可使用，一个订单（可包含多个课程）只可使用一张；优惠券一经使用，不再返还；若被冻结请在PC端删除订单即可返还。</p>
        <p class="mt20">更多问题查询点击 <a href="http://edu.51cto.com/help.html" target="_blank">帮助中心</a></p>
        <p class="mt10">欢迎您提供宝贵意见，对于您的意见我们都会认真、慎重的讨论，每一个意见都是我们更好为您服务的鞭策和激励，感谢您帮助学院成长，<a href="http://edu.51cto.com/user/feedback.html" target="_blank">我要反馈意见</a></p>
        <button id="bizQQ_WPA">&nbsp;</button>
    </div>
</div>
<script type="text/javascript">
$("#bizQQ_WPA").click(function(){
    window.open('http://edu.51cto.com/contactqq.html')
})
//百度统计代码
var _hmt = _hmt || [];
(function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?8c8abdb71d78d33dfdb885e0bc71dae0";
    var s = document.getElementsByTagName("script")[0]; 
    s.parentNode.insertBefore(hm, s);

})();
</script>    <script type="text/javascript"> document.write(unescape("%3Cscript src='https://tongji.51cto.com/cto.js/d54cb05adfc38c1804f9ee1cf9ade6e0' type='text/javascript'%3E%3C/script%3E")); </script>
</body>
</html>
