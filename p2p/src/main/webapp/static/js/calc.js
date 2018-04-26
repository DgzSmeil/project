var getValue = "先息后本";

var options = {
    useEasing: true,
    useGrouping: true,
    separator: ',',
    decimal: '.',
    prefix: '',
    suffix: ''
};

(function() { //计数

    $('.count-star').click(function() {

        var cou = 0;
        inputLength = $('.text-tip').length;
        for (i = 0; i < inputLength; i++) {
            val = Number($('.text-tip').eq(i).val());
            if (isNaN(val) || val == 0) {

                $('.text-tip').eq(i).parent().find('.err-tip').show();
                $('.text-tip').eq(i).css({
                    'color': 'red'
                }).addClass('reb-border');
                cou++;
            } else {

                if (i == 2) {

                    var type = initTypeCode();
                    var mons = $("#moneydata"); //获取投资期限
                    var payments = parseInt(mons.val()); //投资期限

                    if (type == 1) {



                    } else if (type == 2) {


                    }

                } else if (i == 1) {

                    var apr = $("#toolrate").val(); //获取年利率

                    if (apr < 0.1 || apr > 100) {
                        $("#err-rate").html("年利率区间为5%-100%");

                        $('.text-tip').eq(i).parent().find('.err-tip').show();
                        $('.text-tip').eq(i).css({
                            'color': 'red'
                        }).addClass('reb-border');
                        cou++;
                    }

                } else if (i == 0) {

                    var amount = $("#money").val(); //获取投资金额

                    if (amount < 100) {
                        $("#err-money").html("最低投资金额为100");

                        $('.text-tip').eq(i).parent().find('.err-tip').show();
                        $('.text-tip').eq(i).css({
                            'color': 'red'
                        }).addClass('reb-border');
                        cou++;
                    }
                }
            }
        }

        if (cou == 0) {
            $('.res').show();
            calculate();
        }

    })
})();

function initTypeCode() {
    var code;
    $("#dvPopSort li").each(function() {
        if ($(this).hasClass("on")) {
            code = $(this).attr("attrval");
        }
    });
    return code;
}

(function() { //日月切换
    $('.sort-condition ul .v2').hide();
    $('.sort-condition ul').hover(function() {
        $(this).find('li').show();

    }, function() {
        $('.sort-condition ul li').hide();
        $(this).find('.on').show();
    });

    $('.sort-condition ul li, .tool-arrow').click(function() {
        $('.sort-condition ul li').removeClass('on').hide();
        $(this).show().addClass('on');

        if ($(this).html() == "月") {

            $('#gar').show();
            $('#garday').hide();
            getValue = "先息后本";

        } else {

            $('#gar').hide();
            $('#garday').show();
            getValue = "一次性还本付息";
        }

    });
})();

(function() { //还款方式下拉
    $('.re-payment-type-1, .tool-arrow-1').click(function(event) {
        $('.re-payment-type-1').css({
            'display': 'none'
        });
        $('.re-payment-type').css({
            'display': 'inline-block',
            '*display': 'inline'
        });
        $('.re-payment-type dd').slideDown(200);
        event.stopPropagation();
    });
    $('.re-payment-type dt, .re-payment-type dd').click(function() {
        getValue = $(this).attr('value');
        setValue = $('.re-payment-type dt').attr('value');
        $('.re-payment-type-1').attr({
            'get-value': getValue
        }).text(getValue);
        $('.re-payment-type dt').attr({
            'value': getValue
        }).text(getValue);
        $(this).attr({
            'value': setValue
        }).text(setValue);
        $('.re-payment-type dd').slideUp();
        $('.re-payment-type').hide();
        $('.re-payment-type-1').css({
            'display': 'inline-block',
            '*display': 'inline'
        });
    });
    $(document).click(function(event) {
        $('.re-payment-type').hide();
        $('.re-payment-type-1').show();
    })
})();

(function() { // 表单错误提示
    $('.text-tip').focus(function() {

        tipVal = $(this).attr('value');
        tipVal = Number(tipVal);
        $(this).css({
            'color': '#333'
        });
        if (isNaN(tipVal)) {
            $(this).attr({
                'value': ''
            });
        }
        return tipVal;
    })


    $('.text-tip').blur(function() {
        $(this).css({
            'color': '#999'
        });
        val = Number($(this).val());
        if (isNaN(val) == true) {
            $(this).css({
                'color': 'red'
            }).addClass('reb-border');
            $(this).parent().find('.err-tip').show();
        } else {
            $(this).removeClass('reb-border').css({
                'color': '#333'
            });
            $(this).parent().find('.err-tip').hide();
        }
    });

    /*JQuery 限制文本框只能输入数字*/
    $("#money,#moneydata").keyup(function() {
        $(this).val($(this).val().replace(/\D|^0/g, ''));
    }).bind("paste", function() { //CTR+V事件处理
        $(this).val($(this).val().replace(/\D|^0/g, ''));
    }).css("ime-mode", "disabled"); //CSS设置输入法不可用

    /*JQuery 限制文本框只能输入数字和小数点*/
    $("#toolrate").keyup(function() {
        $(this).val($(this).val().replace(/[^0-9.]/g, ''));
    }).bind("paste", function() { //CTR+V事件处理
        $(this).val($(this).val().replace(/[^0-9.]/g, ''));
    }).css("ime-mode", "disabled"); //CSS设置输入法不可用



})();