var homeTabTitle = '主页';
var contextPath = "";

var path = "http://"+window.location.host+"/upload/";
var contpath = "http://"+window.location.host+"/static/upload/";
function hashChange(){
    var hash =  window.location.pathname;
    /*$('.sub-nav li').removeClass('active');
     $('a[href="#'+hash+'"]').parent('li').addClass('active');*/
    switch(hash){
        case '/friend/update':
            initrecharge();
            window.location.href='/friend/page';
            break;

    };
}

/**
 * 添加选项卡到中部内容区域
 * @param title 选项卡的标题
 * @param url 选项卡所对应的url
 * @returns
 */
function addTab(title, url) {
    if ($('#tabs').tabs('exists', title)) { // 通过标题来判断选项卡是否存在
        $('#tabs').tabs('select', title); // 如果存在，则直接选中此选项卡
        var currTab = $('#tabs').tabs('getSelected');
        var url1 = $(currTab.panel('options').content).attr('src');
        if(url1 != undefined && currTab.panel('options').title != homeTabTitle) {
            $('#tabs').tabs('update',{ // 刷新选项卡的内容
                tab:currTab,
                options:{
                    content:createFrame(url1)
                }
            })
        }
    } else {
    	// 如果选项卡不存在，则添加一个选项
        $('#tabs').tabs('add', {
            title: title,
            content: createFrame(url), // 创建一个frame用于显示指定url的页面，把此frame窗口添加到选项的内容区域
            border: false,
            closable: true
        });
    }
    tabClose(); // 关闭选项卡
}

/**
 * 根据指定的url创建frame窗口，与选项卡内容区域的宽度及高度一致
 * @param url
 * @returns
 */
function createFrame(url) {
    return '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
}

/**
 * 关闭选项卡
 * @returns
 */
function tabClose() {
    $(".tabs-inner").dblclick(function(){
        var subtitle = $(this).children(".tabs-closable").text();
        $('#tabs').tabs('close', subtitle);
    })
    $(".tabs-inner").bind('contextmenu',function(e){ // 给选项卡绑定右键菜单 
        $('#mm').menu('show', {
            left: e.pageX,
            top: e.pageY
        });

        var subtitle =$(this).children(".tabs-closable").text();

        $('#mm').data("currtab", subtitle);
        $('#tabs').tabs('select', subtitle);
        return false;
    });
}

/**
 * 关闭事件
 * @returns
 */
function tabCloseEvent() {
    $('#mm-tabupdate').click(function(){ // 刷新事件
        var currTab = $('#tabs').tabs('getSelected');
        var url = $(currTab.panel('options').content).attr('src');
        if(url != undefined && currTab.panel('options').title != homeTabTitle) {
            $('#tabs').tabs('update',{
                tab:currTab,
                options:{
                    content:createFrame(url)
                }
            })
        }
    })
    $('#mm-tabclose').click(function(){ // 关闭
        var currtab_title = $('#mm').data("currtab");
        $('#tabs').tabs('close',currtab_title);
    });
    $('#mm-tabcloseall').click(function(){ // 关闭所有
        $('.tabs-inner span').each(function(i,n){
            var t = $(n).text();
            if(t != homeTabTitle) {
                $('#tabs').tabs('close',t);
            }
        });
    });
    $('#mm-tabcloseother').click(function(){ // 关闭其他 
        var prevall = $('.tabs-selected').prevAll();
        var nextall = $('.tabs-selected').nextAll();
        if(prevall.length>0){
            prevall.each(function(i,n){
                var t=$('a:eq(0) span',$(n)).text();
                if(t != homeTabTitle) {
                    $('#tabs').tabs('close',t);
                }
            });
        }
        if(nextall.length>0) {
            nextall.each(function(i,n){
                var t=$('a:eq(0) span',$(n)).text();
                if(t != homeTabTitle) {
                    $('#tabs').tabs('close',t);
                }
            });
        }
        return false;
    });
    $('#mm-tabcloseright').click(function(){
        var nextall = $('.tabs-selected').nextAll();
        if(nextall.length==0){
            alert('后边没有啦~~');
            return false;
        }
        nextall.each(function(i,n){
            var t=$('a:eq(0) span',$(n)).text();
            $('#tabs').tabs('close',t);
        });
        return false;
    });

    $('#mm-tabcloseleft').click(function(){
        var prevall = $('.tabs-selected').prevAll();
        if(prevall.length==0){
            alert('到头了，前边没有啦~~');
            return false;
        }
        prevall.each(function(i,n){
            var t=$('a:eq(0) span',$(n)).text();
            $('#tabs').tabs('close',t);
        });
        return false;
    });

    $("#mm-exit").click(function(){
        $('#mm').menu('hide');
    })
}

