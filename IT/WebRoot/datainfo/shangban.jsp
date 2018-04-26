<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
  <meta charset="utf-8" />
  <title>51CTO学院Python微职位-51CTO学院直播培训-专业的IT职业在线教育及实战培训平台-51CTO学院直播培训-专业的IT职业在线教育及实战培训平台</title>
  <meta name="keywords" content="Python，python自动化开发python培训,python学习视频,python视频教程,老男孩python培训,python学习路线图" />
  <meta name="description" content="51CTO学院/老男孩Python微职位随报随学!在线Python培训课程,学习更便捷,一对一面试辅导，闯关学习，终身推荐就业!咨询电话:4008519651" />
  <link rel="stylesheet" type="text/css" href="https://static.edu.51cto.com/plugin/datepicker/datepicker.css">
  <link rel="stylesheet" type="text/css" href="https://static.edu.51cto.com/plugin/webuploader/webuploader.css">
  <link rel="stylesheet" type="text/css" href="https://static.edu.51cto.com/css/../center/css/base.css?v=2.4.51121">
  <link rel="stylesheet" type="text/css" href="https://static.edu.51cto.com/pxb/base.css?v=2.4.51121">
  <link rel="stylesheet" type="text/css" href="https://static.edu.51cto.com/pxb/style.css?v=2.4.51121">
  <link rel="stylesheet" type="text/css" href="https://static.edu.51cto.com/pxb/wxk.css?v=2.4.51121">
  <!-- 通用顶部简导航CSS -->
  <link rel="stylesheet" type="text/css" href="https://static.edu.51cto.com/css/gen_top.css?v=2.2.82">
  <script src="https://static.edu.51cto.com/plugin/jquery.min.js"></script>
  <script src="https://static.edu.51cto.com/plugin/jquery.form.js"></script>
  <script src="https://static.edu.51cto.com/plugin/jquery.mousewheel.min.js"></script>
  <!-- 通用简导航JS -->
  <script type="text/javascript" src="https://static.edu.51cto.com/js/gen_top.js?v=2.2.82"></script>
  <script type="text/javascript">
    var image_url = 'https://s1.51cto.com/';
    var pxy_url = 'http://pay.51cto.com/';
    var edu_url = 'http://edu.51cto.com/';
    var uc_api = 'http://ucenter.51cto.com/';
    var uc_url = 'https://ucenter.51cto.com/';
    var home_url = 'http://home.51cto.com/';
    var uppath = 'http://u2.51cto.com/';
    var p_url = 'http://video.51cto.com/';
    var web_url = 'http://edu.51cto.com/px/';
    var imgpath = 'https://static.edu.51cto.com/images/';
    var csspath = 'https://static.edu.51cto.com/css/';
    var jspath = 'https://static.edu.51cto.com/js/';
    var edu_api = 'http://edu.51cto.com/api/php/edu_server.php';
    var static_img = 'https://static.edu.51cto.com/pxb/images/';
    var static_css = 'https://static.edu.51cto.com/pxb/css/';
    var static_js = 'https://static.edu.51cto.com/pxb/js/';
    var static_path = 'https://static.edu.51cto.com/pxb/'
    var pxb_search = web_url+'train/search?';
    var log_url = 'http://da.51cto.com/';
    var sendlog_url = web_url+'log/sends';
    if (!Date.now) {
        Date.now = function() { return new Date().getTime(); };
    }
    var gen_logo = '1';
    var course_id = 0; 
  </script>
</head>
<body>
  <!-- header start -->
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
</div>  <!-- header end -->

  <!-- content start -->
  <div class="Content">
    
<link rel="stylesheet" type="text/css" href="https://static.edu.51cto.com/css/pxbtrain/29/css/style.css?v=1.01">

<!-- banner -->
<div class="mian_bg banner">
  <div class="btn openLy">点击咨询详情</div>
</div>

