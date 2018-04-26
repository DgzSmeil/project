var localObj = window.location;
var contextPath = localObj.protocol + "//" + localObj.host;
var oPage;

$(function(){
    var startDate = $('#startDate').val();
    var endDate = $('#endDate').val();
    var state = $("#state").val();
    $('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    $('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    //初始化数据查询
    initIpayData();

    $("#loan-s").bind("click",function(){
        state = 1;
        $(".sub-nav a").removeClass("active");
        $(this).addClass("active");
        initIpayData(startDate,endDate,state);
        $(".loan-listData1").show();
        $(".loan-listData2").hide();
    });
    $("#loan-z").bind("click",function(){
        state = 3;
        $(".sub-nav a").removeClass("active");
        $(this).addClass("active");
        initIpayData(startDate,endDate,state);
        $(".loan-listData1").show();
        $(".loan-listData2").hide();
    });
    $("#loan-x").bind("click",function(){
        state = 4;
        $(".sub-nav a").removeClass("active");
        $(this).addClass("active");
        initIpayData(startDate,endDate,state);
        $(".loan-listData1").show();
        $(".loan-listData2").hide();
    });
    $("#loan-c").bind("click",function(){
        state = 5;
        $(".sub-nav a").removeClass("active");
        $(this).addClass("active");
        initIpayData(startDate,endDate,state);
        $(".loan-listData1").show();
        $(".loan-listData2").hide();
    });
    $("#loan-l").bind("click",function(){
        state = 2;
        $(".sub-nav a").removeClass("active");
        $(this).addClass("active");
        initIpayData2(startDate,endDate,state);
        $(".loan-listData2").show();
        $(".loan-listData1").hide();
    });
    $('#loanLink').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left':'0'},500);
        $('#repay').hide();
        $('#repayEdit').hide();
        $('#loan').show();
        initIpayData();
    });
    $('#detailLink').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left':'120px'},500);
        $('#loan').hide();
        $('#repayEdit').hide();
        $('#repay').show();
        detailLinkInit();
    });
    $('#repayEditLink').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left':'240px'},500);
        $('#loan').hide();
        $('#repay').hide();
        autoRepaymentInit();
    });
});
//页面初始化
function initIpayData(startDate,endDate,state){
    //数据初始化
    var payData = [
        {
            key:'cpname',resolve:function(val){
            return val;
        }
        },
        {
            key:'lxname',resolve:function(val){
            return val;
        }
        },
        {
            key:'way',resolve:function(val){
            return val;
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
            key:'sqtime',resolve:function(val){
            return formatDate(val);
        }
        },
        {
            key:'state',resolve:function(val){
            var str ='';
            if(val == '1'){
                str = '<p><span class="">审核中</span></p>';
            }else if(val == '2'){
                str = '<p><span class="icon icon-wrong">审核失败</span></p>';
            }else if(val == '3'){
                str = '<p><span class="">招标中</span></p>';
            }else if(val == '4'){
                str = '<p><span class="icon icon-true">成功</span></p>';
            }

            return str;
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
    oPage = new Page(contextPath+'/jkb/select',param,$('#loan .loan-listData1 .listData'),$('#loan .loan-listData1 .paging'),payData,function(){
        $('#invest').show();
    });

}
//申请失败
function initIpayData2(startDate,endDate,state){
    //数据初始化
    var payData = [
        {
            key:'cpname',resolve:function(val){
            return val;
        }
        },
        {
            key:'lxname',resolve:function(val){
            return val;
        }
        },
        {
            key:'excuse',resolve:function(val){
            return val;
        }
        },
        {
            key:'way',resolve:function(val){
            return val;
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
            key:'sqtime',resolve:function(val){
            return formatDate(val);
        }
        },
        {
            key:'baid',resolve:function(val){
            return  '<a href="'+contextPath+'/jkb/update_page/'+val+'" target="_blank">修改申请</a>';
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
    oPage = new Page(contextPath+'/jkb/select',param,$('#loan .loan-listData2 .listData'),$('#loan .loan-listData2 .paging'),payData,function(){
        $('#invest').show();
    });

}

//还款明细初始化
function detailLinkInit(){
    var borrowFlag = 'repaymenting';
    var startDate = '';
    var endDate = '';
    var state = '';
    var param = {
        borrowFlag:borrowFlag,
        startTime:startDate,
        endTime:endDate,
        state:state
    };
    $('#d-startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    $('#d_endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    var dlistData = [
        {
            key:'cpname',resolve:function(val,record){
            var a =$('<a href="'+contextPath+'/jkb/jkb_look/'+record.baid+'" title="'+val+'" target=“_blank”>'+val+'</a>');
            return a;
        }

        },
        {
            key:'djq',resolve:function(val,record){
            return val;
        }
        },
        {
            key:'hname',resolve:function(val){
            return val;
        }
        },
        {
            key:'ytmoney',resolve:function(val){
            return '<span class="black">'+val+'元</span>';
        }
        },
        {
            key:'nprofit',resolve:function(val){
            return val+'%';
        }
        },
        {
            key:'bzname',resolve:function(val,record){
            return val;
        }
        },
        {
            key:'ytime',resolve:function(val,record){
            return formatDate2(val);
        }
        },
        {
            key:'ybx',resolve:function(val){
            return '<span class="black">'+val+'元</span>';
        }
        },
        {
            key:'state',resolve:function(val,record){
            var a =$('<a href="javascript:void(0);" onclick="openhkb('+record.hkid+','+val+')">还 款</a>');
            return a;
        }
        }
    ];
    var dlistData1 = [
        {
            key:'cpname',resolve:function(val,record){
            var a =$('<a href="'+contextPath+'/jkb/jkb_look/'+record.baid+'" title="'+val+'" target=“_blank”>'+val+'</a>');
            return a;
        }

        },
        {
            key:'djq',resolve:function(val,record){
            return val;
        }
        },
        {
            key:'ytmoney',resolve:function(val){
            return '<span class="black">'+val+'元</span>';
        }
        },
        {
            key:'hname',resolve:function(val){
            return val;
        }
        },
        {
            key:'ytime',resolve:function(val,record){
            return formatDate2(val);
        }
        },
        {
            key:'rtime',resolve:function(val){
            var str = '';
            if(val == null){
                str += "无";
            }else{
                str += formatDate2(val);
            }
            return str;
        }
        },
        {
            key:'rbx',resolve:function(val){
            return '<span class="black">'+val+'</span>';
        }
        },
        {
            key:'yfx',resolve:function(val){
            return val;
        }
        },
        {
            key:'state',resolve:function(val,record){
            if(val!='1'){
                var a =$('<a href="javascript:void(0);" onclick="openhkb('+record.hkid+','+val+')">详 情</a>');
                return a;
            }else{
                var a =$('<a href="javascript:void(0);" onclick="openhkb('+record.hkid+','+val+')">还 款</a>');
                return a;
            }
        }
        }
    ];
    var dlistData2 = [
        {
            key:'cpname',resolve:function(val,record){
            var a =$('<a href="'+contextPath+'/jkb/jkb_look/'+record.baid+'" title="'+val+'" target=“_blank”>'+val+'</a>');
            return a;
        }

        },
        {
            key:'djq',resolve:function(val){
            return val;
        }
        },
        {
            key:'ytime',resolve:function(val,record){
            return formatDate2(val);
        }
        },
        {
            key:'rtime',resolve:function(val){
            var str = '';
            if(val == null){
                str += "无";
            }else{
                str += formatDate2(val);
            }
            return str;
        }
        },
        {
            key:'ybx',resolve:function(val){
            return val;
        }
        },
        {
            key:'ylx',resolve:function(val){
            return val;
        }
        },
        {
            key:'yfx',resolve:function(val){
            var str = '';
            if(val == null){
                str += "无";
            }else{
                str += val;
            }
            return str;
        }
        },
        {
            key:'yucount',resolve:function(val){
            var str = '';
            if(val == null){
                str += "无";
            }else{
                str += val;
            }
            return str;
        }
        },
        {
            key:'state',resolve:function(val){
            if(val == '1'){
                return '还款中';
            }else if(val == '2'){
                return '已偿还';
            }else{
                return '已逾期';
            }

        }
        },
        {
            key:'state',resolve:function(val,record){
            if(val!='1'){
                var a =$('<a href="javascript:void(0);" onclick="openhkb('+record.hkid+','+val+')">详 情</a>');
                return a;
            }else{
                var a =$('<a href="javascript:void(0);" onclick="openhkb('+record.hkid+','+val+')">还 款</a>');
                return a;
            }
        }
        }
    ];
    oPage = null;
    oPage = new Page(contextPath +'/hkb/hkb_list',param,$('#repay .listTable1 .listData'),$('#repay .listTable1 .detailPaging'),dlistData,function(){

    });
    //还款中
    $('#detail-h').unbind('click').click(function(){
        borrowFlag = 'repaymenting';
        $(this).addClass('active').siblings('a').removeClass('active');
        var param = {
            borrowFlag:borrowFlag,
            startTime:$('#d-startDate').val(),
            endTime:$('#d_endDate').val(),
            state:1
        };
        $('.listTable3').hide();
        $('.listTable2').hide();
        $('.listTable1').show();
        oPage = null;
        oPage = new Page(contextPath +'/hkb/hkb_list',param,$('#repay .listTable1 .listData'),$('#repay .listTable1 .detailPaging'),dlistData,function(){});
    });
    //已还完
    $('#detail-y').unbind('click').click(function(){
        borrowFlag = 'alreadyRepaid';
        $(this).addClass('active').siblings('a').removeClass('active');
        var param = {
            borrowFlag:borrowFlag,
            startTime:$('#d-startDate').val(),
            endTime:$('#d_endDate').val(),
            state:2
        };
        $('.listTable3').hide();
        $('.listTable1').hide();
        $('.listTable2').show();
        oPage = null;
        oPage = new Page(contextPath +'/hkb/hkb_list',param,$('#repay .listTable2 .listData'),$('#repay .listTable2 .detailPaging'),dlistData1,function(){});
    });
    //还款明细
    $('#detail-m').unbind('click').click(function(){
        borrowFlag = '';
        $(this).addClass('active').siblings('a').removeClass('active');
        var param = {
            borrowFlag:borrowFlag,
            startTime:$('#d-startDate').val(),
            endTime:$('#d_endDate').val(),
            state:''
        };
        $('.listTable2').hide();
        $('.listTable1').hide();
        $('.listTable3').show();
        oPage = null;
        oPage = new Page(contextPath +'/hkb/hkb_list',param,$('#repay .listTable3 .listData'),$('#repay .listTable3 .detailPaging'),dlistData2,function(){});
    });

    $('#detailSearch').unbind('click').click(function(){
        if(borrowFlag=='repaymenting'){
            $('#detail-h').click();
        }
        if(borrowFlag=='alreadyRepaid'){
            $('#detail-y').click();
        }
        if(borrowFlag==''){
            $('#detail-m').click();
        }
    });
}

function openhkb(hkid,state){
    if(state == "1"){
        $("#repay-submit").show();
    }else{
        $("#repay-ok").show();
    }
    $.post(contextPath + '/hkb/look_hkb',
        {
            hkid:hkid
        },
        function (data) {
            $('#hkb-ybx').text(data.ybx);
            $('#hkb-rbx').text(data.rbx);
            $('#hkb-ylx').text(data.ylx);
            $('#hkb-rlx').text(data.rlx);
            $('#hkb-ybj').text(data.ybj);
            $('#hkb-rbj').text(data.rbj);
            $('#hkb-rnum').text(data.rnum);
            $('#hkb-tnum').text(data.tnum);
            $('#hkb-hkdate').text(formatDate2(data.ytime));
            $('#hkid').val(data.hkid);
            $('.repay-from').show();
            $('.repay-from .close').click(function(){
                $('.repay-from').hide();
            });
            $('#repay-ok').click(function(){
                $('.repay-from').hide();
            });
        },
        'json'
    );

}
$('#repay-submit').click(function(){
    var hkid = $("#hkid").val();
    $.post(contextPath + '/hkb/update_hkb',
        {
            hkid:hkid
        },
        function (data) {
            $('.repay-from').hide();
            alert(data.message);
            detailLinkInit();
        },
        'json'
    );
});
//搜索
$('#loanSearch').unbind('click').click(function () {
    var startDate = $('#startDate').val();
    var endDate = $('#endDate').val();
    if (startDate == '') {
        swal("错误信息", "开始时间不能为空", "error");
        return;
    }
    if (endDate == '') {
        swal("错误信息", "结束时间不能为空", "error");
        return;
    }
    if (startDate > endDate) {
        swal("错误信息", "开始时间不能大于结束时间", "error");
        return;
    }
    initIpayData(startDate, endDate);
});
$('#loanSearchClean').unbind('click').click(function () {
    $('#startDate').val('');
    $('#endDate').val('');
});
$('#detailSearchClean').unbind('click').click(function () {
    $('#d-startDate').val('');
    $('#d_endDate').val('');
});
function autoRepaymentInit() {
    $.post(contextPath + '/hkb/tzb_zdhk',
        '',
        function (data) {
            if (data!= null) {
                $("#payment_state").text(data.iszd == 2 ? '已开启' : '已关闭');
                $("#payment_btn").text(data.iszd == 1 ? '开启' : '关闭');
                $('#repayEdit').show();
            } else {
                alert("您还没有借款");
            }

            $('#payment_btn').unbind('click').click(function(){
                var state;
                if (data.iszd == 1) {
                    state = 2;
                } else if (data.iszd == 2) {
                    state = 1;
                }
                $.post(contextPath + '/hkb/zdhk',
                    {
                        iszd:state
                    },
                    function (data) {
                        alert(data.message);
                        autoRepaymentInit();
                    },
                    "json"
                );
            });
        },
        'json'
    );
}
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