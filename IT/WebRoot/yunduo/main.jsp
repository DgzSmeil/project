<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>云朵课堂</title>
    <link rel="stylesheet" type="text/css" href="yunduo/css/base.css">
    <link rel="stylesheet" type="text/css" href="yunduo/css/animate.css">
    <link rel="stylesheet" type="text/css" href="yunduo/css/lightbox.css">
    <link rel="stylesheet" type="text/css" href="yunduo/css/idangerous.swiper.css">
    <link rel="shortcut icon" href="image/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="yunduo/css/index.css">
    
    <link type="text/css" rel="stylesheet" href="yunduo/css/style.css" />
	<script type="text/javascript" src="yunduo/js/jquery-1.8.3.min.js"></script>
	
    <script type="text/javascript" src="yunduo/js/html5.js"></script>
    <script type="text/javascript" src="yunduo/js/jquery.min.js"></script>
    <script type="text/javascript">
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "js/hm.js";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
 function gotoRegister() {
            var url = 'yunduo/registerPage.html';
            var params = location.href.split("?")[1];
            
                url += '?';
                url += "utm_url=" + encodeURI(location.href);
            //location.href=url;
            window.open(url);
        }

  
        function gotoOffer() {
            var url = 'price.html';
            var params = location.href.split("?")[1];
            if (params) {
                url += '?' + params;
                url += "&utm_url=" + encodeURI(location.href);
            }

            //location.href=url;
            window.open(url);
        }
        $(document).on("scroll", function() {
            var scrollTop = $(document).scrollTop();
            if (scrollTop >= 422) {
                $(".nav").addClass("nav2");
            } else {
                $(".nav").removeClass("nav2");
            }
        })

       var thisUrl=window.location.href;
     function addlxContent(){
        var name=$("#lxPhoe").val();
        var mobile=$("#lxMobile").val();
        var email=$("#lxContent").val();
        var qq=$("#lxQQ").val();
        isOk=isRightMobile(mobile);
        if(isOk){
            $.ajax({
                url: "http://manage.yunduoketang.com/leaveWords",
                type: "get",
                dataType: "jsonp",
                data:{
                    "name":name,
                    "mobile":mobile,
                    "qq":qq,
                    "contens":email,
                    "thisUrl":thisUrl
                },
                jsonp: "callback",
                success: function(data) {
                    
                },
                complete:function(){
                    alert("留言成功,我们会尽快给您联系");
                }
            });
        }
    }
    function addSqContent(type){
        if(type){
            sqName = $("#sqName"+type).val();
            sqMobile = $("#sqMobile"+type).val();
            isOk=isRightMobile(sqMobile);
            if(isOk){
                $.ajax({
                    url: "http://manage.yunduoketang.com/leaveWords",
                    type: "get",
                    dataType: "jsonp",
                    data:{
                        "name":sqName,
                        "mobile":sqMobile,
                        "thisUrl":thisUrl
                    },
                    jsonp: "callback",
                    success: function(data) {
                       
                    },
                    complete:function(){
                        alert("留言成功");
                    }
                });
            }
        }
    }
    function isRightMobile(mobile){
        if(mobile.length<=0){
            alert("请输入手机号");
            return false;
        }
        if(isNaN(mobile)){
            alert("请输入正确的手机号");
            return false;
        }
        if(mobile.length!=11){
            alert("请输入正确的手机号");
            return false;
        }
        var myMobile = /^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
        if(!myMobile.test(mobile)) 
        { 
            alert('请输入有效的手机号码！'); 
            return false;
        } 
        return true;
    }


    </script>
    <!--[if lt IE 10]>
    <script src="js/ie8.js"></script>
    <![endif]-->
    <script>
        var _hmt = _hmt || [];

        (function() {

            var hm = document.createElement("script");

            hm.src = "//hm.baidu.com/hm.js?e23da8729371a8208597067d4c986ad0";

            var s = document.getElementsByTagName("script")[0];

            s.parentNode.insertBefore(hm, s);

        })();

    </script>
    <script src="yunduo/js/lib/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="yunduo/js/lib/raphael-min.js"></script>
    <script type="text/javascript" src="yunduo/js/res/chinaMapConfig.js"></script>
    <script type="text/javascript" src="yunduo/js/map-min.js"></script>
    <style>
        *{margin:0;padding:0;border: none;}
        body { color: #333; text-align: center; font: 12px "微软雅黑";background-color: #dcf5ed; }
        .mapTipText{width: 280px;height: 110px;background-color: #ffffff;}
        .mapTipText .mapTipImg{height: 66px; width: 66px; float: left;border: 2px solid #ffffff; border-radius: 50%;overflow: hidden;margin: -12px 5px 0 -12px;}
        .mapTipText .mapTipImg img{width: 100%;height: 100%;}
        .mapTipText .mapTipList{float: left;margin-left: 4px;}
        .mapTipText .mapTipList h2{text-align: left;}
        .mapTipText .mapTipList h2 a{font-size: 24px; color: #262626;text-decoration:none;}
        .mapTipText .mapTipList h2 a:hover{ color: #0085d2;}
        .mapTipText .mapTipList h2 a span{font-size: 16px;margin-left: 3px;}
        .mapTipText .mapTipList ul{ width: 203px;padding-right: 10px;}
        .mapTipText .mapTipList ul li{list-style: none;float: left;padding: 7px 3px 0 3px;}
        .mapTipText .mapTipList ul li a{color: #262626;text-decoration:none;}
        .mapTipText .mapTipList ul li a:hover{background-color:#2ebcfe;color:#ffffff;}
    </style>
    <script type="text/javascript">
        $(function(){
            $('#ChinaMap').SVGMap({
                mapWidth: 806,
                mapHeight: 396
            });
        });
    </script>
</head>

<body>
 <div class="body" style="background-color:grey">
   <img src="images/pic3/footerpic.png" height="500">
 </div>
 <div class="body" style="background-color:#fff">
 		<section class="ft" style="background-color:grey">
            <img src="images/pic3/banner.jpg" height="500">
            <div class="f-box">
                <p class="title">即刻启程：开启您的在线教育网校</p>
                <p class="caption">互联网让学习更加便利，云朵课堂让所有机构5分钟拥有自己独立网校，我们生活在一个充满无限可能的时代，在线教育让人人都能享受优质教育的机会， 我们的理想，就是将世界上最优质的教育资源，专递到地球的每一个角落。
                </p>
                <br>
                <a href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057197')">开通网校点击咨询</a>
                <a href="javascript:gotoRegister();" style="margin-left:20px;">点击注册免费试用</a>
            </div>
        </section>
     </div>
        <header>
        <div class="nav w1259">
            <div class="logo"><img src="images/logo.png"></div>
            <div class="links">
                <a href="<%=basePath %>mainservlet?order=main" class="">首页</a>
                <a href="#live" class="">平台介绍 </a>
                <a href="#video" class="">免费试看</a>
                <a href="#erp" class="">教学理念</a>
                <a href="price.html" target="_blank" class="">服务范围</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="javascript:gotoRegister();" style="border:solid 2px #fff;border-radius:5px;">免费试用</a>
                <a href="#" class="tc">登录</a>
                <b href="javascript:void(0);" style="color:#fff; font-size: 18px"><img src="images/pic1/phone_ico.png"
                                                            style="margin:3px 10px -2px 30px">156-7976-0329</b>
            </div>
        </div>
    </header>
    <div class="body">
        <section class="sec1">
            <div class="title-newly">在线教育迎来“风口”时代，大数据，催生教育平台</div>
            <div class="chart-content">
                <div class="chart-box">
                    <div class="chart-title"><span>7000</span>多万在线教育用户，以<span>15%</span>的速度增长</div>
                    <div id="usersnum" class="echa" style="height:280px;width: 460px;"></div>
                    <div class="exp">
                        <p>据艾瑞咨询数据显示，2017年在线教育用户规模为7769.9</p>

                        <p>万人，同比增长20%，未来几年，在线教育用户将保持15%</p>

                        <p>以上的速度继续增长，到2017年将达到1.2亿人</p>
                    </div>
                </div>
                <div class="chart-box" style="padding-bottom:50px;">
                    <div class="chart-title"><span>900</span>多亿的在线教育市场规模</div>
                    <div id="marketsize" class="echa" style="height:280px"></div>
                    <div class="exp">
                        <p>2017年在线教育市场规模达到1700亿，同比增长速度为</p>

                        <p>20%， 随着在线教育用户群体的不断扩大，还将有更大的发</p>

                        <p>展， 预计到2027年达2733.9亿</p>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </section>
        <section class="sec6" id="live">

            <div class="tt wow fadeInUp">

                <div class="title">热门课程精选</div>

            </div>

            <div class="live-btn">
                <ul class="live-btn-box">
                   <c:forEach items="${courselist}" var="c">
	                   	<li class="flip-container">
	                        <div href="#" class="flipper">
	                            <div class="front ">
	                                <div class="btn-pic p1"><img src="${c.picture_url}" width="200" height="100"></div>
	                                <p>
	                                	课程名称：${c.course_name}<br>
	                                	￥<font color="red" size="4">${c.price}</font>
	                                </p>
	                            </div>
	                            <div class="back ">
	                                <div>
	                                	课程简介：${c.introduce}<br>
	                                	课程寄语：${c.one_word}<br>
	                                	发布时间：${c.replay_date}
	                                </div>
	                            </div>
	                        </div>
	                    </li>
                   </c:forEach>
                    
                </ul>
                <div class="clear"></div>

            </div>
            <div class="btns">

                <a class="btn btn-primary" href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057180')">我要去登录</a>

                <a class="btn btn-primary" href="javascript:gotoRegister();">免费体验直播系统</a>

            </div>
        </section>
       <section class="sec9">
            <div class="content w1259 bgf8" style="background-color:grey">
                <div class="center-box clear">
                    <div class="itemCon" style="float: left">
				        <div id="ChinaMap" style="margin: 0px;"></div>
				        <div id="stateTip" style="position: absolute;text-align: left;display: inline;"></div>
		    		</div>
		    		<div><font color="blue" size="5">省份览表</font></div>
                </div>
            </div>
        </section>
        <section class="sec6" id="live">

            <div class="tt wow fadeInUp">

                <div class="title">著名讲师列表</div>

            </div>

            <div class="live-btn">
                <ul class="live-btn-box">
                   <c:forEach items="${teacherlist}" var="c">
	                   	<li class="flip-container">
	                        <div href="#" class="flipper">
	                            <div class="front ">
	                                <div class="btn-pic p1"><img src="${c.teacherpictureurl}" width="100" height="100"></div>
	                                <p>${c.teachername}->>>
	                                	<c:if test="${c.teachersex==0}">
	                                		男
	                                	</c:if>
	                                	<c:if test="${c.teachersex!=0}">
	                                		女
	                                	</c:if>
	                                </p>
	                            </div>
	                            <div class="back ">
	                                <div>
	                                	简介：${c.teacherjianjie}<br>
	                                	特长：${c.teacherspecial}<br>
	                                	学历：${c.teachereducation}<br>
	                                	email:${c.teacheremail}
	                                </div>
	                            </div>
	                        </div>
	                    </li>
                   </c:forEach>
                    
                </ul>
                <div class="clear"></div>

            </div>

            <div class="btns">

                <a class="btn btn-primary" href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057180')">在线直播点击咨询</a>

                <a class="btn btn-primary" href="javascript:gotoRegister();">免费体验直播系统</a>

            </div>
        </section>
        <section class="sec3 q_box">
            <div class="cont">
                <div class="img fl"><img src="./images/pic6/benfit_02.png" alt="" /></div>
                <div class="right fr tt wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
                    <div class="title" style="height: 90px; line-height: 90px; padding-top: 50px;">本平台的优势</div>
                    <p>提供智能化操作，对用户的资产进行绝对性的保护！提供优质的反馈服务！让用户充分提供信息，让本平台做的更加强大</p>
                </div>
            </div>
        </section>
        <section class="sec4 q_box">
            <div class="itm-wrap">
                <div class="itm">
                    <div class="itm-block wow bounceInLeft animated" style="margin-bottom: 70px; visibility: visible; animation-delay: 0.1s; animation-name: bounceInLeft;" data-wow-duration="0.5" data-wow-delay="0.1s">
                        <h1>对学习的好处</h1>

                        <p>改变了传统的教学模式！跟上数据化时代！ </p>
                    </div>
                    <div class="itm-block wow bounceInLeft animated" data-wow-duration="0.5" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: bounceInLeft;">
                        <h1>节省硬件资金投入</h1>

                        <p>无需购买服务器、机柜、机房、带宽，帮您每年节省十几万</p>
                    </div>
                </div>
                <div class="itm img wow rubberBand animated q_sprit" style="visibility: visible; animation-name: rubberBand;">
                    <div class="words">
                        <h1>没有资金也能学习<br>提供大量的免费视频！</h1>

                        <p>
                            本平台提供专业的SAAS服务，大大降低了教 育培训的机构进入在线教育行业的门槛
                            <br>让教育机构无需百万研发资金投入，仅需千
                            <br>元就能快速、高质量的开展自主品牌的
                            <br>在线教育课程
                        </p>
                        <a class="btn btn-primary" href="javascript:gotoRegister()" onclick="event.stopPropagation();" style="border: none; background:none;">点击注册免费试用</a>
                    </div>
                </div>
                <div class="itm">
                    <div class="itm-block wow bounceInRight animated" style="margin-bottom: 70px; visibility: visible; animation-delay: 0.1s; animation-name: bounceInRight;" data-wow-duration="0.2" data-wow-delay="0.1s">
                        <h1>无需长时间等待</h1>

                        <p>下单即可观看视频！让你无须等待！</p>
                    </div>
                    <div class="itm-block wow bounceInRight animated" data-wow-duration="0.5" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: bounceInRight;">
                        <h1>讲师的等级由你决定！</h1>

                        <p>用户体验和系统功能每周迭代更新，工作人员24小时全方位服务</p>
                    </div>
                </div>
                <div class="ueser-box" style="padding-bottom: 40px;">
                    <div class="urser-cont clear">
                        <div class="user-icon user-icon1"><img src="images/pic6/iconfont-teacher.png" alt=""></div>
                        <div class="uer-info user-name">
                            <input type="text" id="sqName4" placeholder="输入姓名">
                        </div>
                        <div class="user-icon"><img src="images/pic6/iconfont-dianhua.png" alt=""></div>
                        <div class="uer-info user-phone">
                            <input type="text" id="sqMobile4" placeholder="输入建议">
                        </div>
                        <div class="try user-btn"><a href="javascript:void(0);" onclick="javascript:addSqContent(4);">确认反馈</a></div>
                        <div class="set-school user-btn"><a href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057179')">在线咨询</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="sec5">
            <div style="width:1100px;" class="w1100 clear">
                <div class="fl">
                    <div class="content">
                        <div class="cc tt wow fadeInDown">
                            <img src="images/pic1/pic1_r13_c4.png" alt="">

                            <p>独立管理自己的资料</p>
                        </div>
                        <div class="cc tt wow fadeInDown">
                            <img src="images/pic1/pic1_r13_c14.png" alt="">

                            <p>自定义头像</p>
                        </div>
                        <div class="cc n-border tt wow fadeInDown">
                            <img src="images/pic1/pic1_r14_c19.png" alt="">

                            <p>学你所想学</p>
                        </div>
                        <div class="cc-line"></div>
                        <div class="cc tt wow fadeInUp">
                            <img src="images/pic1/pic1_r14_c26.png" alt="">

                            <p>2台高配云服务器部署</p>
                        </div>
                        <div class="cc tt wow fadeInUp">
                            <img src="images/pic1/pic1_r14_c35.png" alt="">

                            <p>200百兆带宽保障，绝对不卡！</p>
                        </div>
                        <div class="cc n-border tt wow fadeInUp">
                            <img src="images/pic1/pic1_r14_c40.png" alt="">

                            <p>在线支付即时到账，和提现</p>
                        </div>
                    </div>
                </div>
                <div class="fr" style="width: 500px">
                    <div class="tt wow fadeInUp">
                        <div class="title">平台承诺
                            <br/>让用户放心</div>
                        <div class="sub-title">提供一站式建站服务：空间，提供高配服务器，可全部由我们提供</div>
                        <div class="sub-title">您只需要购买平台课程，提供你的资金，即刻拥有自己在线教育资源</div>
                        <div class="btns">
                            <a class="btn btn-primary" href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057183')">索取网校解决方案</a>
                            <a class="btn btn-primary" href="javascript:gotoRegister();">点击注册免费试用</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="sec7" id="video">
            <div class="tt wow fadeInUp">
                <div class="title">录播授课9项辅助教学功能 在线教学更随心</div>
                <div class="sub-title">提供专业的学习体验，绝不仅是视频浏览，包含课程大纲、自动上次</div>
                <div class="sub-title">播放、收藏、评论打分等功能，还有相关资料、重点提醒、章节选择</div>
            </div>
            <div class="content w1259">
                <div class="cc">
                    <img class="k12 wow flipInY" src="images/pic4/icon_11_r1_c1.png">

                    <p>自定义章节学习</p>
                </div>
                <div class="cc">
                    <img class="zy wow flipInY" src="images/pic4/icon_11_r1_c4.png">

                    <p>课程笔记回看</p>
                </div>
                <div class="cc">
                    <img class="jy wow flipInY" src="images/pic4/icon_11_r1_c8.png">

                    <p>课程内容收藏</p>
                </div>
                <div class="cc">
                    <img class="yy wow flipInY" src="images/pic4/icon_11_r1_c12.png">

                    <p>课程评论打分</p>
                </div>
                <div class="cc">
                    <img class="xq wow flipInY" src="images/pic4/icon_11_r1_c15.png">

                    <p>学习进度跟踪</p>
                </div>
                <div class="cc">
                    <img class="xq wow flipInY" src="images/pic4/icon_11_r1_c17.png">

                    <p>防录屏安全设置</p>
                </div>
            </div>
            <div class="content w1259">
                <div class="cc">
                    <img class="k12 wow flipInY" src="images/pic4/icon_11_r3_c1.png">

                    <p>课程观看有效期</p>
                </div>
                <div class="cc">
                    <img class="zy wow flipInY" src="images/pic4/icon_11_r3_c3.png">

                    <p>观看次数限制</p>
                </div>
                <div class="cc">
                    <img class="jy wow flipInY" src="images/pic4/icon_11_r3_c7.png"></img>

                    <p>课件共享下载</p>
                </div>
                <div class="cc">
                    <img class="yy wow flipInY" src="images/pic4/icon_11_r3_c11.png"></img>

                    <p>移动终端查看</p>
                </div>
                <div class="cc">
                    <img class="xq wow flipInY" src="images/pic4/icon_11_r3_c15.png"></img>

                    <p>视频秒速缓冲</p>
                </div>
                <div class="cc">
                    <img class="xq wow flipInY" src="images/pic4/icon_11_r3_c17.png"></img>

                    <p>多格式视频上传</p>
                </div>
            </div>
            <div class="btns">
                <a class="btn btn-primary" href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057181')">录播功能点击咨询</a>
                <a class="btn btn-primary" href="javascript:gotoRegister();">点击注册免费试用</a>
            </div>
        </section>
        <section class="sec9">
            <div class="content w1259 bgf8" style="background-color:grey">
                <div class="title">网校考试题库功能&nbsp;随堂测验智能组卷</div>

                <div class="sub-title">老师随时组织知识竞赛、布置课外作业、安排章节练习、随堂测验</div>

                <div class="sub-title">智能组卷、答卷评阅与成绩管理等众多功能</div>

                <div class="center-box clear">
                    <div class="bgimg1">
                        <p>多种题库管理模块</p>

                        <p class="bgimg-con">提供单选题、多选题、填空题、判断题、简单题、案例题等多种类型试题编制工具，并能对试题进行分类管理。</p>

                        <div onclick="doyoo.util.openChat('g=10057178')" class="low-btn low-1">点击了解详情</div>
                    </div>
                    <div class="bgimg2">
                        <p>自定义考试管理模块</p>

                        <p class="bgimg-con">试卷管理中管理员可选取题库中的试题进行组卷，问卷功能灵活，用户可自定义试卷标题、分值、时间、难度系数等。</p>

                        <div onclick="doyoo.util.openChat('g=10057178')" class="low-btn low-2">点击了解详情</div>
                    </div>
                    <div class="bgimg3">
                        <p>自动阅卷与评卷</p>

                        <p class="bgimg-con">根据试卷不同的题型进行识别，若为客观题将提供系统自动阅卷功能；若为主观题，将为管理员提供评卷功能。</p>

                        <div onclick="doyoo.util.openChat('g=10057178')" class="low-btn low-3">点击了解详情</div>
                    </div>
                </div>
            </div>
        </section>
        
       
        <section class="sec13">

            <div class="tt wow fadeInUp">

                <div class="title">从建站到上课一站式研发服务 &nbsp;&nbsp;邀你免费体验</div>

                <div class="sub-title">10秒注册完成，支持PC、pad、手机微信 在线体验</div>

                <div class="sub-title">赠送20个直播并发 20GB空间/流量</div>

            </div>

            <div class="online-btn">

                <ul class="online-btn-box">
                    <li class="">
                        <div>
                            <img src="images/pic5/fan_pic_03.png" alt="" />
                        </div>
                        <p>独立域名网校</p>
                    </li>
                    <li class="">
                        <div>
                            <img src="images/pic5/fan_pic_05.png" alt="" />
                        </div>
                        <p>在线直播课程</p>
                    </li>
                    <li class="">
                        <div>
                            <img src="images/pic5/fan_pic_07.png" alt="" />
                        </div>
                        <p>录播课程学习</p>
                    </li>
                    <li class="">
                        <div>
                            <img src="images/pic5/fan_pic_09.png" alt="" />
                        </div>
                        <p>在线考试题库</p>
                    </li>
                    <li class="">
                        <div>
                            <img src="images/pic5/fan_pic_11.png" alt="" />
                        </div>
                        <p>师生讨论小组</p>
                    </li>
                    <li class="border-r">
                        <div>
                            <img src="images/pic5/fan_pic_14.png" alt="" />
                        </div>
                        <p>直播公开课</p>
                    </li>
                    <li class="">
                        <div>
                            <img src="images/pic5/fan_pic_22.png" alt="" />
                        </div>
                        <p>课程收藏评论</p>
                    </li>
                    <li class="">
                        <div>
                            <img src="images/pic5/fan_pic_25.png" alt="" />
                        </div>
                        <p>手机微信课堂</p>
                    </li>
                    <li class="">
                        <div>
                            <img src="images/pic5/fan_pic_29.png" alt="" />
                        </div>
                        <p>在线支付交易</p>
                    </li>
                    <li class="">
                        <div>
                            <img src="images/pic5/fan_pic_23.png" alt="" />
                        </div>
                        <p>短信邮件通知</p>
                    </li>
                    <li class="">
                        <div>
                            <img src="images/pic5/fan_pic_31.png" alt="" />
                        </div>
                        <p>教学资源管理</p>
                    </li>
                    <li class="border-r">
                        <div>
                            <img src="images/pic5/fan_pic_27.png" alt="" />
                        </div>
                        <p>智能排课功能</p>
                    </li>
                    <li class="border-b">
                        <div>
                            <img src="images/pic5/fan_pic_42.png" alt="" />
                        </div>
                        <p>学员档案管理</p>
                    </li>
                    <li class="border-b">
                        <div>
                            <img src="images/pic5/fan_pic_44.png" alt="" />
                        </div>
                        <p>用户权限管理</p>
                    </li>
                    <li class="border-b">
                        <div>
                            <img src="images/pic5/fan_pic_46.png" alt="" />
                        </div>
                        <p>新闻资讯公告</p>
                    </li>
                    <li class="border-b">
                        <div>
                            <img src="images/pic5/fan_pic_48.png" alt="" />
                        </div>
                        <p>数据报表统计</p>
                    </li>
                    <li class="border-b">
                        <div>
                            <img src="images/pic5/fan_pic_39.png" alt="" />
                        </div>
                        <p>网校营销设置</p>
                    </li>
                    <li class="border-r border-b">
                        <div>
                            <img src="images/pic5/fan_pic_41.png" alt="" />
                        </div>
                        <p>网校模板配置</p>
                    </li>
                </ul>
                <div class="clear"></div>

            </div>

            <div class="ueser-box" style="padding-bottom: 40px;">
                <div class="urser-cont clear">
                    <div class="user-icon user-icon1"><img src="images/pic6/iconfont-teacher.png" alt=""></div>
                    <div class="uer-info user-name">
                        <input type="text" id="sqName13" placeholder="输入姓名">
                    </div>
                    <div class="user-icon"><img src="images/pic6/iconfont-dianhua.png" alt=""></div>
                    <div class="uer-info user-phone">
                        <input type="text" id="sqMobile13" placeholder="输入电话">
                    </div>
                    <div class="try user-btn"><a href="javascript:void(0);" onclick="javascript:addSqContent(13);">免费开通试用</a></div>
                    <div class="set-school user-btn"><a href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057179')">搭建网校咨询</a>
                    </div>
                </div>
            </div>

        </section>
        <section class="sec14 q_box">
            <div class="tt wow fadeInUp">
                <div class="title">自定义界面展示 多套风格可供选择</div>
                <div class="sub-title">系统配置多套精美模板可供选择，仅需一键更换应用
                    <br>模板，轻松的进行模板界面自定义修改</div>
            </div>
            <div class="content">
                <a class="arrow-left" href="javascript:void(0);"></a>
                <a class="arrow-right" href="javascript:void(0);"></a>

                <div class="swiper-container">
                    <div class="swiper-wrapper clear">
                        <div class="swiper-slide">
                            <a href="images/sample4.jpg" class="show show2" data-lightbox="roadtrip">
                                <img src="images/sample4.jpg" width="100%" alt="">
                                <span>
                                <button>查看示例</button>
                            </span>
                            </a>
                        </div>
                        <div class="swiper-slide">
                            <a href="images/sample5.jpg" class="show show2" data-lightbox="roadtrip">
                                <img src="images/sample5.jpg" width="100%" alt="">
                                <span>
                                <button>查看示例</button>
                            </span>
                            </a>
                        </div>
                        <div class="swiper-slide">
                            <a href="images/sample1.jpg" class="show show1" data-lightbox="roadtrip">
                                <img src="images/sample1.jpg" width="100%" alt="">
                                <span>
                                <button>查看示例</button>
                            </span>
                            </a>
                        </div>
                        <div class="swiper-slide">
                            <a href="images/sample2.jpg" class="show show2" data-lightbox="roadtrip">
                                <img src="images/sample2.jpg" width="100%" alt="">
                                <span>
                                <button>查看示例</button>
                            </span>
                            </a>
                        </div>
                        <div class="swiper-slide">
                            <a href="images/sample3.jpg" class="show show1" data-lightbox="roadtrip">
                                <img src="images/sample3.jpg" width="100%" alt="">
                                <span>
                                    <button>查看示例</button>
                                </span>
                            </a>
                        </div>
                        <div class="swiper-slide">
                            <a href="images/sample4.jpg" class="show show2" data-lightbox="roadtrip">
                                <img src="images/sample4.jpg" width="100%" alt="">
                                <span>
                                <button>查看示例</button>
                            </span>
                            </a>
                        </div>
                        <div class="swiper-slide">
                            <a href="images/sample5.jpg" class="show show2" data-lightbox="roadtrip">
                                <img src="images/sample5.jpg" width="100%" alt="">
                                <span>
                                <button>查看示例</button>
                            </span>
                            </a>
                        </div>
                        <div class="swiper-slide">
                            <a href="images/sample1.jpg" class="show show1" data-lightbox="roadtrip">
                                <img src="images/sample1.jpg" width="100%" alt="">
                                <span>
                                <button>查看示例</button>
                            </span>
                            </a>
                        </div>
                        <div class="swiper-slide">
                            <a href="images/sample2.jpg" class="show show2" data-lightbox="roadtrip">
                                <img src="images/sample2.jpg" width="100%" alt="">
                                <span>
                                <button>查看示例</button>
                            </span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="pagination"></div>
            </div>
        </section>
        <section class="sec15 q_box" id="erp">
            <div class="tt wow fadeInUp">
                <div class="title" style="color: #1C6E8B; height: 112px; line-height: 112px;">节约成本 网校ERP功能 省去教务老师时间</div>
            </div>
            <div class="q_sprit" style="width:1056px;">
                <div class="q_item item1 animated flipInY wow tt" style=" visibility: visible; animation-delay: 0.3s; animation-name: flipInY;" data-wow-duration="0.5" data-wow-delay="0.3s">
                    <strong>排课系统</strong>
                    <span>面授课程智能排课老 师教室合理安排 </span>
                </div>
                <div class="q_item item2 animated flipInY wow tt" style=" visibility: visible; animation-delay: 0.3s; animation-name: flipInY;" data-wow-duration="0.5" data-wow-delay="0.3s">
                    <strong>上课通知</strong>
                    <span>学员通知不在漏掉系统 提醒自动短信邮件通知 </span>
                </div>
                <div class="q_item item3 animated flipInY wow tt" style=" visibility: visible; animation-delay: 0.3s; animation-name: flipInY;" data-wow-duration="0.5" data-wow-delay="0.3s">
                    <strong>代报服务</strong>
                    <span>代报材料收集，不会丢失任何学员数据 </span>
                </div>
                <div class="q_item item4 animated flipInY wow tt" style=" visibility: visible; animation-delay: 0.3s; animation-name: flipInY;" data-wow-duration="0.5" data-wow-delay="0.3s">
                    <strong>分期催费</strong>
                    <span>支持学费分期管理 催缴提醒不会丢失</span>
                </div>
                <div class="q_item item5 animated flipInY wow tt" style=" visibility: visible; animation-delay: 0.3s; animation-name: flipInY;" data-wow-duration="0.5" data-wow-delay="0.3s">
                    <strong>报名收费</strong>
                    <span>学员报名，支付宝、微信转账、银联转账  </span>
                </div>
            </div>
            <div class="ueser-box" style="padding-bottom: 40px;">
                <div class="urser-cont clear">
                    <div class="user-icon user-icon1"><img src="images/pic6/iconfont-teacher.png" alt=""></div>
                    <div class="uer-info user-name">
                        <input type="text" id="sqName15" placeholder="输入姓名">
                    </div>
                    <div class="user-icon"><img src="images/pic6/iconfont-dianhua.png" alt=""></div>
                    <div class="uer-info user-phone">
                        <input type="text" id="sqMobile15" placeholder="输入电话">
                    </div>
                    <div class="try user-btn"><a href="javascript:void(0);" onclick="javascript:addSqContent(15);">免费开通试用</a></div>
                    <div class="set-school user-btn"><a href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057179')">搭建网校咨询</a>
                    </div>
                </div>
            </div>

        </section>
        <section class="sec17">
            <div class="title">云朵课堂符合国际信息安全TCSEC标准A类等级</div>
            <div class="sub-title">网校安全稳定性，您的担心我们都会提前想到,我们采用
                <br/>国际信息安全标准保障您的使用安全</div>
            <div class="cont">
                <div class="cont-itm tt wow bounceInLeft" data-wow-delay="0.5s">
                    <h3>学员账户安全性</h3>
                    <div class="words">
                        在数据存储和传输安全方面，用户使用过程中的密码全部通过 最安全的MD5加密算法,避免在使用过程中密码泄露，为机构的信息提供100%安全保障。内部管理中，机构账户数据全部加密我们也无法查看
                    </div>
                    <a href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057189')">网校安全咨询</a>
                </div>
                <div class="cont-itm tt wow bounceInLeft">
                    <h3>视频课程安全性</h3>

                    <div class="words">
                        拥有完善的视频保护机制，添加水印、防下载、ID跑马灯效果， 视频加密，用来有效防止盗链、录屏、下载等盗版途径用作商业用途，切实做到版权无忧
                    </div>
                    <a href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057189')">网校安全咨询</a>
                </div>
                <div class="cont-itm tt wow bounceInRight" data-wow-delay="0.2s">
                    <h3>网校系统稳定性</h3>

                    <div class="words">
                        为保护网校系统安全，在设计中采用了多层次的安全防护措施,顺利通过阿里渗透式测试，使系统最大限度地不被黑客和有意破坏者攻击
                    </div>
                    <a href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057189')">网校安全咨询</a>
                </div>
                <div class="cont-itm tt wow bounceInRight" data-wow-delay="0.5s">
                    <h3>多重安全性保障</h3>

                    <div class="words">
                        采用阿里专业的云盾防火墙和安骑士防护系统，为云朵课堂提供安全防护策略、木马文件检测、 高危漏洞检测和修复，并对系统的安全进行实时监控和管理
                    </div>
                    <a href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057189')">网校安全咨询</a>
                </div>
            </div>
        </section>
        <section class="sec18 q_box">
            <div class="tt wow fadeInUp">
                <div class="title">我们提供私有定制服务&nbsp;&nbsp;满足您的独特需求</div>
                <div class="sub-title">多模块多功能供您选择，多种主流网校风格任你选</div>
                <div class="sub-title">尊贵定制化功能、量身打造您的独立网校</div>
            </div>
            <div class="content" style="position:relative;">
                <ul>
                    <li>
                        <div><img src="images/pic1/pic1_r11_c5.png" />

                            <p>职业教育类</p>
                        </div>
                        <div><img src="images/pic1/pic1_r11_c24.png" />

                            <p>兴趣培训类</p>
                        </div>
                    </li>
                </ul>
                <a class="arrow-left" href="javascript:void(0);"></a>
                 <a class="arrow-right" href="javascript:void(0);"></a>
            </div>
            <div class="btns" style="margin-top: 0;">
                <a class="btn btn-primary" href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057182')">更多模板点击查看</a>
                <a class="btn btn-primary" href="javascript:gotoRegister();">点击注册免费试用</a>
            </div>
        </section>
        <section class="sec19">
            <img src="images/pic6/seven.png" alt="" />
            <div class="w1100">
                <div class="title tt wow slideInUp">十年以上教育系统研发经验 提供专业品质保障</div>
                <h3 class="tt wow rotateIn">团队来自新东方、尚德机构、对啊网、淘宝同学</h3>

                <div class="words">我们为一线教育机构提供超过十年的技术支撑成
                    <br/>功打造业内知名的在线教育平台</div>
            </div>
        </section>
        <section class="sec20">
            <div class="fadeInUp wow tt">
                <div class="title" style="height: 100px; line-height: 100px; margin-bottom: 60px;">为所有在线教育用户提供独立网校</div>
            </div>
            <div class="cont">
                <div class="img q_sprit"></div>
                <p class="q_text pulse animated wow tt" data-wow-duration="0.5" data-wow-delay="0.2s" style="visibility: visible; animation-name: pulse;animation-delay: 0.2s;">免费搭建独立网校 当天即可招生上课</p>
                <div class="q_left part">
                    <div class="item1 q_sprit bounceInLeft animated wow tt" data-wow-duration="0.5" data-wow-delay="0.3s" style="visibility: visible; animation-name: bounceInLeft; animation-delay: 0.3s;">
                        <div>
                            <h3>K12培训类</h3>
                            <p>小学、中学、初中、高中各类学科辅助培训支持1对1教学</p>
                        </div>
                    </div>
                    <div class="item2 q_sprit bounceInLeft animated wow tt" data-wow-duration="0.5" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: bounceInLeft;">
                        <div>
                            <h3>IT职业培训类</h3>
                            <p>会计、人力资源、心理、经济师、建造师、证券等各种成人证书培训</p>
                        </div>
                    </div>
                    <div class="item3 q_sprit bounceInLeft animated wow tt" data-wow-duration="0.5s" data-wow-delay="0.7s" style="visibility: visible; animation-duration: 0.7s; animation-delay: 0.5s; animation-name: bounceInLeft;">
                        <div>
                            <h3>学历培训类</h3>
                            <p>自学考试、高起专、专接本、远程函授、成考、考研培训等成人学历培训</p>
                        </div>
                    </div>
                </div>
                <div class="q_right part">
                    <div class="item1 q_sprit bounceInLeft animated wow tt" data-wow-duration="0.5s" ata-wow-delay="0.3s" style="visibility: visible; animation-duration: 0.5s; animation-delay: 0.3s; animation-name: bounceInRight;">
                        <div style="margin-top:-1px;">
                            <h3>语言类培训</h3>
                            <p>英语四、六级、托福、雅思、韩语、日语、法语等其他语言类培训教学</p>
                        </div>
                    </div>
                    <div class="item2 q_sprit bounceInLeft animated wow tt" data-wow-duration="0.5s" data-wow-delay="0.5s" style="visibility: visible; animation-duration: 0.5s; animation-delay: 0.5s; animation-name: bounceInLeft;">
                        <div style="margin-top: -1px;">
                            <h3>兴趣类培训</h3>
                            <p>舞蹈、瑜伽、手动DIY美术、摄影、美妆、健身减肥等视频在线教学</p>
                        </div>
                    </div>
                    <div class="item3 q_sprit bounceInLeft animated wow tt" data-wow-duration="0.5s" ata-wow-delay="0.7s" style="visibility: visible; animation-duration: 0.5s; animation-delay: 0.7s; animation-name: bounceInRight;">
                        <div style="margin-top: -1px;">
                            <h3>其他类培训</h3>
                            <p>金融行业、医疗内训、电子商务、IT高科技、网络媒体等视频在线教学</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="btns">
                <a class="btn btn-primary" href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057181')">企业案例点击查看</a>
                <a class="btn btn-primary" href="javascript:gotoRegister();">点击注册免费试用</a>
            </div>
        </section>
        <section class="sec21">
            <div class="tt wow fadeInUp">
                <div class="title">拥有独立网校 全面提高您的品牌影响力</div>
            </div>
            <div class="w1100">
                <div class="up-cont clear">
                    <div class="cont-itm">
                        <h3>建立品牌影响力</h3>

                        <div class="cont-itm-word">
                            独立私有的网校，学生直接访问您的域名即可登录上课，品牌宣传效果更好，提高机构在市场的知名度
                        </div>
                    </div>
                    <div class="cont-itm">
                        <h3>提升学员的粘性</h3>

                        <div class="cont-itm-word">
                            个性化的互动学习方法，增强学员活跃度，提升学员粘性
                        </div>
                    </div>
                    <div class="cont-itm">
                        <h3>增加市场覆盖率</h3>

                        <div class="cont-itm-word">
                            通过快速建立网络教学课堂，不受地域限制，面向全国招生，大大降低地域扩张成本
                        </div>
                    </div>
                    <div class="cont-itm">
                        <h3>提升学员转化率</h3>

                        <div class="cont-itm-word">
                            个性化教学服务，课程安排更灵活，满足不同层次学员需求，提升转化率
                        </div>
                    </div>
                    <div class="cont-itm">
                        <h3>提高教学利润率</h3>

                        <div class="cont-itm-word">
                            提高教学资源利用率、降低运营成本,增加机构的利润率
                        </div>
                    </div>
                </div>
                <div class="down-cont">
                    <div class="ueser-box">
                        <div class="urser-cont clear">
                            <div class="user-icon user-icon1"><img src="images/pic6/iconfont-teacher.png" alt=""></div>
                            <div class="uer-info user-name">
                                <input type="text" id="sqName1" placeholder="输入姓名">
                            </div>
                            <div class="user-icon"><img src="images/pic6/iconfont-dianhua.png" alt=""></div>
                            <div class="uer-info user-phone">
                                <input type="text" id="sqMobile1" placeholder="输入电话">
                            </div>
                            <div class="try user-btn"><a href="javascript:void(0);" onclick="javascript:addSqContent(1);">免费开通试用</a>
                            </div>
                            <div class="set-school user-btn"><a href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057179')">搭建网校咨询</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="sec22">
            <div class="up-cont">
                <div class="tt wow fadeInUp">
                    <div class="title">在线教育没有经验怎么做？常见热门问题回答</div>
                </div>
                <div class="hide-box">
                    <div class="m-title title1">如何做好在线教育培训盈利？</div>
                    <div class="m-title title2">如何5分钟搭建独立网校平台？</div>
                    <div class="m-title title3">如何提升在线教育学员导流？</div>
                    <div class="m-title title4">如何开设直播公开课招生？</div>
                    <div class="m-title title5">如何开设高出勤率的直播课堂？</div>
                    <div class="m-title title6">如何录制授学员欢迎录播课程？</div>
                    <div class="m-title title7">如何提升网校的学员报名续费率？</div>
                    <div class="m-title title8">如何实施线上线下结合的运营模式？</div>
                    <div class="m-title title9">如何减少投入增加网校的利润率？</div>
                    <div class="m-title title10">免费用户如何转化为收费学员？</div>
                </div>
            </div>
            <div class="down-cont">
                <div class="ueser-box">
                    <div class="urser-cont clear">
                        <div class="user-icon user-icon1"><img src="images/pic6/iconfont-teacher.png" alt=""></div>
                        <div class="uer-info user-name">
                            <input type="text" id="sqName1" placeholder="输入姓名">
                        </div>
                        <div class="user-icon"><img src="images/pic6/iconfont-dianhua.png" alt=""></div>
                        <div class="uer-info user-phone">
                            <input type="text" id="sqMobile1" placeholder="输入电话">
                        </div>
                        <div class="try user-btn"><a href="javascript:void(0);" onclick="javascript:addSqContent(1);">免费开通试用</a>
                        </div>
                        <div class="set-school user-btn"><a href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057179')">搭建网校咨询</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="sec23" style="padding-bottom:50px;">
            <div class="content">
                <div class="hang">
                    <div class="bg-img wow tt bounceInLeft">
                    	<div style="float:left">
                    		<img src="image/zl.jpg" width="220" height="300">
                    		<div>管理员1</div>
                    	</div>
                    	<div>
                    		<img src="images/1.JPG" width="220" height="300">
                    		<div>管理员2</div>
                    	</div>
                    
                    </div>
                    <div class="wenzi position-r wow tt bounceInRight">
                        <div class="title">终身免费升级服务 我们一直伴您前行</div>
                        <p>每周四版本迭代更新版本，在线解决方案不断升级。</p>

                        <p>免费使用系统所有升级功能，无需支付任何升级费用。</p>

                        <p>在线教育方案的领跑者，让你时刻处于行业领先水平。</p>
                    </div>
                </div>
                <div class="hang">
                    <div class="wenzi wow tt bounceInLeft" data-wow-delay="0.2s">
                        <div class="title"> 仅收取同行业20%的服务费
                            <br> 让教育机构都拥有专业独立网校</div>
                        <p>我们只收取服务器、带宽和空间使用的费用， 以极高的
                            <br>性价比提供教学内容存储、视频点播方案， 让您以最低
                            <br>的成本进军在线教育市场。</p>

                        <div class="btns">
                            <a class="btn btn-primary" href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057194')">服务费用点击咨询</a>
                            <a class="btn btn-primary" href="javascript:gotoRegister();">点击注册免费试用</a>
                        </div>
                    </div>
                    <div class="tu wow tt bounceInRight" data-wow-delay="0.2s">
                        <img src="images/pic3/pci3_r17_c23.png" alt="">
                    </div>
                </div>
            </div>
        </section>
       
        <section class="sec26">
            <div class="title">多次获得新闻媒体报导，在线教育SAAS服务的领跑者</div>
            <div class="content">
                <div class="text">
                    <div class="left">
                        <div class="pic">
                            <img src="images/pic3/pic3.1_r2_c1.png" width="505" height="368" alt="">

                            <div class="wenzi">云朵课堂：服务培训机构向在线教育转化</div>
                        </div>
                    </div>
                    <div class="right">
                        <div class="hang">
                            <div class="pic">
                                <img src="images/pic3/pic3.1_r1_c9.png" width="280" height="182" alt="">

                                <div class="wenzi rightwenzi">中国又一个千亿级的 . . .</div>
                            </div>
                            <div class="pic">
                                <img src="images/pic3/pic3.1_r2_c13.png" width="280" height="182" alt="">

                                <div class="wenzi rightwenzi">为线下机构建网校 . . .</div>
                            </div>
                        </div>
                        <div class="hang">
                            <div class="pic">
                                <img src="images/pic3/pic3.1_r4_c9.png" width="280" height="182" alt="">

                                <div class="wenzi rightwenzi">在线教育行业解码</div>
                            </div>
                            <div class="pic">
                                <img src="images/pic3/pic3.1_r4_c13.png" width="280" height="182" alt="">

                                <div class="wenzi rightwenzi">互联网激活教育“巨变”</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="ft">
            <img src="images/pic3/footerpic.png" height="100%">

            <div class="f-box">
                <p class="title">即刻启程：开启您的在线教育网校</p>

                <p class="caption">互联网让学习更加便利，云朵课堂让所有机构5分钟拥有自己独立网校，我们生活在一个充满无限可能的时代，在线教育让人人都能享受优质教育的机会， 我们的理想，就是将世界上最优质的教育资源，专递到地球的每一个角落。
                </p>
                <br>

                <a href="javascript:void(0);" onclick="doyoo.util.openChat('g=10057197')">开通网校点击咨询</a>
                <a href="javascript:gotoRegister();" style="margin-left:20px;">点击注册免费试用</a>
            </div>
        </section>
    </div>
    <footer class="t-footer">
        <div class="cont">
            <ul class="clear">
                <li><a href="aboutus.html" target="_blank">关于我们</a><i>|</i></li>
                <li><a href="javascript:void(0)">产品服务</a><i>|</i></li>
                <li><a href="javascript:void(0)">产品服务</a><i>|</i></li>
                <li><a href="javascript:void(0)">成功案例</a></li>
            </ul>
            <h2>24小时服务Tel：陈&nbsp;&nbsp;&nbsp;&nbsp;15779093658</h2>

            <p>email:275300091@qq.com</p>

            <div>
                <p class="fl">赣州市宏图软件学院(一班)</p>

                <p class="fr" style="font-size: 12px">版权仅供参考！不得盗版！</p>
            </div>
            <img class="foot-logo" src="http://yunduoketang.oss-cn-beijing.aliyuncs.com/tulan/images/logo.png"></img>
        </div>
    </footer>
    <div class="popup" id="popup">

	<div class="top_nav" id='top_nav'>
		<div align="center">
			<i></i>
			<span>登录账号</span>
			<a class="guanbi"></a>
		</div>
	</div>
	
	<div class="min">
	
		<div class="tc_login">
		
			<div class="left">
				<h4 align="center">手机扫描，赞助一下</h4>
				<div align="center"><img src="yunduo/images/zfb_2yuan.jpg" width="150" height="150" /></div>
				<dd>
					<div align="center">自愿赞助我们 <span style="font-family: 'microsoft yahei'; color: #F60; font-size: 18px;">2</span> 元</div>
				</dd>
			</div>  
		
			<div class="right">
				<form action="<%=basePath %>loginservlet?order=student" method="post" name="form_login" target="_top">
					<c:if test="${msg!=null}">
		            	<script type="text/javascript">
		            		alert("${msg}");
		            	</script>
		            </c:if>
					<div align="left">
						<a href="">短信快捷登录</a>
						<i class="icon-mobile-phone" class="left">
							<input type="text" name="name" id="name" required="required" placeholder="用户名" autocomplete="off" class="input_yh">
						</i>
						<br>
						<i class="icon-mobile-phone" class="left">
							<input type="password" name="password" id="pass" required="required" placeholder="密码" autocomplete="off" class="input_mm">
						</i>
						<i class="icon-mobile-phone" class="left">
							<img src="${pageContext.request.contextPath }/enimg.jsp" width="110" height="40" style="width:110px;float:left;height:39px;margin-top:5px"  id="codes"  alt="点击换一张"  onclick="refresh();">
						</i>
						<i class="icon-mobile-phone" class="right">
							<input type="text" name="code" id="name"  align="left" style="width:110px;float:left;height:37px;margin-top:5px" required="required" placeholder="验证码" autocomplete="off" class="input_yh">  
					    </i>
					</div>
					<div align="center">
						<input type="submit" class="button" title="Sign In" value="登录">
					</div>
				</form>   
				<dd>
					<div align="center"><a href="<%=basePath %>studentservlet?order=add" target="_blank">立即注册</a></div>
				</dd>
				<hr align="center" />
				<div align="center">期待更多功能 </div>
			</div>
		
		</div>
	
	</div>

</div>
<script type="text/javascript">
    	function c(){
    		var check = document.getElementById("check").value;
    		var incheck = document.getElementById("incheck").value;
    		if(check!=incheck){
    			alert("验证码输入错误");
    			return false;
    		}
    		return true;
    	}
    </script>
    <script type="text/javascript">
		function refresh(){
			document.getElementById("codes").src= '${pageContext.request.contextPath }/enimg.jsp?'+Math.random();
		}
	</script>
  
<script type="text/javascript">
//窗口效果
//点击登录class为tc 显示
$(".tc").click(function(){
	$("#gray").show();
	$("#popup").show();//查找ID为popup的DIV show()显示#gray
	tc_center();
});
//点击关闭按钮
$("a.guanbi").click(function(){
	$("#gray").hide();
	$("#popup").hide();//查找ID为popup的DIV hide()隐藏
})

//窗口水平居中
$(window).resize(function(){
	tc_center();
});

function tc_center(){
	var _top=($(window).height()-$(".popup").height())/2;
	var _left=($(window).width()-$(".popup").width())/2;
	
	$(".popup").css({top:_top,left:_left});
}	
</script>

<script type="text/javascript">
$(document).ready(function(){ 

	$(".top_nav").mousedown(function(e){ 
		$(this).css("cursor","move");//改变鼠标指针的形状 
		var offset = $(this).offset();//DIV在页面的位置 
		var x = e.pageX - offset.left;//获得鼠标指针离DIV元素左边界的距离 
		var y = e.pageY - offset.top;//获得鼠标指针离DIV元素上边界的距离 
		$(document).bind("mousemove",function(ev){ //绑定鼠标的移动事件，因为光标在DIV元素外面也要有效果，所以要用doucment的事件，而不用DIV元素的事件 
		
			$(".popup").stop();//加上这个之后 
			
			var _x = ev.pageX - x;//获得X轴方向移动的值 
			var _y = ev.pageY - y;//获得Y轴方向移动的值 
		
			$(".popup").animate({left:_x+"px",top:_y+"px"},10); 
		}); 

	}); 

	$(document).mouseup(function() { 
		$(".popup").css("cursor","default"); 
		$(this).unbind("mousemove"); 
	});
}) 
</script>
    
</body>
<script type="text/javascript" src="yunduo/js/my.js"></script>
<script type="text/javascript" src="yunduo/js/jquery-ui.js"></script>
<script type="text/javascript" src="yunduo/js/wow.min.js"></script>
<script type="text/javascript" src="yunduo/js/jquery.cbpQTRotator.js"></script>
<script type="text/javascript" src="yunduo/js/jquery.parallax-1.1.3.js"></script>
<script type="text/javascript" src="yunduo/js/jquery.scrollTo.min.js"></script>
<script type="text/javascript" src="yunduo/js/jquery.sticky.js"></script>
<script type="text/javascript" src="yunduo/js/smoothscroll.js"></script>
<script type="text/javascript" src="yunduo/js/waypoints.min.js"></script>
<script type="text/javascript" src="yunduo/js/echarts-all.js"></script>
<script type="text/javascript" src="yunduo/js/barcharts.js"></script>
<script type="text/javascript" src="yunduo/js/lightbox.js"></script>
<script type="text/javascript" src="yunduo/js/idangerous.swiper.min.js"></script>
<script type="text/javascript" src="yunduo/js/index.js"></script>
<script type="text/javascript" charset="utf-8" src="yunduo/js/10051886.js"></script>


</html>
