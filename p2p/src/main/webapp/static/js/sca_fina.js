
$(function () {

   

    //计算
    $("#btnCalculate").click(function () {
        //calculate();
    });
});

Number.prototype.toFixed2 = function () {
    return parseFloat(this.toString().replace(/(\.\d{2})\d+$/, "$1"));
}

//计算
function calculate() {
    
    var amount = $("#money"); //获取投资金额	
    var apr = $("#toolrate"); //获取年利率
    var mons = $("#moneydata"); //获取投资期限

    var type = initTypeCode(); //获取投资期限类型  1日，2月

    // getValue  还款方式
    
    var principal = parseFloat(amount.val()); //返回一个金额浮点数
    var interest = accDiv(parseFloat(apr.val()) / 100, 12); //parseFloat(apr.val()) / 100 / 12; //每月利率
    var payments = parseInt(mons.val()); //投资期限

    var c1, c2, c3;
    
    var str = "<tr><th>期数</th><th>回款本息</th><th>回款本金</th><th>利息</th><th>待收本息</th></tr>";

    if (getValue == "先息后本") {
        
        var mon = 0;
        for (var j = 1; j < parseInt(payments) + 1; j++) {
            if (j == parseInt(payments)) {
                mon = principal;
            }

            str += "<tr>";
            str += "<td>" + (j) + "</td>"//期数
            str += "<td>" + "￥" + (principal * interest + mon).toFixed2() + "</td>"; //每期还款本息
            str += "<td>" + "￥" + (mon).toFixed2() + "</td>"; //每期还款本金
            str += "<td>" + "￥" + (principal * interest).toFixed2() + "</td>"; //利息
            str += "<td>" + "￥" + (principal + principal * interest * payments - principal * interest * parseInt(j) - mon).toFixed2() + "</td>"; //余额
            str += "</tr>";
        }
        $(".mt25").html(str);

        if (parseInt(payments) == 1) {
            $("#c1").html((principal * interest * payments).toFixed2());
            $("#c2").html(((principal * interest * payments) + principal).toFixed2());   //本息合计
            $("#c3").html(((principal * interest * payments) + principal).toFixed2());

            c1 = (principal * interest * payments).toFixed2();
            c2 = ((principal * interest * payments) + principal).toFixed2();
            c3 = ((principal * interest * payments) + principal).toFixed2();
        } else {
            $("#c1").html((principal * interest * payments).toFixed2());
            $("#c2").html(((principal * interest * payments) + principal).toFixed2());   //本息合计
            $("#c3").html((principal * interest).toFixed2());

            c1 = (principal * interest * payments).toFixed2();
            c2 = ((principal * interest * payments) + principal).toFixed2();
            c3 = (principal * interest).toFixed2();
        }
        

    } else if (getValue == "一次性还本付息") {

        if (type == 1) {  //天数

            str += "<tr>";
            str += "<td>" + 1 + "</td>"//期数	
            str += "<td>" + "￥" + (parseFloat((principal * parseFloat(apr.val()) * 0.01 * payments / 365)) + principal).toFixed2() + "</td>"; //	每期还款本息
            str += "<td>" + "	￥" + (principal).toFixed2() + "</td>"; //每期还款本金
            str += "<td>" + "￥" + (principal * parseFloat(apr.val()) * 0.01 * payments / 365).toFixed2() + "</td>"; //利息
            str += "<td>" + "￥0.00</td>"; //余额
            str += "</tr>";

            $(".mt25").html(str);

            $("#c1").html((principal * parseFloat(apr.val()) * 0.01 * payments / 365).toFixed2());
            $("#c2").html((parseFloat((principal * parseFloat(apr.val()) * 0.01 * payments / 365)) + parseFloat(principal)).toFixed2());   //本息合计
            $("#c3").html("--");

            c1 = (principal * parseFloat(apr.val()) * 0.01 * payments / 365).toFixed2();
            c2 = (parseFloat((principal * parseFloat(apr.val()) * 0.01 * payments / 365)) + parseFloat(principal)).toFixed2();
            c3 = 0.00;

        } else if (type == 2) {

            str += "<tr>";
            str += "<td>" + 1 + "</td>"//期数	
            str += "<td>" + "￥" + ((principal * interest * payments) + principal).toFixed2() + "</td>"; //	每期还款本息
            str += "<td>" + "	￥" + (principal).toFixed2() + "</td>"; //每期还款本金
            str += "<td>" + "￥" + (principal * interest * payments).toFixed2() + "</td>"; //利息
            str += "<td>" + "￥0.00</td>"; //余额
            str += "</tr>";

            $(".mt25").html(str);

            $("#c1").html((principal * interest * payments).toFixed2());
            $("#c2").html(((principal * interest * payments) + principal).toFixed2());   //本息合计
            $("#c3").html("--");

            c1 = (principal * interest * payments).toFixed2();
            c2 = ((principal * interest * payments) + principal).toFixed2();
            c3 = 0.00;
        }

    } else if (getValue == "等额本息") {
        
        var monthRate = interest;
        var tempAmount = 0.00, tempInterestAmount = 0.00, tempAmountAndInterest = 0.00, totalInterest = 0.00, totalAmount = 0.00; interestAmount = 0.00;
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

            str += "<tr>";
            str += "<td>" + (index) + "</td>"//期数
            str += "<td>" + "￥" + (Number(tempAmountAndInterest)).toFixed2() + "</td>"; //	每期还款本息
            str += "<td>" + "￥" + (Number(tempAmount)).toFixed2() + "</td>"; //每期还款本金
            str += "<td>" + "￥" + (Number(tempInterestAmount)).toFixed2() + "</td>"; //利息

            if (index == payments) {
                str += "<td>" + "￥0.00</td>"; //余额
            } else {
                str += "<td>" + "￥" + (interestAmount + principal - Number(tempAmountAndInterest * index)).toFixed2() + "</td>"; //余额
            }
            str += "</tr>";

            index++;
        }
        interestAmount = ((Number(totalInterest) * 100) / 100); //总利息

        $(".mt25").html(str);

        $("#c1").html(interestAmount);
        $("#c2").html((Number(interestAmount) + principal).toFixed2());   //本息合计
        $("#c3").html((Number(tempAmountAndInterest)).toFixed2());

        c1 = interestAmount.toFixed2();
        c2 = (Number(interestAmount) + principal).toFixed2();
        c3 = Number(tempAmountAndInterest).toFixed2();
    }

    if (getValue == "一次性还本付息") {
        var c11 = new CountUp("c1", 0, c1, 2, 1, options);
        var c22 = new CountUp("c2", 0, c2, 2, 1, options);
        c11.start();
        c22.start();

    } else {
        count(c1, c2, c3);
    }
    showLine();
}

