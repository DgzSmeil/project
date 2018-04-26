var localObj = window.location;
var contextPath = localObj.protocol + "//" + localObj.host;
var oPage;
$(function(){

    $(".img1").mouseover(function (){
        $("#a1").show();
    }).mouseout(function (){
        $("#a1").hide();
    });
    $(".img2").mouseover(function (){
        $("#a2").show();
    }).mouseout(function (){
        $("#a2").hide();
    });
    $(".nomargin").mouseover(function (){
        $("#a3").show();
    }).mouseout(function (){
        $("#a3").hide();
    });
    $(".img4").mouseover(function (){
        $("#a4").show();
    }).mouseout(function (){
        $("#a4").hide();
    });
    //全部投资
    $('#pushAll').click(function(){
        $("#amount").val($("#kymoney").val());
        reckon();
    })

    $("#investBtn").click(function(){
        if($("#state").val()!=3){return};
        var ktmoney = $("#ktmoney").val();
        var kymoney = $("#kymoney").val();
        var amount =$("#amount").val();
        var kymoney =$("#kymoney").val();
        if(kymoney == ""){
            alert('您还未登录，请先登录！');
            window.location.href = '/user/login_page';
            return;
        }
        if(amount == ''){
            alert('请输入投资金额');
            return;
        }
        if(isNaN(amount)){
            alert('金额格式不正确');
            return;
        }
        if(parseFloat(amount)>kymoney){
            alert('余额不足！');
            return;
        }
        if(parseFloat(amount)>ktmoney){
            alert('投资金额不能大于最大投标金额');
            return;
        }
        if(amount<100){
            alert('投资金额不能小于100元');
            return;
        }
        var pwd =$("#pwd").val();
        if(pwd == ""){
            ajaxSubmit();
        }else{
            $('.hasPWD').fadeIn();
            $('#password').val('');
            $('.hasPWD .close').click(function(){
                $('.hasPWD').hide();
            });
            $('#haspwd-submit').unbind('click').click(function(){
                var password = $("#password").val();
                if(password == ''){
                    alert('请输入交易密码');
                    return;
                };
                if(pwd != password){
                    alert("交易密码错误");
                    return;
                }
                ajaxSubmit();
            })
        }
    })
})
//提交
function ajaxSubmit(){
    var amount =$("#amount").val();
    var kymoney = $("#kymoney").val();
    var uid =$("#uid").val();
    var baid =$("#baid").val();
    var cpname =$("#cpname").val();
    var nprofit =$("#nprofit").val();
    var ytmoney =$("#ytmoney").val();
    var ticket = $("#selectQuan").val();
    $("#canUseSum").html(kymoney - parseFloat(amount));
    var url =contextPath + "/tzb/tz_save";
    $.post(url,
        {
            ukid:ticket,
            money:amount,
            juid:uid,
            baid:baid,
            cpname:cpname,
            nprofit:nprofit,
            ytmoney:ytmoney
        },
        function(data){
            $('.hasPWD').hide();
            alert(data.message);
            history.go(0);
        },
        "json"
    );
}
//标的相关文件
function getFile(obj) {
    if ($(obj).hasClass('active')) {
        return;
    }
    ;

    $('.em-line').animate({'left': '160px'}, 500);
    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
    if ($('.files-box').children('li').size() > 0) {
        $('#files').show();
        return;
    };
}
//标的详情
function getDetail(obj){
    if($(obj).hasClass('active')){
        return;
    };
    $('.em-line').animate({'left':'40px'},500);
    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
    $('#project').show();
}
//还款计划
function getPlan(obj){
    var baid = $("#baid").val();
    if($(obj).hasClass('active')){
        return;
    };
    $('.em-line').animate({'left':'280px'},500);
    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
       var listData = [
           {
               key:'tnum',resolve:function(val,record){
               return record.djq+"/"+val;
           }
           },
           {
               key:'ytime',resolve:function(val){
               return formatDate(val);
           }
           },
           {
               key:'rtime',resolve:function(val){
               if(val == null){
                   return '无';
               }else{
                   return formatDate(val);
               }
           }
           },
           {
               key:'rbx',resolve:function(val){
               return val;
           }
           },
           {
               key:'ybx',resolve:function(val){
               return val;
           }
           },
           {
               key:'rfx',resolve:function(val){
               return val;
           }
           },
           {
               key:'yfx',resolve:function(val){
               return val;
           }
           },
           {
               key:'state',resolve:function(val){
               if(val == '1'){
                   return '未偿还';
               }else if(val == '2'){
                   return '已偿还';
               }else{
                   return '已逾期';
               }
           }
           }
       ];
       var param = {
           baid:baid
       }
    new Page(contextPath+'/hkb/search',param,$('#plan .listData'),$('.paging'),listData,function(){
        $('#plan').show();
    });

}
//投资记录
function getInvest(obj) {
    var baid = $("#baid").val();
    if ($(obj).hasClass('active')) {
        return;
    }
    if ($("#state").val() == 4) {
        $('.em-line').animate({'left': '400px'}, 500);
    } else {
        $('.em-line').animate({'left': '280px'}, 500);
    }
    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
    var param={
        baid:baid
    };
    var listData = [
        {
            key:'rname',resolve:function(val){
            return val;
        }
        },
        {
            key:'money',resolve:function(val){
            return val;
        }
        },
        {
            key:'time',resolve:function(val){
            return formatDate2(val);
        }
        },
        {
            key:'',resolve:function(val){
            return "<p><span class='icon icon-true'>成功</span></p>";
        }
        }
    ];
    new Page(contextPath+'/tzb/list',param,$('#invest .listData'),$('#invest .paging'),listData,function(){
        $('#invest').show();
    })
}
//查看风险提示
function dangger(obj){
    if($(obj).hasClass('active')){
        return;
    };
    if($("#state").val() == 4){
        $('.em-line').animate({'left':'520px'},500);
    }else{
        $('.em-line').animate({'left':'400px'},500);
    }

    $('.sub-a-box').hide();
    $(obj).addClass('active').siblings().removeClass('active');
    $('#tips').show();
}
//大图预览
function showBigImg(index){
    document.getElementById(index).style.display ='block';
    document.getElementById('fade').style.display='block'
}
function closeBigImg(index){
    document.getElementById(index).style.display ='none';
    document.getElementById('fade').style.display='none'
}
//计算收益
function reckon() {
    var amount = $("#amount"); //获取投资金额
    var apr = $("#nprofit").val()/100; //获取年利率
    var mons = $("#term"); //获取投资期限
    var type = $("#sid").val(); //获取投资方式
    var principal = parseFloat(amount.val()); //返回一个金额浮点数
    var interest = apr/12;//每月利率
    var payments = parseInt(mons.val()); //投资期限
    if(!isNaN(amount.val()) && amount.val() !=''){
        if (type==3) {
            var mon = 0;

            if (parseInt(payments) == 1) {
                $("#reckon").html((principal * interest * payments).toFixed(2));
            } else {
                $("#reckon").html((principal * interest * payments).toFixed(2));
            }


        } else if (type == 2) {
            $("#reckon").html((principal * interest * payments).toFixed(2));
        } else if (type == 5) {

            var monthRate = interest;
            var tempAmount = 0.00, tempInterestAmount = 0.00, tempAmountAndInterest = 0.00, totalInterest = 0.00,
                totalAmount = 0.00;
            interestAmount = 0.00;
            var index = 1;
            interestAmount = GetInterest(principal, payments, apr.val());
            while (index <= payments) {
                tempAmount = Number(principal * monthRate * Math.pow(1 + monthRate, index - 1) / (Math.pow(1 + monthRate, payments) - 1));
                tempAmountAndInterest = Number(principal * monthRate * Math.pow(1 + monthRate, payments) / (Math.pow(1 + monthRate, payments) - 1));
                tempInterestAmount = Number(tempAmountAndInterest - tempAmount);
                if (index == payments) {
                    tempAmount = Number(principal) - Number(totalAmount);
                    tempInterestAmount = Number(tempAmountAndInterest - tempAmount);
                }
                totalInterest += Number(tempInterestAmount);
                totalAmount += Number(tempAmount);
                interestAmount = ((Number(totalInterest) * 100) / 100); //总利息
                $("#reckon").html(interestAmount);
            }
        }
    }else{
        $('#reckon').text('0.00');
        $('#increase').text('0.00');
    }

}
//时间格式化到天
function formatDate(value) {
    if (value == undefined || value == null || value == '') {
        return "";
    } else {
        var date = new Date(value); // 获取js的Date对象
        var year = date.getFullYear().toString();
        var month = (date.getMonth() + 1);
        var day = date.getDate().toString();

        if (month < 10) {
            month = "0" + month;
        }
        if (day < 10) {
            day = "0" + day;
        }
        return year + "-" + month + "-" + day;
    }
}
//时间格式化到秒
function formatDate2(value) {
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