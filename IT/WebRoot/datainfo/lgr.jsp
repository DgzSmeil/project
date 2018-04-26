<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:wb="http://open.weibo.com/wb">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=1200, initial-scale=device-width/1200, user-scalable=no, minimal-ui">
<title>赖国荣的搜索结果_51CTO学院</title>
<meta name="keywords" content="赖国荣" />
<meta name="description" content="" />
<meta   http-equiv="Expires"   CONTENT="0">
<meta   http-equiv="Cache-Control"   CONTENT="no-cache">
<meta   http-equiv="Pragma"   CONTENT="no-cache">
<LINK href="/favicon.ico" type="image/x-icon" rel=icon>
 
<script>var imgpath = "https://static1.51cto.com/edu/images/";</script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/jquery.min.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/msgbox.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/nav.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/mbox.js?v=2.4.4"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/allpageevent.js?v=2.4.4"></script>
<!-- 通用顶部简导航 -->
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/gen_top.css?v=2.2.82">
<script type="text/javascript" src="https://static1.51cto.com/edu/js/gen_top.js?v=2.2.82"></script>
<!-- New Header -->
<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/../center/css/base.css?v=2.4.4">
<link type="text/css" href="https://static1.51cto.com/edu/css/whitestyle.css?v=2.4.4" rel="Stylesheet" />
<script type="text/javascript">
var gen_logo = '';
</script>
</head>
<body>

<div class="GenTopHeader" style="margin-top: 0px;">
    <ul class="Page"  id="GenTopBar"><li class="fl f14" id="Til"><a href="http://edu.51cto.com/">中国最大的IT技能学习平台</a></li>
        <li class="fr navi"><a href="http://edu.51cto.com/sitemap.html" target="_blank" style="background-color:none;">网站导航</a>
            <ul class="navigates">
                <li><a href="http://edu.51cto.com/px" target="_blank">微职位</a></li>
                <li><a href="http://edu.51cto.com/ke" target="_blank">视频课程</a></li>
                <li style="border-bottom: 1px solid #FFF;"><a href="http://edu.51cto.com/activity/lists/id-23.html?dh2" target="_blank">企业学习</a></li>
                <li><a href="http://edu.51cto.com/lecturer/lectopics" target="_blank">申请开课</a></li>
                <li><a href="http://www.51cto.com/" target="_blank">51CTO主站</a></li>
                <li><a href="http://x.51cto.com/act/cto/camp/page/video?edutop" target="_blank">CTO训练营</a></li>
                <li><a href="http://wot.51cto.com/?edutop" target="_blank">WOT峰会</a></li>
                <li><a href="http://wot.51cto.com/act/bcsl/info?edutop" target="_blank">百城沙龙</a></li>
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
        <li class="fr" id="TopCart">
            <a href="http://edu.51cto.com/user/login.html" target="_blank" class="red">购物车<span>0</span></a>
        </li>
        <li class="fr reg"><a href="http://edu.51cto.com/user/register.html" target="_blank">注册</a></li>
        <li class="fr"><a href="http://edu.51cto.com/user/login.html">登录</a></li>
    </ul>
</div>        <ul class="FixedSideBar">
        <li class="FixedSideBar_Spree">
            <p><a href="/spree/index" target="_blank">新人<br >大礼包</a></p>
        </li>
        <li class="FixedSideBar_iPad">
            <ul class="reddot"></ul>
            <p>APP下载</p>
            <div class="FixedSideBar_SSS"></div>
            <div class="FixedSideBar_iPad_QrCode">
                <img src="https://static1.51cto.com/edu/images/whitestyle/download_qr2.png" style="width:90px;" />
                <div class="tc">下载学院APP<br />缓存视频离线看</div>
            </div>
        </li>
        <li class="FixedSideBar_FeedBack">
            <p><a href="/user/feedback.html" target="_blank">意见反馈</a></p>
        </li>
        <li class="FixedSideBar_GoTop">
            <p>返回顶部</p>
        </li>
    </ul>
    
<input type="hidden" value="">
<div class="pagebg" style="width: 100%;background: #fff;">
    <div class="Page" style="height:90px;">
        <a href="http://wot.51cto.com/act/2017/architecture?edu" target="_blank">
            <img src="https://s1.51cto.com/images/201702/53e443972c9431116e16054f46df1f275601da.jpg" />
        </a>
    </div>
