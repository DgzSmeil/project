var AutoLoadList = Class.create()
AutoLoadList.prototype.initialize = function(domId,options,parm) {
  this.domId = domId
  this.list = $("#"+domId)
  this.loading = $("#"+domId+'_loading')
  this.noMore = $("#"+domId+'_Empty')
  this.datas = []
  this.items = []
  this.loadingStatus = -1
  this.noConMsg = options.ncm?options.ncm:'童鞋，没检测到相关信息，去看看其他内容吧'
  this.first = true

  this.ajaxOptions = {type:'post',dataType:'json',url:'',size:10}
  $.extend(this.ajaxOptions,options)

  this.parm = {page:1}
  this.parm.size = this.ajaxOptions.size
  this.resetParm(parm)
  var me = this
  $(window).scroll(function(){
    me.checkLoading()
  })

  setTimeout(function(){
    $(window).scrollTop($(window).scrollTop()+1)
  },1000)
};
AutoLoadList.prototype.build = function(datas){
  this.datas = []
  for(var i=0;i<datas.length;i++){
    var item = this.listItem(datas[i],i)
    this.items.push(item)
    this.list.append(item)
  }
  this.loaded(datas,this.datas)
}
AutoLoadList.prototype.listItem = function(e){
  return false
}
AutoLoadList.prototype.loadNext = function(){
  var me = this
  this.before()
  $.ajax({
    url:this.ajaxOptions.url,
    data:this.parm,
    dataType:'json',
    type:this.ajaxOptions.type,
    success:function(res){
      if(res.status == -9){
        goLoginPage()
        return false;
      }
      if(res.status == 1){
        if(res.data==''){
          var d = []
          me.build(d)
        }else{
          var d = res.data
          if(me.ajaxOptions.field) d = res.data[me.ajaxOptions.field]
          me.datas = me.datas.concat(d)
          me.build(d)
        }
      }else{
        var d = []
        me.build(d)
      }
      me.complete(d)
      me.success(res)
    }
  })
}

AutoLoadList.prototype.resetParm = function(e){
  this.first = true
  this.parm.page = 1
  this.list.empty()
  this.datas = []
  if(e) $.extend(this.parm,e)
  if(e && e.ncm) this.noConMsg = e.ncm
  return this
}
AutoLoadList.prototype.resetOptions = function(e){
  $.extend(this.ajaxOptions,e)
  this.resetParm()
  this.loadNext()
}
AutoLoadList.prototype.before = function(){
  this.noMore.hide()
  if(this.parm.page==1){
    this.loading.html('正在加载')
  }else{
    this.loading.html('正在加载下一页')
  }
  this.loading.show()
  this.loadingStatus = 1
}
AutoLoadList.prototype.complete = function(e){
  this.parm.page++
  if(this.parm.size>e.length){
    this.loading.hide()
  }
  if(this.first && this.datas.length==0){
    this.noMore.html('<table><tr><td>'+this.noConMsg+'</td></tr></table>').show();
  }
  this.loadingStatus = -1
  if(e.length!=0){
    this.noMore.hide()
  }
  this.first = false;
}
AutoLoadList.prototype.checkLoading = function(e){
  if($("#"+this.domId+'_loading:visible').length>0 && ($(window).height()+$(window).scrollTop()>(this.loading.offset().top+20) && this.loadingStatus<0)){
    this.loadNext()
  }
}

AutoLoadList.prototype.checkList = function(){
  if(this.list.children().length==0){
    this.reload()
  }
}

AutoLoadList.prototype.getAjaxStatus = function(e){
  return this.loadingStatus
}
AutoLoadList.prototype.reload = function(e){
  this.resetParm()
  this.loadNext()
}
AutoLoadList.prototype.listItemEvents = function(e){}
AutoLoadList.prototype.loaded = function(e){}
AutoLoadList.prototype.success = function(e){}