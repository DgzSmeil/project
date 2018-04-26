var path = "http://"+window.location.host+"/static/upload/picimg/";
var contpath = "http://"+window.location.host+"/static/upload/";

$(function (){

    $.post('/notice/indexno',
        function(data) {
        if(data != undefined){
            var newsContent = $('#newsContent');
            var topNewContent = $('#news-list');
            for(var i = 0;i<data.length;i++){
                var obj = data[i];
                var newsLi = $('<li><a href="/notice/nopage?nid='+obj.nid+'" target="_blank">'+obj.title+'</a><span>'+obj.date.substring(0,10)+'</span></li>');
                var topNews = $('<li><span>最新公告：&nbsp;&nbsp;|&nbsp;&nbsp;</span><a href="/notice/nopage?nid='+obj.nid+'" target="_blank">'+obj.title+'</a></li>');
                newsLi.appendTo(newsContent);
                topNews.appendTo(topNewContent);
            }
            noticeSlide(topNewContent);
        }

    },
        "json"
    );

    $.post("/friend/selectlist",
        function(data) {
            if(data != undefined) {
                //友情链接
                var linkListContent = $('#linkList');
                for(var i=0;i<data.length;i++){
                    var lineobjs = data[i];
                    var linkLi = $('<li><a target="view_frame" href="'+lineobjs.furl+'" title="'+lineobjs.rname+'"><img src="'+contpath+''+lineobjs.fpic+'" alt="'+lineobjs.rname+'"></a></li>');
                    linkLi.appendTo(linkListContent);
                }
                //友情链接滚动
                var oLinklist = linkListContent.find('li').size();
                var oLinkBox = $('.link-list-box');
                linkListContent.css('width',oLinklist*292+'px');
                oLinkBox.css('width',oLinklist*292*2+'px');
                var linkList2 = $('#linkList2').html(linkListContent.html()).css('width',oLinklist*292+'px');
                var oLinkTime = window.setInterval(start,100);
                oLinkBox[0].onmouseover = function(){
                    window.clearInterval(oLinkTime);
                }
                oLinkBox[0].onmouseout = function(){
                    oLinkTime = setInterval(start,40);
                }
            }
        },
    "json"
    );

   $.post("/media/listall",
       function (data) {
           if (data != undefined){
               for(var i=0;i<data.length;i++){
                   var obj = data[i];
                   var mediaLi =
                       $('<li><a href="/media/nopage?mid='+obj.mid+'" target="_blank" class="news-main-content-left">'+
                           '<img src="'+path+obj.pic+'" alt="'+obj.title+'" width="210" height="140"></a>'+
                           '<a href="/media/nopage?mid='+obj.mid+'" target="_blank" class="list-title">'+obj.title+'</a>'+
                           '<a href="/media/nopage?mid='+obj.mid+'" target="_blank" class="list-main">'+streplace(obj.content)+'</a></li>')
                   mediaLi.appendTo($('#media .news-main-list'));
               };
           }
       },
       "json"
   );


    $.post('/dynamic/listAll',
        function(data) {
            if(data != undefined){
                var newsContent = $('#news-part');
                for(var i = 0;i<data.length;i++){
                    var obj = data[i];
                    var newsLi = $('<li><a href="/dynamic/nopage?dyid='+obj.dyid+'" target="_blank">'+obj.title+'</a><span>'+formatDate(obj.date).substring(0,10)+'</span></li>');
                    newsLi.appendTo(newsContent);
                }
            }
        },
        "json"
    );

    $.post("/home/homeppt",
        function (data) {
            if (data != undefined){
                var newsContent = $('#home_pic');
                var mediaLi =
                    $('<a href="'+data.l1+'" target="_blank" class="nivo-imageLink" style="display: none;">'+
                        '<img src="'+path+data.pic1+'"></a>'+
                        '<a href="'+data.l2+'" target="_blank" class="nivo-imageLink" style="display: none;">'+
                        '<img src="'+path+data.pic2+'"></a>'+
                        '<a href="'+data.l3+'" target="_blank" class="nivo-imageLink" style="display: none;">'+
                        '<img src="'+path+data.pic3+'"></a>')
                mediaLi.appendTo(newsContent);
            };
        },
        "json"
    );

});

function start(){
    if ($('#linkList2')[0].offsetWidth - $('.link-list')[0].scrollLeft <= 0){
        $('.link-list')[0].scrollLeft -= $('#linkList')[0].offsetWidth;
    }else{
        $('.link-list')[0].scrollLeft++;
    }
}

//公告轮播
function noticeSlide(obj){
    var ul=obj,noTime;
    ul.css({height:obj.find('li').size()*48+'px',top:'0px'});
    //开始轮播
    oTimer=setTimeout(start, 3000);
    var i=1;
    function start() {
        i++;
        if(i>=obj.find('li').size()){
            ul.css('top', '0px');
            i=0;
        };
        ul.stop().animate({
                top:-48*i},
            200, function() {
            });
        oTimer=setTimeout(start, 3000);
    }
    ul.hover(function(){
        clearTimeout(oTimer)
    }, function(){
        oTimer=setTimeout(start, 3000);
    });
}

//内容裁剪
function streplace(str){
    var oStr = str.replace(/<[^>]+>|\n+\s&nbsp;/g,"");
    if(oStr.length>60){
        return oStr.substring(0,60)+'...';
    }else{
        return oStr;
    }

}

//时间格式化
function formatDate(value) {
    if (value == undefined || value == null || value == '') {
        return "";
    } else {
        var date = new Date(value); // 获取js的Date对象
        var year = date.getFullYear().toString();
        var month = (date.getMonth() + 1);
        var day = date.getDate().toString();
        var hour = date.getHours().toString();
        var minutes = date.getMinutes().toString();
        var seconds = date.getSeconds().toString();
        if (month < 10) {
            month = "0" + month;
        }
        if (day < 10) {
            day = "0" + day;
        }
        if (hour < 10) {
            hour = "0" + hour;
        }
        if (minutes < 10) {
            minutes = "0" + minutes;
        }
        if (seconds < 10) {
            seconds = "0" + seconds;
        }
        return year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;
    }
}
