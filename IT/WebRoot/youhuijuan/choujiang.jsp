<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优惠券抽奖活动</title>

<style type="text/css">
* { margin: 0; padding: 0;}
body { font-family: "Microsoft Yahei"; background-color: #15734b;}
h1 { width: 900px; margin: 40px auto; font: 32px "Microsoft Yahei"; text-align: center; color: #fff;}
.dowebok { width: 894px; height: 563px; margin: 0 auto; background-image: url(images/s3_bg.png);}
.rotary { position: relative; float: left; width: 504px; height: 504px; margin: 20px 0 0 20px; background-image: url(images/g.png);}
.hand { position: absolute; left: 144px; top: 144px; width: 216px; height: 216px; cursor: pointer;}
.list { float: right; width: 300px; padding-top: 44px;}
.list strong { position: relative; left: -45px; display: block; height: 65px; line-height: 65px; font-size: 32px; color: #ffe63c;}
.list h4 { height: 45px; margin: 30px 0 10px; line-height: 45px; font-size: 24px; color: #fff;}
.list ul { line-height: 36px; list-style-type: none; font-size: 12px; color: #fff;}
.list span { display: inline-block; width: 94px;}
</style>

</head>

<body>
<h1>优惠券领取名单</h1>
<div class="dowebok">
	<div class="rotary">
		<img class="hand" src="images/z.png" alt="">
	</div>
	<div class="list">
		<strong>100%中奖</strong>
		<h4>优惠券领取名单</h4>
		<ul>
			<li>
				<span>154**88</span> <span>获得1元优惠券</span>
			</li>
			<li>
				<span>6161***034</span> <span>获得3元优惠券</span>
			</li>
			<li>
				<span>2349***224</span> <span>获得5元优惠券</span>
			</li>
			<li>
				<span>433***54</span> <span>获得7元优惠券</span>
			</li>
			<li>
				<span>5154***234</span> <span>获得6元优惠券</span>
			</li>
			<li>
				<span>3213***123</span> <span>获得5元优惠券</span>
			</li>
			<li>
				<span>898****362</span> <span>获得3元优惠券</span>
			</li>
		</ul>
	</div>
</div>

<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.rotate.min.js"></script>
<script>
$(function(){
	var $hand = $('.hand');

	$hand.click(function(){
		var data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
		data = data[Math.floor(Math.random()*data.length)];
		switch(data){
			case 1:
				rotateFunc(1,16,'恭喜你抽中了1元优惠券');
				break;
			case 2:
				rotateFunc(2,47,'恭喜你抽中了2元优惠券');
				break;
			case 3:
				rotateFunc(3,76,'恭喜你抽中了3元优惠券');
				break;
			case 4:
				rotateFunc(4,106,'恭喜你抽中了4元优惠券');
				break;
			case 5:
				rotateFunc(5,135,'恭喜你抽中了5元优惠券');
				break;
			case 6:
				rotateFunc(6,164,'恭喜你抽中了6元优惠券');
				break;
			case 7:
				rotateFunc(7,193,'恭喜你抽中了7元优惠券');
				break;
			case 8:
				rotateFunc(7,223,'恭喜你抽中了8元优惠券');
				break;
			case 9:
				rotateFunc(7,252,'恭喜你抽中了9元优惠券');
				break;
			case 10:
				rotateFunc(7,284,'恭喜你抽中了10元优惠券');
				break;
			case 11:
				rotateFunc(7,314,'恭喜你抽中了11元优惠券');
				break;
			case 12:
				rotateFunc(7,345,'恭喜你抽中了12元优惠券');
				break;
		}
	});

	var rotateFunc = function(awards,angle,text){
		$hand.stopRotate();
		$hand.rotate({
			angle: 0,
			duration: 5000,
			animateTo: angle + 1440,
			callback: function(){
				alert(text);
			}
		});
	};
});
</script>
</body>
</html>