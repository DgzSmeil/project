var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;
function page(page,sort) {
	var url=basePath+"/builds/lookallbuilds";
	if(page!=""){
		$.post(url,{
			"page":page,
			"sort":sort
			},
			function(data){
				var trs="";
				var tbs="";
				
				for(var i=0;i<data.length;i++){
					
					trs+="<div class='col-md-4 col-sm-6 col-xs-12 mar-bot'>";
					trs+="<div class='single-product'>";
					trs+="<div class='single-product-img' id='trs1'>";
					trs+="<a href='"+basePath+"/builds/lookbuildings?builds.id="+data[i].id+"' target='_blank' onclick='addhistory(\""+data[i].id +"\");'><img src='"+basePath+"/upload/"+data[i].logo+"' style='width:280px;height:300px;'/></a>";
					trs+="<span class='sale-box'><span class='sale'>销售</span></span>";    
					trs+="</div>";        
					trs+="<div class='single-product-content' ><div class='product-title'><h5 id='h5'><a href='"+basePath+"/builds/lookbuildings?builds.id="+data[i].id+"' target='_blank'>"+data[i].name +"</a></h5></div>";                
					trs+="<div class='rating'><div class='star star-on'></div><div class='star star-on'></div><div class='star star-on'></div><div class='star star-on'></div><div class='star'></div></div>";            
					trs+="<div class='price-box'><span id='price1' class='price'>￥"+data[i].avg_price +"/平方米</span></div>";           
					trs+="<div class='product-action' id='tds1'><button class='btn btn-default add-cart' title='立即查看'>立即查看</button>";    
					trs+="<a href='javascript:void(0);' class='add-wishlist' id='"+data[i].id+"' title='加入收藏' onclick='setClass(this);'><i class='fa fa-heart'></i></a>";    
					trs+="<a class='quick-view' href='javascript:void(0);' data-toggle='modal' data-target='#myModal' title='quick view' onclick='open_asd(\""+data[i].id +"\");'><i class='fa fa-search'></i></a>";        
					trs+="</div></div></div></div>";        
				}
				$("#gried_view").html(trs);
			},
			"json"
			);
	}
	
}
function sort(){
	//获取下拉框的值进行排序
	$('#sort').change(function(){
		var p1=$(this).children('option:selected').val();
	});
}
$(function(){
	$(".asda li").bind("click",function(){
		$(".asda li").removeClass("active");
		$(this).addClass("active");
		
	});
	
})
function body(){
	var url=basePath+"/like/likelist";
	var id=$("#user_id").val();
	if(id!=""){
		$.post(url,{
			"user.id":id
			},
			function(data){
				for(var i=0;i<data.length;i++){
					document.getElementById( data[i].buildings_id ).className = "active";
				}
			},
			"json"
			);
	}
}
function setClass(obj) {
	var id=obj.id;
	var url=basePath+"/like/addLike";
	if($("#user_id").val()==""){
		swal("提示", "您还未登录，请先登录");
	}else{
		$.post(url,{
			"user.id":$("#user_id").val(),
			"buildings_id":id
			},
			function(data){
				swal("提示", data);
				document.getElementById( id ).className = "active";
			},
			"json"
			);
	}
	
}
function open_asd(id){
	var url=basePath+"/buildings_img/look";
	if(id!=""){
		$.post(url,{
			"buildings_id":id
			},
			function(data){
				if(data==""){
					swal("提示", "该楼盘还未有图片");
				}else{
					var trs1="";
					var tbs1="";
					trs1+="<li class='active'>";
					trs1+="<a data-toggle='tab' href='#"+data[0].id+"'><img src='"+basePath+"/upload/"+data[0].img_path+"' /></a>";
					trs1+="</li>";
					
					tbs1+="<div id='"+data[0].id+"' class='tab-pane fade in active'>";
					tbs1+="<div class='single-product'>";
					tbs1+="<div class='single-product-img'>";
					tbs1+="<a href='"+basePath+"/builds/lookbuildings?builds.id="+data[0].id+"'><img src='"+basePath+"/upload/"+data[0].img_path+"' /></a>";
					tbs1+="<span class='sale-box'><span class='sale'>销售</span></span>";
					tbs1+="</div>";
					tbs1+="</div>";
					tbs1+="</div>";
					for(var i=1;i<data.length;i++){
						trs1+="<li>";
						trs1+="<a data-toggle='tab' href='#"+data[i].id+"'><img src='"+basePath+"/upload/"+data[i].img_path+"' /></a>";
						trs1+="</li>";
						
						tbs1+="<div id='"+data[i].id+"' class='tab-pane fade'>";
						tbs1+="<div class='single-product'>";
						tbs1+="<div class='single-product-img'>";
						tbs1+="<a href='"+basePath+"/builds/lookbuildings?builds.id="+data[i].id+"'><img src='"+basePath+"/upload/"+data[i].img_path+"' /></a>";
						tbs1+="<span class='sale-box'><span class='sale'>销售</span></span>";
						tbs1+="</div>";
						tbs1+="</div>";
						tbs1+="</div>";
					}
					$("#trs2").html(trs1);
					$("#tbs2").html(tbs1);
					$("#h51").html(data[0].buildings.name);
					$("#price2").html("￥"+data[0].buildings.avg_price+"/平方米");
					$("#price3").html("￥"+(data[0].buildings.avg_price+400)+"/平方米");
					$("#p10").html(data[0].buildings.intro);
					$("#total_rooms1").val(data[0].buildings.total_rooms);
				}

			},
			"json"
			);
	}
	
}
function btn_search(){
	if($("#search-buildings").val()==""){
		window.open(basePath+"/builds/allbuilds"); 
	}else{
		window.open(basePath+"/builds/findbuildings?builds.name="+$("#search-buildings").val()); 
	}
	
}