</div>
<div class="Header">
    <div class="Page">
        <div class="Logo fl">
            <a href="http://edu.51cto.com/" title="51cto学院"><img src="https://static1.51cto.com/edu/css/../center/images/logo.png" class="fl"></a>
        </div>
            <ul class="Navigate fl">
            <li><a href="http://edu.51cto.com/">首页</a></li>
            <li><a href="http://edu.51cto.com/px" target="_blank">微职位培训</a></li>
            <li><a href="http://edu.51cto.com/course/courseList/id-all.html" target="_blank">视频课程</a></li>
            <li><a href="http://edu.51cto.com/package/packagelist.html?ejdh" target="_blank">套餐</a></li>
            <li><a href="http://edu.51cto.com/roadmap/index.html" target="_blank">职业路线图</a></li>
            <li><a href="http://edu.51cto.com/activity/lists/id-23.html?dh1" target="_blank">企业学习</a></li>
            <li><a href="http://edu.51cto.com/activity/lists/id-32.html?dh"  target="_blank">免费试听</a></li>
            <li>
              <p class="min_more">线下学习</p>
              <div class="min_more">
                  <a target="_blank" href="http://x.51cto.com/act/cto/camp/page/video?edunav">CTO训练营</a>
                  <a target="_blank" href="http://wot.51cto.com/?edunav ">WOT峰会</a>
                  <a target="_blank" href="http://wot.51cto.com/act/bcsl/info?edunav">百城沙龙</a>
              </div>
            </li>
        </ul>
        <div class="Search fr">
            <form class="form-search" id="q-form" method="get" action="http://edu.51cto.com/index.php">
                <input name="do" type="hidden" value="search">
                <input name="m" type="hidden" value="course" id="_SearchType">
                <button class="fr">搜索</button>
                <input type="text" class="fr" placeholder="找课程、找讲师" name="q" id="q" autocomplete="off" />
            </form>
        </div>
    </div>
</div>
<div class="Page">
	<p class="SearchResultText">共找到 <span class="gre resultTotalNum">26</span> 个 "<span class="gre">赖国荣</span>" 相关结果</p>
	<ul class="SearchPageClassNav">
		<li class="SPCN_Item SPCN_Cur"><a href="javascript::" id="courseCount" on="2">课程(24)</a></li>
		<li class="SPCN_Item"><a href="/index.php?do=search&m=pack&q=%E8%B5%96%E5%9B%BD%E8%8D%A3">套餐(0)</a></li>

		<li class="SPCN_Item"><a href="/index.php?do=search&m=roadmap&q=%E8%B5%96%E5%9B%BD%E8%8D%A3">路线图(0)</a></li>
		<li class="SPCN_Item"><a href="/index.php?do=search&m=lecturer&q=%E8%B5%96%E5%9B%BD%E8%8D%A3">讲师(2)</a></li>
	</ul>	<div class="SearchResultTools bg_ef">
		<ul class="SearchResultScreen fl">
			<li class="SRSA_Item SRSA_Cur SRSA_down" key="relevance"><a href="javascript:;">相关排序</a></li>
			<li class="SRSA_Item" key="study_nums"><a href="javascript:;">人气</a></li>
			<li class="SRSA_Item" key="buy_nums"><a href="javascript:;">销量</a></li>
			<li class="SRSA_Item" key="score"><a href="javascript:;">好评</a></li>
			<li class="SRSA_Item" key="price"><a href="javascript:;">价格</a></li>
			<!--<li class="ml20" style="padding-top:2px;"><input type="checkbox" id="itsOver" /></li>
			<li><label for="itsOver">已完结</label></li>-->
			<li class="ml20" style="padding-top:2px;"><input type="checkbox" id="itsOnly" /></li>
			<li><label for="itsOnly">独家</label></li>
			<li>
				<div class="CCInputSelect w140Select ml20" style="margin-top:3px;">
					<p style="line-height:24px;">技术难度</p>
					<ul style="line-height:24px;">
						<li v="0">全部</li>
						<li v="1">初级</li>
						<li v="2">中级</li>
						<li v="3">高级</li>
					</ul>
				</div>
			</li>
		</ul>
		<ul class="SearchResultPageDevice fr f18" style="width:160px;">
			<li class="SRPD_next"></li>
			<li><span class="gre"><font id="scurPage">0</font></span>/<font id="stotalPage">0</font></li>
			<li class="SRPD_prev SRPD_prev_no"></li>
		</ul>
		<input type="hidden" value="0" id="AllCoursePage" />
		<div class="clear"></div>
	</div>
  <div class="micro_position_Rec">
    <div class="Main">
            <div class="fl Info Block">
        <div class="main">
          <h2 class="fl">微职位</h2>
            <h3 class="fl">&nbsp;- IT职场晋升培训领导者</h3>
            <div class="clear"></div>
            <p class="mb10">权威的学习模式.顶尖的授课名师.贴心的就业推荐</p>
            <p>面向的学员：IT普通从业者希望通过培训改变职位及薪资</p>
            <p>我们的使命：把IT普通从业者锻造成企业急需的IT精英人群</p>
        </div>
      </div>
                  <div class="fr Block list">
        <div class="fl subList">
          <h2>技能方向</h2>
          <div class="clear"></div>
                                  <a href="http://edu.51cto.com/px/train/94?jnfx" target="_blank" >· Python培训</a>
                                              <a href="http://edu.51cto.com/px/train/115?jnfx" target="_blank" >· Linux运维班</a>
                                              <a href="http://edu.51cto.com/px/train/108?jnfx" target="_blank" >· 大数据工程师班</a>
                                              <a href="http://edu.51cto.com/px/train/122?jnfx" target="_blank" >· 虚拟化与云计算</a>
                              </div>
        <div class="fl subList">
          <h2>认证方向</h2>
          <div class="clear"></div>
                                  <a href="http://edu.51cto.com/px/train/123?rzfx" target="_blank" >· 软考认证保过班</a>
                                              <a href="http://edu.51cto.com/px/train/109?jnfx" target="_blank" >· 华为认证保过班</a>
                                              <a href="http://edu.51cto.com/px/train/105?rzfx" target="_blank" >· 红帽认证保过班</a>
                                              <a href="http://edu.51cto.com/px/?rzfx" target="_blank" >· 更多认证</a>
                              </div>
      </div>
                  <div class="clear"></div>
    </div>
  </div>

	<ul class="SearchListCourse">
	</ul>
	<span id="searchPage"></span>
