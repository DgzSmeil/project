var path = "http://"+window.location.host+"/static/upload/picimg/";

function saveNews(formId,winId,listId,url) {
    var param = document.getElementById(formId);
    var formData = new FormData(param);
    alert(url);
    $.ajax({
        url : contextPath + url,
        type : "post",
        data :formData,
        processData : false,
        contentType : false,
        success : function(data) {
            if (data.result === 'ok') {
                closeWin(winId);
                showInfoAlert(data.message);
                $("#" + listId).datagrid("reload");
            } else {
                showInfoAlert("添加失败！");
            }
        },
        error : function(e) {
            showInfoAlert("出错了、请稍后重试！！");
        }
    });
}

function savehome(formId,winId,listId,url) {
    var param = document.getElementById(formId);
    var formData = new FormData(param);
    $.ajax({
        url : contextPath + url,
        type : "post",
        data :formData,
        processData : false,
        contentType : false,
        success : function(data) {
            alert(data.result);
            if (data.result === 'ok') {
                closeWin(winId);
                showInfoAlert(data.message);
                $("#" + listId).datagrid("reload");
            } else {
                showInfoAlert("添加失败！");
            }
        },
        error : function(e) {
            showInfoAlert("出错了、请稍后重试！！");
        }
    });
};

function openEditWin(winId, listId, formId) {
    var row = $("#" + listId).datagrid("getSelected");
    if (row) {
        $("#" + formId).form("load", row);
        var ue = UE.getEditor('editor');
        ue.addListener("ready", function () {
            ue.setContent(row.content);
        });
        $('#imgheads').attr("src",+path+row.pic);
        alert(row.id+"; "+row.pic);
        openWin(winId);
    } else {
        showInfoAlert("请选择需要修改的数据");
    }
}

function openEditHomeWin(winId, listId, formId) {
    var row = $("#" + listId).datagrid("getSelected");
    alert(row.hid);
    if (row) {
        $("#" + formId).form("load", row);
        $('#imgs1').attr("src",+path+row.pic1);
        $('#imgs2').attr("src",+path+row.pic2);
        $('#imgs3').attr("src",+path+row.pic3);
        $('#imgs4').attr("src",+path+row.ewm);
        openWin(winId);
    } else {
        showInfoAlert("请选择需要修改的数据");
    }
}

//内容裁剪
function streplace(value,row,index) {
    var str = row.content;
    var oStr = str.replace(/<[^>]+>|\n+\s&nbsp;/g, "");
    if (oStr.length > 60) {
        return oStr.substring(0, 60) + '...';
    } else {
        return oStr;
    }
}
//查看信息

//图片展示
function picImg(value, row, index){
    return "<img  style='width: 80px; height: 70px;' src='"+path+row.pic+"'>";
};
function pic1Img(value, row, index){
    return "<img  style='width: 150px; height: 70px;' src='"+path+row.pic1+"'>";
};
function pic2Img(value, row, index){
    return "<img  style='width: 150px; height: 70px;' src='"+path+row.pic2+"'>";
};
function pic3Img(value, row, index){
    return "<img  style='width: 150px; height: 70px;' src='"+path+row.pic3+"'>";
};
function ewmimg(value, row, index){
    return "<img  style='width: 150px; height: 70px;' src='"+path+row.ewm+"'>";
};
//操作
function dynamicMack(){

    var str = '<button class="button button1" onclick="return openEditWinpreimage('+"'editWin'"+','+"'list'"+','+"'editForm'"+');">修改</button>';
    str += '<button class="button button3" onclick="return deleteWinpreimage('+"'/friend/delete'"+','+"'list'"+');">删除</button>';
    return str;
}