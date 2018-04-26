/*
 * 
 * MsgBox
 * 
 * @requires jQuery v1.7 or later
 * @create By 2014-9-11
 * @author Ravens<34263626@qq.com>
 * 
 */


//自定义MessBox
// parms = {img=[success|error|i|fail],parent,}
var msg = function(parms){
	imgpath = imgpath?imgpath:'./images/';
	var me = this;
	var p = {};
	p.id = 'Msg_'+(parms.id?parms.id:Math.random()*10000);
	p.title = parms.title?parms.title:'消息提示框';
	p.content = parms.content?parms.content:'请确认';
	p.Yes = parms.Yes?parms.Yes:'确认';
	p.No = parms.No?parms.No:'取消';
	p.img = parms.img?parms.img:'i';
	p.H = parms.H?parms.H:'130';
	p.W = parms.W?parms.W:'260';
	//构造主体
	this.make=function(){
		me.MC = $("<div id="+p.id+" style='display:none;background:#FFF;'></div>");
		me.MC_Top = $("<div style='height:24px;width100%;background:#00848e;padding:8px;'></div>");
			me.MC_Title = $("<h4 style='float:left;color:#FFF;font-size:14px;font-weight:bold;'>"+p.title+"</h4>");
			me.MC_Close = $("<a href='javascript:void(0);' style='background:url("+imgpath+"close.jpg) no-repeat;height:22px;width:22px;float:right;'></a>");
		me. MC_Main = $("<div style='text-align:center;background:url("+imgpath+p.img+".png) no-repeat 30px 10px;padding:10px 5px'></div>");
			me.MC_Content = $("<p style='margin-bottom:5px;text-align:left;margin-left:70px;margin-top:5px;margin-bottom:15px;'>"+p.content+"</p>");
			me.MC_YesButton = $("<button class='msgBoxButton msgBoxButtonYes'>"+p.Yes+"</button>");
			me.MC_NoButton = $("<button class='msgBoxButton msgBoxButtonNo'>"+p.No+"</button>");

		me.MC_Main.append(me.MC_Content);
		if(!parms.noButton){
			me.MC_Main.append(me.MC_YesButton);
			me.MC_Main.append(me.MC_NoButton);
			me.MC_Top.append(me.MC_Title);
			me.MC_Top.append(me.MC_Close);
			me.MC.append(me.MC_Top);
		}
		me.MC.append(me.MC_Main);

		if(parms.parent){
			$("#"+parms.parent).css('position','relative');
			p.left = ((parseInt($("#"+parms.parent).width())-parseInt(p.W))/2)+100 +'px';
			p.top = ((parseInt($("#"+parms.parent).height())-parseInt(p.H))/2) +'px';
			$(me.MC).css('position','absolute');
		}else{
			p.left = ((parseInt($(window).width())-parseInt(p.W))/2)+100+'px';
			p.top = ((parseInt($(window).height())-parseInt(p.H))/2)+'px';
			$(me.MC).css('position','fixed');
		}
		$(me.MC).css({
			'z-index':'1001',
			'width':p.W,
			'height':p.H,
			'top':parms.top?parms.top:p.top,
			'left':parms.left?parms.left:p.left,
			'border':'1px solid #00848e'
		});
		if(parms.parent){
			$("#"+parms.parent).append(me.MC);
		}else{
			$("body").append(me.MC);
		}
		$(me.MC_NoButton).bind('click',function(){
			me.close();
			me.NoClick();
		});
		$(me.MC_YesButton).bind('click',function(){
			me.YesClick();
		});
		$(me.MC_Close).bind('click',function(){
			me.close();
		});
		if(parms.autoClose){
			setTimeout(function(){
				me.close();
			},parms.autoClose*1000)
		}
	};
	//显示
	this.show=function(){
		$("div[id^=Msg_]").remove();
		me.make();
		$(me.MC).show();
	};
	this.YesClick = function(e){
		return e;
	};
	this.NoClick = function(e){
		return e;
	};
	this.hide=function(){
		$(me.MC).hide();
	};
	this.close=function(){
		$(me.MC).remove();
	};
};


