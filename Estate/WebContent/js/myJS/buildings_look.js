var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;
	function body(date){
		var d=new Date(date); 
		d.setDate(d.getDate()+600); 
		var month=d.getMonth()+1; 
		var day = d.getDate(); 
		if(month<10){ 
		month = "0"+month; 
		} 
		if(day<10){ 
		day = "0"+day; 
		} 
		var val = "(有效期："+date+"至"+d.getFullYear()+"-"+month+"-"+day+")";
		$(".riqi").html(val);
		
		var url=basePath+"/like/findlike";
		var id=$("#user_id").val();
		if(id!=""){
			$.post(url,{
				"user.id":id,
				"buildings_id":$("#buildings_id").val()
				},
				function(data){
					if(data.id==null){
					}else{
						document.getElementById( "lkjkl" ).style.display='none';
						document.getElementById( "lkjk" ).style.display='block';
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
        	
	function setClass(id) {
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
					document.getElementById( "lkjkl" ).style.display='none';
					document.getElementById( "lkjk" ).style.display='block';
				},
				"json"
				);
		}
		
	}
        	
$(function(){
 	  $("#btn_submit").bind("click",function(){
 		  if($("#user_id").val()==""){
 			swal("提示", "您还没有登录，请先登录" );
 		  }else{
 			  if($("#name1").val()==""){
 				 swal("提示", "请输入姓名" );
 				 return false;
 			  }else if($("#tel1").val()==""){
 				 swal("提示", "请输入手机号码" );
 				 return false;
 			  }else if($("#email1").val()==""){
 				 swal("提示", "请输入邮箱地址" );
 				 return false;
 			  }else if($("#content1").val()==""){
 				 swal("提示", "请输入您想要留言的内容" );
 				 return false;
 			  }else{
 				 var url=basePath+"/message/add";
 	 			 $.post(url,{
 	 				"message.user_id":$("#user_id").val(),
 	 				"message.buildings_id":$("#buildings_id").val(),
 	 				"message.agency_id":$("#agency_id").val(),
 	 				"message.content":$("#content1").val()
 	 				},
 	 				function(data){
 	 					swal("提示", data.msg );
 	 				},
 	 				"json"
 	 				);
 			  }
 			  
 		  }
 	  });
   })
   
//创建和初始化地图函数：
    function initMap(){
      createMap();//创建地图
      setMapEvent();//设置地图事件
      addMapControl();//向地图添加控件
      addMapOverlay();//向地图添加覆盖物
    }
    function createMap(){ 
      map = new BMap.Map("map"); 
      map.centerAndZoom(new BMap.Point($("#longitude1").val(),$("#latitude1").val()),14);
    }
    function setMapEvent(){
      map.enableScrollWheelZoom();
      map.enableKeyboard();
      map.enableDragging();
      map.enableDoubleClickZoom()
    }
    function addClickHandler(target,window){
      target.addEventListener("click",function(){
        target.openInfoWindow(window);
      });
    }
    function addMapOverlay(){
      var markers = [
        {content:"均价"+$('#avg_price1').val()+"/平方米",title:$('#buildingsname').val(),imageOffset: {width:0,height:3},position:{lat:$("#latitude1").val(),lng:$("#longitude1").val()}}
      ];
      for(var index = 0; index < markers.length; index++ ){
        var point = new BMap.Point(markers[index].position.lng,markers[index].position.lat);
        var marker = new BMap.Marker(point,{icon:new BMap.Icon(basePath+"/img/icon.png",new BMap.Size(20,25),{
          imageOffset: new BMap.Size(markers[index].imageOffset.width,markers[index].imageOffset.height)
        })});
        var label = new BMap.Label(markers[index].title,{offset: new BMap.Size(25,5)});
        var opts = {
          width: 200,
          title: markers[index].title,
          enableMessage: false
        };
        var infoWindow = new BMap.InfoWindow(markers[index].content,opts);
        marker.setLabel(label);
        addClickHandler(marker,infoWindow);
        map.addOverlay(marker);
      };
      var labels = [
      ];
      for(var index = 0; index < labels.length; index++){
        var opt = { position: new BMap.Point(labels[index].position.lng,labels[index].position.lat )};
        var label = new BMap.Label(labels[index].content,opt);
        map.addOverlay(label);
      };
    }
    //向地图添加控件
    function addMapControl(){
      var scaleControl = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});
      scaleControl.setUnit(BMAP_UNIT_IMPERIAL);
      map.addControl(scaleControl);
      var navControl = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:0});
      map.addControl(navControl);
      var overviewControl = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:true});
      map.addControl(overviewControl);
    }
    var map;
    initMap();