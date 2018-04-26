var localObj = window.location;
var contextPath = localObj.protocol + "//" + localObj.host;
var oPage;
$(function(){
    initstyle();
    initIpayData();

    $('#invest-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    $('#invest-endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    $("#invest-manage-Link").bind("click",function(){
        $(".sub-a-nav a").removeClass("active");
        $(this).addClass("active");
        $('.em-line').animate({'left':'0px'},500);
        $("#payment").hide();
        $("#invest").show();
        initIpayData();
    });
    $('#invest-detail-Link').unbind('click').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left':'120px'},500);
        initInvestDetail();
        sumDate();
    });
    $("#invest-s1").bind("click",function(){
        var startDate = $('#invest-startDate').val();
        var endDate = $('#invest-endDate').val();
        initIpayData(startDate,endDate,null);
        $(".sub-nav a").removeClass("active");
        $(this).addClass("active");
    });
    $("#invest-s2").bind("click",function(){
        var startDate = $('#invest-startDate').val();
        var endDate = $('#invest-endDate').val();
        $("#state").val(3);
        initIpayData(startDate,endDate,$("#state").val());
        $(".sub-nav a").removeClass("active");
        $(this).addClass("active");
    });
    $("#invest-s3").bind("click",function(){
        var startDate = $('#invest-startDate').val();
        var endDate = $('#invest-endDate').val();
        $("#state").val(4);
        initIpayData(startDate,endDate,$("#state").val());
        $(".sub-nav a").removeClass("active");
        $(this).addClass("active");
    });
    $("#invest-s4").bind("click",function(){
        var startDate = $('#invest-startDate').val();
        var endDate = $('#invest-endDate').val();
        $("#state").val(5);
        initIpayData(startDate,endDate,$("#state").val());
        $(".sub-nav a").removeClass("active");
        $(this).addClass("active");
    });
})
function initstyle(){
    $.post(contextPath+'/tzb/select_haveorno',
        '',
        function (data) {
            if(data.result === 'ok'){
                $("#invest-detail-Link").show();
            }else{
                $("#invest-detail-Link").hide();
            }
        },
        'json'
    );

}
//页面初始化
function initIpayData(startDate,endDate,state){
    //数据初始化
    var payData = [
        {
            key:'cpname',resolve:function(val,record){
                var a =$('<a href="'+contextPath+'/jkb/jkb_look/'+record.baid+'" title="'+val+'" target=“_blank”>'+val+'</a>');
                return a;
            }
        },
        {
            key:'money',resolve:function(val){
            return '<span class="black">'+val+'元</span>';
            }
        },
        {
            key:'nprofit',resolve:function(val){
                return '<span class="black">'+val+'%</span>';
            }
        },
        {
            key:'term',resolve:function(val){
                return val;
            }
        },
        {
            key:'way',resolve:function(val){
                return val;
            }
        },
        {
            key:'time',resolve:function(val){
                return formatDate(val);
            }
        },
        {
            key:'state',resolve:function(val,record){
                if (val == "4"){
                    var a =$('<a href="javascript:void(0);" onclick="add('+record.baid+','+record.money+')">收款详情</a>');
                    return a;
                }else{
                    return "--";
                }
            }
        }
    ];
    var startDate = startDate||'';
    var endDate = endDate||'';
    var state = state||'';
    var param={
        startTime:startDate,
        endTime:endDate,
        state:state
    };
    oPage = null;
    oPage = new Page(contextPath+'/tzb/select',param,$('#invest .invest-listData1 .listData'),$('#invest .invest-listData1 .paging'),payData,function(data){
        for (var i = 0; i<data.length;i++){
            alert(data[i].sid);
        }
    });

}
function add(baid,money){
    $.post(contextPath + '/skb/add_skb',
        {
            baid:baid,
            money:money
        },
        function (data) {
            $("#invest-detail-Link").show();
            document.getElementById("invest-detail-Link").click();
        },
        'json'
    );

}
//清空
$("#clean_date1").click(function(){
    $("#invest-startDate").val('');
    $("#invest-endDate").val('');
})
$("#clean_date2").click(function(){
    $("#payment-startDate").val('');
    $("#payment-endDate").val('');
})
//搜索
$('#investSearch').unbind('click').click(function () {
    var startDate = $('#invest-startDate').val();
    var endDate = $('#invest-endDate').val();
    var state = $("#state").val();
    if (startDate == '') {
        alert('开始时间不能为空');
        return;
    }
    if (endDate == '') {
        alert('结束时间不能为空');
        return;
    }
    if (startDate > endDate) {
        alert('开始时间不能大于结束时间');
        return;
    }
    initIpayData(startDate, endDate,state);
});
//收款明细
function initInvestDetail(){
    $('#invest').hide();
    $('#payment').show();
    $('#payment-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    $('#payment-endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    var param = {
        startTime:'',
        endTime:'',
        title:''
    };
    var investDetailData = [
        {
            key:'cpname',resolve:function(val,record){
                var a =$('<a href="'+contextPath+'/jkb/jkb_look/'+record.baid+'" title="'+val+'" target=“_blank”>'+val+'</a>');
                return a;
        }
        },
        {
            key:'way',resolve:function(val){
                return val;
            }
        },
        {
            key:'nprofit',resolve:function(val,record){
                return val+'%';
            }
        },
        {
            key:'tzmoney',resolve:function(val,record){
                return '<span class="black">'+val+'元</span>';
            }
        },
        {
            key:'ybx',resolve:function(val,record){
                var money = parseFloat(record.ybx+record.ylx+record.ybj).toFixed(2);
                return '<span class="black">'+money+'元</span>';
            }
        },
        {
            key:'hkdate',resolve:function(val){
                return formatDate2(val);
            }
        },
        {
            key:'state',resolve:function(val){
                    var str = '';
                    if(val == "2"){
                        str += "未还款";
                    }else if(val == "1"){
                        str += "可收款";
                    }else{
                        str += "已收款";
                    }
                return str;
            }
        },
        {
            key:'state',resolve:function(val,record){
                if (val == "1"){
                    var a =$('<a href="javascript:void(0);" onclick="openskb('+record.skid+','+val+')">收 款</a>');
                    return a;
                }else{
                    var a =$('<a href="javascript:void(0);" onclick="openskb('+record.skid+','+val+')">查看详情</a>');
                    return a;
                }
            }
        }
    ]
    var investDetailPage = new Page(contextPath +'/skb/list',param,$('.invest-detailTable .listData'),$('.invest-detailTable .paging'),investDetailData,function(data){

    });

    $('#invest-detailSearch').unbind('click').click(function(){
        param = {
            startTime:$('#payment-startDate').val(),
            endTime:$('#payment-endDate').val(),
        };
        investDetailPage = new Page(contextPath +'/skb/list',param,$('.invest-detailTable .listData'),$('.invest-detailTable .paging'),investDetailData,function(){});
    })
}
function sumDate(){
    $.post(contextPath + '/skb/sumDate',
        '',
        function (data) {
            if(data.money1 == null){
                data.money1 = 0;
            }
            if(data.money2 == null){
                data.money2 = 0;
            }
            if(data.money3 == null){
                data.money3 = 0;
            }
            if(data.money4 == null){
                data.money4 = 0;
            }
            $('#allForPIOneMonth').text(data.money1);
            $('#allForPIThreeMonth').text(data.money2);
            $('#allForPIYear').text(data.money3);
            $('#allForPI').text(data.money4);
        },
        'json'
    );
}
function openskb(skid,state){
    if(state == "1"){
        $("#repay-submit").show();
    }else{
        $("#repay-ok").show();
    }
    $.post(contextPath + '/skb/look_skb',
        {
            skid:skid
        },
        function (data) {
            $('#skid').val(data.skid);
            $('#skb-ybx').text(data.ybx);
            $('#skb-rbx').text(data.rbx);
            $('#skb-ylx').text(data.ylx);
            $('#skb-rlx').text(data.rlx);
            $('#skb-ybj').text(data.ybj);
            $('#skb-rbj').text(data.rbj);
            $('#skb-rnum').text(data.rnum);
            $('#skb-tnum').text(data.tnum);
            $('#skb-hkdate').text(formatDate2(data.hkdate));
            $('.repay-from').show();
            $('.repay-from .close').click(function(){
                $('.repay-from').hide();
                $("#repay-submit").hide();
                $("#repay-ok").hide();
            });
            $('#repay-ok').click(function(){
                $('.repay-from').hide();
                $("#repay-submit").hide();
                $("#repay-ok").hide();
            });
        },
        'json'
    );

}
$("#repay-submit").click(function(){
    var skid = $("#skid").val();
    $.post(contextPath + '/skb/update_skb',
        {
            skid:skid
        },
        function (data) {
            $('.repay-from').hide();
            $("#repay-submit").hide();
            $("#repay-ok").hide();
            alert(data.message);
            initInvestDetail();
        },
        'json'
    );
})

//时间格式化到秒
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
//时间格式化到天
function formatDate2(value) {
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