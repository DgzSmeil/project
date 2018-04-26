var hostName = location.hostname;
var WEB_URL = document.location.protocol+'//edu.51cto.com/';
(function(){
    if(document.getElementById('GenTopBar')) return false;
    if(hostName.indexOf('test')>-1) WEB_URL = 'http://test.edu.51cto.com/';
    if(hostName.indexOf('local')>-1) WEB_URL = 'http://edulocal.51cto.com/';
    if(hostName.indexOf('style')>-1) WEB_URL = 'http://style.edu.51cto.com/';
    if(hostName.indexOf('linetest')>-1) WEB_URL = 'http://linetest.edu.51cto.com/';
    //创建顶条
    function buildTop(data){
        var newDotStatus = 'none',cartNum = '';
        if(data){
            if(data.msgNum>0) newDotStatus = 'block';
        }
        var inner = '<ul class="Page"  id="GenTopBar">';
        inner += '<li class="fl f14" id="Til"><a href="'+WEB_URL+'">IT人充电，上51CTO学院！</a></li>';
        inner += '<li class="fr navi"><a href="'+WEB_URL+'sitemap.html" target="_blank" style="background-color:none;">网站导航</a>';
        inner +=    '<ul class="navigates">';
        inner +=        '<li><a href="'+WEB_URL+'px" target="_blank">微职位</a></li>';
        inner +=        '<li><a href="'+WEB_URL+'ke" target="_blank">视频课程</a></li>';
        inner +=        '<li style="border-bottom: 1px solid #FFF;"><a href="'+WEB_URL+'activity/lists/id-23.html?dh2" target="_blank">企业学习</a></li>';
        inner +=        '<li><a href="'+WEB_URL+'lecturer/lectopics" target="_blank">申请开课</a></li>';
        inner +=        '<li><a href="http://www.51cto.com/" target="_blank">51CTO主站</a></li>';
        inner +=        '<li><a href="http://x.51cto.com/act/cto/camp/page/video?edutop" target="_blank">CTO训练营</a></li>';
        inner +=        '<li><a href="http://wot.51cto.com/?edutop" target="_blank">WOT峰会</a></li>';
        inner +=        '<li><a href="http://wot.51cto.com/act/bcsl/info?edutop" target="_blank">百城沙龙</a></li>';
        inner +=    '</ul>';
        inner += '</li>';
        inner += '<li class="fr"><a target="_blank" href="'+WEB_URL+'user/studyGains.html?dingbujdh">学员故事</a></li>';

        inner += '<li class="fr apps"><a href="'+WEB_URL+'activity/lists/id-10.html" target="_blank" style="background:none;">学院APP</a>';
        inner += '    <ul>';
        inner += '        <li><a href="'+WEB_URL+'download/android/v-02.html" target="_blank">Android</a></li>';
        inner += '        <li><a href="https://itunes.apple.com/us/app/51cto-xue-yuan-shi-zhanit/id1038062672?l=zh&ls=1&mt=8" target="_blank">iPhone</a></li>';
        inner += '        <li><a href="https://itunes.apple.com/us/app/51cto-xue-yuan/id948807016?ls=1&mt=8"  target="_blank">iPad</a></li>';
        inner += '    </ul>';
        inner += '</li>';
        if(data){
            inner += '<li class="fr" id="TopCart"><a href="'+WEB_URL+'center/cart" target="_blank" class="red">购物车<span>'+data.cartNum+'</span></a></li>';
            if(data.study || data.study_log){
              inner += '<li class="fr">学习记录';
              inner += '<div class=" StudyLog">';
              var list0 = data.study;
              var list = data.study_log;
              if(list.length>0){
                  inner += '<ul>';
                  for(var i=0;i<list.length;i++){
                      inner += '<li>';
                      inner += '<a href="'+WEB_URL+'lesson/id-'+list[i].lesson_id+'.html" target="_blank" class="fl ellipsis">'+list[i].lesson_title+'阿萨德哈哈说法数据库来发很舒服哈就开始发卡上考虑好</a>';
                      inner += '<span class="fr">观看至'+list[i].player_rate+'%</span>';
                      inner += '<a href="'+WEB_URL+'lesson/id-'+list[i].lesson_id+'.html" target="_blank" class="fr">继续学习</a>';
                      inner += '</li>';
                  }
                  inner += '</ul>';
                  inner += '<p><a href="'+WEB_URL+'user/study/user_id-'+data.user_id+'.html" target="_blank">更多学习记录&gt;&gt;</a></p>';
              }else{
                  inner += '<h2 class="tc">暂无学习记录</h2>';
                  inner += '<h3 class="tc">业精于勤荒于嬉，快来学习吧</h3>';
                  inner += '<h4>大家正在学：</h4>';
                  for(var s=0;s<list0.length;s++){
                      inner += '<h5><a href="'+WEB_URL+'course/course_id-'+list0[s].course_id+'.html" target="_blank" class="ellipsis">'+list0[s].course_title+'</a></h5>';
                  }
              }
              inner += '</div>';
              inner += '</li>';
            }
            inner += '<li class="fr"><a target="_blank" href="'+WEB_URL+'user/user_id-'+data.user_id+'.html">我的'+(data.isLec?'教学':'学习')+'</a></li>';
            inner += '<li class="fr newDot"><a target="_blank" href="http://home.51cto.com/index.php?s=/Notify/inbox">消息<i id="newDot" style="display: '+newDotStatus+';"></i></a></li>';
            inner += '<li class="fr"><span class="fl">Hi，</span><a class="fl" id="isVip" href="'+WEB_URL+'user/user_id-'+data.user_id+'.html" target="_blank">'+data.username+'</a><a href="'+WEB_URL+'center/user/index/logout?reback='+encodeURIComponent(encodeURIComponent(location.href))+'" class="out fl">[退出]</a></li>';
        }else{
            inner += '<li class="fr" id="TopCart"><a href="'+WEB_URL+'user/login.html" target="_blank">购物车</a></li>';
            inner += '<li class="fr"><a href="'+WEB_URL+'user/register.html" target="_blank" class="red">注册</a></li>';
            inner += '<li class="fr"><a href="'+WEB_URL+'user/login.html">登录</a></li>';
        }
        inner+='</ul>';
        return inner;
    }

    ////////
    window.jsonpCallbackForGeneral = function(result) {
        if(result.user_id>0){
            var bt = $(buildTop(result))
            if(typeof big_index == 'boolean'){
                bt.find("#Til").html('IT人充电，上51CTO学院！').addClass('tc')
            }
            $("#GenTopBar").replaceWith(bt);
            setUserId(result.user_id);
            if(typeof(_isLogin)!='undefined') _isLogin = true
        }
        if(result.is_spree == 0 || result.user_id==0){
          $("#Spree").slideDown(300)
        }
        if((typeof(gen_logo) != 'undefined') && (gen_logo == 1)){
          $("#Til").before('<li class="fl" style="margin-right:15px;"><a href="'+WEB_URL+'"><img src="http://static1.51cto.com/edu/index/images/logo.png?v=1.0.0.0" style="height:20px;margin-top:12px;display:block;"></a></li>')
        }
        // zjf20170217 vip
        if(result.is_vip == 1){
          $('#isVip').append('<a class="vipSide" style="left: 3px;top: 3px;*top: 0;" href="http://home.51cto.com/members/in-fo?edu" target="_blank"></a>')
        }else{
          $('#isVip').append('<a class="vipSide_gray" style="left: 3px;top: 3px;*top: 0;" href="http://home.51cto.com/members/in-fo?edu" target="_blank"><span><i></i><b>一个会员，全站特权</b></span></a>')
        }
        showAD()
    }
    function setUserId(user_id){
        var userId = document.createElement("input");
        userId.setAttribute("type","hidden");
        userId.setAttribute("display","none");
        userId.setAttribute("id","ServiceUserId");
        userId.setAttribute("value",user_id);
        document.getElementsByTagName("head")[0].appendChild(userId);
    }
    var JSONP=document.createElement("script");
    JSONP.type="text/javascript";
    JSONP.src=WEB_URL+"service.php/index/userinfo?callback=jsonpCallbackForGeneral";
    document.getElementsByTagName("head")[0].appendChild(JSONP);

    function showAD(){
      if(getCookie('430isShow')==1) return false;
      setTimeout(function(){setCookie('420isShow',1,86400)},5000)
      var nowTime = (Date.parse(new Date()))/1000;
      if(nowTime>1493567999)return false;
      var mask = $('<div style="width:100%;height:100%;position:fixed;left:0;top:0;background:url(https://s1.51cto.com/images/201604/0645ecf26569d21026b25114883d80bdf1dae9.png);z-index:10000;"></div>');
      var msgDiv = $('<div style="background:url(https://s1.51cto.com/images/201704/91e12107898c53ed9a2743a262bdae21bbfe8e.png) no-repeat;width:571px;height:655px;position:fixed;left:50%;top:50%;margin-left:-286px;margin-top:-328px;z-index:10001;">')
      var closeBtn = $('<div style="width:46px;height:46px;cursor:pointer;right:1px;top:4px;position:absolute;z-index:10002">&nbsp;</div>')
      var goBtn = $('<a style="cursor:pointer;display:block;position:absolute;width:100%;height:90%;left:0;top:8%;z-index:10001" href="'+WEB_URL+'activity/lists/id-48.html?qd=tk" target="_blank"></a>')
      setCookie('430isShow',1,86400);
      msgDiv.append(goBtn).append(closeBtn)
      $('body').append(mask).append(msgDiv)
      closeBtn.click(function(){
        mask.remove()
        msgDiv.remove()
      })
      goBtn.click(function(){
        mask.remove()
        msgDiv.remove()
      })
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
})()