/**
 * 给所有选项卡绑定关闭事件
 */
$(function() {
    tabCloseEvent();
    // 给所有具有site-navi-tab的元素添加点击事件，一旦点击，则添加选项到选项卡中
    $('.site-navi-tab').click(function() {
        var $this = $(this);
        var href = $this.attr('src');
        var title = $this.text();
        addTab(title, href); 
    });
});

/**
 * 
 * @param tableId 哪个表格进行分页
 * @param pageSize 默认的pageSize
 * @returns
 */
var defaultPageSize = 10;
function setPagination(tableId, pageSize) {
    var ps = defaultPageSize;
    if (typeof pageSize === 'number') {
        ps = pageSize;
    }
    var p = $("#" + tableId).datagrid('getPager'); // getPager获取表格所对应的分页组件
    $(p).pagination({ // 设置分页组件的属性
        pageSize: ps,
        pageList: [10, 20, 30, 40, 50, 60, 70],
        beforePageText: '第',
        afterPageText: '页    共 {pages} 页', // 引用 pages变量，用于总共有多少页
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录', // 引用total变量，表示 总共多少条记录
        onBeforeRefresh: function () {
            $(this).pagination('loading');
            $(this).pagination('loaded');
        }
    });
}

/**
 * 表格的顶部加入搜索框，搜索框的form表单的值与datagrid的参数一同传递到后台
 * @param dataGridId
 * @param formId
 * @returns
 */
function getQueryParams(dataGridId, formId) {
    var fields =$('#' + formId).serializeArray();
    var params = $("#" + dataGridId).datagrid('options').queryParams; // 获取指定的数据表格的查询参数
    $.each( fields, function(i, field){ // 把表单的查询参数与表格分页的查询组合在一起
        params[field.name] = field.value;
    });
    return params;
}

function getStatus(borrow){
    if(borrow == 1){
        return '待审核';
    }else if(borrow == 2){
        return '审核成功';
    }else if(borrow == 3){
        return '已取消';
    }else if(borrow == 4){
        return '转账中';
    }else if(borrow == 5){
        return '审核失败';
    }
};

function Mack(){

    var str = '<button class="button button1" onclick="return openEditwin('+"'addWin'"+','+"'list'"+',2);">审核通过</button>';
    str += '<button class="button button3" onclick="return openEditwin('+"'addWin'"+','+"'list'"+',5);">拒绝</button>';
    return str;
}


function NoMack(){
    var str = '<button class="button button1" onclick="return openEditWinprefix('+"'editWin'"+','+"'list'"+','+"'editForm'"+');">修改</button>';
    str += '<button class="button button3" onclick="return deleteWinprefix('+"'/notice/delete'"+','+"'list'"+');">删除</button>';
    return str;
}

function NoticeMack(){

    var str = '<button class="button button1" onclick="return openEditWinpreimage('+"'editWin'"+','+"'list'"+','+"'editForm'"+');">修改</button>';
    str += '<button class="button button3" onclick="return deleteWinpreimage('+"'/friend/delete'"+','+"'list'"+');">删除</button>';
    return str;
}

function LetterMack(){

    var str = '<button class="button button1" onclick="return openEditWinpreLetter('+"'editWin'"+','+"'list'"+','+"'editForm'"+');">修改</button>';
    str += '<button class="button button3" onclick="return deleteWinpreLetter('+"'/letter/delete'"+','+"'list'"+');">删除</button>';
    return str;
}

