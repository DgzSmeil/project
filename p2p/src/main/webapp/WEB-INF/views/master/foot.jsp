<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/20
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="ajaxFooter">
    <div class="mod-sidebar">
        <ul>
            <li><a target="_blank" href="tencent://message/?uin=3036302675&amp;Site=&amp;Menu=yes" class="sidebar-qq"></a></li>
            <li><a href="javascript:;" class="sidebar-wx"></a></li>
            <li><a href="<%=path%>/jkb/calc" class="sidebar-cl"></a></li>
            <li><a href="javascript:;" class="wenquan" title="填写即送5元代金券"></a></li>
            <li><a href="javascript:void(0);" onclick="gotop();" class="sidebar-top"></a></li>
            <span style="display: none"><a href="#top" id="go_top"></a></span>
        </ul>
    </div>
    <!-- concat -->
    <div class="index-concat">
        <div class="wrap cl">
            <div class="index-concat-left">
                <img src="<%=path %>/static/p2p/index_erweima.png" alt="扫码关注普金资本">
            </div>
            <div class="index-concat-phone">
                <p>财富热线</p>
                <h3>400-606-2079</h3>
            </div>
            <div class="index-concat-channel">
                <p class="about_cel_text">
                    <a target="_blank" href="http://weibo.com/pujinziben" class="about_wb"></a>
                    <a href="javascript:void(0);" class="about_wx line_02">
						<span class="line_l_h">
							<span class="line_l_sj"></span>
							<span class="line_l_text">关注普金资本公众号</span>
							<span class="line_l_pic"></span>
						</span>
                    </a>
                    <a target="_blank" href="tencent://message/?uin=2311960484&amp;Site=&amp;Menu=yes" class="about_qq"></a>
                    <a href="javascript:void(0);" class="about_wx about_rr">
						<span class="line_l_j">
							<span class="line_l_sj"></span>
							<span class="line_l_texts">400-606-2079</span>
						</span>
                    </a>
                </p>
                <p class="about_cel_no">admin@pujinziben.com</p>
            </div>
            <div class="index-concat-link cl">
                <a href="javascript:;" class="title">友情链接</a>
                <a target="_blank" href="http://www.p2peye.com/">网贷天眼</a>
                <a target="_blank" href="http://www.wdtianxia.com/">网贷天下</a>
                <a target="_blank" href="http://bank.pingan.com/">中国平安银行</a>
                <a target="_blank" href="http://www.ccb.com/cn/home/indexv3.html">中国建设银行</a>
                <a target="_blank" href="http://www.wangdaidongfang.com/">网贷东方</a>
                <a target="_blank" href="http://www.p2p001.com/">第一网贷</a>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="wrap">
            <p class="text">
                版权所有 © 普金资本运营（赣州）有限公司 All rights reserved <br>
                备案确认书：<a href="http://www.miitbeian.gov.cn/publish/query/indexFirst.action" target="_blank" class="beian">赣ICP备16004010号</a>
                <a href="http://new.cnzz.com/v1/login.php?siteid=1260871948" target="_blank">  <img src="<%=path %>/static/p2p/CNZZ.png" alt=""></a>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=36070202000195" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;" class="beian"><img src="<%=path %>/static/p2p/beian.png" style="float:left;">赣公网安备 36070202000195号</a>
            </p>
            <div class="footer-list" style="width:650px;text-align:center">
                <a id="___szfw_logo___" href="https://credit.szfw.org/CX05252017016185201512.html" target="_blank">
                    <img src="<%=path %>/static/p2p/foot2.png" border="0">
                </a>
                <a href="https://www.yunaq.com/analytics/login/?site=pujinziben.com" target="_blank">
                    <img src="<%=path %>/static/p2p/ft_link_02.png" alt="">
                </a>
                <a href="http://si.trustutn.org/info?sn=685170725000594426611&amp;certType=4" target="_blank">
                    <img width="110px" height="40px" src="<%=path %>/static/p2p/p2p_bottom_large_img.jpg" alt="">
                </a>
                <a href="https://v.pinpaibao.com.cn/authenticate/cert/?site=www.pujinziben.com&amp;at=business" target="_blank">
                    <img src="<%=path %>/static/p2p/ft_link_04.png" alt="">
                </a>
                <a target="_blank" href="http://ec.eqixin.com/?sn=QX3712005910061483682343">
                    <img width="112px" height="34px" src="<%=path %>/static/p2p/foot1.png">
                </a>
            </div>
        </div>
    </div>
    <div class="popup wechart-box">
        <p class="title left">关注普金资本微信公众号</p>
        <a href="javascript:void(0);" class="close icon icon-close"></a>
        <div class="popup-from">
            <img class="wechart" src="<%=path %>/static/p2p/wechart.jpg">
        </div>
    </div>
</div>

</body>
<script>
    function gotop() {
        document.getElementById("go_top").click();
    }
</script>
</html>
