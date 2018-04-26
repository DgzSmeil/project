<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<html>
<head>
	<title>普金资本平台</title>
</head>


<div class="about-right-nav">
	<div class="sub-a-nav">
		<a href="javascript:void(0);" class="active" >平台资质</a>
	</div>
	<em class="em-line"></em>
</div>
<div class="about-content">
	<div class="title-link">
		<a href="javascript:;" class="left active">公司证件</a>
		<a href="javascript:;" class="right">荣誉资质</a>
	</div>
	<div id="zhengjian" class="content">
		<div class="text-banner clearfix" style="display: block;">

			<div class="credit-right fl" style="width:299px;margin-left:140px;">
				<p class="credit-pic" onclick="zjPicBanner(0)">
					<img src="<%=path%>/static/resources/front/v01/src/images/about/ptzz_06_big.jpg" width="299" height="190">
					<span style="width:299px;height:190px;display: none;">
						<span>开户许可证</span>
					</span>
				</p>
				<p class="credit-pic" style="margin-top:20px;" onclick="zjPicBanner(1)">
					<img src="<%=path%>/static/resources/front/v01/src/images/about/ptzz_07_big.jpg"  width="299" height="190">
					<span style="width:299px;height:190px;display: none;">
						<span>机构信用代码证</span>
					</span>
				</p>
			</div>
			<div class="credit-right fl" style="width:299px;margin-left:19px;">
				<p class="credit-pic" onclick="zjPicBanner(2)">
					<img src="<%=path%>/static/resources/front/v01/src/images/about/ptzz_09_big.jpg"  width="299" height="190">
					<span style="width:299px;height:190px;display: none;">
						<span>汇付天下合同协议</span>
					</span>
				</p>
				<p class="credit-pic" style="margin-top:20px;" onclick="zjPicBanner(3)">
					<img src="<%=path%>/static/resources/front/v01/src/images/about/ptzz_08_big.jpg"  width="299" height="190">
					<span style="width:299px;height:190px;display: none;">
						<span>国资委备案</span>
					</span>
				</p>
			</div>
		</div>
	</div>
	<div id="zizhi"class="content">
		<div class="text-banner clearfix text-banner-two" style="position: relative;">
			<p class="credit-pic">
				<img src="<%=path%>/static/resources/front/v01/src/images/about/ptzz_001.jpg" width="265" height="182">
				<span style="display: none;">
						<span>先进单位</span>
					</span>
			</p>
			<p class="credit-pic">
				<img src="<%=path%>/static/resources/front/v01/src/images/about/ptzz_002.jpg"  width="265" height="182">
				<span style="display: none;">
						<span>先进单位</span>
					</span>
			</p>
			<p class="credit-pic">
				<img src="<%=path%>/static/resources/front/v01/src/images/about/ptzz_003.jpg"  width="265" height="182">
				<span style="display: none;">
						<span>先进单位</span>
					</span>
			</p>
			<p class="credit-pic" style="margin-right:0;">
				<img src="<%=path%>/static/resources/front/v01/src/images/about/ptzz_05.jpg"  width="265" height="182">
				<span style="display: none;">
						<span>信息工作先进单位</span>
					</span>
			</p>
			
		</div>
	</div>
</div>
		