function openEditWinprefix (winId, listId, formId) {
    var row = $("#" + listId).datagrid("getSelected");
    if (row) {
        $("#" + formId).form("load", row);
        var ues = UE.getEditor('editor');
        ues.addListener("ready", function () {
            ues.setContent(row.content);
        });
        openWin(winId);
    } else {
        showInfoAlert("请选择需要修改的数据");
    }
}

function openEditWinpreimage (winId, listId, formId) {
    var row = $("#" + listId).datagrid("getSelected");
    if (row) {
        $("#" + formId).form("load", row);
        $("#imgheads").attr('src',path+row.fpic);
        openWin(winId);
    } else {
        showInfoAlert("请选择需要修改的数据");
    }
}

function openEditWinpreLetter (winId, listId, formId) {
    var row = $("#" + listId).datagrid("getSelected");
    if (row) {
        $("#" + formId).form("load", row);
       /* var objs = document.getElementById('select-phones');
        if(row.uid === 1 || row.uid == null) {
            objs.style.display='block';
            document.getElementById('selects').selectedIndex = 1;
        }else{
            objs.style.display='none';
        }*/
        openWin(winId);
    } else {
        showInfoAlert("请选择需要修改的数据");
    }
}

/*function formatterPhone(value) {
    return value == null || value.length == 0 ? '公共消息' : value;
}*/

function formatterStart(value) {
    return value == 0 ? '群发' : '单发';
}

function formtterBankStart(value){
    return value == 0 ? '激活' :'冻结';
}

function encodeBank(bank){
    var bank = bank+'';
    return bank.substring(0,4)+' ******** '+bank.substring(bank.length-4,bank.length);
}

function deleteWinprefix(urlId,listId) {
    var row = $("#"+listId).datagrid("getSelected");
    if(row) {
        $.post(urlId,
            {nid:row.nid},
            function(data) {
                if(data.result == "ok") {
                    showInfoAlert(data.message);
                    $("#" + listId).datagrid("reload");
                }
            },'json'
        );
    }
}

function deleteWinpreimage(urlId,listId) {
    var row = $("#"+listId).datagrid("getSelected");
    if(row) {
        $.post(urlId,
            {fid:row.fid},
            function(data) {
                if(data.result == "ok") {
                    showInfoAlert(data.message);
                    $("#" + listId).datagrid("reload");
                }
            },'json'
        );
    }
}


function deleteWinpreLetter(urlId,listId) {
    var row = $("#"+listId).datagrid("getSelected");
    if(row) {
        $.post(urlId,
            {lid:row.lid},
            function(data) {
                if(data.result == "ok") {
                    showInfoAlert(data.message);
                    $("#" + listId).datagrid("reload");
                }
            },'json'
        );
    }
}


function MackCommonSuccess(addWin,url,formId,listId){
    $.post(contextPath+url,
            $('#'+formId).serialize(),
            function (data) {
                if(data.result == "ok") {
                    closeWin(addWin);
                    showInfoAlert(data.message);
                    $("#" + listId).datagrid("reload");
                }else{
                    showInfoAlert(data.message);
                }
            },
            "json"
    );
}



function openEditwin(winId, list,statu) {
    var row = $('#'+list).datagrid("getSelected");
    if(row) {
        $('#rname').textbox("setValue",row.rname);
        $('#txid').val(row.id);
        $('#statu').val(statu);
        if(statu == 2 || statu == 5) {
            openWin(winId);
        }else if(statu == 4) {
            MackCommonSuccess('addWin','/logtx/aduits','addForm','list');
        }
    }else {
        showInfoAlert("请选择需要审核的数据！");
    }

}


function getCzStatus(borrow){
    if(borrow == 1){
        return '成功';
    }else if(borrow == 2){
        return '失败';
    }
}

//转换成Data类型 parser:myparser,
/*function myparser(s){
    if (!s) return new Date();
    var ss = (s.split('-'));
    var y = parseInt(ss[0],10);
    var m = parseInt(ss[1],10);
    var d = parseInt(ss[2],10);
    if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
        return new Date(y,m-1,d);
    } else {
        return new Date();
    }
}*/
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

