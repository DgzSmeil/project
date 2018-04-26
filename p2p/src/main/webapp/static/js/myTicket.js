var localObj = window.location;
var contextPath = localObj.protocol + "//" + localObj.host;
var oPage;
$(function(){
    dtasteData();
    //代金券按钮
    $('#dLink').click(function(){
        if($(this).hasClass('active')){
            return;
        };
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left':'0'},500);
        dtasteData();
    });
    //加息券按钮
    $('#jLink').click(function(){
        if($(this).hasClass('active')){
            return;
        };
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left':'120px'},500);
        jtasteData();
    });
    //现金券按钮
    $('#xLink').click(function(){
        if($(this).hasClass('active')){
            return;
        };
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left':'240px'},500);
        xtasteData();
    });
})

//代金券 类型1
function dtasteData(){
    $('#xtaste').hide();$('#ttaste').hide();$('#jtaste').hide();$('#dtaste').show();
    //未使用
    var dtasteData1 =[
        {
            key:'id',resolve:function(val,userTicketVO){
            var msg1='',msg2='',msg3="";
            var dtastHtml = '<div class="bg-nouse"><div class="taste-bg-l">'+
                '<p class="money">¥<span>'+userTicketVO.tkmoney+'</span></p>'+
                '<p class="date">满<span>'+1000+'</span>元抵用</p>'+
                '</div>'+
                '<div class="text">'+
                '<p>'+msg1+userTicketVO.tkmoney+'元使用</p>'+
                '<p>'+msg2+'</p>'+
                '<p>有效期至'+formatDate(userTicketVO.tktime)+'</p>'+
                '</div>'+
                '<div class="taste-bg-r">'+
                '<a target="_blank" href="/detail/page" class="taste-btn">立即使用</a>'+
                '</div></div>'
            return dtastHtml;
        }
        }
    ]
    //已使用
    var dtasteData2 =[
        {
            key:'id',resolve:function(val,userTicketVO){
            var msg1='',msg2='',msg3="";
            var dtastHtml = '<div class="bg-use"><div class="taste-bg-l">'+
                '<p class="money">¥<span>'+userTicketVO.tkmoney+'</span></p>'+
                '<p class="date">满<span>'+1000+'</span>元抵用</p>'+
                '</div>'+
                '<div class="text">'+
                '<p>'+msg1+userTicketVO.tkmoney+'元使用</p>'+
                '<p>'+msg2+'</p>'+
                '<p>有效期至'+formatDate(userTicketVO.tktime)+'</p>'+
                '</div>'+
                '<div class="taste-bg-r">'+
                '<a class="taste-btn"></a>'+
                '</div></div>'
            return dtastHtml;
        }
        }
    ]
    //已过期
    var dtasteData3 =[
        {
            key:'id',resolve:function(val,userTicketVO){
            var msg1='',msg2='',msg3="";
            var dtastHtml = '<div class="bg-date"><div class="taste-bg-l">'+
                '<p class="money">¥<span>'+userTicketVO.tkmoney+'</span></p>'+
                '<p class="date">满<span>'+1000+'</span>元抵用</p>'+
                '</div>'+
                '<div class="text">'+
                '<p>'+msg1+userTicketVO.tkmoney+'元使用</p>'+
                '<p>'+msg2+'</p>'+
                '<p>有效期至'+formatDate(userTicketVO.tktime)+'</p>'+
                '</div>'+
                '<div class="taste-bg-r">'+
                '<a class="taste-btn"></a>'+
                '</div></div>'
            return dtastHtml;
        }
        }
    ]

    var params = {
        couponType:"" ,//代金券， 3 加息券， 2 现金券
        useType: "",// 未使用， 2已使用， 3已过期
    };
    var dtastePage = new Page(contextPath + '/uticket/select/1/1',params,$('.dtaste-listData1 .nouse'),$('.dtaste-listData1 .paging'),dtasteData1,function(){});
    $('#Dunused').unbind('click').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        var params = {
            couponType: 1 ,//代金券， 3 加息券， 2 现金券
            useType: 1,// 未使用， 2已使用， 3已过期
        };
        $('.dtaste-listData1').show().siblings('div.dtaste-listData').hide();
        dtastePage = new Page('/uticket/select/1/1',params,$('.dtaste-listData1 .nouse'),$('.dtaste-listData1 .paging'),dtasteData1,function(){});
    });
    $('#Dused').unbind('click').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        var params = {
            couponType: 1 ,//代金券， 3 加息券， 2 现金券
            useType: 2,// 未使用， 2已使用， 3已过期
        };
        $('.dtaste-listData2').show().siblings('div.dtaste-listData').hide();

        dtastePage = new Page('/uticket/select/1/2',params,$('.dtaste-listData2 .use'),$('.dtaste-listData2 .paging'),dtasteData2,function(){});
    });
    $('#Dexpired').unbind('click').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        var params = {
            couponType: 1 ,//代金券， 3 加息券， 2 现金券
            useType: 3,// 未使用， 2已使用， 3已过期
        };
        $('.dtaste-listData3').show().siblings('div.dtaste-listData').hide();
        dtastePage = new Page('/uticket/select/1/3',params,$('.dtaste-listData3 .overdue'),$('.dtaste-listData3 .paging'),dtasteData3,function(){});
    });
}