</div>

<script type="text/javascript">
var imgpath = false;
var price_unit = "¥";
    loadCourse();
	//模拟Select动作
	$(".CCInputSelect>p").click(function(){
		if($(this).next().css('display')=='none'){
			$(this).next().css('display','block');
			$(this).removeClass('grey');
		}else{
			$(this).next().css('display','none');
			$(this).addClass('grey');
		}
	});
	$(".CCInputSelect>ul>li").click(function(){
		var x = $(this).html();
		$(this).parent().prev().html(x);
		$(this).parent().css('display','none');
		$(this).parent().prev().addClass('grey difInput').attr('v', $(this).attr('v'));

		//技术难度 do something...
		loadCourse();
	});
	$(".CCInputSelect>ul").bind('mouseleave',function(){
		$(this).css('display','none');
		$(this).prev().addClass('grey');
	});
	//模拟Select动作End

	//筛选 是否更新完成
	$("#itsOver").click(function(){
		loadCourse();
		if($(this).is(":checked")){
			//更新完被选中 do something...
		}else{
			//更新完取消选中 do something...
		}
	});
	//筛选  是否独家
	$("#itsOnly").click(function(){
		loadCourse();
		if($(this).is(":checked")){
			//独家被选中 do something...
		}else{
			//独家取消选中 do something...
		}
	});


	// 课程排序
	$('.SRSA_Item').click(function() {
		var sort = '';
		if($(this).hasClass('SRSA_up')) {
			sort = 'SRSA_down';
		} else if($(this).hasClass('SRSA_down')) {
			sort = 'SRSA_up';
		} else {
			sort = 'SRSA_down';
		}

		if($(this).attr('key') == 'relevance') {
			sort = 'SRSA_down';
		}

		$('.SRSA_Item').removeClass('SRSA_Cur SRSA_up SRSA_down');
		$(this).addClass('SRSA_Cur ' + sort);

		loadCourse();
		return false;
	})


	//会员卡点击
	$(".VipTypeItem").click(function(){
		if(!$(this).hasClass('VipTypeItem_Display')){
			$(this).addClass('VipTypeItem_Cur').siblings().removeClass('VipTypeItem_Cur');
			$(this).parent().parent().prev().find('p').eq($(this).index()+1).show().siblings().hide().eq(0).show();
		}
	});

	//翻页点击
	$(".SRPD_next").bind('click',function(){
		var thisPage = $("#scurPage").text();
		if(parseInt(thisPage) <$("#AllCoursePage").val()){
			thisPage++;
			$("#scurPage").text(thisPage);
			$(this).next().next().removeClass('SRPD_prev_no');
			
			SRPD_SHOW(thisPage);
			loadCourse(thisPage);
		}
	});
	$(".SRPD_prev").bind('click',function(){
		var thisPage = $("#scurPage").text();
		if(parseInt(thisPage) >1){
			thisPage--;
			$("#scurPage").text(thisPage);
			$(this).prev().prev().removeClass('SRPD_next_no');

			SRPD_SHOW(thisPage);
			loadCourse(thisPage);
		}
	});

	$(document).on('click', '.pagesGoPrve, .pagesNum, .pagesGoNext, .pagesGoHome, .pagesGoEnd', function() {
		var obj = $(this);
		if(obj.hasClass('pagesNumCur')) {
			return ;
		}

		var href = $(this).attr('href');
		loadCourse(href);
		return false;
	})