function validateForm(formId) {
	return $("#" + formId).form('enableValidation').form("validate");
}

/**
 * 显示窗口
 */
function openWin(winId) {
	$("#" + winId).window("open");
}

function closeWin(winId) {
	$("#" + winId).window("close");
}

function formatValid(value) {
	if (value == "Y") {
		return "是";
	} else {
		return "否";
	}
}

function showInfoAlert(message) {
	$.messager.alert("提示", message, "info");
}

function strToJSON(str) {
	return eval("(" + str + ")"); // 把一个JSON格式字符串转化成JSON对象
}

function pagerOptions(listId) {
    return $("#" + listId).datagrid("getPager").data("pagination").options; // pageSize, pageNumber
}

function doSearch(listId, formId) {
    var options = pagerOptions(listId);
    $("#" + listId).datagrid(
        {
            url:options.url,
            pageSize:options.pageSize,
            queryParams: getQueryParams(listId, formId)
        }
    );
}

function doSearchAll(listId, formId) {
    $("#" + formId).form("reset");
    doSearch(listId, formId);
}

function openEditWinPrefix (winId, listId, formId, prefix) {
    var row = $("#" + listId).datagrid("getSelected");
    if (row) {
        $("#" + formId).form("load", datagridRowHandler(row, prefix));
        openWin(winId);
    } else {
        showInfoAlert("请选择需要修改的数据");
    }
}

function datagridRowHandler(row, prefix) {
    var data = {};
    for (var key in row) {
        data[prefix + '.' + key] = row[key];
    }
    return data;
}

function save(url, formId, winId, listId) {
    saveOrUpdate(url, formId, winId, listId);
}

function edit(url, formId, winId, listId) {
    saveOrUpdate(url, formId, winId, listId);
}

function saveOrUpdate(url, formId, winId, listId) {
    if (validateForm(formId)) {
        $.post(contextPath + url,
            $("#" + formId).serialize(),
            function (data) {
                if (data.result === "ok") {
                    $('#'+formId).form('clear');
                    closeWin(winId);
                    showInfoAlert(data.message);
                    $("#" + listId).datagrid("reload");
                } else {
                    showInfoAlert(data.message);
                }
            },
            'json'
        );
    }
}

function derivation(url,formid) {
    var form = $('#'+formid);
    form.attr('action',contextPath+url);
    form.submit();
}

function formatImage(value) {
    return '<img src="'+contpath+''+value+'" style="width: 350px;height: 90px"/>';
}