//现金券 类型2
function xtasteData(){
    var canSend;
    $('#dtaste').hide();$('#jtaste').hide();$('#xtaste').show();$('#ttaste').hide();
    var xtasteData1 =[
        {
            key:'id',resolve:function(val,userTicketVO){
            var xtastHtml = '<div class="xj-nouse">'+
                '<div class="taste-bg-l">'+
                '<p class="money">¥<span>'+userTicketVO.tkmoney+'</span></p>'+
                '</div>'+
                '<div class="text"><p class="date">有效期至'+formatDate(userTicketVO.tktime)+'</p></div>'+
                '<div class="taste-bg-r">'+
                '<a target="_blank" href="/detail/page" class="taste-btn">立即使用</a>'+
                '</div>'+
                '</div>'
            return xtastHtml;
        }
        }
    ]
    var xtasteData2 =[
        {
            key:'id',resolve:function(val,userTicketVO){
            var xtastHtml = '<div class="xj-use">'+
                '<div class="taste-bg-l">'+
                '<p class="money">¥<span>'+userTicketVO.tkmoney+'</span></p>'+
                '</div>'+
                '<div class="text"><p class="date">使用时间:'+formatDate(userTicketVO.tktime)+'</p></div>'+
                '<div class="taste-bg-r">'+
                '<a href="javascript:;" class="taste-btn"></a>'+
                '</div>'+
                '</div>'
            return xtastHtml;
        }
        }
    ]
    var xtasteData3 =[
        {
            key:'id',resolve:function(val,userTicketVO){
            var xtastHtml = '<div class="xj-date">'+
                '<div class="taste-bg-l">'+
                '<p class="money">¥<span>'+userTicketVO.tkmoney+'</span></p>'+
                '</div>'+
                '<div class="text"><p class="date">有效期至'+formatDate(userTicketVO.tktime)+'</p></div>'+
                '<div class="taste-bg-r">'+
                '<a href="javascript:;" class="taste-btn"></a>'+
                '</div>'+
                '</div>'
            return xtastHtml;
        }
        }
    ]
    var params = {
        couponType:"2" ,//代金券， 3 加息券， 2 现金券
        useType: "1",// 未使用， 2已使用， 3已过期
    };
    var XtastePage = new Page('/uticket/select/2/1',params,$('.xtaste-listData1 .nouse'),$('.xtaste-listData1 .paging'),xtasteData1,function(){});
    $('#Xunused').unbind('click').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        var params = {
            couponType: 2 ,//代金券， 3 加息券， 2 现金券
            useType: 1,// 未使用， 2已使用， 3已过期
        };
        $('.xtaste-listData1').show().siblings('div.xtaste-listData').hide();
        XtastePage = new Page('/uticket/select/2/1',params,$('.xtaste-listData1 .nouse'),$('.xtaste-listData1 .paging'),xtasteData1,function(){});
    });
    $('#Xused').unbind('click').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        var params = {
            couponType: 2 ,//代金券， 3 加息券， 2 现金券
            useType: 2,// 未使用， 2已使用， 3已过期
        };
        $('.xtaste-listData2').show().siblings('div.xtaste-listData').hide();

        XtastePage = new Page('/uticket/select/2/2',params,$('.xtaste-listData2 .use'),$('.xtaste-listData2 .paging'),xtasteData2,function(){});
    });
    $('#Xexpired').unbind('click').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        var params = {
            couponType:2 ,//代金券， 3 加息券， 2 现金券
            useType: 3,// 未使用， 2已使用， 3已过期
        };
        $('.xtaste-listData3').show().siblings('div.xtaste-listData').hide();
        XtastePage = new Page('/uticket/select/2/3',params,$('.xtaste-listData3 .overdue'),$('.xtaste-listData3 .paging'),xtasteData3,function(){});
    });
}


