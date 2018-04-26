var contextPath = "http://localhost:8080";
var contentType = "application/x-www-form-urlencoded; charset=utf-8";
var oPage;
function hashChange(){

    var hash =  window.location.pathname;
    /*$('.sub-nav li').removeClass('active');
    $('a[href="#'+hash+'"]').parent('li').addClass('active');*/
    switch(hash){
        case '/logczz/page':
            initrecharge();
            break;
        case '/recommend/handpage':
            initTuijian();
            break;
        case 'tuijian':
            initTuijian();
            break;
        case 'ipay':
            initIpay();
            break;
        case '/logtx/page':
            initCash();
            InitBank();
            break;
        case 'taste':
            initTaste();
            break;
        case 'fund':
            initFundRecord();
            break;
        case 'invest':
            initInvestManage();
            break;
        case 'claimm':
            initClaimManage();
            break;
        case 'claimb':
            initClaimBuy();
            break;
        case 'loan':
            initLoanManage();
            break;
        case '/bank/page':
            initMyDebitCard();
            break;
        case 'safe':
            initSafe();
            break;
        case 'msg':
            initMsgCenters();
            break;
        case '/letter/showpage':
            initMsgData();
            break;
        /*default : initAccount();$('a[href="#account"]').parent('li').addClass('active');
            break;*/
    };
/*
    $('a[href="#'+hash+'"]').parent('li').addClass('active');
*/
}

function initMyDebitCard() {
        $.post(contextPath + "/bank/select",
            function(data) {
                for (var i = 0; i < data.length; i++) {
                    var obj = data[i];

                    var cardColor = 'bank-card_1';
                    if (i % 2 != 0) {
                        cardColor = 'bank-card_2';
                    }
                    var cards = $("#myDebitCard");
                    // 卡号
                    var cardNo1 = obj.cardno.substr(0, 4);
                    var cardNo2 = obj.cardno.substr(obj.cardno.length - 4, obj.cardno.length - 1);
                    var cardUserName = obj.rname.substr(1, obj.rname.length - 1);
                    var bcid = obj.bcid;

                    var card =
                        $('<div id="card1" class="' + cardColor + '">' +
                            '<div class="bank-top">' +
                            /*'<div class="bank-cardLogo"></div>' +*/
                            '<div class="bank-cardTitle">' + obj.type + '</div>' +
                            '<div class="bank-cardType">储蓄卡</div>' +
                            '</div>' +
                            '<div class="bank-center">' +
                            /*'<div class="bank-empty"></div>' +*/
                            '<div class="bank-cardNumber">' + cardNo1 + ' **** **** ' + cardNo2 + '</div>' +
                            '<div class="bank-userName">*' + cardUserName + '</div>' +
                            '<div><a href="javascript:;"  onclick="deleteCardy('+bcid+');" class="bank-userName" style="color: #8f2500">一键解绑</a></div>'+
                            '</div>' +
                            '</div>');
                    card.appendTo(cards);

                }
                // 循环完银行卡后显示添加银行卡
                var cards = $("#myDebitCard");
                // 添加银行卡对象
                var card =
                    $('<div id="card3" class="bank-card_3" onclick="addCard();" style="cursor:pointer;">'+
                        '<div class="bank-addCard"><a href="javascript:;" >添加银行卡</a></div>'+
                        '</div>');
                card.appendTo(cards);
            },
            "json"
        );
}

