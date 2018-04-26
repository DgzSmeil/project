var localObj = window.location;
var contextPath = localObj.protocol + "//" + localObj.host;
var oPage;
$(function(){
    initIpayData();
    $('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    $('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
    $("#type4").bind("click",function(){
        $("#type").val('');
        $(".cl li").removeClass("active");
        $(this).addClass("active");
        initIpayData('','',null);
    });
    $("#type0").bind("click",function(){
        $("#type").val(1);
        $(".cl li").removeClass("active");
        $(this).addClass("active");
        initIpayData($("#startDate").val(),$("#endDate").val(),$("#type").val());
    });
    $("#type1").bind("click",function(){
        $("#type").val(2);
        $(".cl li").removeClass("active");
        $(this).addClass("active");
        initIpayData($("#startDate").val(),$("#endDate").val(),$("#type").val());
    });
    $("#type2").bind("click",function(){
        $("#type").val(3);
        $(".cl li").removeClass("active");
        $(this).addClass("active");
        initIpayData($("#startDate").val(),$("#endDate").val(),$("#type").val());
    });
    $("#type3").bind("click",function(){
        $("#type").val(5);
        $(".cl li").removeClass("active");
        $(this).addClass("active");
        initIpayData($("#startDate").val(),$("#endDate").val(),$("#type").val());
    });
    $("#type5").bind("click",function(){
        $("#type").val(4);
        $(".cl li").removeClass("active");
        $(this).addClass("active");
        initIpayData($("#startDate").val(),$("#endDate").val(),$("#type").val());
    });
    $("#type6").bind("click",function(){
        $("#type").val(6);
        $(".cl li").removeClass("active");
        $(this).addClass("active");
        initIpayData($("#startDate").val(),$("#endDate").val(),$("#type").val());
    });
    $("#clean_date").click(function(){
        $("#startDate").val('');
        $("#endDate").val('');
    })

})

//记录初始化
function initIpayData(startDate,endDate,type){
    //数据初始化
    var payData = [
        {
            key:'date',resolve:function(val){
                return formatDate(val);
            }
        },
        {
            key:'type',resolve:function(val){
            var str ='';
            if(val == '1'){
                str = '<p><span class="">充值</span></p>';
            }else if(val == '2'){
                str = '<p><span class="">提现</span></p>';
            }else if(val == '3'){
                str = '<p><span class="">还款</span></p>';
            }else if(val == '4'){
                str = '<p><span class="">投资</span></p>';
            }else if(val == '5'){
                str = '<p><span class="">系统金额</span></p>';
            }else if(val == '6'){
                str = '<p><span class="">收款</span></p>';
            }
            return str;
            }
        },
        {
            key:'in',resolve:function(val){
            return '<span class="black">'+val+'元</span>';
            }
        },
        {
            key:'out',resolve:function(val){
            return '<span class="black">'+val+'元</span>';
            }
        },
        {
            key:'state',resolve:function(val){
                return "<p><span class='icon icon-true'>成功</span></p>";
            }
        }
    ];
    var startDate2 = startDate||'';
    var endDate2 = endDate||'';
    var type2 = type||'';
    var param={
        startTime:startDate2,
        endTime:endDate2,
        type:type2
    };
    oPage = null;
    oPage = new Page(contextPath+'/log_money/search',param,$('.listData'),$('.paging'),payData,function(){
        $('#invest').show();
    });

}
//搜索
$('#loanSearch').unbind('click').click(function () {
    var startDate = $('#startDate').val();
    var endDate = $('#endDate').val();
    var type = $("#type").val();
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
    initIpayData(startDate, endDate,type);
});
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