//加息券 类型3
function jtasteData(){
    $('#jtaste').show();$('#dtaste').hide();$('#xtaste').hide();$('#ttaste').hide();
    var jtasteData1 =[
        {
            key:'id',resolve:function(val,userTicketVO){
            var jtastHtml = '<div class="bg-nouse"><div class="taste-bg-l">'+
                '<p class="money"><span>'+userTicketVO.tkmoney+'</span>%</p>'+
                '<p class="date">满<span>'+1000+'</span>元抵用</p>'+
                '</div>'+
                '<div class="text">'+
                '<p>'+msg1+userTicketVO.tkmoney+'元使用</p>'+
                '<p>'+msg2+'</p>'+
                '<p>有效期至'+formatDate(userTicketVO.tktime)+'</p>'+
                '</div>'+
                '<div class="taste-bg-r">'+
                '<a target="_blank" href="/detail/page" class="taste-btn">立即使用</a>'+
                '</div></div>'
            return jtastHtml;
        }
        }
    ]
    var jtasteData2 =[
        {
            key:'id',resolve:function(val,userTicketVO){
            var jtastHtml = '<div class="bg-use"><div class="taste-bg-l">'+
                '<p class="money"><span>'+userTicketVO.tkmoney+'</span>%</p>'+
                '<p class="date">满<span>'+1000+'</span>元抵用</p>'+
                '</div>'+
                '<div class="text">'+
                '<p>'+msg1+userTicketVO.tkmoney+'元使用</p>'+
                '<p>'+msg2+'</p>'+
                '<p>有效期至'+formatDate(userTicketVO.tktime)+'</p>'+
                '</div>'+
                '<div class="taste-bg-r">'+
                '<a href="investlist.html" class="taste-btn"></a>'+
                '</div></div>'
            return jtastHtml;
        }
        }
    ]
    var jtasteData3 =[
        {
            key:'id',resolve:function(val,userTicketVO){
            var jtastHtml = '<div class="bg-date"><div class="taste-bg-l">'+
                '<p class="money"><span>'+userTicketVO.tkmoney+'</span>%</p>'+
                '<p class="date">满<span>'+1000+'</span>元抵用</p>'+
                '</div>'+
                '<div class="text">'+
                '<p>'+msg1+userTicketVO.tkmoney+'元使用</p>'+
                '<p>'+msg2+'</p>'+
                '<p>有效期至'+formatDate(userTicketVO.tktime)+'</p>'+
                '</div>'+
                '<div class="taste-bg-r">'+
                '<a href="investlist.html" class="taste-btn"></a>'+
                '</div></div>'
            return jtastHtml;
        }
        }
    ]
    var params = {
        couponType:"3" ,//代金券， 3 加息券， 2 现金券
        useType: "1",// 未使用， 2已使用， 3已过期
    };
    var JtastePage = new Page('/uticket/select/3/1',params,$('.jtaste-listData1 .nouse'),$('.jtaste-listData1 .paging'),jtasteData1,function(){});
    $('#Junused').unbind('click').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        var params = {
            couponType: 3 ,//代金券， 3 加息券， 2 现金券
            useType: 1,// 未使用， 2已使用， 3已过期
        };
        $('.jtaste-listData1').show().siblings('div.jtaste-listData').hide();

        JtastePage = new Page('/uticket/select/3/1',params,$('.jtaste-listData1 .nouse'),$('.jtaste-listData1 .paging'),jtasteData1,function(){});
    });
    $('#Jused').unbind('click').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        var params = {
            couponType: 3 ,//代金券， 3 加息券， 2 现金券
            useType: 2,// 未使用， 2已使用， 3已过期
        };
        $('.jtaste-listData2').show().siblings('div.jtaste-listData').hide();

        JtastePage = new Page('/uticket/select/3/2',params,$('.jtaste-listData2 .use'),$('.jtaste-listData2 .paging'),jtasteData2,function(){});
    });
    $('#Jexpired').unbind('click').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        var params = {
            couponType:3 ,//代金券， 3 加息券， 2 现金券
            useType: 3,// 未使用， 2已使用， 3已过期
        };
        $('.jtaste-listData3').show().siblings('div.jtaste-listData').hide();
        JtastePage = new Page('/uticket/select/3/3',params,$('.jtaste-listData3 .overdue'),$('.jtaste-listData3 .paging'),jtasteData3,function(){});
    });
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