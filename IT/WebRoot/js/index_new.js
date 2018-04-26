
$("#Search").submit(function(){
	var url = $(this).attr('action'),key = $.trim($("#searchQ").val());
	if(key.length==0) return false;
	window.open(url+'q='+encodeURIComponent(key));
	return false;
});
$("#searchQ").blur(function(){
	$(this).val($.trim($(this).val()));
});
if($.trim($("#searchQ").val()).length!=0){
	$(".hotKey").hide();
}
/////////////////////////
$(function(){
    var ib = new IndexBanner();
    $(".IndexBannerPics").mouseover(function(){
        $(".IBPB_L,.IBPB_R").stop(true,true).fadeIn(500);
        ib.setMousState(true);
    }).mouseout(function(){
        $(".IBPB_L,.IBPB_R").hide();
        ib.setMousState(false);
    });
    //Lv2
    $(".IndexBannerDown li").mouseenter(function(){
        $(this).children('dl').fadeIn(200);
        $(this).siblings('li').find('dl').fadeOut(100);
    });
    $(".IndexBannerDown li").mouseleave(function(){
        $(this).children('dl').fadeOut(100);
    });
    //////////////////////
	$("#SearchSelect li").click(function(){
	    $(this).parent().prev().text($(this).text());
	    $("#Search").attr('action',searchType[$(this).index()]);
	});
	$("#searchQ").focus(function(){
	    $(".hotKey").hide();
	}).blur(function(){
		if($.trim($(this).val()).length!=0) return false;
	    $(".hotKey").show();
	});

	/*--------tab 切换-------*/
	$("#tabs li").mouseenter(function(){
	    if($(this).hasClass('cur')) return false;
	    var n = $(this).index();
	    $(this).addClass('cur').siblings().removeClass('cur');
	    $(".tablist").hide();
	    $(".tablist").eq(n).show();
	    
	    
	})
});
/*---------------------*/

//首页Banner轮换
var IndexBanner = function(parms){
    this.init(parms);
}
IndexBanner.prototype.init = function(parms) {
    var me = this;
    this.mouseInPic = false;
    this.total = $(".IBPLBs_Iemt").length;
    this.items = $(".IndexBannerPicsList li");
    $('.IBPB_L').click(function(){
        me.showPrev();
    });
    $('.IBPB_R').click(function(){
        me.showNext();
    });
    $(".IndexBannerPicsList_Btn li").mouseenter(function(){
        if(!$(".IndexBannerPicsList li").eq($(this).index()).hasClass("IBPLBs_IemtCur")){
            me.showExact($(this).index())
        }
    });
    //set position
    $(".IndexBannerPicsList_Btn").css({
        'margin-left':-(((this.total+1)*12)/2),
        'display':'block'
    });
    //
    this.items.eq(0).stop(true,true).fadeIn(500);
    var color = this.items.eq(0).attr('color')
    $(".IndexBanner,.bleft,.bright").css('background-color',color);
    //this.setBtnColor(color.replace('#',''));
    this.show = 0;
    var autoNext = setInterval(function(){
        if(!me.mouseInPic) me.showNext();
    },8000);//轮播图片间隔时间(ms)
};
IndexBanner.prototype.showPrev = function() {
    this.items.eq(this.show).hide();
    this.show--;
    this.show = this.show<0?this.total-1:this.show;
    this.showAct();
};
IndexBanner.prototype.showNext = function() {
    this.items.eq(this.show).hide();
    this.show++;
    this.show = this.show>=this.total?0:this.show;
    this.showAct();
};
IndexBanner.prototype.showExact = function(n) {
    this.items.eq(this.show).hide();
    this.show = n;
    this.showAct();
};
IndexBanner.prototype.showAct = function() {
    var color = this.items.eq(this.show).attr('color');
    $(".IndexBanner,.bleft,.bright").css('background-color',color);
    this.items.eq(this.show).fadeIn(300);
    $(".IndexBannerPicsList_Btn li").eq(this.show).addClass('IBPLBs_IemtCur').siblings().removeClass('IBPLBs_IemtCur');
    //this.setBtnColor(color.replace('#',''));
}
IndexBanner.prototype.setMousState = function(b) {
    this.mouseInPic = b;
};
IndexBanner.prototype.setBtnColor = function(c) {
    if(c.length==3) c=c.substr(0,1)+c.substr(0,1)+c.substr(1,1)+c.substr(1,1)+c.substr(2,1)+c.substr(2,1);
    var r=parseInt(c.substr(0,2),16),g=parseInt(c.substr(2,2),16),b=parseInt(c.substr(4,2),16);
    if(r<100&&g<100&&b<100){
        $(".IndexBannerPicsList_Btn").removeClass('black');
    }else{
        $(".IndexBannerPicsList_Btn").addClass('black');
    }
};