<!-- byname -->
<div class="mian_bg byname_bg">
  <div class="mian w1200 pad100">
    <div class="title">
      <h2 class="cff">优惠不等人，抓紧时间报名吧</h2>
    </div>

    <div class="byname_con">
      <div class="left fl">
        <img src="https://static.edu.51cto.com/css/pxbtrain/29/images/n_01.png" >
        <p>零元入学，先学习后付款，我们为你提供更贴心的分期付款服务，不再让费用成为阻碍你提升IT技能路上的障碍。</p>
        <span class="button openLy">点击申请免费学习</span>
      </div>
      <div class="right fl">
        <img src="https://static.edu.51cto.com/css/pxbtrain/29/images/n_02.png" >
        <p>51CTO学院微职位定制课程，本周报名9折优惠，优惠不等人，抓紧时间报名吧，名额有限先到先得。</p>
        <span class="button openLy">点击申请九折优惠</span>
      </div>
      <div class="clear"></div>
    </div>

    <div class="byname_bottom tc">
      <p class="byname_title">上班族Python培训领导者</p>
      <img src="https://static.edu.51cto.com/css/pxbtrain/29/images/n_03.png" >
      <p class="byname_num">本周新班开课，仅剩<b>10</b>个名额</p>
      <span class="byname_btn button openLy">点击申请免费试听</span>
    </div>
  </div>
</div>

<!-- pxb -->
<div class="mian_bg">
  <div class="mian w1200 pad50">
    <!-- 01 -->
    <div class="pxb_box pad50">
      <div class="pxb_left fl">
        <div class="pxb_title">
          <p>上班族Python培训</p>
          <h2><em>爽</em>，频繁直播，随到随学</h2>
        </div>
        <h2 class="f26 c42">权威</h2>
        <p>1500万用户调研得出，随时录播，</p>
        <p>定时直播，更适合上班族</p>
        <h2 class="f26 c42 pad20">特色</h2>
        <p>上班族学员，不用再担心加班出差</p>
        <p>等因素影响学习进度</p>
        <p class="pad45">我们站在上班族的角度为你定制专属课程</p>
        <p>无论你在哪个省份，哪个城市</p>
        <p>无论你是否有固定的时间</p>
        <p>我们都可以为你制定你专属的学习形式和进度</p>
        <p>电脑端/移动端，直播/录播全程效果保障体系</p>
      </div>
      <div class="pxb_right pxb_right_01 fr">
        <span class="button openLy">点击制定学习方案</span>
      </div>
      <div class="clear"></div>
    </div>
    <!-- 02 -->
    <div class="pxb_box pad50">
      <div class="pxb_left fl">
        <div class="pxb_title">
          <p>上班族Python培训</p>
          <h2><em>准</em>，工作实用，项目实战</h2>
        </div>
        <h2 class="f26 c42">权威</h2>
        <p>按照IT行业人才标准，打造最实用的</p>
        <p>全流程项目实战课程</p>
        <h2 class="f26 c42 pad20">特色</h2>
        <p>我们按照运维/测试等岗位要求，打造</p>
        <p>上班族实用课程</p>
        <p class="pad45">51CTO学院11年来致力于上班族IT培训</p>
        <p>以工作为导向，向死而生</p>
        <p>为上班族打造最实用，最贴近工作的培训</p>
        <p>闯关式学习，全程监控每个人的学习效果</p>
        <p>保障每个学员学有所成，为职场助力</p>
      </div>
      <div class="pxb_right pxb_right_02 fr">
        <span class="button openLy">点击制定学习方案</span>
      </div>
      <div class="clear"></div>
    </div>
    <!-- 03 -->
    <div class="pxb_box pad50">
      <div class="pxb_left fl">
        <div class="pxb_title">
          <p>上班族Python培训</p>
          <h2><em>稳</em>，六层进阶，保证学成</h2>
        </div>
        <h2 class="f26 c42">权威</h2>
        <p>超过50万上班族学员的培训证明，</p>
        <p>六层进阶学成效果最佳</p>
        <h2 class="f26 c42 pad20">特色</h2>
        <p>授课名师，助教，就业导师四人</p>
        <p>带你六层进阶</p>
        <h2 class="f26 c42 pad20">六层进阶体系</h2>
        <p>从你报名那一刻开始，我们就对你的学习全面负责</p>
        <p>时时对你的学习进行监控，学有所成，高薪就业</p>
        <p>是我们一直以来的信仰，一起为你的职场拼搏</p>
      </div>
      <div class="pxb_right pxb_right_03 fr">
        <span class="button openLy">点击制定学习方案</span>
      </div>
      <div class="clear"></div>
    </div>
    <!-- 04 -->
    <div class="pxb_box pad50">
      <div class="pxb_left fl">
        <div class="pxb_title">
          <p>上班族Python培训</p>
          <h2><em>妥</em>，1对1服务，助你成功</h2>
        </div>
        <h2 class="f26 c42">权威</h2>
        <p>11年的IT行业沉淀，我们更了解学员</p>
        <p>最想要的是什么</p>
        <h2 class="f26 c42 pad20">特色</h2>
        <p>四层1对1服务，这一次你离学成</p>
        <p>Python只差一步</p>
        <p class="pad45">1对1助教答疑服务</p>
        <p>1对1班主任督学服务</p>
        <p>1对1老师考核服务</p>
        <p>1对1面试指导服务</p>
      </div>
      <div class="pxb_right pxb_right_04 fr">
        <span class="button openLy">点击制定学习方案</span>
      </div>
      <div class="clear"></div>
    </div>
  </div>