//课程右上角分页
function SRPD_SHOW(curPage) {
	if(curPage >= $("#AllCoursePage").val()){
		$('.SRPD_next').addClass('SRPD_next_no');
	} else {
		$('.SRPD_next').removeClass('SRPD_next_no');
	}

	if(curPage <= 1){
		$('.SRPD_prev').addClass('SRPD_prev_no');
	} else {
		$('.SRPD_prev').removeClass('SRPD_prev_no');
	}
}

function loadCourse(page) {
	//$('#searchPage').html('');
	$(".ItsNothing").remove();
	var url = '';
	if(!page) {
		page = 1;
	} else {
		if(isNaN(page)) {
			var pArr = page.split("page=");
			var page = pArr[1];
		}
	}
	var q = "赖国荣";
	q = encodeURIComponent(q);
	if(url == '') {
		url = '/index.php?do=search&m=courseSearch&q='+q+'&page=' + page;
	}

	var listObj = $('.SearchListCourse');
	var Loading = $('<div class="ItsNothing"><img src="https://static1.51cto.com/edu/images//loading1.gif" /></div>');
	listObj.before(Loading);
	listObj.empty();
	
	var sort = 'DESC';
	var sortKey = $('.SRSA_Cur');
	if(sortKey.hasClass('SRSA_up')) {
		sort = 'ASC';
	}

	if(sortKey.attr('key') != 'relevance') {
		var sortText = sortKey.attr('key') + '_' + sort;
	} else {
		var sortText = sortKey.attr('key');
	}
	
	var itsOver = $('#itsOver').attr('checked') ? 2 : 0;
	var itsOnly = $('#itsOnly').attr('checked') ? 3 : 0;
	var difficulty = $('.difInput').attr('v');

	$.ajax({
		url:url + '&v=' + Math.random()*10000,
		//type:'POST',
		data:{sortText:sortText, is_end:itsOver, sole_first:itsOnly, difficulty:difficulty},
		success:function(data) {
			if(data.status) {
				Loading.remove();
				// if(data.packList){packBuild(listObj, data.packList,page);}
				courseBuild(listObj, data,page);
				if($(".live").length>0){
				  $(".live:last").after($(".packItem"))
				}
			}
		}
	});
}