//首页Banner轮换 End
//首页新闻/公告start//
var News = document.getElementById('News');
	var Notices = document.getElementById('Notices');
	var t1 = document.getElementById('title1');
	var t2 = document.getElementById('title2');

   	function show1(){
		News.style.display = "none";
		Notices.style.display = "block";
		t1.className = "Cur";
		t2.className = "";
   	}
	function show2(){
		News.style.display = "block";
		Notices.style.display = "none";
		t2.className = "Cur";
		t1.className = ""
   	}
//首页新闻/公告End//


/*
*定义对话框
*/
var Dialog = function(parms){
	this.initialize(parms)
}
Dialog.prototype.initialize = function(parms){
	this.setting = {
		cBtn:true,
		Yes:'确定',
		No:'取消',
		title:'提示信息',
		content:'提示信息'
	};
	if(typeof(parms)=='string'){
		this.setting.content = parms;
	}else{
		$.extend(this.setting,parms);
	}
	this.mask = $('<div class="mask"></div>');
	this.box = $('<div class="Dialog"></div>');
	this.boxMain = $('<div class="Main"></div>');
	this.boxBtns = $('<div class="Btns"></div>');
	this.box.append(this.boxMain)
	$('body').append(this.mask).append(this.box);
	this.build();
}

Dialog.prototype.build = function(){
	var me = this;
	//关闭按钮
	// this.closeBtn = $('<button class="close"></button>')
	// this.closeBtn.bind('click',function(){
	// 	me.hide()
	// })
	// if(this.setting.cBtn) this.boxMain.append(this.closeBtn);
	//标题
	// this.title = $('<div class="title"></div>');
	// if(this.setting.title){
	// 	this.boxMain.append(this.title);
	// 	this.title.html(this.setting.title);
	// }
	//内容
	this.content = $('<div class="content"></div>');
	if(this.setting.content){
		this.boxMain.append(this.content);
		this.content.append(this.setting.content);
	}
	//按钮
	this.boxMain.append(this.boxBtns);
	if(this.setting.Yes){
		this.Yes = $('<button class="ok">'+this.setting.Yes+'</button>');
		this.Yes.bind('click',function(){
			me.yc();
		});
		this.boxBtns.append(this.Yes);
	}
	if(this.setting.No){
		this.No = $('<button class="cancel">'+this.setting.No+'</button>');
		this.No.bind('click',function(){
			me.nc();
		});
		this.boxBtns.append(this.No);
	}
}

Dialog.prototype.show = function(){
	this.mask.fadeIn(200);
	this.box.fadeIn(500);
}
Dialog.prototype.hide = function(){
	this.mask.fadeOut(500);
	this.box.fadeOut(200);
}
Dialog.prototype.yc = function(){}
Dialog.prototype.nc = function(){
	this.hide();
}
Dialog.prototype.setTitle = function(s){
	this.setting.title = s;
	this.title.html(s);
}
Dialog.prototype.setContent = function(s){
	this.setting.content = s;
	this.content.empty().append(s);
}