</div>

<!-- name -->
<div class="mian_bg info_bg">
  <div class="mian w1200 pad100">
    <div class="info_box fr">
      <h2>今晚有课</h2>
      <p class="f22 pad15">已有<em>17688</em>名学员体验并好评</p>
      <p class="f16">留下您的信息即可申请免费试听</p>
      <div class="info" id="info">
        <input type="text" name="pname" value="真实姓名">
        <input type="text" name="phone" value="手机号">
        <input type="text" name="qq" value="QQ号">
        <span class="info_btn" id="getInfo">我要试听</span>
      </div>
    </div>
    <div class="clear"></div>
  </div>
</div>

<!-- teacher -->
<div class="mian_bg">
  <div class="mian w1200 pad100">
    <div class="title">
      <p class="c42">上班族python培训，体验大师的盛宴  </p>
      <h2 class="c42">名师大咖亲临授课</h2>
    </div>
    <ul class="teacher_list">
      <li>
        <img class="left fl" src="https://static.edu.51cto.com/css/pxbtrain/29/images/n_04.png">
        <div class="right fl">
          <h2>Alex 金角大王</h2>
          <span>IT课堂&nbsp;&nbsp;高级讲师</span>
          <p>老男孩教育python教学总监，CrazyEye,MadKing,TriAquae三款开源软件作者，10多年运维+自动化开发经验，曾任职公安部、飞信、Nokia中国、汽车之家等公司，热爱技术、电影、音乐、旅游、妹子！</p>
        </div>
        <div class="clear"></div>
      </li>
      <li>
        <img class="left fl" src="https://static.edu.51cto.com/css/pxbtrain/29/images/n_05.png">
        <div class="right fl">
          <h2>武Sir 银角大王</h2>
          <span>IT课堂&nbsp;&nbsp;签约讲师</span>
          <p>擅长C#，Python，PHP等一大堆开发语言，现任某大型互联网公司高级自动化开发工程师，已精读多个开源软件源码，自行开发过改进版Tornado WEB框架，讲课风趣幽默，除了追求完美，没啥缺点！</p>
        </div>
        <div class="clear"></div>
      </li>
    </ul>
  </div>
</div>

<!-- time -->
<div class="mian_bg time_bg">
  <div class="mian w1200 padt275 tc time_box">
    <h2>51CTO高额奖学金计划</h2>
    <p id="last_time">距离截止&nbsp;<em>12</em>&nbsp;天&nbsp;<em>10</em>&nbsp;时&nbsp;<em>28</em>&nbsp;分&nbsp;<em>45</em>&nbsp;秒</p>
    <span class="button openLy">点击抢占奖学金名额</span>
  </div>
</div>

