//总数目
var length = $("#hiddenresult .show").length;
$("#pageNum").val(length);
//从表单获取分页元素参数
var optInit = getOptionsFromForm();
$("#Pagination").pagination(length, optInit);

// 按钮事件
$("#setoptions").click(function(){
    var opt = getOptionsFromForm();
    // 重新创建分页参数
    $("#Pagination").pagination(length, opt);
});
//-----------------------------------
function getOptionsFromForm(){
    var opt = {callback: pageselectCallback};
    // 从文本域中收集参数 - 这些空间名与参数名相对应
    $("input:text").each(function(){
        opt[this.name] = this.className.match(/numeric/) ? parseInt(this.value) : this.value;
    });
    //避免demo重引入HTML
    var htmlspecialchars ={ "&":"&amp;", "<":"&lt;", ">":"&gt;", '"':"&quot;"}
    $.each(htmlspecialchars, function(k,v){
        opt.prev_text = opt.prev_text.replace(k,v);
        opt.next_text = opt.next_text.replace(k,v);
    })
    return opt;
}
//-------------------------------
function pageselectCallback(page_index, jq){
    // 从表单获取每页的显示的列表项数目
    var items_per_page = $("#items_per_page").val();
    var max_elem = Math.min((page_index+1) * items_per_page, length);

    $("#Searchresult").html("");
    // 获取加载元素
    for(var i=page_index*items_per_page;i<max_elem;i++){
        $("#Searchresult").append($("#hiddenresult .show:eq("+i+")").clone());
    }
    //阻止单击事件
    return false;
}