//图片上传预览    IE是用了滤镜。
var MAXWIDTH = 300;
var MAXHEIGHT = 90;
var img = '';
function previewImage(file) {

    var div = $('.preview');
    if (file.files && file.files[0]) {
        div.innerHTML = '<img id=imghead onclick=$("#previewImg").click()>';
        img = document.getElementById('imghead');
        img.onload = function() {
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            img.width = rect.width;
            img.height = rect.height;
            //                 img.style.marginLeft = rect.left+'px';
            img.style.marginTop = rect.top + 'px';
        }
        var reader = new FileReader();
        reader.onload = function(evt) {
            img.src = evt.target.result;
        }
        reader.readAsDataURL(file.files[0]);
    } else //兼容IE
    {
        var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
        file.select();
        var src = document.selection.createRange().text;
        div.innerHTML = '<img id=imghead>';
        var img = document.getElementById('imghead');
        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
        div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
    }
}
function previewImages(file) {
    var div = $('.preview');
    if (file.files && file.files[0]) {
        div.innerHTML = '<img id=imgheads onclick=$("#previewImgs").click()>';
        img = document.getElementById('imgheads');
        img.onload = function() {
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            img.width = rect.width;
            img.height = rect.height;
            //                 img.style.marginLeft = rect.left+'px';
            img.style.marginTop = rect.top + 'px';
        }
        var reader = new FileReader();
        reader.onload = function(evt) {
            img.src = evt.target.result;
        }
        reader.readAsDataURL(file.files[0]);
    } else //兼容IE
    {
        var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
        file.select();
        var src = document.selection.createRange().text;
        div.innerHTML = '<img id=imgheads>';
        var img = document.getElementById('imgheads');
        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
        div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
    }
}
//轮播图一
function previewImage1(file) {

    var div = $('.preview');
    if (file.files && file.files[0]) {
        div.innerHTML = '<img id=img1 onclick=$("#previewImg1").click()>';
        img = document.getElementById('img1');
        img.onload = function() {
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            img.width = rect.width;
            img.height = rect.height;
            //                 img.style.marginLeft = rect.left+'px';
            img.style.marginTop = rect.top + 'px';
        }
        var reader = new FileReader();
        reader.onload = function(evt) {
            img.src = evt.target.result;
        }
        reader.readAsDataURL(file.files[0]);
    } else //兼容IE
    {
        var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
        file.select();
        var src = document.selection.createRange().text;
        div.innerHTML = '<img id=img1>';
        var img = document.getElementById('img1');
        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
        div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
    }
}
function previewImages1(file) {
    var div = $('.preview');
    if (file.files && file.files[0]) {
        div.innerHTML = '<img id=imgs1 onclick=$("#previewImgs1").click()>';
        img = document.getElementById('imgs1');
        img.onload = function() {
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            img.width = rect.width;
            img.height = rect.height;
            //                 img.style.marginLeft = rect.left+'px';
            img.style.marginTop = rect.top + 'px';
        }
        var reader = new FileReader();
        reader.onload = function(evt) {
            img.src = evt.target.result;
        }
        reader.readAsDataURL(file.files[0]);
    } else //兼容IE
    {
        var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
        file.select();
        var src = document.selection.createRange().text;
        div.innerHTML = '<img id=imgs1>';
        var img = document.getElementById('imgs1');
        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
        div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
    }
}
//轮播图二

function previewImage2(file) {

    var div = $('.preview');
    if (file.files && file.files[0]) {
        div.innerHTML = '<img id=img2 onclick=$("#previewImg2").click()>';
        img = document.getElementById('img2');
        img.onload = function() {
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            img.width = rect.width;
            img.height = rect.height;
            //                 img.style.marginLeft = rect.left+'px';
            img.style.marginTop = rect.top + 'px';
        }
        var reader = new FileReader();
        reader.onload = function(evt) {
            img.src = evt.target.result;
        }
        reader.readAsDataURL(file.files[0]);
    } else //兼容IE
    {
        var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
        file.select();
        var src = document.selection.createRange().text;
        div.innerHTML = '<img id=img2>';
        var img = document.getElementById('img2');
        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
        div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
    }
}
function previewImages2(file) {
    var div = $('.preview');
    if (file.files && file.files[0]) {
        div.innerHTML = '<img id=imgs2 onclick=$("#previewImgs2").click()>';
        img = document.getElementById('imgs2');
        img.onload = function() {
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            img.width = rect.width;
            img.height = rect.height;
            //                 img.style.marginLeft = rect.left+'px';
            img.style.marginTop = rect.top + 'px';
        }
        var reader = new FileReader();
        reader.onload = function(evt) {
            img.src = evt.target.result;
        }
        reader.readAsDataURL(file.files[0]);
    } else //兼容IE
    {
        var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
        file.select();
        var src = document.selection.createRange().text;
        div.innerHTML = '<img id=imgs2>';
        var img = document.getElementById('imgs2');
        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
        div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
    }
}
//轮播图三