/*
*获取用户信息
*/
function getTask(num,title,txt1,txt2,status,link){
	if(status==0){
		var item = '<li class="Task1">';
	}else{
		var item = '<li class="Task1 complete">';
	}
	item += '<h2>'+title+'</h2>';
	item += '<img src="'+img_url+'icons/task_icon_'+num+'.png">';
	if(status!=0) item += '<img src="'+img_url+'icons/complete.png" class="complete">';
	item += '<div class="TaskInfo">';
	item += '<p>'+txt1+'</p>';
	item += '<p>'+txt2+'</p>';
	if(status==0){
		item += '<a class="btn" href="'+web_url+link+'" target="_blank">领取任务</a>';
	}else{
		item += '<button>领取任务</button>';
	}
	item += '</div></li>';
	return item;
}
$.getJSON(web_url+'index/userinfo',{},function(data){
	if(data.user_id){
		var goldUrl = web_url+'user/order/user_id-'+data.user_id+'.html';
		if(data.islecturer==1){
			goldUrl = web_url+'user/user_id-'+data.user_id+'.html';
    }
    // zjf20170217 vip
    if (data.is_vip == 1) {
	    $("#UserName").html('<a class="fl" href="'+web_url+'user/user_id-'+data.user_id+'.html" target="_blank">'+data.username+'</a><a class="vipSide fl" style="left: 6px;top: 5px;" href="http://home.51cto.com/members/in-fo?edu" target="_blank"><a>');
    }else{
      $("#UserName").html('<a href="'+web_url+'user/user_id-'+data.user_id+'.html" target="_blank">'+data.username+'</a>');
    }
	    $("#UserScore").html('学分 <a href="'+web_url+'user/credit/" target="_blank"><span class="blue">'+data.totalCredit+'</span> </a><span class="gray">|</span> 余额 <a href="'+goldUrl+'" target="_blank"><span class="red">'+data.wuyougold+'</span></a>');
	    var head = $('<img src="http://ucenter.51cto.com/avatar.php?uid='+data.user_id+'&size=small" style="width:100%;height:100%;">');
	    $("#UserAvatar").replaceWith(head);
	    head.next().css('cursor','pointer').click(function(){
	    	location.href=web_url+'user/study/user_id-'+data.user_id+'.html';
	    });
	    var sign = $('<button>每日签到</button>')
		if(data.is_sign==false){
			sign.html('每日任务');
		}
	    $("#BannerBtn").html(sign)

		sign.click(function(){
			var btn = $(this);
			if(btn.hasClass('gray')) return false;
			btn.addClass('gray');
			$.getJSON(web_url+'index/task',{},function(e){
        var nowTime = new Date().getHours(),nowStatus = '';
        if(nowTime < 24) nowStatus = '晚上';
        if(nowTime < 18) nowStatus = '下午';
        if(nowTime < 12) nowStatus = '上午';
        if(nowTime < 9) nowStatus = '早上';
				var item = $('<div class="everyTask"></div>'),
				closeItem = $('<div class="closeTask"><button></button></div>'),
				creditInfo = $('<div class="top">亲爱的<span class="blue">'+e.user_detail.username+'</span>，'+nowStatus+'好！你已连续签到 '+e.credit.date+' 天，获得 '+e.credit.get+' 学分，明天可领取 '+e.credit.willget+' 学分。</div>'),
        topnew = $('<div class="topnew">温馨提示：你还可以在手机APP中随时随地签到，并参加“每日有礼”抽奖活动。<a href="'+web_url+'activity/lists/id-10.html?qiandao" target="_blank">下载学院APP>></a></div>'),
				itemList = $('<ul class="Tasks"></ul>'),
				itemInfo = $('<div class="Info"></div>');
				//////////////
				var tils = ['发表笔记','','回复问题','分享课程/课时'];
				var txt1 = ['观看视频后发表一篇笔记','','回复一个他人提出的问题','分享至社会化媒体被他人访问一次'];
				var txt2 = ['奖励20学分','','奖励20学分','奖励2学分,每天可领100学分'];
				var links = ['lession/id-'+e.ids['1']+'-show-2.html','','lession/id-'+e.ids['3']+'-show-3.html'];
				links.push(e.ids['5']?'course/course_id-'+e.ids['5']+'.html':'lession/id-'+e.ids['4']+'.html')
				$(tils).each(function(i,s){
					if(i!=1){
						var z = getTask(i+1,s,txt1[i],txt2[i],e.info[i+1],links[i]);
						itemList.append(z);
					}
				});
				//////////////
				itemInfo.append('<p>学分可抵现金购买付费课程，100学分抵1元，<a href="'+web_url+'index/help.html" target="_blank">详情&gt;&gt;</a></p>');
				itemInfo.append('<p>每天可领取5学分，连续5天以上可领取10学分，30天以上可领取15学分</p>');
				itemInfo.append('<p class="blue">'+e.ad+'</p>')
				/////////////////
				item.append(closeItem).append(creditInfo).append(topnew).append(itemList).append(itemInfo);
				//////
				var msg = new Dialog({content:item,Yes:false,No:false});
				msg.show();
				/////
				closeItem.click(function(){
					msg.hide();
				});
				if(btn.text()=='每日签到'){
					$("#userDetailCredit").html(parseInt($("#userDetailCredit").text())+parseInt(e.credit.get));
				}
				btn.html('每日任务').removeClass('gray');
			});
			return false;
		});
	}else{
    $("#UserScore").html('新用户首单7折<br>赠送“5元无门槛优惠劵”').css({'line-height':'1.4','color':'#c01920'});
  }
});

//设置COOKIE
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