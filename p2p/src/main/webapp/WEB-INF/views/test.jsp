<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/19
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <style>
        /*幻灯片*/
        .ppt{ width:270px; height:330px; border:1px solid #ccc; position:relative;}
        .ppt img{ position: absolute; top:10px; left:7px; width:255px; height:310px; overflow:hidden;}
        .pptNum{ position: absolute; height: 13px; line-height: 14px; bottom:12px; right: 10px; }
        .pptNum span{ font-size: 12px; font-weight: 400; color: #FFF; float: right; display: block; width: 24px; text-align: center; background: #000; border-left: solid 1px #FFF; cursor: pointer; }
        .pptNum .normal{ text-indent: 50px;
            overflow: hidden;
            width: 12px;
            height: 12px;
            background-color: #fff;
            display: block;
            border-radius: 50%;
            opacity: .5;
            filter: progid: DXImageTransform.Microsoft.Alpha(opacity=50);
            float: left;
            margin: 0 8px;
            transition: opacity 1s;
            -moz-transition: opacity 1s;
            -webkit-transition: opacity 1s;
            -o-transition: opacity 1s;
            box-shadow: 0 0 3px #272727; }
        .pptNum .cur{ opacity: 1;
            filter: progid: DXImageTransform.Microsoft.Alpha(opacity=100); }
    </style>
</head>
<body>
<div class="ppt">
    <a href="###"><img src="<%=path %>/static/p2p/201704281355082037.jpg" /></a>
    <a href="###" style="display:none;"><img src="<%=path %>/static/p2p/201707101417398884.jpg" /></a>
    <a href="###" style="display:none;"><img src="<%=path %>/static/p2p/20171018160753035.jpg" /></a>
    <a href="###" style="display:none;"><img src="<%=path %>/static/p2p/201707101417398884.jpg" /></a>
    <div class="pptNum">
        <span class="normal">4</span>
        <span class="normal">3</span>
        <span class="normal">2</span>
        <span class="cur normal">1</span>
    </div>
</div>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script>
    (function ($) {
        $.fn.extend({
            "ppting": function (t) {
                var num = 4; //共多少张要轮播的
                var $this = $(this), i = 0, $pics = $('.ppt'), autoChange = function () {
                    var $currentPic = $pics.find('a:eq(' + (i + 1 === num ? 0 : i + 1) + ')');
                    $currentPic.css({
                        display: 'block'
                    }).siblings('a').css({
                        display: 'none'
                    });
                    $pics.find('.pptNum>span:contains(' + (i + 2 > num ? num - i : i + 2) + ')').attr('class', 'cur normal').siblings('span').attr('class', 'normal');
                    i = i + 1 === num ? 0 : i + 1;
                }, st = setInterval(autoChange, t || 2000);
                $this.hover(function () {
                    clearInterval(st);
                }, function () { st = setInterval(autoChange, t || 2000) });
                $pics.find('.pptNum>span').click(function () {
                    i = parseInt($(this).text(), 10) - 2;
                    autoChange();
                });
            }
        });
    }(jQuery));
    $('.ppt').ppting(2000);
</script>
</html>