function previewImage3(file) {

    var div = $('.preview');
    if (file.files && file.files[0]) {
        div.innerHTML = '<img id=img3 onclick=$("#previewImg3").click()>';
        img = document.getElementById('img3');
        img.onload = function() {
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            img.width = rect.width;
            img.height = rect.height;
            //                 img.style.marginLeft = rect.left+'px';
            img.style.marginTop = rect.top + 'px';
        }
        var reader = new FileReader();
        reader.onload = function(evt) {
            img.src = evt.target.result;
        }
        reader.readAsDataURL(file.files[0]);
    } else //兼容IE
    {
        var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
        file.select();
        var src = document.selection.createRange().text;
        div.innerHTML = '<img id=img3>';
        var img = document.getElementById('img3');
        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
        div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
    }
}
function previewImages3(file) {
    var div = $('.preview');
    if (file.files && file.files[0]) {
        div.innerHTML = '<img id=imgs3 onclick=$("#previewImgs3").click()>';
        img = document.getElementById('imgs3');
        img.onload = function() {
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            img.width = rect.width;
            img.height = rect.height;
            //                 img.style.marginLeft = rect.left+'px';
            img.style.marginTop = rect.top + 'px';
        }
        var reader = new FileReader();
        reader.onload = function(evt) {
            img.src = evt.target.result;
        }
        reader.readAsDataURL(file.files[0]);
    } else //兼容IE
    {
        var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
        file.select();
        var src = document.selection.createRange().text;
        div.innerHTML = '<img id=imgs3>';
        var img = document.getElementById('imgs3');
        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
        div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
    }
}
//二维码

function previewImage4(file) {
    var div = $('.preview');
    if (file.files && file.files[0]) {
        div.innerHTML = '<img id=img4 onclick=$("#previewImg4").click()>';
        img = document.getElementById('img4');
        img.onload = function() {
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            img.width = rect.width;
            img.height = rect.height;
            //                 img.style.marginLeft = rect.left+'px';
            img.style.marginTop = rect.top + 'px';
        }
        var reader = new FileReader();
        reader.onload = function(evt) {
            img.src = evt.target.result;
        }
        reader.readAsDataURL(file.files[0]);
    } else //兼容IE
    {
        var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
        file.select();
        var src = document.selection.createRange().text;
        div.innerHTML = '<img id=img4>';
        var img = document.getElementById('img4');
        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
        div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
    }
}
function previewImages4(file) {
    var div = $('.preview');
    if (file.files && file.files[0]) {
        div.innerHTML = '<img id=imgs4 onclick=$("#previewImgs4").click()>';
        img = document.getElementById('imgs4');
        img.onload = function() {
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            img.width = rect.width;
            img.height = rect.height;
            //                 img.style.marginLeft = rect.left+'px';
            img.style.marginTop = rect.top + 'px';
        }
        var reader = new FileReader();
        reader.onload = function(evt) {
            img.src = evt.target.result;
        }
        reader.readAsDataURL(file.files[0]);
    } else //兼容IE
    {
        var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
        file.select();
        var src = document.selection.createRange().text;
        div.innerHTML = '<img id=imgs4>';
        var img = document.getElementById('imgs4');
        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
        div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
    }
}
function clacImgZoomParam(maxWidth, maxHeight, width, height) {
    var param = {
        top: 0,
        left: 0,
        width: width,
        height: height
    };
    if (width > maxWidth || height > maxHeight) {
        rateWidth = width / maxWidth;
        rateHeight = height / maxHeight;

        if (rateWidth > rateHeight) {
            param.width = maxWidth;
            param.height = Math.round(height / rateWidth);
        } else {
            param.width = Math.round(width / rateHeight);
            param.height = maxHeight;
        }
    }
    param.left = Math.round((maxWidth - param.width) / 2);
    param.top = Math.round((maxHeight - param.height) / 2);
    return param;
}

function updatepwd(){
    $(function(){
        if($("#oldpwd").val()==""){
            showInfoAlert("旧密码不能为空");
            return false;
        }else if($("#newpwd").val()==""){
            showInfoAlert("新密码不能为空");
            return false;
        }else if($("#newpwd1").val()==""){
            showInfoAlert("确认密码不能为空");
            return false;
        }else if($("#newpwd").val()!=$("#newpwd1").val()){
            showInfoAlert("新密码与确认密码不一致")
            return false;
        }else{
            edit('/huser/updatepwd', 'updatepwdForm', 'updatepwdWin', 'list');
        }

    });
}