function addCard(){
    window.location.href="/bank/bindingpage";
}
function deleteCardy(bcid) {

    $.post("/bank/delbyid",
            {
                bcid:bcid
        },
            function (data){
                if(data.code == "2000") {
                    window.location.href="/bank/page";
                    alert(data.message);
                }else{
                    alert(data.message);
                }
            },
            "json"
        );
}
//绑定银行卡
function bindingcode(){
    var uid = $('#uid').val();
    var type = $('#type').val();
    var rname = $('#realName').text();
    var idno = $('#idno').text();
    var cardno = $.trim($('#cardno').val());
    if(cardno == "") {
        $("#banknoInfo").html("请填写银行卡号");
        return false;
    }
    if(cardno.length < 16 || cardno.length > 19) {
       alert("银行卡号长度必须在16到19之间");
        return false;
    }
    var num = /^\d*$/; //全数字
    if(!num.exec(cardno)) {
        alert("银行卡号必须全为数字");
        return false;
    }

    //开头6位
    var strBin = "10,18,30,35,37,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,58,60,62,65,68,69,84,87,88,94,95,98,99";
    if(strBin.indexOf(cardno.substring(0, 2)) == -1) {
        alert("银行卡号开头6位不符合规范");
        return false;
    }

    var bankCard={uid:uid,cardno:cardno,type:type,rname:rname,idno:idno};
    $.post(contextPath+'/bank/add',
        bankCard,
        function(data){
            if(data.code == "1000"){
                alert("恭喜您哦！"+data.message);
                window.location.href=contextPath + "/bank/page";
            }else{
                alert("对不起！"+data.message);
            }
        },
    "json"
    );
}
var bankno;//jquery bug
var bankname;
//初始化银行下拉框
function initrecharge() {
    InitBank();
    //充值
    $('#ipay-submit').click(function () {

        var money = $('#ipay-amt').val();
        if (money == '') {
            alert('请输入充值金额');
            return false;
        }
        var sum = /^\d*$/;
        if(!sum.exec(money)) {
            alert('请输入正确格式的金额');
            return false;
        }
        var logCzz = {banktype: bankname, bankcard: bankno, money: money};
        $.post(contextPath + "/logczz/add",
            logCzz,
            function (data) {
                if (data.code === "3000") {
                    alert(data.message);
                } else {
                    alert(data.message);
                }

            },
            "json"
        );
    });
    $('.show-ipay-list').click(function () {
        if ($(this).hasClass('active')) {
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left': '120px'}, 500);
        $('.ipay-pay').hide();
        $('.ipay-list').show();
        $('#startDate').datepicker({format: 'yyyy-mm-dd'}).on('changeDate', function () {

        });
        $('#endDate').datepicker({format: 'yyyy-mm-dd'}).on('changeDate', function () {

        });
        if ($('.listData li').size() == 0) {
            //初始化数据查询
            initIpayData();
        }
        //搜索
        $('#ipaySearch').unbind('click').click(function () {
            var startDate = $('#startDate').val();
            var endDate = $('#endDate').val();
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
            initIpayData(startDate, endDate);
        });
    });
}

//充值记录初始化
function initIpayData(startDate,endDate){
    //数据初始化
    var payData = [
        {
            key:'rname',resolve:function(val){
            return val;
        }
        },
        {
            key:'money',resolve:function(val){
            return '<span class="black">'+val+'</span>';
        }
        },
        {
            key:'banktype',resolve:function(val){
            return val;
        }
        },
        {
            key:'date',resolve:function(val){
            return formatDate(val);
        }
        },
        {
            key:'state',resolve:function(val){
            var str ='';
            if(val == '1'){
                str = '<p><span class="icon icon-true">成功</span></p>';
            }else{
                str = '<p><span class="icon icon-wrong">失败</span></p>';
            }
            return str;
        }
        }
    ];
    var startDate = startDate||'';
    var endDate = endDate||'';
    var param={
        startTime:startDate,
        endTime:endDate
    };
    oPage = null;
    oPage = new Page('/logczz/select',param,$('.listData'),$('.paging'),payData,function(){
        $('#invest').show();
    });

}

//提现

function initCash() {
    $.post(contextPath + "/logtx/page");
    $("#cashInput").blur(function () {
        var value = $(this).val();
        if (isMoney(value)) {
            alert('金额格式不正确');
            $('#cash-submit').addClass('disabled').unbind('click');
            return;
        } else if (value < 100) {
            alert('提现金额不能小于100');
            return;
        } else {
            $('#cash-submit').removeClass('disabled').unbind('click').bind('click', function () {
                cashSubmit();
            });
        }
        if (value == 0) {
            $('#refreew').text("0.00").data('fei', fei);
        } else {
            var fei = value * 0.0035;
            $('#refreew').text(fei + "元").data('fei', fei);
            if (fei <= 2) {
                $('#refreew').text("2元").data('fei', fei);
            }
        }
    });
//提现记录
    $('.show-cash-list').click(function(){
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left':'120px'},500);
        $('.cash-pay').hide();
        $('.cash-list').show();
        $('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
        $('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
        if($('.listData li').size() == 0){
            //初始化数据查询
            initcashData();
        };
        //搜索
        $('#cashSearch').unbind('click').click(function(){
            var startDate = $('#startDate').val();
            var endDate = $('#endDate').val();
            if(startDate == ''){
                utils.toast('开始时间不能为空');
                return;
            }
            if(endDate == ''){
                utils.toast('结束时间不能为空');
                return;
            }
            if(startDate>endDate){
                utils.toast('开始时间不能大于结束时间');
                return;
            }
            initcashData(startDate,endDate);
        });
    });
}


//提现
function cashSubmit(){
    var money = $('#cashInput').val();
	var password = $('#cash-password').val();
    var bankNo = $('#select-bank').data('bankno');
    var fei =  $('#refreew').data('fei');
    if(money == ''){
        alert('金额不能为空');return;
    }
	if(password == ''){
		alert('交易密码不能为空');return;
	}
    if(isMoney(money)){
        alert('金额格式不正确');return;
    }
    var logTx={bankcard:bankNo,banktype:bankname,money:money,proce:fei,password:password};
    $.post(contextPath+"/logtx/add",
        logTx,
        function (data){
            if(data.result === "ok") {
                alert(data.message);
                window.location.href=contextPath + "/logtx/page";
               /* $('#returnHtml').html(data.html.replace('target="_blank"',''));*/
            }
        }
    )


}

function initcashData(startDate,endDate){
    //数据初始化
    var cashData = [
        {
            key:'rname',resolve:function(val){
            return val;
        }
        },
        {
            key:'money',resolve:function(val){
            return '<span class="black">'+val+'元</span>';
        }
        },
        {
            key:'cardno',resolve:function(val){
            return encodeBank(val);
        }
        },
        {
            key:'proce',resolve:function(val){
            return '<span class="black">'+val+'元</span>';
        }
        },
        {
            key:'date',resolve:function(val){
            return formatDate(val);
        }
        },
        {
            key:'state',resolve:function(val){
            var str ='';
            if(val == '2'){
                str = '<p><span class="icon icon-true">已提现</span></p>';
            }else if(val=='1'){
                str = '<p><span class="icon icon-danger">审核中</span></p>';
            }else if(val=='3'){
                str = '<p><span class="icon icon-wrong">取消</span></p>';
            }else if(val=='4'){
                str = '<p><span class="icon icon-danger">转账中</span></p>';
            }else if(val=='5'){
                str = '<p><span class="icon icon-wrong">失败</span></p>';
            }
            return str;
        }
        },
        {
            key:'state',resolve:function(val,record){
            var str ='';
            if(val == '2'){
                str = '<p><span class="black">--</span></p>';
            }else if(val=='1'){
                str = $('<a href="javascript:void(0);" onclick="deleteWithdraw('+record.id+','+record.money+')">取消</a>');
            }else if(val=='3'){
                str = '<p><span class="black">--</span></p>';
            }else if(val=='4'){
                str = '<p><span class="black">--</span></p>';
            }else if(val=='5'){
                str = '<p><span class="black">--</span></p>';
            }
            return str;
        }
        }
    ];
    var startDate = startDate||'';
    var endDate = endDate||'';
    var param={
        startTime:startDate,
        endTime:endDate
    };
    var payPage = new Page(contextPath+'/logtx/select',param,$('.listData'),$('.paging'),cashData,function(){});
}

//取消提现
function deleteWithdraw(id,sum){
    if(!window.confirm("确定要取消提现记录")){
        return;
    }
    var param={id:id};
    $.post(
        contextPath +'/logtx/cancl',
        {
            id:id,money:sum
        },
        function(data){
            if(data.result =='ok'){
                alert(data.message);
                //初始化数据查询
                initcashData();
            }else{
                alert(data.message);
            }
        },
        'json'
    );
}

function InitBank() {
    $.post(contextPath + "/bank/select",
        function (data) {
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    $('<li data-name="' + data[i].type + '" data-bankno="' + data[i].cardno + '"><a href="javascript:;">' + data[i].type + '&nbsp;&nbsp;|&nbsp;&nbsp;' + encodeBank(data[i].cardno) + '</a></li>')
                        .click(function () {
                            bankno = $(this).attr('data-bankno');//jquery bug
                            bankname = $(this).data('name');

                            $('#select-bank').val(bankname + '  |  ' + encodeBank(bankno)).data('bankno',bankno);
                            $('.select-box').slideUp(200);
                        })
                        .appendTo($('.select-box'));
                }
                ;

                //默认值
                $("#select-bank").val(data[0].type + '  |  ' + encodeBank(data[0].cardno))
                    .data('bankno', data[0].cardno)
                    .click(function () {
                        $('.select-box').slideToggle(200);
                    });
                bankno = data[0].cardno;//jquery bug
                bankname = data[0].type;
            }
        },
        "json"
    );
}
function initTuijian() {
    //复制文本
    var text = $(".tj-clip-text").text();
    clipboard(text,'tj-clip-btn','复制成功！','tj-clip');
    /*

     $('.tuijian-list').hide();
     $(".invest-list").hide();
     $(".investList").hide();
     $(".fanhui").hide();
     */

    $(".tuijian").click(function () {
        tuiJianList();

        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left':'0'},500);
        $('.tuiJianShow').show();
        $('.tuijian-list').hide();
        $(".invest-list").hide();
        $(".investList").hide();
        $(".fanhui").hide();
    });

    $(".show-tuijian-list").bind("click", function () {
        if($(this).hasClass('active')){
            return;
        }
        $(this).addClass('active').siblings('a').removeClass('active');
        $('.em-line').animate({'left':'120px'},500);
        $('.tuiJianShow').hide();
        $('.tuijian-list').show();
        $(".invest-list").hide();
        $(".investList").hide();
        $(".fanhui").hide();

        $('#startDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
        $('#endDate').datepicker({format:'yyyy-mm-dd'}).on('changeDate',function(){});
        if($('.listData li').size() == 0){
            //初始化数据查询
            tuiJianList();
        };
        //搜索
        $('#cashSearch').unbind('click').click(function(){
            var startDate = $('#startDate').val();
            var endDate = $('#endDate').val();
            if(startDate == ''){
                alert('开始时间不能为空');
                return;
            }
            if(endDate == ''){
                alert('结束时间不能为空');
                return;
            }
            if(startDate>endDate){
                alert('开始时间不能大于结束时间');
                return;
            }
            tuiJianList();
        });
    });
}
var isEmployeeReferral=-1;
function tuiJianList(){
    var begin = $("#startDate").val();
    var end = $("#endDate").val();
    //数据初始化
    var payData = [
        {
            key:'tname',resolve:function(val, record){
            return val;
        }
        }, {
            key:'date',resolve:function(val, record){
                return formatDate(val);
            }
        }, {
            key:'rname',resolve:function(val, record){
                return val;
            }
        }, /*{
            key:'',resolve:function(val, record){
                if (isEmployeeReferral != 2){
                    return "- -";
                }
                var a = $("<a href='javascript:;'>查看</a>");
                a.click(function() {
                    // 查看推荐的好友投资详细信息
                    $(".tuijian-list").hide();
                    $(".investList").show();
                    $(".invest-listData").show();
                    $(".fanhui").css({"float":"right","dispaly":"block","color":"#87CEFA"});
                    $(".fanhui").show();
                    investRecordInit(record.username, record.userId);
                });
                return a;
            }
        }*/
    ];
    var param={'startTime':begin,'endTime':end};
    oPage = null;
    oPage = new Page('/recommend/pager_criteria',param,$('.tuijian-list .listData'),$('.tuijian-list .paging'),payData,function(data){
    });
}

//消息列表初始化
function initMsgData(){
    //数据初始化
    var payData = [
        {
            key:'',resolve:function(val, record){
            var check;
            if (record.state == 1){
                check = $('<input class="check" type="checkbox" value="'+ record.lid +'" name="sysMail" />');
            } else {
                check = $('<input type="checkbox" value="'+ record.lid +'" name="sysMail" />');
            }
            return check;
        }
        },
        {
            key:'',resolve:function(val){
            return '系统消息';
        }
        },
        {
            key:'title',resolve:function(val,record,index){
            var data;
            if (record.state == 1){
                data = $("<a href='javascript:;' style='color: #c0c0c0;'>" + val + "</a>");
            } else {
                data = $("<a href='javascript:;' style='color: #333;'>" + val + "</a>");
            }
            data.click(function(){
                initMsgxq(record.lid);
            })
            return data;
        }
        },
        {
            key:'date',resolve:function(val){
            return formatDate(val);
        }
        }
    ];
    var app = "app";
    var param={app:app};
    oPage = null;
    oPage = new Page('/letter/select',param,$('.msg-list.listData'),$('.paging'),payData,function(){});

}

// 消息详情
function initMsgxq(lid) {
    $.ajax({
        url: '/letter/pageparti',
        type: "get",
        dataType: "html",
        contentType:contentType,
        success: function (data) {
            $('.account-right').empty();
            $('.account-right').html(data);
            $(".msgPerson").hide();
            initMsgxq2(lid);
        }
    });
}
function initMsgxq2(id) {
    $.ajax({
        url: "/letter/partid?lid="+id,
        type: "get",
        dataType: "json",
        success: function (data) {
            $(".msgPerson").show();
            $(".msgTitle").html(data.title);
            $(".msgContent").html(data.content);
            $(".msgTime").html(data.date);
        }
    });
}
// 选中已读
function checkAll_Sys(e){
    if(e.checked){
        $("input[name='sysMail']").attr("checked","checked");
    }else{
        $("input[name='sysMail']").attr("checked",false);
    }
}
// 删除选中已读
function deleteMsg (obj) {
    $("#deleteMsg").attr("disabled",true);
    var stIdArray = [];
    $("input[name='sysMail']:checked").each(function(){
        stIdArray.push($(this).val());
    });
    if(stIdArray.length == 0){
        alert("请选择需要删除的内容");
        $("#deleteMsg").attr("disabled",false);
        return ;
    }
    if(!window.confirm("确定要删除吗?")){
        $("#deleteMsg").attr("disabled",false);
        return;
    }
    var ids = stIdArray.join(",");
    $.ajax({
        url: "/letter/delete",
        type: "get",
        data: {ids:ids},
        dataType: "json",
        success: function (data) {
            if(data.result == 'ok') {
                alert(data.message);
                initMsgData();
            } else {
               alert(data.message);
            }
            $("#deleteMsg").attr("disabled",false);
        }
    });
}

function readedSys(){
    $("#readedSys").attr("disabled",true);
    var stIdArray = [];
    $("input[name='sysMail']:checked").each(function(){
        stIdArray.push($(this).val());
    });
    if(stIdArray.length == 0){
        alert("请选择要标记的内容");
        $("#readedSys").attr("disabled",false);
        return ;
    }
    if(!window.confirm("确定要将所选邮件标记为已读吗?")){
        $("#readedSys").attr("disabled",false);
        return;
    }
    var ids = stIdArray.join(",");
    $.ajax({
        url: "/letter/update",
        type: "get",
        data: {ids:ids,state:1},
        dataType: "json",
        success: function (data) {
            if(data.result == 'ok') {
                alert(data.message);
                initMsgData();
            }
            $("#readedSys").attr("disabled",false);
        }
    });
}

function unReadSys(){
    $("#unReadSys").attr("disabled",true);
    var stIdArray = [];
    $("input[name='sysMail']:checked").each(function(){
        stIdArray.push($(this).val());
    });
    if(stIdArray.length == 0){
        alert("请选择要标记的内容");
        $("#unReadSys").attr("disabled",false);
        return ;
    }
    if(!window.confirm("确定要将所选邮件标记为未读吗?")){
        $("#unReadSys").attr("disabled",false);
        return;
    }
    var ids = stIdArray.join(",");

    $.ajax({
        url: "/letter/update",
        type: "get",
        data: {ids:ids,state:0},
        dataType: "json",
        success: function (data) {
            if(data.result == 'ok') {
                alert(data.message);
                initMsgData();
            }
            $("#unReadSys").attr("disabled",false);
        }
    });
}

//复制初始化
function clipboard(text,button,msg,parent) {
    if(window.clipboardData){        //for ie
        var copyBtn = document.getElementById(button);
        copyBtn.onclick = function(){
            window.clipboardData.setData('text',text);
            alert(msg);
        }
    }else{
        initclip(text);
    }
    return false;
}
//获取复制文本
function initclip(text) {
    var clip = new ZeroClipboard.Client();
    clip.setHandCursor(true);
    clip.addEventListener('mouseOver', function(){
        clip.setText( text );
    },false);
    clip.addEventListener('complete', function(){
        alert('复制成功！');
    });
    clip.glue( 'tj-clip-btn' );
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
//格式化银行卡
function encodeBank(bank){
    var bank = bank+'';
    return bank.substring(0,4)+' ******** '+bank.substring(bank.length-4,bank.length);
}