<!-- python -->
<div class="mian_bg">
  <div class="mian w1200 pad100">
    <div class="title">
      <h2 class="c42">闯关式学习，成就Python大牛</h2>
    </div>
    <ul class="python_box python_list_top mt60">
      <li>
        <span>第一关</span>
        <p>Python基础</p>
      </li>
      <li>
        <span>第二关</span>
        <p>函数和常用模块</p>
      </li>
      <li>
        <span>第三关</span>
        <p>面向对象</p>
      </li>
      <li>
        <span>第四关</span>
        <p>网络编程基础</p>
      </li>
      <li>
        <span>第五关</span>
        <p>网络编程进阶</p>
      </li>
      <div class="clear"></div>
    </ul>
    <ul class="python_box python_list_bottom">
      <li>
        <span>第六关</span>
        <p>web开发基础</p>
      </li>
      <li>
        <span>第七关</span>
        <p>web开发进阶</p>
      </li>
      <li>
        <span>第八关</span>
        <p>算法与设计模式</p>
      </li>
      <li>
        <span>第九关</span>
        <p>9大实战项目</p>
      </li>
      <li class="last openLy">
        <a href="javascript:;">点击索取课程大纲</a>
      </li>
      <div class="clear"></div>
    </ul>
  </div>
</div>

<!-- public -->
<div class="mian_bg public_bg">
  <div class="mian public_box">
    <span class="button openLy">点击查看项目详情</span>
  </div>
</div>

<!-- more -->
<div class="mian_bg">
  <div class="mian w1200 pad100">
    <div class="more_left fl">
      <img src="https://static.edu.51cto.com/css/pxbtrain/29/images/n_06.png">
      <p>微信之父张小龙推荐</p>
      <span class="button openLy">点击了解更多</span>
    </div>
    <div class="more_right fr">
      <img src="https://static.edu.51cto.com/css/pxbtrain/29/images/n_07.png">
      <p>人民日报IT学习榜首</p>
      <span class="button openLy">点击了解更多</span>
    </div>
    <div class="clear"></div>
  </div>
</div>

<!-- student -->
<div class="mian_bg">
  <div class="mian w1200 pad100">
    <div class="title">
      <h2 class="c42">最新就业学员</h2>
    </div>
    <ul class="student_list">
      <li>
        <h2>孙童鞋</h2>
        <span>运维工程师</span>
        <p>Python 2期学员，现入职北京，<br>易到用车，现薪资13K，涨幅20%</p>
      </li>
      <li>
        <h2>王童鞋</h2>
        <span>运维工程师</span>
        <p>Python 11期学员，现入职北京，<br>映客直播，现薪资16K，涨幅25%</p>
      </li>
      <li>
        <h2>王童鞋</h2>
        <span>自动化开发工程师</span>
        <p>Python 11期学员，现入职北京，<br>搜狗，现薪资17K，涨幅35%</p>
      </li>
      <li>
        <h2>张童鞋</h2>
        <span>运维工程师</span>
        <p>Python 12期学员，现入职深圳，<br>全时云商务股份有限公司，<br>现薪资15K，涨幅40%</p>
      </li>
      <li>
        <h2>李童鞋</h2>
        <span>运维主管</span>
        <p>Python 2期学员，现入职广州，<br>大象健康科技有限公司，<br>现薪资16K，涨幅20%</p>
      </li>
      <li>
        <h2>毕童鞋</h2>
        <span>运维工程师</span>
        <p>Python1期学员，现入职北京，<br>大头互动文化传播有限公司，<br>现薪资12K，涨幅30%</p>
      </li>
      <div class="clear"></div>s
    </ul>
    <div class="tc">
      <span class="student_btn button openLy">点击在线沟通学长</span>
    </div>
  </div>
</div>

<!-- compy -->
<div class="mian_bg">
  <div class="mian w1200 pad100">
    <img src="https://static.edu.51cto.com/css/pxbtrain/29/images/n_bg_11.jpg" >
    <div class="tc mtu50">
      <span class="student_btn button openLy">更多直通企业</span>
    </div>
  </div>
</div>

<!-- book -->
<div class="mian_bg book_bg mbu30">
  <div class="mian w1200 book_box">
    <div class="right">
      <h2>这一次你离学会Python<br>只差一步之遥...</h2>
      <a class="button top openLy">点击在线咨询</a><br>
      <a class="button bottom" href="http://edu.51cto.com/px/train/signup/94" target="_blank">点击在线报名</a>
    </div>
  </div>
</div>


