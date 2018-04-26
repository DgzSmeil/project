<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
	body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
	#allmap {height: 500px;width:100%;overflow: hidden;}
	#result {width:100%;font-size:12px;}
	dl,dt,dd,ul,li{
		margin:0;
		padding:0;
		list-style:none;
	}
	dt{
		font-size:14px;
		font-family:"微软雅黑";
		font-weight:bold;
		border-bottom:1px dotted #000;
		padding:5px 0 5px 5px;
		margin:5px 0;
	}
	dd{
		padding:5px 0 0 5px;
	}
	li{
		line-height:28px;
	}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=EUbWj3rVZmVlbDIqPttrqfrTGixWinnC"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/SearchInfoWindow/1.5/src/SearchInfoWindow_min.css" />
	<title>带检索功能的信息窗口</title>
</head>
<body>
	<div id="allmap">	
	</div>
	<div id="result">
		<input type="button" value="默认样式" onclick="searchInfoWindow.open(marker);"/>
	</div>
<script>
var localObj = window.location;
var contextPath = localObj.pathname.split("/")[1];
var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;

	var map = new BMap.Map("allmap");    // 创建Map实例
	map.centerAndZoom(new BMap.Point(114.98,25.82), 12);  // 初始化地图,设置中心点坐标和地图级别
	map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
	map.setCurrentCity("赣州");          // 设置地图显示的城市 此项是必须设置的
	map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
	function myFun(result){
		var cityName = result.name;
		map.setCenter(cityName);
		toastr.info("当前定位城市:"+cityName);
	}
	var myCity = new BMap.LocalCity();
	myCity.get(myFun);
	//获取鼠标选取的坐标
	//map.addEventListener("click",function(e){
	//alert(e.point.lng + "," + e.point.lat);
	//});
	
	var data=new Array();
	data=${list};
	var opts = {
			width : 400,     // 信息窗口宽度
			height: 200,     // 信息窗口高度
			enableMessage:true//设置允许信息窗发送短息
		   };
	for(var i=0;i<=data.length;i++){
		var marker = new BMap.Marker(new BMap.Point(data[i][3],data[i][4]));  // 创建标注
		var content = "<h4 style='margin:0 0 5px 0;padding:0.2em 0'>"+data[i][6]+"</h4>" + 
		"<img style='float:right;margin:4px' id='imgDemo' src='"+basePath+"/upload/"+data[i][1]+"' width='139' height='104'/>" + 
		"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+data[i][5]+"</p>" + 
		"</div>";
		map.addOverlay(marker);               // 将标注添加到地图中
		addClickHandler(content,marker);
	}
	function addClickHandler(content,marker){
		marker.addEventListener("click",function(e){
			openInfo(content,e)}
		);
	}
	function openInfo(content,e){
		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	}
	
</script>
</body>
</html>
