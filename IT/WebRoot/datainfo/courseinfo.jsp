<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:wb="http://open.weibo.com/wb">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=1200, initial-scale=device-width/1200, user-scalable=no, minimal-ui">
<title>it课堂</title>
<link href="/favicon.ico" type="image/x-icon" rel=icon/>
<script>var imgpath = "https://static1.51cto.com/edu/images/";</script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/jquery.min.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/msgbox.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/nav.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/mbox.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/allpageevent.js?v=2.4.4"></script>
<!-- 通用顶部简导航 -->
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/gen_top.css?v=2.2.80"/>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/gen_top.js?v=2.2.80"></script>
<!-- New Header -->
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/../center/css/base.css?v=2.4.4"/>
<link type="text/css" href="https://static1.51cto.com/edu/css/whitestyle.css?v=2.4.4" rel="Stylesheet" />
<script type="text/javascript">
var gen_logo = '';
</script>
<script src="<%=basePath %>js/jquery-1.4.1.min.js"></script>
</head>
<body>

<div class="GenTopHeader" style="margin-top: 0px;">
    <ul class="Page"  id="GenTopBar"><li class="fl f14" id="Til"><a href="http://edu.51cto.com/">中国最大的IT技能学习平台</a></li>
		<li class="fr navi"><a href="http://edu.51cto.com/sitemap.html" target="_blank" style="background-color:none;">网站导航</a>
            <ul class="navigates">
                <li><a href="<%=basePath %>courselistservlet?order=list" target="_blank">首页</a></li>
                <li><a href="<%=basePath %>datainfo/login.jsp" target="_blank">登录界面</a></li>
                <li style="border-bottom: 1px solid #FFF;"><a href="<%=basePath %>datainfo/zhuce.jsp" target="_blank">注册界面</a></li>
                <li><a href="<%=basePath %>studentservlet?order=teacher&studentname=${studentbean.studentname}" target="right">申请开课</a></li>
                <li><a href="<%=basePath %>mainservlet?order=face" target="_blank">IT课堂主站</a></li>
            </ul>
        </li>       
         <li class="fr"><a target="_blank" href="http://edu.51cto.com/user/studyGains.html?dingbujdh">学员故事</a></li>
        <li class="fr apps"><a href="http://edu.51cto.com/activity/lists/id-10.html" target="_blank" style="background:none;">学院APP</a>
            <ul>
                <li><a href="http://edu.51cto.com/download/android/v-02.html" target="_blank">Android</a></li>
                <li><a href="https://itunes.apple.com/us/app/51cto-xue-yuan-shi-zhanit/id1038062672?l=zh&ls=1&mt=8" target="_blank">iPhone</a></li>
                <li><a href="https://itunes.apple.com/us/app/51cto-xue-yuan/id948807016?ls=1&mt=8"  target="_blank">iPad</a></li>
            </ul>
        </li>
        <li class="fr reg"><a href="<%=basePath %>datainfo/zhuce.jsp" target="_blank">注册</a></li>
        <li class="fr"><a href="<%=basePath %>datainfo/login.jsp">登录</a></li>
    </ul>
</div>        <ul class="FixedSideBar">
        <li class="FixedSideBar_iPad">
            <ul class="reddot"></ul>
            <p>APP下载</p>
            <div class="FixedSideBar_SSS"></div>
            <div class="FixedSideBar_iPad_QrCode">
                <img src="<%=basePath %>image/big.png" style="width:90px;" />
                <div class="tc">下载学院APP<br />缓存视频离线看</div>
            </div>
        </li>
        <li class="FixedSideBar_FeedBack">
            <p><a href="<%=basePath %>courselistservlet?order=fankui" target="_blank">意见反馈</a></p>
        </li>
        <li class="FixedSideBar_GoTop">
            <p>返回顶部</p>
        </li>
    </ul>
    
<div class="pagebg" style="width: 100%;background: #fff;">
    <div class="Page edu-ad" ad_id="231" course_id="7737"></div>
</div>
<div class="Header">
    <div class="Page">
        <div class="Logo fl">
            <a href="http://edu.51cto.com/" title="51cto学院"><img src="https://static1.51cto.com/edu/css/../center/images/logo.png" class="fl"></a>
        </div>
            <ul class="Navigate fl">
            <li><a href="<%=basePath %>courselistservlet?order=list">首页</a></li>
            <li><a href="<%=basePath %>courselistservlet?order=study" target="_blank">微职位培训</a></li>
            <li><a  target="_blank">视频课程</a></li>
            <li><a  target="_blank">套餐</a></li>
            <li><a  target="_blank">职业路线图</a></li>
            <li><a  target="_blank">企业学习</a></li>
            <li><a   target="_blank">免费试听</a></li>
            <li>
              <p class="min_more">线下学习</p>
              <div class="min_more">
                  <a target="_blank" >IT训练营</a>
                  <a target="_blank" >IT峰会</a>
                  <a target="_blank" >IT集训</a>
              </div>
            </li>
        </ul>
        <div class="Search fr">
            <form class="form-search" id="q-form" method="get" action="http://edu.51cto.com/index.php">
                <button class="fr">搜索</button>
                <input type="text" class="fr" placeholder="找课程、找讲师" name="q" id="q" autocomplete="off" />
            </form>
        </div>
    </div>