function packBuild(listObj,datas,p){
	$.each(datas,function(i,data){
		var item = '';
		item += '<li class="SearchListCourseItem packItem" style="height:100px;overflow:hidden;">';
		item += '	<div class="fl SLCI_Img">';
		item += '		<div class="r20 courseCardType">套餐</div>';
		item += '		<a target="_blank" href="/pack/view/id-'+data.pack_id+'.html?sslb">';
		item += '			<img src="'+data.pack_img+'">';
		item += '		</a>';
		item += '	</div>';
		item += '	<div class="fl SLCI_Con" style="width:990px;">';
		item += '		<h3><a href="/pack/view/id-'+data.pack_id+'.html?sslb" target="_blank">'+data.pack_title+'</a></h3>';
		item += '		<p class="ellipsis">'+data.pack_desc+'</p>';
		item += '		<p>相关讲师：';
		for(var i=0;i<data.lec.length;i++){
			item += '			<span class="gre mr15">';
			item += '				<a href="/user/user_id-'+data.lec[i].user_id+'.html" target="_blank" class="gre">'+data.lec[i].realname+'</a>'; 
			item += '			</span>';
		}
		item += '			&nbsp;&nbsp;&nbsp;&nbsp;共 <span class="gre">'+data.study_nums+'</span> 人学习';
		item += '		</p>';
		item += '		<p>套餐价： <span class="f16 red">¥'+data.price.pack_price+'</span><span class="mr15"></span>原价：<span class="del">¥'+data.price.total_price+'</span></p>';
		item += '	</div>';
		item += '	<div class="clear"></div>';
		item += '</li>';
		listObj.append($(item))
	})
}

function courseBuild(listObj, data,p) {
	if(p!=1){listObj.empty();}
	$('.searchNoText').remove();
	$('#searchPage').html(data.pageStr);
	$('#AllCoursePage').val(data.totalPage);
	$('#scurPage').html(data.page);
	$('#stotalPage').html(data.totalPage);
	$('#courseCount').html('课程('+data.count+')');
	var totalN = $('#courseCount').attr('on');
	totalN = parseInt(totalN);
	totalN = totalN + parseInt(data.count);
	$('.resultTotalNum').html(totalN);
	SRPD_SHOW(data.page);
	if(data.courseList) {
		$.each(data.courseList,function(i,e){//
			var url = (e.orig_type==1)?e.pxb_url:'/course/course_id-'+e.course_id+'.html';
			var l_1 = $('<li class="SearchListCourseItem" style="height:100px;overflow:hidden;"></li>');


			var l_2 = $('<div class="fl SLCI_Img"><div class="r20 courseCardType"></div><a target="_blank" href="'+url+'" title="'+e.title+'"><img src="'+e.imageurl+'" alt="'+e.title+'" /></a></div>');
			var l_3 = $('<div class="fl SLCI_Con"><h3><a href="'+url+'" target="_blank" title="'+e.title+'">'+e.showTitle+'</a></h3><p class="ellipsis">'+e.describe+'</p><p class="ellipsis">适用人群：'+e.for_who+'</p><p>'+e.updateStr+'</p></div>');
			if(e.isAct) {//活动
				if(e.isAct == 'dis'){
					var l_4 = $('<div class="fl SLCI_Price"><h3 class="red f16 fl">'+price_unit+e.newPrice+'</h3><div style="margin-right:10px;" class="dcdc fl"><h3>'+e.actText+'</h3></div><div class="clear"></div><p class="grey">原价：<span class="del">'+price_unit+e.price+'</span></p></div>');
				}else{
					var l_4 = $('<div class="fl SLCI_Price"><h3 class="red f16 fl">'+price_unit+e.newPrice+'</h3><div style="margin-right:10px;" class="dcdc fl"><h3>'+e.actText+'</h3></div><div class="clear"></div></div>');
				}
				
			} else {
				if(e.price == 0) {					
					var priceText = '免费';
					
				} else {
					var priceText = price_unit+e.price;
				}
				if(e.orig_type==1){
					var priceText = '<a href="'+url+'" target="_blank" class="red">免费试听</a>';
				}

				var l_4 = $('<div class="fl SLCI_Price"><h3 class="red f16 fl">'+priceText+'</h3><div class="clear"></div></div>');
			}
			if(e.score == false) {
				var scoreText = '<span>暂无</span>';
			} else {
				var scoreText = '<span class="gre">'+e.score+'</span>';
			}
			
			//var l_5 = $('<div class="fl SLCI_Info"><p>学员评分：'+scoreText+'</p><p>技术难度：'+e.difText+'</p><p>更新状态：'+e.updateStatus+'</p><p>讲师姓名：<a class="gre" href="/user/user_id-'+e.user_id+'.html" target="_blank">'+e.lec_name+'</a></p></div>');
			//var l_5 = $('<div class="fl SLCI_Info"><p>学员评分：'+scoreText+'</p><p>技术难度：'+e.difText+'</p><p>更新状态：'+e.updateStatus+'</p><p>讲师姓名：<a class="org" href="/user/user_id-'+e.user_id+'.html" target="_blank">'+e.lec_name+'</a></p></div>');
			var l_5 = $('<div class="fl SLCI_Info"><p>学员评分：'+scoreText+'</p><p>技术难度：'+e.difText+'</p><p>讲师姓名：<a class="org" href="/user/user_id-'+e.user_id+'.html" target="_blank">'+e.lec_name+'</a></p></div>');

			var l_6 = $('<div class="clear"></div>');
			
			if(e.orig_type==1){
				l_2.find('img').width(190).height(106);
				l_2.find('.courseCardType').text('微职位');
				if(e.train_model == 1){
				l_3 = $('<div class="fl SLCI_Con" style="font-size:14px;"><h3><a href="'+url+'" target="_blank" title="'+e.title+'">'+e.showTitle+'</a></h3><p style="height:52px;line-height:26px;overflow:hidden;">'+e.describe+'</p><p>开班时间：'+e.start_time_type+' 至 '+e.end_time_type+'</p></div>').width(634);
				}else{
				l_3 = $('<div class="fl SLCI_Con" style="font-size:14px;"><h3><a href="'+url+'" target="_blank" title="'+e.title+'">'+e.showTitle+'</a></h3><p style="height:52px;line-height:26px;overflow:hidden;">学习模式：视频课程+直播答疑+作业考核+通关式学习+一对一辅导+班级小组学习</p><p>随到随学&nbsp'+e.video_duration_num+' 周</p></div>').width(634);
				}
				l_5 = $('<div class="fl SLCI_Info"><p>培训类型：'+e.train_type_name+'</p><p>报名截止：'+e.regend_time_type+'</p><p>讲师姓名：<a class="gre" href="'+e.lec_url+'" target="_blank">'+e.real_name+'</a></p></div>');
				l_5.find('p').css({'margin-right':'-20px','width':140});
				l_1.addClass('live')
			}else{
				if(e.sole_first == 2) {
					l_2.find('.courseCardType').text('独家');
				} else if(e.sole_first == 1) {
					l_2.find('.courseCardType').text('首发');
				} else{
					l_2.find('.courseCardType').remove()
				}
			}
			l_1.append(l_2).append(l_3).append(l_4).append(l_5).append(l_6);
			listObj.append(l_1);
		});
	} else {
		var nothing = $(data.noResultText);
		listObj.before(nothing);
		$(".courseScore").each(function(){
	        $(this).parent().css('width',$(this).val()*15);
	    });
	}

}



