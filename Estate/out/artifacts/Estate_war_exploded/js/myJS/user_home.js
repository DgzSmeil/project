var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;
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
		$.post(url,{
			"buildings_id":id
			},
			function(data){
				if(data==""){
					swal("提示", "该楼盘还未有图片");
				}else{
					var trs="";
					var tbs="";
					var btn="<button onclick='openpage(\""+data[0].buildings.id+"\");'>查看详情</button>";
					trs+="<li class='active'>";
					trs+="<a data-toggle='tab' href='#"+data[0].id+"'><img src='"+basePath+"/upload/"+data[0].img_path+"' /></a>";
					trs+="</li>";
					
					tbs+="<div id='"+data[0].id+"' class='tab-pane fade in active'>";
					tbs+="<div class='single-product'>";
					tbs+="<div class='single-product-img'>";
					tbs+="<a href='"+basePath+"/builds/lookbuildings?builds.id="+data[0].id+"'><img src='"+basePath+"/upload/"+data[0].img_path+"' /></a>";
					tbs+="<span class='sale-box'><span class='sale'>销售</span></span>";
					tbs+="</div>";
					tbs+="</div>";
					tbs+="</div>";
					for(var i=1;i<data.length;i++){
						trs+="<li>";
						trs+="<a data-toggle='tab' href='#"+data[i].id+"'><img src='"+basePath+"/upload/"+data[i].img_path+"' /></a>";
						trs+="</li>";
						
						tbs+="<div id='"+data[i].id+"' class='tab-pane fade'>";
						tbs+="<div class='single-product'>";
						tbs+="<div class='single-product-img'>";
						tbs+="<a href='"+basePath+"/builds/lookbuildings?builds.id="+data[i].id+"'><img src='"+basePath+"/upload/"+data[i].img_path+"' /></a>";
						tbs+="<span class='sale-box'><span class='sale'>销售</span></span>";
						tbs+="</div>";
						tbs+="</div>";
						tbs+="</div>";
					}
					$("#trs1").html(trs);
					$("#tbs1").html(tbs);
					$("#button2").html(btn);
					$("#h51").html(data[0].buildings.name);
					$("#price1").html("￥"+data[0].buildings.avg_price+"/平方米");
					$("#price2").html("￥"+(data[0].buildings.avg_price+400)+"/平方米");
					$("#p1").html(data[0].buildings.intro);
					$("#total_rooms1").val(data[0].buildings.total_rooms);
				}

			},
			"json"
			);
	
}
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
function openpage(id){
	window.open(basePath+"/builds/lookbuildings?builds.id="+id); 
}
function btn_search(){
	if($("#search-buildings").val()==""){
		window.open(basePath+"/builds/allbuilds"); 
	}else{
		window.open(basePath+"/builds/findbuildings?builds.name="+$("#search-buildings").val()); 
	}
	
}