</div>
<style type="text/css">
body {background: #f4f4f4;}
.Page {width: 1200px;}
.page-bgs .CourseTeacher-top-right {font-size: 16px;color: #00baf2;border:1px solid #00baf2;border-radius: 4px;padding: 0 24px;height: 32px;line-height: 32px;margin-top: 15px;}
.page-bgs .CourseTeacher-top-right:hover {background: #fff;color: #00baf2;}
</style>
<div class="page-bgs">
	<img src='/index.php?do=course&m=addView&id=7737'  style="display:none"  />
	<input type="hidden" value="1" id="ThisIsCoursePage" />
	<div class="FixedPage" style="box-shadow:none;">
		<div class="Page">
			<ul class="CourseTabControlF" style="float:left;margin-bottom:-6px;margin-top:5px;">
				<li class="CTItem CARCur">目录</li>
				<li class="CTItem ">介绍</li>
				<li class="CTItem">资料</li>
			</ul>
			<div class="CourseBtn" style="float:right;margin:5px 0px;" id="FixedPageCourseBtn">
				<button onclick="javascript:window.location.href='bofang1.jsp?sectionurl=${sectionbean.sectionurl}&coursename=${coursebean.course_name}&imgsrc=${coursebean_picture_url}'">我要学习</button>
			</div>
			<div class="DisCount">
				<h5 class="red fl" id="DisCount-chid">
					<c:if test="${coursebean.ismoney==0}">
						免费
					</c:if>
					<c:if test="${coursebean.ismoney==1}">
						付费----￥${coursebean.price}
					</c:if>
				</h5>
			</div>
			<div class="clear"></div>
		</div>
	</div>

	<div class="CoursePage" style="position:relative;z-index: 2;">
		<div class="Page">
			<ul class="Crumbs">
				<li><a href="/course/courseList/id-all.html" target="_blank"><h1>视频课程</h1></a></li>
				<li><span>&gt;</span></li>
				<li><a href="/course/courseList/id-47.html" target="_blank"><h1>${coursebean.one_word}</h1></a></li>
				<li><span>&gt;</span></li>
				<li><a href="/course/courseList/id-48.html" target="_blank"><h2>${coursebean.course_name}</h2></a></li>
				<li><span>&gt;</span></li>
				<li>${coursebean.introduce}</li>
				<!-- 广告位6  -->
			</ul>
			<div class="CourseIntro page-top">
				<div class="clear"></div>
				<div class="CourseImg" style="">
				<div class="courseCardType">首发</div>
				<c:forEach items="${sectionlist}" var="s">
					<a href="<%=basePath %>data/bofang1.jsp?sectionurl=${sectionbean.sectionurl}&coursename=${coursebean.course_name}&imgsrc=${coursebean.picture_url}" title="${coursebean.one_word}">
					<img alt="${coursebean.one_word}" width="400px" height="300px" src="${coursebean.picture_url}" title="${coursebean.one_word} " />
					<div class="CoursePlay"></div>
				</a>
				</c:forEach>
			</div>
				<div style="clear:both;"></div>
				<div class="CourseIntro_Text CourseIntro_Text_top" style="margin-top:-365px;">
					<h1 title="${coursebean.one_word}" style="line-height:30px;">${coursebean.one_word}</h1>
					<!--  课程标签 -->
					<div class="CoursePrePrice CoursePrePrice-top">
            		<div class="top">
  						<p class="fl f40 cf" id="coursePrice">
  							<c:if test="${coursebean.ismoney==0}">
								免费
							</c:if>
							<c:if test="${coursebean.ismoney==1}">
								付费----￥${coursebean.price}
							</c:if>
  						</p>
  					    <div class="clear"></div>
            		</div>

				<div class="bottom">
                <div class="courseInfo_line courseInfo_line_bg fl" style="line-height: 14px;">
                    <span id="maxcoupon"></span>
                </div>
            </div>
				<div class="clear"></div>
					</div>
					<div class="courseInfo_line courseInfo_line_top">
						<span class="fl">
						共${requestScope.num}课时						<em class="lop-top02">|</em>						</span>
						<span class="fl">4.9分(6人评价)<em class="lop-top02">|</em></span>
						<span class="fl">更新时间： ${coursebean.replay_date}</span>
						<div class="clear"></div>
					</div>
					
					<p >适用人群： ${coursebean.one_word}</p>
					<div class="CourseBtn" style="padding-top: 50px">
							<button onclick="javascript:window.location.href='<%=basePath %>datainfo/login.jsp'">我要学习课程</button>
         			</div>
					<div class="CoursePrP">
						<div class="CoursePr cp_7 c42 f14" style="position:relative;overflow: visible;">
							<span class="c9">下载课程</span>
						</div>
						<div class="CoursePrQrCode fl" style="width:100px;z-index:99;position: relative;margin-left: -85px;margin-top:20px;margin-right: -52px;">
							<img src="https://static1.51cto.com/edu/images/whitestyle/appdownload90.png" />
							<div class="tc">下载学院APP<br />缓存视频离线看</div>
						</div>
						<span class="lop-top"></span>
						<a class="CoursePr c9 f14 cp_1 " href="javascript:void(0);">
						收藏						(58)
						</a>
						<!--
												-->
												<span class="lop-top"></span>
						<a class="CoursePr cp_5 c9 f14" href="javascript:void(0);" style="margin-right: 10px;">分享</a>
						<style type="text/css">
						.bdsharebuttonbox	{float:left !important;margin-right: 10px !important;}
						.bdshare-button-style1-16 a, .bdshare-button-style1-16 .bds_more	{margin:0px 6px 0px 0px !important;background-image: url(https://static1.51cto.com/edu/images/whitestyle/share_icons.png?v=20160711) !important;padding-left:20px !important;}
						.bdshare-button-style1-16 .bds_weixin	{background-position: 0px 0px !important;}
						.bdshare-button-style1-16 .bds_tsina	{background-position: -45px 0px !important;}
						.bdshare-button-style1-16 .bds_qzone	{background-position: -90px 0px !important;}
						.bdshare-button-style1-16 .bds_more	{background-position: -135px 0px !important;}
						</style>
						<div class="bdsharebuttonbox">
							<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
							<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
							<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
							<a href="#" class="bds_more" data-cmd="more"></a>
						</div>
                        <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":["mshare","bdysc","renren","tqq","bdxc","kaixin001","tqf","tieba","douban","tsohu","bdhome","sqq","thx","ibaidu","meilishuo","mogujie","diandian","huaban","duitang","hx","fx","youdao","sdo","qingbiji","people","xinhua","mail","isohu","yaolan","wealink","ty","iguba","fbook","twi","linkedin","copy","print"],"bdPic":"https://s1.51cto.com/images/201611/818d1ee62c87e175791875d39a3203bf50578c_big.jpg","bdStyle":"1","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='https://static1.51cto.com/edu/js/baiduShare/static/api/js/share.js?v=2.4.4'];</script>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div><!--Page End-->
	</div>
	<div style="display:none" id="confirm"></div>
<script>
var course_id	=	"7737"; 
var user_id 	=	"0";
var price_unit = "¥";
var studyDateArr = [{"term":"\u6c38\u4e45\u89c2\u770b","price":"0","reduce_price":0,"eid":0,"original_price":"0","default":1}],changePrice = 0;//
	$("ul.courseDate").empty();
	function studyDateChange(n){
		if(!n) n=0;
		if(studyDateArr.length==1) n=0;
		$("#coursePrice").html(price_unit+studyDateArr[n]['price']+'<span class="f14 c3"></span>');
		$('#DisCount-chid').html(price_unit+studyDateArr[n]['price']);
		$("#oPrice, #DisCount-old").text(price_unit+studyDateArr[n]['original_price']);
		$(".MyCartGoods_money").html(studyDateArr[n]['reduce_price']);
		if(studyDateArr[n]['term'] == '永久观看'){
			$(".CourseVIP2").show();
		}else{
			$(".CourseVIP2").hide();
		}
	}
	if(studyDateArr.length>1){
		$("#coursePrice").html(price_unit+studyDateArr[0]['price']+'<span class="f14 c3"></span>');
		$("#DisCount-chid").html(price_unit+studyDateArr[0]['price']);
		$(".CourseVIP2").hide();
		$("#oPrice, #DisCount-old").text(price_unit+studyDateArr[0]['original_price']);
		$(".MyCartGoods_money").html(studyDateArr[0]['reduce_price']);
	}
	$.each(studyDateArr,function(i,e){
		var item = $('<li>'+studyDateArr[i]['term']+'</li>');
		$("ul.courseDate").append(item);
		if(i==0){
			item.addClass('changed');
		}else if(e['default']==1){
			item.addClass('changed').siblings().removeClass('changed');
			studyDateChange(i);
		}
		item.click(function(){
			var n = $(this).index();changePrice=n;
			$(this).addClass('changed').siblings().removeClass('changed');
			studyDateChange(n);
		});
	});
	//购买课程
	$("button.buyCourseButton").live("click",function(){
		if(user_id == 0) {
			noLoginTrip();
			return false;
		}

		$('#confirm').html('<form action="/orders/confirm.html" method="post" id="buyForm"><input type="hidden" name="course_id[]" value="7737"><input type="hidden" name="eid" value="'+studyDateArr[changePrice]['eid']+'" ></form>');
	    $('#buyForm').submit();
	})

	//续费
	$("#renew").click(function(){
		$('#confirm').html('<form action="/orders/confirm.html" method="post" id="buyForm"><input type="hidden" name="course_id[]" value="7737"><input type="hidden" name="eid" value="'+studyDateArr[changePrice]['eid']+'" ></form>');
	    $('#buyForm').submit();
	})
	$(".cp_7").bind('mouseenter',function(){
		$(".CoursePrQrCode").fadeIn(100);
	}).bind('mouseleave',function(){
		$(".CoursePrQrCode").fadeOut(100);
	});
		//学习码观看
	$(".cp_6").click(function(){//
		if(user_id == '0'){
			noLoginTrip();
			return false;
		}
		new AutoBox({
			'title':'<strong style="font-size:16px;">学习码观看</strong>',
			'W':480,
			'ADD':StudyCodeBox(course_id),
			'noCon':true,
			'mask':true,
			'complete':function(){//
			}
		});
	});
		//分享
	$("#bdshare").bind('mouseover',function(){//
		$(".cp_5").addClass('cp_5ed');
	}).bind('mouseleave',function(){//
		$(".cp_5").removeClass('cp_5ed');
	});
	var useStudyCode = function(batchCode) {
		if(batchCode == '') {
			return false;
		}

		$.ajax({
			url:'/index.php?do=batch&m=usecode',
			type:'post',
			data:{
				code:batchCode,
				courseid:course_id,
				userid:user_id,
				ischeck:0
			},
			dataType:'json',
			success:function(data){
				if(data.state == 'true') {
					$('div[id^="Msg_"]').remove();//关闭弹出框
					$('div#Mask').remove();//关闭遮罩层

					//$('.cp_6').unbind('click');
					$('.cp_6').remove();
	                var str_end_date = data.end_date;
	                $('.CourseBtn').append('<p>学习码体验中&nbsp;有效期至：' + str_end_date.split(' ')[0]+'</p>');
					$("#FixedPageCourseBtn").html('<button class="buyCourseButton" style="background: #c01920;">立即购买</button>');
					new AutoBox({
						'content':'学习码使用成功！',
						'autoClose':2,
						'noCBtn':true,
						'ok':function() {
						}
					});
				} else {
					$("#useCodeError").show();
					$("#useCodeError").text(data.msg);
					/*
					new AutoBox({
						'content':data.msg,
						'autoClose':2,
						'W':380,
						'img':'remind'
					})*/
				}
			}

		})
	}

			var empty = $('<div style="padding:30px;"><img src="'+imgpath+'../images/whitestyle/loading.gif" /></div>');
		useScor.append(uc1).append(uc2).append(uc3).append(ucError).append($('<div class="clear"></div>')).append(uc5).append(uc4).append(uc_table).append(empty);
		return useScor;
	}
</script>
	<div class="Page CourseAbout" style="position: relative;z-index: 1;">
		<div class="CA_Left CA_Left_top">
			<!--  套餐 路线图 start -->
						<!--  套餐 路线图 end -->
			<div class="CourseTabControlMask"></div>
			<ul class="CourseTabControl">
				<li class="CTItem CARCur">目录</li>
				<li class="CTItem ">介绍</li>
				<li class="CTItem">资料</li>
			</ul>
			<div class="clear"></div>
			<ul class="CourseTab">
				<li id="course_lessions_lists" style="display:block">
					<dl class="CourseTabIntro">
						<div class="CourseTabIntro-box">
							<span class="left fl">课程名称</span>
							<p class="right fl">
								${coursebean.course_name}	</p>
							<div class="clear"></div>
						</div>
							<div class="CourseTabIntro-box">
								<span class="left fl">章节列表</span>
									<c:forEach items="${sectionlist}" var="s">
										<p class="right fl">${s.sectionname}-----${s.sectionremark}-----${s.timelength}分钟															</p>
									</c:forEach>
								<div class="clear"></div>
							</div>
						<div class="clear"></div>
					</dl>
						<div class="QQ_recom">
						<div class="Info fl">
							<h5>加入学院交流2群，</h5>
							<p>随时和讲师、学伴交流</p>
						</div>
						<div class="fr Btn">
							275300091<a href="" target="">立即加入</a>
						</div>
						<div class="clear"></div>
					</div>
				</li>
				<!-- 介绍 -->
				<li style="display:none">
					<dl class="CourseTabIntro">
						<div class="CourseTabIntro-box">
							<span class="left fl">课程目标</span>
							<p class="right fl">
								${coursebean.introduce}	</p>
							<div class="clear"></div>
						</div>
						<div class="CourseTabIntro-box">
							<span class="left fl">适用人群</span>
							<p class="right fl">
									${coursebean.one_word}															</p>
							<div class="clear"></div>
						</div>
						<div class="CourseTabIntro-box">
							<span class="left fl">课程简介</span>
							<div class="right fl" id="content_code">
								${coursebean.introduce}
							</div>
							<div class="clear"></div>
						</div>
						<div class="clear"></div>
					</dl>
						<div class="QQ_recom">
						<div class="Info fl">
							<h5>加入学院Linux交流2群，</h5>
							<p>随时和讲师、学伴交流</p>
						</div>
						<div class="fr Btn">
							176027975702<a href="http://shang.qq.com/wpa/qunwpa?idkey=8099522b41c5f7c4cf5f4e5417091b89f8d956492108673cb0100c3e863d08a4" target="">立即加入</a>
						</div>
						<div class="clear"></div>
					</div>
									</li>
				<!-- 资料 -->
				<li style="display:none;">
					<div class="CourseFile">
						<dl>
							<div class="ItsNothing"><p>暂时还没有课件~</p></div>
						</dl>
					</div>
				</li>
				<!-- 问答 -->
				<li style="display:none;" id="course_comment_list">
				</li>
				<!-- 评价 -->
				<li style="display:none;position:relative;" >
					<!-- 广告图 -->
					<a class="ases-class" href="http://edu.51cto.com/user/studyGains.html" target="_blank"><img src="https://static1.51cto.com/edu/images/whitestyle/ases.jpg" width="762" ></a>
					<div class="CourseCommScore">
						<div class="CourseTeacher-top fl" style="margin-top: 6px;">
							<div class="fl left">4.9</div>
							<div class="fl center" style="margin-top: 8px;">
								<div class="CCS_Stars" style="margin: 0 0 15px;">
									<input type="hidden" class="ccs_ccs" value="4.9" />
									<div class="CCS_StarsBG"></div>
									<img src="https://static1.51cto.com/edu/images/whitestyle/stars_b.png" />
								</div>
								<span>6人评价</span>
															</div>
						</div>
						<ul class="CCS_scoreIntro">
							<li>
								<p>课程与描述相符&nbsp;&nbsp;<em class="cfea">5</em>(非常满意)</p>
								<div class="clear"></div>
							</li>
							<li>
								<p>老师的讲解表达&nbsp;&nbsp;<em class="cfea">5</em>(非常满意)</p>
								<div class="clear"></div>
							</li>
							<li>
								<p>老师的答疑服务&nbsp;&nbsp;<em class="cfea">4.8</em>(非常满意)</p>
								<div class="clear"></div>
							</li>
							<!--
														<li>
								<p>课程的更新速度&nbsp;&nbsp;<em class="cfea">5</em>(非常满意)</p>
								<div class="clear"></div>
							</li>
														-->
						</ul>
														<a class="fr CourseTeacher-top-right" href="/index.php?do=appraise&m=AppraiseIndex&course_id=7737" target="_blank">评价</a>
																								</div>
					<!-- 评论内容 -->
					<div id="appraiseList_info">
										<ul class="CCS_CommList">
												<li>
							<div class="CCS_Comm">
								<div class="CCS_CommHead fl">
											<a href="/user/user_id-12033289.html" target="_blank">
											<img src="http://ucenter.51cto.com/avatar.php?uid=12033289&size=middle" />
										</a>
												</div>
																	<a href="/user/user_id-12033289.html" target="_blank" class="fl gre">棋子棋子</a>
																<div class="CCS_Stars_sm">
									<input type="hidden" class="ccs_ccs_sm" value="5" />
									<div class="CCS_StarsBG_sm"></div>
									<img src="https://static1.51cto.com/edu/images/whitestyle/stars_b.png" width="84" />
								</div>

								<div class="fl">5分</div>
								<p class="CCSCC_Time fr">2017-02-05 15:30:54</p>
								<div class="CCS_CommCon">
									<p class="clear"></p>
									<p class="CCSCC_Text">还行</p>
								</div>
								<div class="clear"></div>
							</div>
						</li>
																		<li>
							<div class="CCS_Comm">
								<div class="CCS_CommHead fl">
																			<a href="/user/user_id-11929788.html" target="_blank">
											<img src="http://ucenter.51cto.com/avatar.php?uid=11929788&size=middle" />
										</a>
																	</div>
																	<a href="/user/user_id-11929788.html" target="_blank" class="fl gre">常青藤sin60</a>
																<div class="CCS_Stars_sm">
									<input type="hidden" class="ccs_ccs_sm" value="4.7" />
									<div class="CCS_StarsBG_sm"></div>
									<img src="https://static1.51cto.com/edu/images/whitestyle/stars_b.png" width="84" />
								</div>

								<div class="fl">4.7分</div>
								<p class="CCSCC_Time fr">2017-01-03 11:41:44</p>
								<div class="CCS_CommCon">
									<p class="clear"></p>
									<p class="CCSCC_Text">将的很不错，另外谁有那个高清的学习路线图啊，能不能分享一下
									</p>
								</div>
								<div class="clear"></div>
							</div>
						</li>
						<li>
							<div class="CCS_Comm">
								<div class="CCS_CommHead fl">
									<a href="/user/user_id-12345303.html" target="_blank">
										<img src="http://ucenter.51cto.com/avatar.php?uid=12345303&size=middle" />
									</a>
									</div>
									<a href="/user/user_id-12345303.html" target="_blank" class="fl gre">颠沛流离i</a>
									<div class="CCS_Stars_sm">
									<input type="hidden" class="ccs_ccs_sm" value="5" />
									<div class="CCS_StarsBG_sm"></div>
									<img src="https://static1.51cto.com/edu/images/whitestyle/stars_b.png" width="84" />
								</div>

								<div class="fl">5分</div>
								<p class="CCSCC_Time fr">2016-12-27 10:36:46</p>
								<div class="CCS_CommCon">
									<p class="clear"></p>
									<p class="CCSCC_Text">真的太好了</p>
								</div>
								<div class="clear"></div>
							</div>
						</li>
						<li>
							<div class="CCS_Comm">
								<div class="CCS_CommHead fl">
									<a href="/user/user_id-11631517.html" target="_blank">
										<img src="http://ucenter.51cto.com/avatar.php?uid=11631517&size=middle" />
									</a>
								</div>
									<a href="/user/user_id-11631517.html" target="_blank" class="fl gre">whx12300</a>
									<div class="CCS_Stars_sm">
									<input type="hidden" class="ccs_ccs_sm" value="5" />
									<div class="CCS_StarsBG_sm"></div>
									<img src="https://static1.51cto.com/edu/images/whitestyle/stars_b.png" width="84" />
								</div>
								<div class="fl">5分</div>
								<p class="CCSCC_Time fr">2016-12-19 12:10:11</p>
								<div class="CCS_CommCon">
									<p class="clear"></p>
									<p class="CCSCC_Text">哈哈哈</p>
								</div>
								<div class="clear"></div>
							</div>
						</li>
						<li>
							<div class="CCS_Comm">
								<div class="CCS_CommHead fl">
									<a href="/user/user_id-11396120.html" target="_blank">
										<img src="http://ucenter.51cto.com/avatar.php?uid=11396120&size=middle" />
									</a>
								</div>
								<a href="/user/user_id-11396120.html" target="_blank" class="fl gre">潇洒xh</a>
								<div class="CCS_Stars_sm">
									<input type="hidden" class="ccs_ccs_sm" value="5" />
									<div class="CCS_StarsBG_sm"></div>
									<img src="https://static1.51cto.com/edu/images/whitestyle/stars_b.png" width="84" />
								</div>
								<div class="fl">5分</div>
								<p class="CCSCC_Time fr">2016-12-10 12:29:13</p>
								<div class="CCS_CommCon">
									<p class="clear"></p>
									<p class="CCSCC_Text">好</p>
								</div>
								<div class="clear"></div>
							</div>
						</li>
						<li>
							<div class="CCS_Comm">
								<div class="CCS_CommHead fl">
									<a href="/user/user_id-12230178.html" target="_blank">
										<img src="http://ucenter.51cto.com/avatar.php?uid=12230178&size=middle" />
									</a>
								</div>
									<a href="/user/user_id-12230178.html" target="_blank" class="fl gre">lx6423623</a>
									<div class="CCS_Stars_sm">
										<input type="hidden" class="ccs_ccs_sm" value="5" />
										<div class="CCS_StarsBG_sm"></div>
										<img src="https://static1.51cto.com/edu/images/whitestyle/stars_b.png" width="84" />
									</div>
								<div class="fl">5分</div>
								<p class="CCSCC_Time fr">2016-12-01 21:28:38</p>
								<div class="CCS_CommCon">
									<p class="clear"></p>
									<p class="CCSCC_Text">谢谢老师</p>
								</div>
								<div class="clear"></div>
							</div>
						</li>
																								</ul>
				</div>
				</li>
			</ul>
			<!--  -->
			<div class="clear" id="AndStudyThisNBSP"></div>
			<div class="UWillLike disp-n" id="AndStudyThis">
				<h2>学习过此课程的人还学习了</h2>
					<ul class="CRL_RecoC CRL_RecoCB" id="AndStudyThisList" style="overflow:hidden">
					</ul>
			</div>
			<!--  -->
		</div>
		<div class="CA_Right">
			
			<div class="poster-box poster-box-padd">
				<div class="IndexBannerPics poster-img-box">
				<div class="edu-ad" ad_id="230" course_id="7737"></div>
				</div>
			</div>
			<!-- 分类广告位 -->
			<!-- 讲师展示 start -->
			<div class="CourseTeacher poster-box">
				<!-- 购买后或者免费课程显示 -->
						<div class="CourseTeacher-top pb40">
						<div class="fl left">4.9</div>
						<div class="fl center" style="margin-top: 8px;">
							<div class="CCS_Stars" style="margin: 0;">
								<input type="hidden" class="ccs_ccs" value="4.9" />
								<div class="CCS_StarsBG"></div>
								<img src="https://static1.51cto.com/edu/images/whitestyle/stars_b.png" />
							</div>
							<span>6人评价</span>
						</div>
						<button class="fr CourseTeacher-top-right" onclick="window.location.href='data/pingjia.jsp'" target="_blank">评价</button>
						<div class="clear"></div>
					</div>
					<div class="CourseTeacher_Head CourseTeacher_Head_top">
					<div class="right-title-box"><h2 class="right-title">讲师</h2></div>
					<div class="CourseTeacher_Head_top_teach">
						<div class="left fl">
				      		<a href="/user/user_id-8899635.html" target="_blank">
					     		<img alt="edu学院" src="https://s1.51cto.com/images/201610/563928c7970553323428143d297645fef89b4f_small.png" />
					      	</a>						    
				        </div>
					    <div class="right fr" style="width: 190px;">
					    	<!-- 讲师名称 -->
					    	<div class="CourseTeacher_Info">
								<h2><a href="/user/user_id-8899635.html" target="_blank">edu学院</a></h2>
								<a href="/index/help.html#honor"  target="_blank">
			                	</a>
				             	<div class="clear"></div>
							</div>
						    <p>好评率：<span class="org">98%</span></p>
						</div>
						<div class="clear"></div>
				    </div>
				    <p class="CourseTeacher_Head_top_con">本学院技能学习平台，依托于11年行业品牌、1400万技术用户，提供辅导式“微职位”和自学式“视频课程”两种在线学习模式，帮助广大IT技术人员实现技能提升、高薪就业的职业梦想。</p>
				</div>
				<!-- 评价-没购买并且不免费的 -->
			<div class="clear"></div>
			</div>
			<!-- 讲师展示 end -->

			<!-- 7日学霸榜 start -->
			<div class="teacher-list">
					<div class="right-title-box">
						<h2 class="right-title fl">7日学霸榜</h2>
						<span class="fr">有<em class="baf">1030</em>个小伙伴和你一起学习</span>
						<div class="clear"></div>
					</div>
					<div class="no-con">
						<p>近7日还没有小伙伴学习哦，快去成为第一人吧</p>
						<a href="/lesson/id-139711.html" target="_blank">去学习</a>
					</div>
			</div>
			<dl class="CourseRightList CourseRightList-bg " id="Books">
				<div class="right-title-box">
					<h2 class="right-title">推荐图书</h2>
				</div>
				<dd>
					<ul style="padding-right:17px;" id="BooksList">
					</ul>
				</dd>
			</dl>
		</div>
		<div class="clear"></div>
	</div>
	<pre id="content_temp" style="display:none"><p>${coursebean.introduce}<span style="background-color: rgb(255, 255, 255);">lledu学院</span><span style="background-color: rgb(255, 255, 255);">&nbsp;</pre>
	<div class="clear"></div>
</div>
<script>

function AndStudyThisItem(e,index){
	var item = '';
	item += '<li>';
	item +=   '<a href="/index.php?do=course&m=index&course_id='+e.course_id+'" course_id="'+e.course_id+'" title="'+e.title+'" target="_blank"><img class="img-left" src="https://s1.51cto.com/'+e.imageurl.replace('.jpg','_small.jpg')+'" /></a>';
	item +=   '<div class="CRL_RecoCI">';
	item +=     '<h4>';
	item +=       '<a href="/index.php?do=course&m=index&course_id='+e.course_id+'" course_id="'+e.course_id+'" title="'+e.title+'" target="_blank">'+e.title+'</a>';
	item +=     '</h4>';
	item +=     '<p style="width:130px;height:16px;overflow:hidden;margin:0px;line-height:1;">讲师：';
	item +=       '<a href="/user/user_id-'+e.user_id+'.html" target="_blank">'+(e.nickname?e.nickname:(e.realname?e.realname:e.username))+'</a>';
	item +=     '</p>';
	item +=     '<div class="CCS_Stars_sm" style="float:right;">';
	item +=       '<div class="CCS_StarsBG_sm" style="width:'+(17.9*parseFloat(e.score))+'px"></div>';
	item +=       '<img src="https://static1.51cto.com/edu/images/whitestyle/stars_b.png" width="84" />';
	item +=     '</div>';
	item +=   '</div>';
	item += '</li>';
	return item;
}
function AlreadyStudyItem(e){
	var item = '';
	item += '<li>';
	item += '<a href="/index.php?do=user&m=index&user_id='+e.user_id+'" target="_blank">';
	item += '<img src="http://ucenter.51cto.com/avatar.php?uid='+e.user_id+'&size=small"/>';
	item += '<p>'+e.username.substring(0,5)+'</p>';
	item += '</a></li>';
	return item;
}
////

	//$("#content_code").html($("#content_temp").html());
		document.getElementById("content_code").innerHTML = document.getElementById("content_temp").innerHTML;
	//课程Tab
		$(".CourseTabControl>li").click(function(){
			if($(this).index()<7){
				tabList(this)
			}
		});
		$(".CourseTabControlF>li").click(function(){
			tabList(this);
			var ftop =$(".CourseTabControl").offset().top;
			$(window).scrollTop(ftop+1);
		});
		var tabList = function(e){//
			var n = $(e).index();
			tabListClick(n);
		}

		// 123
		tabListClick = function(n){
			if(n == 3){
				$.get('/index.php?do=comment&m=courseCommentList&course_id='+course_id,function(h){
					$('#course_comment_list').html(h);
					//回复
					$(".CourseQuest_Reply").click(function(){
						ShowReply(this)
					});

				})
			}else if(n == 4){
				$.get('/index.php?do=note&m=courseNoteList&course_id='+course_id,function(h){
					$('#course_note_list').html(h);
					// $('.CourseNotes_img').css('cursor','url('+imgpath+'../images/magnifier.png),pointer');
					// 笔记图片放大
					$('.CourseNotes_img').click(function(){
						if($(this).attr('name') == 'Notes_img'){
							$(this).parent().removeClass('show');
							$(this).attr('name','');
						}else{
							$(this).attr('name','Notes_img');
							$(this).parent().addClass('show');
						}
					});
				})
			}else if(n == 6){
				var lessonURL = 'http://edu.51cto.com/exam/lesson?y=1&course_id='+course_id;
				// 获取课时列表 
				function setGet(e){
					$.get(e,function(h){
						$('#exam_less_time').html(h);
						$('#pagination a').click(function(){
							var thHref = $(this).attr('href');
							setGet(thHref);
							return false;
						})
					})
				}
				setGet(lessonURL);
			}
			$(".CourseTabControl>li").removeClass('CARCur');
			$(".CourseTabControlF>li").removeClass('CARCur');
			$(".CourseTabControl>li").eq(n).addClass('CARCur');
			$(".CourseTabControlF>li").eq(n).addClass('CARCur');
			$(".CourseTab>li").css('display','none');
			$(".CourseTab>li").eq(n).css('display','block');
		}
		//
		$(".CourseAnnex>li,.tab1").click(function(){//
			var n=this.className.replace('tab','');
			$(".CourseTabControl>li").eq(n).click();
			var x =$(".CourseTabControl").offset().top;
			$(window).scrollTop(x);

		});

		//课程评价动作
		function appraisesInit(){}{
			$('#appraiseList_info').on('click', '.pagesGoPrve, .pagesNum, .pagesGoNext, .pagesGoHome, .pagesGoEnd',function(event) {
				var obj = $(this);
				if(obj.hasClass('pagesNumCur')) return ;

				var href = $(this).attr('href');
				$.get(href,function(h){
					$('#appraiseList_info').html(h);
					appraisesInit();
					$(".CourseTabControlF li").eq(5).click();
				});
				return false;
			});
		}
</script>

<script type="text/javascript">
	var favNum		= 	"58";
	var user_email	=	"";
	
	
	var username 	=	"";
	var isRemin 	= 	"false";
	var examData = [];
	$.getJSON('/index.php',{'do':'course','m':'getExam','id':course_id},function(data){
		if(data.status==1 && data.data.length>0){
			examData = data.data;
			$('.cp_4').show();
		}else{
			$('.cp_4').remove();
		}
	});

	
	//字符串切割
	var strSplitByLen = function (str,len) {
		var l = 0;
		var str1 = '';
		var str2 = '';
		for(var i in str){
			var length = str[i].charCodeAt();
			l = ( length >= 0 && length <= 128 ) ? l+1 : l+2;
			if(l < len){
				str1 += str[i];
			}else{
				str2 += str[i];
			}
		}
		var newstr = {0:str1,1:str2}
		return newstr;
	}

	//数字长度格式化
	var zeroize = function (value, length) {
	    if (!length) length = 2;
	    value = String(value);
	    for (var i = 0, zeros = ''; i < (length - value.length); i++) {
	        zeros += '0';
	    }
	    return zeros + value;
	};

	//时间戳转换
	var getLocalTime = function(nS,sign) {
		var dateval	 =	nS ? new Date(parseInt(nS) * 1000) : new Date();
		var yy	=	dateval.getFullYear();
		var mm 	=	zeroize(dateval.getMonth() + 1);
		var dd 	=	zeroize(dateval.getDate());
		if(sign > 0){
			var hh  = 	zeroize(dateval.getHours());
			var ii	=	zeroize(dateval.getMinutes());
			var ss 	=	zeroize(dateval.getSeconds());
			return yy + '-' + mm + '-' + dd + ' ' + hh + ':' + ii + ':' + ss;
		}
		return yy + '-' + mm + '-' + dd;
	}

	//字符串长度计算
	var strHtmlLen = function(value){
		var _tmp = value.length;
		var _length = 0;
		for (var i = 0; i < _tmp; i++) {
			if (value.charCodeAt(i) > 255) {
				_length = _length + 2;
			}else {
				_length++;
			}
		}
		return _length;
	}
	

	
	// 显示手机专享二维码
	$('.phone-erwm').mouseover(function() {
		$(this).find('.phone-erwm-down').show();
	}).mouseout(function(){
		$('.phone-erwm-down').hide();
	});



	var start_time = '';
	var end_time = '';

	function setCookie(name, value, iDay) {
	    var oDate = new Date();
	    oDate.setTime(oDate.getTime() + iDay*1000);
	    var dateStr = ( iDay == 0 ) ? '' : ';expires='+oDate.toGMTString();
	    document.cookie = name+'='+value+dateStr+';path=/';
	}
	//获取cookie
	function getCookie(name) {
	    var arr = document.cookie.split('; ');
	    var i = 0;
	    for(i=0; i<arr.length; i++) {
	        var arr2 = arr[i].split('=');
	        if(arr2[0] == name) {return arr2[1];}
	    }
	    return '';
	}
	//删除cookie
	function removeCookie(name) {
	    setCookie(name,'',-1);
	}

	
	var CheckCourseBuy = '',price = '0';
	if(!CheckCourseBuy && price > 0 ){
		$.ajax({
		    url:'http://edu.51cto.com/?do=course&m=getCourseCoupon',
		    data:{course_id:"7737"},
		    type:'get',
		    success:function(data){
		    	$(".CA_Right").prepend(data);
		    	$("#maxcoupon").html($('#max_coupon').html());
		    	var it_lef = $('.coupon-l'),
					it_rig = $('.coupon-r'),
					it_coupon_li = $(".coupon-list .coupon_ch_box"),
					it_coupon_btn = $(".coupon-list-btn-item");
					it_coupon_btn_li = $(".coupon-list-btn li"),
					it_img_coupon_btn = $(".coupon-list-btn");
		    	setIndexBanner(it_lef, it_rig, it_coupon_li, it_coupon_btn, it_coupon_btn_li, it_img_coupon_btn,8);
		    }
		})  
	}
	 
	

</script>

<script charset="utf-8" src="https://wpa.b.qq.com/cgi/wpa.php"></script>
<script type="text/javascript">
	BizQQWPA.addCustom({aty: '0',a: '1001',
		nameAccount: '4008519651',
		selector: 'qqwaps'});
	BizQQWPA.visitor({nameAccount: '4008519651'});
</script>
<!----------------------数据分析  begin ---------------------->
<script type="text/javascript">
var
	levelid = "", 
	packid = "",
	returnData = "",
	returnLikeCourse = "";
	$.get('/index.php?do=course&m=courseInfoTract&course_id=7737',function(e){
		if(e.status==1){
			course_id = e.data.course_id;
			levelid = e.data.levelid;
			packid = e.data.packid;
			returnData = e.data.returnData;
			returnLikeCourse = e.data.returnLikeCourse;
			$.getScript('https://static1.51cto.com/edu/js/pv_tract.js?v=2016092803');
		}
	},'json')

</script>
<!----------------------数据分析  end ------------------------>

<div class="Footer">
    <div class="Page">
        <table class="QRcode tc">
            <caption>
                <a href="http://edu.51cto.com/" title="51cto学院"><img src="https://static1.51cto.com/edu/css/../center/images/logo.png" alt="51cto学院" width="194" height="40"/>
            </caption>
            <tr>
                <td>
                    <img src="https://static1.51cto.com/edu/css/../center/images/qrcode.png" alt="学院APP" width="110" height="110"/>
                    <p>学院APP</p>
                </td>
                <td>
                    <img src="https://static1.51cto.com/edu/css/../center/images/qrcode2.png" alt="官方微信" width="110" height="110"/>
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
                <a href="<%=basePath %>courselistservlet?order=jiaoliu" target="_blank"  title="学员交流">学员交流</a>            </div>
            <p class="Call fl red">176-0797-5702</p>
            <p class="fl callTime">09:00 - 19:00</p>
            <div class="clear"></div>
            <p class="copy">Copyright &copy; 2017-2027 <a href="<%=basePath %>courselistservlet?order=list" target="_blank">IT课堂.com</a></p>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="mask disp-n" id="AdviceMask"></div>
<div class="Advice disp-n" id="Advice">
    <div class="Main">
        <button class="close" onclick="$('#AdviceMask').hide();$('#Advice').hide();">&nbsp;</button>
        <button id="bizQQ_WPA">&nbsp;</button>
        <h3>可以开发票么？</h3>
        <p>可以的，购买课程或者充值余额后都是可以开具发票的，具体详情点击：<a href="http://bbs.51cto.com/thread-1472105-1.html" target="_blank">我要开发票</a></p>
        <h3>购买的课程可以下载么？</h3>
        <p>目前PC端暂不支持下载课程视频，请手机或者平板电脑下载“51CTO学院”APP后再下载视频哦！</p>
        <h3>优惠券如何使用？</h3>
        <p>非折扣课程（不包含1元课程/套餐）可使用，一个订单（可包含多个课程）只可使用一张；优惠券一经使用，不再返还；若被冻结请在PC端删除订单即可返还。</p>
        <p class="mt20">更多问题查询点击 <a href="http://edu.51cto.com/help.html" target="_blank">帮助中心</a></p>
        <p class="mt10">欢迎您提供宝贵意见，对于您的意见我们都会认真、慎重的讨论，每一个意见都是我们更好为您服务的鞭策和激励，感谢您帮助学院成长，<a href="http://edu.51cto.com/user/feedback.html" target="_blank">我要反馈意见</a></p>
    </div>
</div>
<script type="text/javascript">
$("#bizQQ_WPA").click(function(){
    window.open('http://edu.51cto.com/contactqq.html')
})
</script>

<script type="text/javascript" src="https://static1.51cto.com/edu/js/edu-ad.js?v=20161009"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/edu_header.js?v=1.2.2"></script>
<!----------------------数据分析  begin --------------------->
<script type="text/javascript">
    var sessionid = "jje0hpk4aae4b5be7lpantjdd6",
            ip = "182.97.87.71",
            user_id = "0",
            source = 0;
</script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/md5.js"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/tract_public.js?v=10.21"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/pv_tract.js?v=2016092803"></script>
<!----------------------数据分析  end -------------------->
<span style="display:none;">
<script src="https://logs.51cto.com/rizhi/count/count.js"></script>
</span>




<!--qiaohaun-->
                                    <script type="text/javascript"> document.write(unescape("%3Cscript src='https://tongji.51cto.com/cto.js/b57176900a4805e17afc7b8e25a43abf' type='text/javascript'%3E%3C/script%3E")); </script>

<script type="text/javascript">
//百度统计代码
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?8c8abdb71d78d33dfdb885e0bc71dae0";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</body>
</html>