<div id="Mask"></div>
<div id="submit_succes" class="submit_succes">
  <h1>提交成功！</h1>
  <button id="toclose"></button>
</div>
<div id="submit_error" class="submit_succes">
  <h1 id="error_msg">提交失败！</h1>
  <button id="tocloseE"></button>
  <button id="hurry">确定</button>
</div>
<script>
  // 七天倒计时
  var daytemp = 7//新增加变量
  function show_date_time(){
    window.setTimeout("show_date_time()", 1000);
    var nowDate = new Date(),
        nowDay = nowDate.getDay()-1<0?6:nowDate.getDay()-1,
        sectimeold = (7-nowDay)*86400-(nowDate.getHours()*3600+nowDate.getMinutes()*60+nowDate.getSeconds()); //相差多少秒
    secondsold = Math.floor(sectimeold);
    msPerDay = 24*60*60; //相差多少天
    e_daysold = sectimeold/msPerDay
    daysold = Math.floor(e_daysold);
    e_hrsold = (e_daysold-daysold)*24; //相差多少小时
    hrsold = Math.floor(e_hrsold);
    if (hrsold < 10){
        hrsold = "0"+hrsold;
    }
    e_minsold = (e_hrsold-hrsold)*60; //相差多少分
    minsold = Math.floor((e_hrsold-hrsold)*60);
    if (minsold < 10){ 
      minsold = "0"+minsold;
    }
    seconds=Math.floor((e_minsold-minsold)*60); //相差多少秒
    if (seconds < 10){ 
      seconds = "0"+seconds;
    }

    if(daysold >= 0){
      $('#last_time').html('距离截止&nbsp;<em>'+daysold+'</em>&nbsp;天&nbsp;<em>'+hrsold+'</em>&nbsp;时&nbsp;<em>'+minsold+'</em>&nbsp;分&nbsp;<em>'+seconds+'</em>&nbsp;秒');
    }else{
      if(daysold + daytemp >= 0){
        $('#last_time').html('距离截止&nbsp;<em>'+(daysold+daytemp)+'</em>&nbsp;天&nbsp;<em>'+hrsold+'</em>&nbsp;时&nbsp;<em>'+minsold+'</em>&nbsp;分&nbsp;<em>'+seconds+'</em>&nbsp;秒')
      }else{
        daytemp = daytemp+7;
      }
    }
  }
  show_date_time();

  // 输入框焦点
  var input_pname = $('input[name=pname]'),
      pname_val = input_pname.val(),
      input_phone = $('input[name=phone]'),
      phone_val = input_phone.val(),
      input_qq = $('input[name=qq]'),
      qq_val = input_qq.val();
  focusOrblur( input_pname );
  focusOrblur( input_phone );
  focusOrblur( input_qq );

  // 报名
  $("#getInfo").click(function(){
    var datas = {},isNULL=false;;
    $("#info").find('input').each(function(i,e){
      datas[$(this).attr('name')] = $(this).val();
      if($(this).val().length==0) isNULL = true;
    });
    if(isNULL){
      $("#error_msg").html('请输入完整信息~');
      $("#Mask, #submit_error").show()
    }else{
      datas['tid']='94';
      $.ajax({
        url:'http://edu.51cto.com/px/train/receive',
        data:datas,
        type:'POST',
        dataType:'json',
        success:function(e){
          if(e.status == '1'){
            $("#Mask, #submit_succes").show();
          }else{
            $("#error_msg").html(e.msg);
            $("#Mask, #submit_error").show()
          }
        }
      })
      
    }
  });

  // 关闭弹窗
  $("#toclose, #tocloseE, #hurry").click(function() {
    $('#error_msg').html('提交失败！');
    $("#Mask, #submit_succes, #submit_error").hide();
  });

  /**
 * * 获取焦点失去焦点
 * @param  {[type]} obj [元素按钮]
 */
  function focusOrblur(obj){
    obj.bind({ 
      focus:function(){ 
        if (this.value == this.defaultValue){
          this.value="";
        }
      }, 
      blur:function(){ 
        if($(this).val() == ''){
          this.value = this.defaultValue; 
        }
      } 
    });
  }
