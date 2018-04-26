var AmtRegExp =/^(([1-9]\d{0,9})|0)(\.\d{1,2})?$/;

/*toast提示框
 * @param msg 提示语
 * @param time 提示语显示时间
 * @auth wsl
 */

    /*前台数据分页
     * @param url 请求的url
     * @param param 上送参数
     * @param listelm 数据显示列表
     * @param elm 分页显示列表
     * @param listData 分页数据参数[]
     * @param fn 分页回调方法
     * @auth wsl
     */
function Page(url,param,listelm,elm,listData,fn){
    if(url == ''){
      alert('url error');
    };
    this.minNumber = 10;
    this.Data;
    this.AllData;
    this.url = url;
    this.initPageNum = 1;//当前页
    this.pageTotalNum = 0;//总页数
    this.param = param;
    this.elm = elm;
    this.pageLoading = true;
    this.listelm = listelm;
    if(fn){this.fn = fn;}
    if(listData){this.listData = listData;};
    this.listelm.empty();
    this.elm.empty();
    this.initAjax();
}
//获取后台请求数据
Page.prototype.initAjax = function(num){
    var _this = this;
    if(num){
        _this.param.curPage = num;
    }else{
        _this.param.curPage = 1;
    };
    _this.listelm.empty();
    _this.listelm.addClass('list-loading');
    if(!_this.pageLoading)return;
    _this.pageLoading = false;
    $.post(
        this.url,
        _this.param,
        function(data) {
            _this.listelm.removeClass('list-loading');
             if (data.total !== 0) {
             _this.Data = data.rows;
             _this.AllData = data;
             _this.pageTotalNum = data.pages;
             _this.initPageNum = _this.param.curPage;
             if (_this.Data.length > 0) {
             _this.initPage(_this.param.curPage);
             } else {
             var oLi = $('<li class="none">没有符合条件的内容！</li>');
             var oHeight = _this.listelm.height();
             if (oHeight > 0) {
             oLi.css({'line-height': oHeight + 'px'})
             } else {
             oLi.css({'line-height': '60px'});
             }
             oLi.appendTo(_this.listelm);
             _this.elm.empty();
             if (_this.fn) {
             _this.fn.call(_this, _this.AllData);
             }
             }
             } else {
                 var oLi = $('<li class="none">没有符合条件的内容！</li>');
                 var oHeight = _this.listelm.height();
                 if (oHeight > 0) {
                     oLi.css({'line-height': oHeight + 'px'})
                 } else {
                     oLi.css({'line-height': '60px'});
                 }
                 oLi.appendTo(_this.listelm);
             }
        },
        "json"
    )
};
//初始化页面DOM数据
Page.prototype.initPage = function(num){
    var _this = this;
    this.elm.empty();
    //初始化数据
    if(this.listData){
        initListData(this.listData,this.Data,this.listelm);
    };
    $('<li><button type="button" class="pre">全部</button></li>')
        .bind('click',function(){
        _this.sumPage();
    }).appendTo(_this.elm);
    //pre
    var pre = $('<li><button type="button" class="pre">上一页</button></li>');
    pre.bind('click',function(){
        _this.Previou();
    });
    pre.appendTo(_this.elm);
    //生成页面列表
    if(_this.pageTotalNum>7){
        //first
        $('<li><button type="button" data-num="1">1</button></li>')
            .find('button').bind('click',function(){
            var index = $(this).data('num');
            if(index == _this.initPageNum)return;
            _this.toIndex(index);
        })
            .end()
            .appendTo(_this.elm);
        //center
        var x = 0;
        if(num>3 && (num+2)<_this.pageTotalNum){
            x=num-2;
        }else if(num+5>=_this.pageTotalNum){
            x=_this.pageTotalNum-5;
        }else{
            x=2;
        }
        //隐藏在开始之后
        if((num-2)>1){
            $('<li><span>...</span></li>').appendTo(_this.elm);
        };
        for(var i =x;i<=(x+4);i++){
            $('<li><button type="button" data-num="'+i+'">'+i+'</button></li>')
                .find('button').bind('click',function(){
                var index = $(this).data('num');
                if(index == _this.initPageNum)return;
                _this.toIndex(index);
            })
                .end()
                .appendTo(_this.elm);
        };
        //隐藏在结束之前
        if((x+2)<_this.pageTotalNum && (x+5)<_this.pageTotalNum){
            $('<li><span>...</span></li>').appendTo(_this.elm);
        };
        //last
        $('<li><button type="button" data-num="'+_this.pageTotalNum+'">'+_this.pageTotalNum+'</button></li>')
            .find('button').bind('click',function(){
            var index = $(this).data('num');
            if(index == _this.initPageNum)return;
            _this.toIndex(index);
        })
            .end()
            .appendTo(_this.elm);
    }else{
        for(var i =1;i<=_this.pageTotalNum;i++){
            var li = $('<li><button type="button" data-num="'+i+'">'+i+'</button></li>');
            li.find('button').bind('click',function(){
                var index = $(this).data('num');
                if(index == _this.initPageNum)return;
                _this.toIndex(index);
            });
            li.appendTo(_this.elm);
        };
    }
    //next
    var next = $('<li><button type="button" class="next">下一页</button></li>');
    next.bind('click',function(){
        _this.Next();
    });
    next.appendTo(_this.elm);
    _this.elm.find('li').eq(_this.initPageNum).addClass('active');
    //设置居中
    var liSize = _this.elm.find('li').size() - 2;
    liSize = liSize * 40 +240;
    _this.elm.css({'width':liSize+'px','margin':'30px auto 0'});
    $('[data-num="'+num+'"]').parent('li').addClass('active').siblings('li').removeClass('active');
    if(this.fn){
        this.fn.call(this,_this.AllData);
    }
    _this.pageLoading = true;
};
Page.prototype.Next = function(){
    if((Number(this.initPageNum)+1)>this.pageTotalNum){
       alert('当前已经是最后一页了哦');
        return;
    }
    this.toIndex(Number(this.initPageNum)+1);
};
Page.prototype.Previou = function(){
    if((this.initPageNum-1)<1){
       alert('当前已经是第一页了哦');
        return;
    }
    this.toIndex(Number(this.initPageNum)-1);
};
Page.prototype.toIndex = function(num) {
    if (this.pageLoading == false)return;
    this.initAjax(num);
};
Page.prototype.sumPage = function(){
    if(this.pageTotalNum !== 0){
        this.param.startTime="";
        this.param.endTime="";
        this.initAjax();
    }
};
/*生成数据表格
 * @param list 分页数据参数[]
 * @param data 返回的单条数据
 * @param listelm 数据显示列表
 * @auth wsl
 */
function initListData(list,data,listelm){
    if(data.length>0){
        for(var i=0;i<data.length;i++){
            if((i+1)%2 == 1){
                var oLi = $('<li class="interval"></li>');
            }else{
                var oLi = $('<li></li>');
            }
            for(var j=0;j<list.length;j++){
                var oP = $('<div class="children'+j+'"></div>');
                var oValue = data[i][list[j]['key']];
                var oCallback = list[j]['resolve'].call(this,oValue,data[i],i);
                oP.html(oCallback);
                oP.appendTo(oLi);
            };
            oLi.appendTo(listelm);
        }
    }
};


 function isMoney(m){
    if(!AmtRegExp.test(m)){
        return true;
    }else{
        return false;
    }
};