function count(cc1,cc2,cc3) {
    var c1 = new CountUp("c1", 0, cc1, 2, 1, options);
    var c2 = new CountUp("c2", 0, cc2, 2, 1, options);
    var c3 = new CountUp("c3", 0, cc3, 2, 1, options);
    c1.start();
    c2.start();
    c3.start();
}

//解决js计算bug
function accDiv(arg1, arg2) {
    var t1 = 0, t2 = 0, r1, r2;
    try { t1 = arg1.toString().split(".")[1].length } catch (e) { }
    try { t2 = arg2.toString().split(".")[1].length } catch (e) { }
    with (Math) {
        r1 = Number(arg1.toString().replace(".", ""))
        r2 = Number(arg2.toString().replace(".", ""))
        return (r1 / r2) * pow(10, t2 - t1);
    }
}


function GetInterest(amount, deadline, interestRate) {
    var interestAmount = 0.00;
    if (amount == "" || amount == "0" || deadline == "" || deadline == "0" || interestRate == "" || interestRate == "0")
        return interestAmount;

    var monthRate = interestRate * 0.010000000000 / 12.00;
    var tempAmount = 0.00, tempInterestAmount = 0.00, tempAmountAndInterest = 0.00, totalInterest = 0.00, totalAmount = 0.00;
    var index = 1;
    while (index <= deadline) {
        tempAmount = Number(amount * monthRate * Math.pow(1 + monthRate, index - 1) / (Math.pow(1 + monthRate, deadline) - 1));
        tempAmountAndInterest = Number(amount * monthRate * Math.pow(1 + monthRate, deadline) / (Math.pow(1 + monthRate, deadline) - 1));
        tempInterestAmount = Number(tempAmountAndInterest - tempAmount);
        if (index == deadline) {
            tempAmount = (Number(amount) - Number(totalAmount));
            tempInterestAmount = Number(tempAmountAndInterest - tempAmount);
        }
        totalInterest += Number(tempInterestAmount);
        totalAmount += Number(tempAmount);
        index++;
    }
    interestAmount = Number(((Number(totalInterest) * 100) / 100));

    return interestAmount;
}

function showLine() {
    $(".payment").find('tr:even').css({
        'background': "#f7f7f7"
    })
}