//自定义纠错MessBox
// parms = {img=[success|error|i|fail],parent,}
var correction = function(parms){
	var imgpath = imgpath?imgpath:'./images/';
	var me = this;
	var p = {};
	p.id = 'correction_'+(parms.id?parms.id:Math.random()*10000);
	p.title = parms.title?parms.title:'纠错';
	p.content = parms.content?parms.content:'请填写题目存在的问题，如题干错误，选项错误，答案错误、解析错误等。越具体越好，谢谢！';
	p.Yes = parms.Yes?parms.Yes:'确认';
	p.No = parms.No?parms.No:'取消';
	p.img = parms.img?parms.img:'i';
	p.H = parms.H?parms.H:'260';
	p.W = parms.W?parms.W:'440';
	//构造主体
	this.make=function(){
		me.MC = $("<div id="+p.id+" style='display:none;background:#FFF;'></div>");
		me.MC_Top = $("<div style='height:24px;width100%;background:#00848e;padding:8px;'></div>");
			me.MC_Title = $("<h4 style='float:left;color:#FFF;font-size:14px;font-weight:bold;'>"+p.title+"</h4>");
			me.MC_Close = $("<a href='javascript:void(0);' style='background:url("+imgpath+"close.jpg) no-repeat;height:22px;width:22px;float:right;'></a>");
		me. MC_Main = $("<div style='padding:10px 5px'></div>");
			me.MC_Content = $("<textarea style='width:420px;padding:5px;;height:150px;color:#999;margin-bottom:10px;'>"+p.content+"</textarea>");
			me.MC_YesButton = $("<button style='float:right;height:30px;width:80px;border:none;color:#FFF;cursor:pointer;background:url("+imgpath+"/exam/exam_button.png) no-repeat left bottom;'>"+p.Yes+"</button>");
			me.MC_NoButton = $("<span style='float:right;height:30px;line-height:30px;margin-right:20px;cursor:pointer;'>"+p.No+"</span>");

		me.MC_Main.append(me.MC_Content);
		if(!parms.noButton){
			me.MC_Main.append(me.MC_YesButton);
			me.MC_Main.append(me.MC_NoButton);
			me.MC_Top.append(me.MC_Title);
			me.MC_Top.append(me.MC_Close);
			me.MC.append(me.MC_Top);
		}
		me.MC.append(me.MC_Main);

		if(parms.parent){
			$("#"+parms.parent).css('position','relative');
			p.left = (parseInt($("#"+parms.parent).width())-parseInt(p.W))/2+'px';
			p.top = (parseInt($("#"+parms.parent).height())-parseInt(p.H))/2+'px';
			$(me.MC).css('position','absolute');
		}else{
			p.left = (parseInt($(window).width())-parseInt(p.W))/2+'px';
			p.top = (parseInt($(window).height())-parseInt(p.H))/2+'px';
			$(me.MC).css('position','fixed');
		}
		$(me.MC).css({
			'z-index':'1001',
			'width':p.W,
			'height':p.H,
			'top':parms.top?parms.top:p.top,
			'left':parms.left?parms.left:p.left,
			'border':'1px solid #00848e'
		});
		if(parms.parent){
			$("#"+parms.parent).append(me.MC);
		}else{
			$("body").append(me.MC);
		}
		$(me.MC_NoButton).bind('click',function(){
			me.close();
		});
		$(me.MC_YesButton).bind('click',function(){
			me.YesClick();
		});
		$(me.MC_Close).bind('click',function(){
			me.close();
		});
		$(me.MC_Content).bind('focus',function(){
			if($(this).html() == p.content){
				$(this).html('');
			}
		});
		$(me.MC_Content).bind('blur',function(){
			if($(this).html() == ''){
				$(this).html(p.content);
			}
		});
		if(parms.autoClose){
			setTimeout(function(){
				me.close();
			},parms.autoClose*1000)
		}
	};
	//显示
	this.show=function(){
		$("div[id^=correction_]").remove();
		me.make();
		$(me.MC).show();
	};
	this.YesClick = function(e){
		return e;
	};
	this.hide=function(){
		$(me.MC).hide();
	};
	this.close=function(){
		$(me.MC).remove();
	};
};