</script>
<script type="text/javascript">
  if(document.location.protocol=='https:'){
      document.write('\<script type="text\/javascript" charset="utf-8" src="https\:\/\/gate.soperson.com\/20000923\/10063912\.js"\>\<\/script\>')
  }else{
      document.write('\<script type="text\/javascript" charset="utf-8" src="http\:\/\/lead.soperson.com\/20000923\/10063912\.js"\>\<\/script\>')
  }
</script>
<script type="text/javascript">
  $(".openLy").click(function(){
    doyoo.util.openChat('g=10066064');
  })
</script>
<script type="text/javascript">
var rmid = 2;//微职位详情页
var course_id = 94;//微职位ID[即课程ID],js值覆盖
</script>
<input type="hidden" value="px">  </div>
  <!-- content end -->

  <!-- footer start -->
  <div class="Footer">
    <div class="Page">
        <table class="QRcode tc">
            <caption>
                <a href="<%=basePath %>courselistservlet?order=list" title="IT课堂"><img src="<%=basePath %>image/itlogo.png" alt="IT课堂" width="194" height="40"/>
            </caption>
            <tr>
                <td>
                    <img src="https://static.edu.51cto.com/css/../center/images/qrcode.png" alt="学院APP" width="110" height="110"/>
                    <p>学院APP</p>
                </td>
                <td>
                    <img src="https://static.edu.51cto.com/css/../center/images/qrcode2.png" alt="官方微信" width="110" height="110"/>
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
                <a href="http://51edu.blog.51cto.com/8899635/1862738" target="_blank" title="学员交流">学员交流</a>
            </div>
            <p class="Call fl red">400-851-9651</p>
            <p class="fl callTime">09:00 - 19:00</p>
            <div class="clear"></div>
            <p class="copy">Copyright &copy; 2005-2016 <a href="http://www.51cto.com/" target="_blank">51CTO.com</a></p>
        </div>
        <div class="clear"></div>
    </div>
  </div>
  <!-- footer end -->

  <script src="https://static.edu.51cto.com/plugin/util.js"></script>
  <script src="https://static.edu.51cto.com/plugin/scrollbar.js"></script>
  <script src="https://static.edu.51cto.com/plugin/select.js"></script>
  <script src="https://static.edu.51cto.com/plugin/word-count.js"></script>
  <script src="https://static.edu.51cto.com/plugin/mbox.js"></script>
  <script src="https://static.edu.51cto.com/plugin/new_mbox.js"></script>
  <script src="https://static.edu.51cto.com/pxb/js/top.js?v=1.1"></script>
  <script src="https://static.edu.51cto.com/plugin/datepicker/datepicker.js"></script>
  <script src="https://static.edu.51cto.com/plugin/datepicker/datepicker.zh-CN.js"></script>
  <script src="https://static.edu.51cto.com/plugin/placeholder.js"></script>
  <script src="https://static.edu.51cto.com/plugin/time.js"></script>



  <script typ="text/javascript">
      var levelid = 0;   //课程难度
      var packid = 0;  //套餐ID
      var source = 1;
      var user_id = 0;
      var lec_id = 0;
      var sessionid = '42j1orkd6fk4pqbihq5e3sj2o1';
      var ip='218.204.104.235';
      var rmid = 2;   //微职位详情页
        //微职位ID[即课程ID],js值覆盖
      $(".headMenu li[index='train']").addClass("Cur");
  </script>
  <script src="https://static.edu.51cto.com/js/md5.js"></script>
  <script src="https://static.edu.51cto.com/pxb/js/log_public.js"></script>
  <script src="https://static.edu.51cto.com/pxb/js/pxb_pv_tract.js"></script>
  <div style="display:none;"><script src="https://logs.51cto.com/rizhi/count/count.js" language="JavaScript"></script></div>

  <script type="text/javascript"> document.write(unescape("%3Cscript src='https://tongji.51cto.com/cto.js/5b055a2454fed8b88459c3cffdd96ed8' type='text/javascript'%3E%3C/script%3E")); </script>


  <script type="text/javascript">
  $(function(){
      $('<iframe frameborder="0" scrolling="no" width="0" height="0" src="http://log.51cto.com/pageview.php?frompos=edu_art"></iframe>').appendTo('body');
  })

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
