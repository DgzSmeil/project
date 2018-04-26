/**
 * Created by pc on 2016/9/26.
 */

var find_pwd_type='';
function checkReisterType(name){
    var regValue = $("#"+name).val();
    if(!regValue){
        showMess(name,"<span class='font-grgy'>请您输入邮箱，或者11位手机号。</span>"); return false;
    }
    if(regValue.indexOf("@") != -1){
        checkFindPwdType('email');
        checkEmail(name,regValue);
        showCode();
    }else if(/(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/.test(regValue)){
        checkFindPwdType('mobile');
        checkMob(name,regValue);
        showCode();
        return false;
    }else{
        showMess(name,"请您输有效的邮箱，或者手机号。"); return false;
    }
}

function checkMob(name,regValue){
    $(".loading").hide();
    var patten = /(^0{0,1}1[3|4|5|6|7|8|9][0-9]{9}$)/;
    if(!patten.test(regValue)){
        showMess(name,"请输入正确的手机号"); return false;
    }
    $.post("/forgot-password/check-user-mobile",{'mobile':regValue},function (sta){
        var classN = "";
        var flag =0;
        var msg="";
        if(sta == 'ok'){
            classN = 'font_green12';
            flag =1;
            msg = "输入正确";

        }else{
            msg = "手机号不存在";
        }
        showMess(name,'<span class='+classN+'>'+msg+'</span>');
        $("#regType").val("mobile");
        $("#re_"+name).val(flag);
    })
}

function checkEmail(name,regValue){
    $(".loading").hide();
    var emailformat = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
    if(regValue.indexOf("@") == -1)
    {
        showMess(name,"请输入邮箱"); return false;
    }else if(!emailformat.test(regValue))
    {
        showMess(name,"请输入正确的邮箱格式"); return false;
    }
    var msg = '';
    $.post('/forgot-password/check-user-email',{'email':regValue},function (data){
        if(data == 'ok'){
            msg = "<span class='font_green12' >输入正确</span>";
            $("#re_"+name).val(1);
        }else{
            msg = data;
            $("#re_"+name).val(0);
        }

        showMess(name,msg);
        $("#regType").val("email");
    })
}

function showCode(type){
    $(".regr").show();
    $(".ydxy").show();
    $("#sms_verify_code_wrapper").show();
    $("#sms_verify_code").show();
}

//验证验证码
function checkVerify(obj){
    var codevalue = $("#"+obj).val();
    var classN = "";
    var falg = false;
    if(codevalue==""){
        showMess(obj,"请输入验证码!");
        return false;
    }
}

function checkFindPwdType(type){
    if(type == 'mobile'){
        find_pwd_type = 'mobile';
        $("[name='verify_code']").attr('placeholder','短信验证码');
    }else if(type == 'email'){
        find_pwd_type = 'email';
        $("[name='verify_code']").attr('placeholder','邮箱验证码');
    }
    $(".loading").show();
    $(".noncode").show();
}

function sendCode(obj,name){
    var _val = obj.value;
    if(_val !=='获取验证码'){
        return true;
    }
    
}
var readyInterval;
function set_time_code(obj){
    var num = 60;
    readyInterval = setInterval(function(){
        if(num >=0){
            obj.value ="重新发送" + num + "s";
            num--;
        }else{
            clearInterval(readyInterval);
            obj.value = '重新获取验证码';
        }
    },1000);
}

function sendEmailCode(obj,name){
    var _val = obj.value;
    if(_val ==='获取验证码'){
        var url = "/forgot-password/send-email-code";
        var email   = $("#"+name).val();
        var captcha  = $("#codev").val();
        if(email !== ''){
            $.post(url,{'email':email,'captcha':captcha},function(data){
                if(data.status != '0'){
                    showMess("verify_code",data.msg);
                }else{
                    showMess("verify_code","<span class='font-grgy'>验证码已发送至您的邮箱，<a style='color:#1b66c7;' target='_blank' href='"+emailJump(email)+"' >去查收</a></span>");
                   // hideMess("verify_code","");
                    set_time_code(obj);
                }
            },'json');
        }
    }else{
        return false;
    }
}
function emailJump(email){
    if(!email){
        return false;
    }
    var email_suffix = email.split("@")[1];
    if(email_suffix){
        return "http://mail."+email_suffix;
    }
}

function sendMobileCode(obj,name){
    var _val = obj.value;
    if(_val ==='获取验证码'){
        var url = "/forgot-password/send-mobile-code";
        var mobile   = $("#"+name).val();
        var captcha  = $("#codev").val();
        if(mobile !== ''){
            $.post(url,{'mobile':mobile,'captcha':captcha},function(data){
                if(data.status != '0'){
                    showMess("verify_code",data.msg);
                }else{
                    hideMess("verify_code","");
                    set_time_code(obj);
                }
            },'json');
        }
    }else{
        return false;
    }
}

//密码强度
//判断输入密码的类型
function CharMode(iN) {

    if (iN >= 48 && iN <= 57) //数字
        return 1;
    if (iN >= 65 && iN <= 90) //大写
        return 2;
    if (iN >= 97 && iN <= 122) //小写
        return 4;
    else return 8;
} //bitTotal函数
//计算密码模式
function bitTotal(num) {
    modes = 0;
    for (i = 0; i < 4; i++) {
        if (num & 1) modes++;
        num >>>= 1;
    }
    return modes;
} //返回强度级别
function checkStrong(sPW) {
    if (sPW.length <= 4) return 0; //密码太短
    Modes = 0;
    for (i = 0; i < sPW.length; i++) { //密码模式
        Modes |= CharMode(sPW.charCodeAt(i));
    }

    return bitTotal(Modes);
} //显示颜色
function pwStrength(pwd) {
    pwdcheck("password");
    var pwdvalue=document.getElementById("userpwd").value;
    if (pwdvalue.indexOf(" ") != -1) {
        poiely(1,'password');
    }else if(/.*[\u4e00-\u9fa5]+.*$/.test(pwdvalue)){
        poiely(2,'password');
    }else{
        if (pwd == null || pwd == '' || pwd.length < 6 || pwd.length >20) {
            document.getElementById("strength_L").style.display = "none";
            document.getElementById("strength_M").style.display = "none";
            document.getElementById("strength_H").style.display = "none";
        } else {
            hideMess("password");
            document.getElementById("strength_L").style.display = "none";
            document.getElementById("strength_M").style.display = "none";
            document.getElementById("strength_H").style.display = "none";
            S_level = checkStrong(pwd);

            switch (S_level) {
                case 0:
                    document.getElementById("strength_L").style.display = "block";
                    break;
                case 1:
                    document.getElementById("strength_L").style.display = "block";
                    break;
                case 2:
                    document.getElementById("strength_M").style.display = "block";
                    break;
                case 3:
                    document.getElementById("strength_H").style.display = "block";
                    break;
                default:;
            }
        }
        return;
    }
}

function poiely(kid,obj){
    document.getElementById("strength_L").style.display = "none";
    document.getElementById("strength_M").style.display = "none";
    document.getElementById("strength_H").style.display = "none";
    if(kid=='1'){
        showMess(obj,"不支持空格，请输入6-20个字符，包含数字、大小写字母和符号（空格除外）");
    }else if(kid=='2'){
        showMess(obj,"不支持汉字，请输入6-20个字符，包含数字、大小写字母和符号（空格除外）");
    }
    return false;
}

//验证password
function pwdcheck(obj){
    var mess="";
    var pwdvalue=document.getElementById("userpwd").value;
    $("#re_"+obj).val(0);
    if (pwdvalue.indexOf(" ") != -1) {
        showMess(obj,"不支持空格，请输入6-20个字符，包含数字、大小写字母和符号（空格除外）");
        return false;
    }
    if(/.*[\u4e00-\u9fa5]+.*$/.test(pwdvalue)) {
        showMess(obj,"不支持汉字，请输入6-20个字符，包含数字、大小写字母和符号（空格除外）");
        return false;
    }
    if(pwdvalue==""){
        showMess(obj,"请输入密码。");
        return false;
    }else if(pwdvalue.length<6){
        showMess(obj,"密码长度不能小于6个字符。");
        return false;
    }else if(pwdvalue.length>20){
        showMess(obj,"密码长度不能大于20个字符。");
        return false;
    }else{
        mess = "<span class='font_green12'>输入正确</span>";
        showMess(obj,mess);
        $("#re_"+obj).val(1);
    }
}

function check_submit(){
    //账号验证
    checkReisterType("registerName");
    if($("#re_registerName").val() !=1){
        return false;
    }
    //图片验证码
    checkVerify("codev");
    if($("#re_codev").val() != 1){
        return false;
    }
    //手机，邮箱验证码
    checkCode("verify_code",'registerName');
    if($("#re_verify_code").val() != 1){
        return false;
    }
    //密码验证
    pwdcheck('password');
    if($("#re_password").val() !=1){
        return false;
    }
    var account         = $("[name='registerName']").val();
    var password        = $("[name='password']").val();
    var img_verify_code = $("[name='codev']").val();
    var verify_code     = $("[name='verify_code']").val();
    var mess = "";

    $.ajax({
        async: false,
        type: "post",
        url: "/forgot-password/update-password",
        data: {'account':account,'password':password,'img_verify_code':img_verify_code,'verify_code':verify_code,'find_pwd_type':find_pwd_type},
        dataType: "json",
        success: function(data){
            if(data.error){
                mess = data.message;
                showMess("commit",mess);
                return false;
            }else{
                window.location.href = "/forgot-password/success";
            }
        }
    });
}

function showMess(name,mess){
    $("."+name).show();
    $("."+name).html(mess);
}

function hideMess(name){
    $("."+name).hide();
    $("."+name).html("");
}