//自定义MessBox（扩展板）
// parms = {img=[success|error|i|fail],parent,}
var msgExt = function(parms){
	imgpath = imgpath?imgpath:'./images/';
	var me = this;
	var p = {};
	p.id = 'Msg_'+(parms.id?parms.id:Math.random()*10000);
	p.title = parms.title?parms.title:'消息提示框';
	p.content = parms.content?parms.content:'请确认';
	p.Yes = parms.Yes?parms.Yes:'确认';
	p.No = parms.No?parms.No:'取消';
	p.img = parms.img?parms.img:'i';
	p.H = parms.H?parms.H:'130';
	p.W = parms.W?parms.W:'260';
	//构造主体
	this.make=function(){
		me.mask = $('<div style="width:100%;height:100%;background:#000;opacity:0.5;position:fixed;left:0px;top:0px;z-index:1000;"></div>');
		me.MC = $("<div id="+p.id+" style='display:none;background:#FFF;'></div>");
		me.MC_Top = $("<div style='height:24px;width100%;background:#00848e;padding:8px;'></div>");
			me.MC_Title = $("<h4 style='float:left;color:#FFF;font-size:14px;font-weight:bold;'>"+p.title+"</h4>");
			me.MC_Close = $("<a href='javascript:void(0);' style='background:url("+imgpath+"close.jpg) no-repeat;height:22px;width:22px;float:right;'></a>");
		me.MC_Main = $("<div style='text-align:center;background:url("+imgpath+p.img+".png) no-repeat 30px 20px;padding:10px 5px'></div>");
			me.MC_Content = $("<div style='margin-bottom:5px;text-align:left;margin-left:70px;margin-top:5px;margin-bottom:15px;margin-right:15px;'>"+p.content+"</div>");
			me.MC_YesButton = $("<button class='msgBoxButton msgBoxButtonYes'>"+p.Yes+"</button>");
			me.MC_NoButton = $("<button class='msgBoxButton msgBoxButtonNo'>"+p.No+"</button>");

		me.MC_Main.append(me.MC_Content);
		if(!parms.noButton){
			me.MC_Main.append(me.MC_YesButton);
			me.MC_Main.append(me.MC_NoButton);
			me.MC_Top.append(me.MC_Title);
			me.MC_Top.append(me.MC_Close);
			me.MC.append(me.MC_Top);
		}
		me.MC.append(me.MC_Main);

		if(parms.parent){
			$("#"+parms.parent).css('position','relative');
			p.left = ((parseInt($("#"+parms.parent).width())-parseInt(p.W))/2) +'px';
			p.top = ((parseInt($("#"+parms.parent).height())-parseInt(p.H))/2) +'px';
			$(me.MC).css('position','absolute');
		}else{
			p.left = ((parseInt($(window).width())-parseInt(p.W))/2)+'px';
			p.top = ((parseInt($(window).height())-parseInt(p.H))/2)+'px';
			$(me.MC).css('position','fixed');
		}
		$(me.MC).css({
			'z-index':'1001',
			'width':p.W,
			'height':p.H,
			'top':parms.top?parms.top:p.top,
			'left':parms.left?parms.left:p.left,
			'border':'1px solid #00848e'
		});
		if(parms.parent){
			$("#"+parms.parent).append(me.MC);
		}else{
			if(parms.mask){
				$("body").append(me.mask);
			}
			$("body").append(me.MC);
		}
		$(me.MC_NoButton).bind('click',function(){
			me.close();
			me.NoClick();
		});
		$(me.MC_YesButton).bind('click',function(){
			me.close();
			me.YesClick();
		});
		$(me.MC_Close).bind('click',function(){
			me.close();
		});
		if(parms.autoClose){
			setTimeout(function(){
				me.close();
			},parms.autoClose*1000)
		}
	};
	//显示
	this.show=function(){
		$("div[id^=Msg_]").remove();
		me.make();
		$(me.MC).show();
	};
	this.YesClick = function(e){
		return e;
	};
	this.NoClick = function(e){
		return e;
	};
	this.hide=function(){
		$(me.MC).hide();
	};
	this.close=function(){
		$(me.mask).remove();
		$(me.MC).remove();
	};
};