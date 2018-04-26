/**
 * Created by Administrator on 2016/7/28.
 */
var Introduce, IntroduceFn = function(){
  this.init()
}
IntroduceFn.prototype = {
  init:function(){
    this.dom = $('<div></div>')
    this.dom.css({
      background:'url('+imgpath+'../../center/images/bg50.png)',
      position:'fixed',
      left:'0',
      top:'0',
      width:'100%',
      height:'100%',
      'z-index':10000000
    }).append('<div style="z-index:10000001;width:200px;height:100px;background:#FFF url('+imgpath+'../../center/images/loading.gif) no-repeat center;position:absolute;left:50%;top:50%;margin-left:-100px;margin-top:-50px;"></div>').hide()
    $('body').append(this.dom)
  },
  show:function(){
    this.dom.show()
  },
  hide:function(){
    this.dom.hide()
  }
}

setTimeout(function(){
  Introduce = new IntroduceFn()
},100)



function ThisCur(dom,name){
  var a = name?name:'cur'
  dom.addClass(a).siblings().removeClass(a)
}

typeof(_Export)!='undefined' && _Export()
function goLoginPage(){
  location.href="/user/login.html";
}
function getUrl(id,type){
  // type=[course,lec,pack,wejob,spec]
  var type = type?type:'course'
  return _urls[type].replace('888',id)
}

// 
(function(){

  if((typeof(_play_lesson_video_tjm)) == "undefined"){ //tjm
    $.get(_centerURL+'/index/index/direct',function(res){
      if(res.status!=1){
        $("#ALLCourse").remove()
        return false
      }
      for(var i=0;i<res.data.length;i++){
        $("#ALLCourseList").append(_directItem(res.data[i]))
      }
    },'json')
  }

function _directItem(e){
   var item = $('<div class="item"></div>')
  .append(_directItem_Lv1(e.parent_ids,e.first_name))
  .append(_directItem_Lv2(e.list))
  .append(_directItem_More(e.list,e.other,e.first_name).append('<a href="'+e.img_link+'" target="_blank"><img src="'+e.img_url+'"></a>'))
  return item
}
function _directItem_Lv1(ids,names){
  var item = $('<h2></h2>')
  for(var i=0;i<ids.length;i++){
    item.append('<a href="'+_centerURL+'course/index/list?pid='+ids[i]+'" target="_blank">'+names[i]+'</a>')
    if(i<ids.length-1){
      item.append('<span></span>')
    }
  }
  return item
}
function _directItem_Lv2(e){
  var item = $('<p></p>')
  for(var i=0;i<e.length;i++){
    if(e && e[i] && e[i][0] && e[i][0].parent_id) item.append('<a href="'+_centerURL+'course/index/list?pid='+e[i][0].parent_id+'&cid='+e[i][0].second_id+'" target="_blank">'+e[i][0].second_name+'</a>')
  }
  return item
}
function _directItem_More(e,v,names){
  var main = $('<div class="main"></div>')
  for(var i=0;i<e.length;i++){
    var dl = $('<dl></dl>');
    dl.append('<dt>'+names[i]+'</dt>')
    .append(_directItem_DD(e[i]))
    main.append(dl)
  }
  main.append(_directItem_Other(v))
  return $('<div class="more"></div>').append(main)
}
function _directItem_DD(e){
  var dd = $('<dd></dd>');
  for(var i=0;i<e.length;i++){
    dd.append(_directItem_DDLv2(e[i]))
  }
  return dd;
}
function _directItem_DDLv2(e){
  var a = $('<p class="fl mr10"></p>')
  .append('<a href="'+_centerURL+'course/index/list?pid='+e.parent_id+'&cid='+e.second_id+'" target="_blank">'+e.second_name+'</a>')
  return a;
}
function _directItem_Other(e){
  var dd = $('<dd></dd>')
  ,item = $('<dl></dl>')
  .append('<dt>管家推荐</dt>')
  .append(dd)
  for(var i=0;i<e.length;i++){
    dd.append('<p><a href="'+e[i].rec_link+'" target="_blank">'+e[i].rec_name+'</a></p>')
  }
  return item
}
})()

$(function(){
  $('body').on('click','.vipBig,.vipMedium,.vipSmall,.vipSide,.vipBig_gray,.vipMedium_gray,.vipSmall_gray,.vipSide_gray,i.vip.icon',function(){
    window.open('http://home.51cto.com/members/in-fo')
    return false;
  })
  new EDU_Topic()
})

//topic
var EDU_Topic = Class.create()
EDU_Topic.prototype.initialize = function() {
  var me = this;
  $(".edu-ad").each(function(i,e){
    me.getCon($(this))
  })
};
EDU_Topic.prototype.getCon = function(dom) {
  var ps = {
    info_id : dom.attr('info_id'),
    ad_id : dom.attr('ad_id'),
    type : dom.attr('type')
  }
  $.get(_centerURL+'/advert/index/index',ps,function(res){
    dom.html(res.ad_content)
  },'json')
};

//TopSearchFrom
$("#TopSearchFrom").find('input').keyup(function(){
  $(this).val($(this).val().substr(0,30))
})