</script>
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
                <a href="http://edu.51cto.com/about/index.html" title="关于我们" target="_blank">关于我们</a>
                <span></span>
                <a href="http://edu.51cto.com/help.html" target="_blank"  title="帮助中心">帮助中心</a>
                <span></span>
                <a href="http://edu.51cto.com/user/feedback.html" title="意见反馈" target="_blank">意见反馈</a>
                <span></span>
                <a href="http://edu.51cto.com/about/contactus.html" target="_blank"  title="联系我们">联系我们</a>
                <span></span>
                <a href="http://bbs.51cto.com/thread-1113045-1.html" target="_blank"  title="课程登记">课程登记</a>
                <span></span>
                <a href="http://edu.51cto.com/user/studyGains.html" target="_blank"  title="学员故事">学员故事</a>
                <span></span>
                <a href="http://51edu.blog.51cto.com/8899635/1862738" target="_blank"  title="学员交流">学员交流</a>
            </div>
            <p class="Call fl red">400-851-9651</p>
            <p class="fl callTime">09:00 - 19:00</p>
            <div class="clear"></div>
            <p class="copy">Copyright &copy; 2005-2017 <a href="http://www.51cto.com/" target="_blank">51CTO.com</a></p>
        </div>
        <div class="clear"></div>
    </div>
</div>
<img src="https://static1.51cto.com/edu/images/whitestyle/qqbm_bs.png" style="position: fixed;right:10px;bottom:100px;z-index: 99;cursor: pointer;" onclick="$('#AdviceMask').show();$('#Advice').show();">
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
    var sessionid = "hu98eke0vuij6u8ugfbnqirh55",
            ip = "218.204.104.235",
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
<div style="display:none">
    <iframe frameborder="0" scrolling="no" width="0" height="0" src="http://log.51cto.com/pageview.php?frompos=edu_art"></iframe>
</div>
</body>
</html>
