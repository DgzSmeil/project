var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;

function F_Open_dialog(){
    document.getElementById("fpic").click();
}
function F_Open_dialog1(){
    document.getElementById("ypic").click();
}
function F_Open_dialog2(){
    document.getElementById("qpic").click();
}
function F_Open_dialog3(){
    document.getElementById("tpic").click();
}
var i=true;
function addElementImg(obj) {
    if(i){

        i=false;
        var input = document.getElementById("fpic");
        var $img = $('#newImg');
        input.addEventListener('change',readFile,false);
        function readFile(){
            var file=this.files[0];
            var $file = $(this);
            var fileObj = $file[0];
            var windowURL = window.URL || window.webkitURL;
            var dataURL;
            dataURL = windowURL.createObjectURL(fileObj.files[0]);
            $img.attr('src',dataURL);
        }
    }
}
var j=true;
function addElementImg1(obj) {
    if(j){

        j=false;
        var input = document.getElementById("ypic");
        var $img = $('#newImg1');
        input.addEventListener('change',readFile,false);
        function readFile(){
            var file=this.files[0];
            var $file = $(this);
            var fileObj = $file[0];
            var windowURL = window.URL || window.webkitURL;
            var dataURL;
            dataURL = windowURL.createObjectURL(fileObj.files[0]);
            $img.attr('src',dataURL);
        }
    }
}
var k=true;
function addElementImg2(obj) {
    if(k){

        k=false;
        var input = document.getElementById("qpic");
        var $img = $('#newImg2');
        input.addEventListener('change',readFile,false);
        function readFile(){
            var file=this.files[0];
            var $file = $(this);
            var fileObj = $file[0];
            var windowURL = window.URL || window.webkitURL;
            var dataURL;
            dataURL = windowURL.createObjectURL(fileObj.files[0]);
            $img.attr('src',dataURL);
        }
    }
}
var l=true;
function addElementImg3(obj) {
    if(l){

        l=false;
        var input = document.getElementById("tpic");
        var $img = $('#newImg3');
        input.addEventListener('change',readFile,false);
        function readFile(){
            var file=this.files[0];
            var $file = $(this);
            var fileObj = $file[0];
            var windowURL = window.URL || window.webkitURL;
            var dataURL;
            dataURL = windowURL.createObjectURL(fileObj.files[0]);
            $img.attr('src',dataURL);
        }
    }
}
function update(url, formId) {
    var money = $("#money").val();
    var bzid = $("#bzid").val();
    var lxid = $("#lxid").val();
    var sid = $("#sid").val();
    var term = $("#term").val();
    var fpic = $("#fpic").val();
    var ypic = $("#ypic").val();
    var qpic = $("#qpic").val();
    var tpic = $("#tpic").val();
    var mpurpose = $("#mpurpose").val();
    var hksource = $("#hksource").val();
    var nprofit = $("#nprofit").val();
    var suggest = $("#suggest").val();
    var xmdescrip = $("#xmdescrip").val();
    var guarantee = $("#guarantee").val();
    if (money == ''){
        alert("请输入申请金额");
        $('#money').focus();
        return;
    }else if(isNaN(money)){
        alert('金额格式不正确');
        $('#money').focus();
        return;
    }else if(money < 10000){
        alert("申请金额必须在10000元以上");
        $('#money').focus();
        return;
    }else if(bzid == ''){
        alert("请选择借款标种");
        $('#bzid').focus();
        return;
    }else if(lxid == ''){
        alert("请选择借款类型");
        $('#lxid').focus();
        return;
    }else if(sid == ''){
        alert("请选择收益方式");
        $('#sid').focus();
        return;
    }else if(term == ''){
        alert("请输入借款期限");
        $('#term').focus();
        return;
    }else if(term < 1 || term >24){
        alert("期限必须在1到24个月之内");
        $('#term').focus();
        return;
    }else if(mpurpose == ''){
        alert("请输入资金用途");
        $('#mpurpose').focus();
        return;
    }else if(hksource == ''){
        alert("请输入还款来源");
        $('#hksource').focus();
        return;
    }else if(nprofit == ''){
        alert("请输入年化收益");
        $('#nprofit').focus();
        return;
    }else if(nprofit < 1 || nprofit > 50){
        alert("年化收益必须在1%到50%之间");
        $('#nprofit').focus();
        return;
    }else if(isNaN(nprofit)){
        alert('年化收益格式不正确');
        $('#nprofit').focus();
        return;
    }else if(suggest == ''){
        alert("请输入借款人介绍");
        $('#suggest').focus();
        return;
    }else if(xmdescrip == ''){
        alert("请输入项目描述");
        $('#xmdescrip').focus();
        return;
    }else if(guarantee == ''){
        alert("请输入保障措施");
        $('#guarantee').focus();
        return;
    }else{
        $.post(basePath + url,
            $("#" + formId).serialize(),
            function (data) {
                if (data.result === "ok") {
                    $("#baid").val(data.code);
                    alert(data.message);
                    $("#btn_upate").click();
                } else {
                    swal("申请失败！", 请稍后再试, "error");
                }
            },
            'json'
        );
    }

}
