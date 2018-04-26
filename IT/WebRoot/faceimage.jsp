<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="SQLBean.JifenBean"%>
<%@ page import="SQLBean.StudentBean"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="Page_bg">
			<p id="nav0"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
						target="_blank">系统/运维</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/790550c890c47be45352448aa2bbfdd3030294.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank">Linux</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank">Windows</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">Shell</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen1">
								热门
							</li>
							<li class="" id="linux">
								Linux
							</li>
							<li class="" id="windows">
								Windows
							</li>
							<li class="" id="unix">
								Unix
							</li>
							<li class="" id="mac">
								Mac os
							</li>
							<li class="" id="shujuqita">
								其他
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl"
							style="display: block;" id="data">
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank"><img
										src="<%=basePath%>/itimage/3522232992ba001085b242ecb07b3195ce3e1f.png">
								</a>
							</li>
							<li class="two">
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank"><img
										src="<%=basePath%>/itimage/26a977f3883bc8376079911c23e1a1634f7886.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/f6c591433883454230d038b0aac44b2013c012.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/f5b2c0e630e48541464993e0f9e4d52ce9cea4.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" id="data1"
							style="display: none;">
							<c:forEach items="${courselist}" var="s">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&courseid=${s.course_id}" 
									target="_blank"><img
										src="${s.picture_url}">
									<p>
										共${s.course_count}课时
									</p> </a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&courseid=${s.course_id}"
									target="_blank">${s.one_word}</a>
								<p class="course_price">
									<c:if test="${s.ismoney!=1}">
										<span class="first">免费</span>
									</c:if>
									<c:if test="${s.ismoney==1}">
										<span class="first">￥${s.price}</span>
									</c:if>
								</p>
							</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav1"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
						target="_blank">云计算</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/a280d318205f9d1fc42954dbe4fc37379d73a0.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank">虚拟化</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank">云计算</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">Openstack</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen2">
								热门
							</li>
							<li class="" id="openstack">
								OpenStack
							</li>
							<li>
								虚拟化
							</li>
							<li>
								云平台
							</li>
							<li>
								Office 365
							</li>
							<li>
								云服务
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl"
							style="display: block" id="data2">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/2369b8b4222ce8b51d5583ae9d7b54916082de.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/d56ae0a88928e4a38bf98991c8674e0a932a30.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/440d9f889f993d41ca295336a35f260a1de857.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none" id="data3">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/d567db9812b44ec9f182891bbef029c843e16c.jpg">
									<p>
										共19课时
									</p> </a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Openstack Newton手动部署实战视频课程</a>
								<p class="course_price">
									<span class="first">￥579</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/88b5f3c197c4720aa2c024f57ccdeabb30f50f.jpg">
									<p>
										共5课时
									</p> </a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">【张彬Linux】Openstack实战部署、运维和管理实战视频课程</a>
								<p class="course_price">
									<span class="first">￥39</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/651212277ce4c2a828f005d7b943f091279e88.png">
									<p>
										共32课时
									</p> </a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Openstack从入门到放弃视频课程</a>
								<p class="course_price">
									<span class="first">￥399</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/53efaea0188a617c37d09002f85cff5c3f2397.jpg">
									<p>
										共27课时
									</p> </a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Openstack入门与实践（ceph+Keystone+虚拟机镜像）视频课程</a>
								<p class="course_price">
									<span class="first">￥29</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav2"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
						target="_blank">大数据</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/7342dbd987bab9ca47f4190cabfce77b990f29.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank">大数据</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank">机器学习</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">Storm</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen3">
								热门
							</li>
							<li class="" id="hadoop">
								Hadoop
							</li>
							<li>
								Spark
							</li>
							<li>
								Storm
							</li>
							<li>
								Hive
							</li>
							<li>
								Yarn
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl"
							style="display: block;" id="data4">
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/599719470ea5f52109b275d6108b2763df8263.png">
								</a>
							</li>
							<li class="two">
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/f809f0509375c11a73c3670e692ac88b9a67eb.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/a65e55b22aafeabbc44977d761ad98c073565e.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/f3e24900700654dfbf288273269b3c7e980145.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" style="display: none" id="data5">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/18c33256b4dd61aed7ec37283f86c7a9.png">
									<p>
										共26课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Hadoop 2.x（五） MapReduce案例视频课程</a>
								<p class="course_price">
									<span class="first">￥139</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/764bba98812725e33f2462ea9423fe8c843747.png">
									<p>
										共9课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Hadoop平台HDFS存储原理、MapReduce与Yarn工作机制视频课程</a>
								<p class="course_price">
									<span class="first">￥119</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/f2e5e91595a18bcbb062515bfaf7520cef4aa1.jpg">
									<p>
										共7课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">大数据——Zookeeper权威指南视频课程(集群环境搭建+底层API操作+Watcher)（上）</a>
								<p class="course_price">
									<span class="first">￥179</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/10cadcb52b8d6713a5be1d2b1f25f6ed.png">
									<p>
										共43课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Hadoop 2.x（一） 大数据基础实战视频课程</a>
								<p class="course_price">
									<span class="first">￥279</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/c2a491e30bd8294304852794050fed5f319b55.jpg">
									<p>
										共8课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Hadoop实战教学视频---用Mahout构建职位推荐引擎</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/66cbea861dab62989cc2340cd7807ef73c3056.jpg">
									<p>
										共82课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">大数据——Hadoop大数据实战开发视频课程【李兴华】</a>
								<p class="course_price">
									<span class="first">￥1999</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/wKioL1UQ_oHy1GCfAAdGUutgrdI757.jpg">
									<p>
										共11课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">大数据流处理系统之Apache Kafka专题视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/221e18e806196b21381145b70d4fbf394c68df.jpg">
									<p>
										共4课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Hadoop数据分析实战演练(入门篇)</a>
								<p class="course_price">
									<span class="first">￥19</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav3"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
						target="_blank">Web开发</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank"><img
								src="<%=basePath %>itimage/e7a9e8a7549b02a454736284fb680d6aba8298.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank">PHP</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">Javascript</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">Jquery</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen4">
								热门
							</li>
							<li class="" id="php">
								PHP
							</li>
							<li>
								Html/CSS
							</li>
							<li>
								JavaScript
							</li>
							<li>
								jQuery
							</li>
							<li>
								Node.js
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl"
							style="display: block" id="data6">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/4548980591b661ce3c23664b89bdf6853d9b8c.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/d9c4c157010eb14f8f173325def10e9f410cd3.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/f6e21a989ad8957b87904813262b3dc3cad992.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none;" id="data7">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/d5bcd8499c3c68c0036883b48bf02cbbf8ee79.png">
									<p>
										共56课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">七日成蝶-ThinkPHP5标准教程（综合实战篇【一】）</a>
								<p class="course_price">
									<span class="first">￥169</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/770e0e743495148b4f2012950738eeb979b63e.jpg">
									<p>
										共9课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">阿里云ECS Linux服务器项目部署实战视频课程</a>
								<p class="course_price">
									<span class="first">￥69</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/045edde886c2aea1def125d3d42199013d94c6.jpg">
									<p>
										共54课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">PHP开发-零基础到精通疯狂实战教程（第二季）【韦玮老师】</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/59940da3115e6df3a9c16304c42fd310853ba1.jpg">
									<p>
										共43课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">私活级ThinkPHP实战速学视频课程私活级ThinkPHP实战速学视频课程</a>
								<p class="course_price">
									<span class="first">￥159</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/69f1bff6871a7c85fa6971d9411e2aa0e835a2.jpg">
									<p>
										共58课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">PHP动态网站开发实录之后台编程及框架应用视频课程</a>
								<p class="course_price">
									<span class="first">￥79</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav4"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
						target="_blank">编程语言</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/95a78d2985fc2e0dcb5773816df179b77db5c4.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank">自动化开发</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank">全栈开发</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">.net</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen5">
								热门
							</li>
							<li class="" id="python">
								Python
							</li>
							<li>
								Java
							</li>
							<li>
								C/C++
							</li>
							<li>
								.Net
							</li>
							<li>
								Ruby
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl" style="display:block" id="data8">
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank"><img
										src="<%=basePath%>/itimage/95538ec50419ba94e22173cb5dc4aecc01e64a.png">
								</a>
							</li>
							<li class="two">
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/841d5a158d3c23d8fa63376110fbf103c0bc8e.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/b1c861063f6c4df9cb42032a7c5d1b336ece39.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/74dc0e554ab477a7efc418afab65828da94e74.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" style="display: none;"  id="data9">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/d46358d22dfb31b59815847db9fd674315f5a7.jpg">
									<p>
										共64课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">Python网络爬虫工程师系列培训视频课程（全套详细版）</a>
								<p class="course_price">
									<span class="first">￥899</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/01caa88868ea87f72aa5935424df6b4a72d585.jpg">
									<p>
										共15课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">Python(3.6)黑板报之字典与列表解析</a>
								<p class="course_price">
									<span class="first">￥39</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/865a6c21130612b037a7000b49725e70863902.png">
									<p>
										共22课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">Python实战视频课程（面向对象+异常处理+文件管理）-基础篇(老段)</a>
								<p class="course_price">
									<span class="first">￥599</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/92cec4b0302f2521fe57884199fe7e2d7eec47.png">
									<p>
										共133课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">Python自动化开发实战视频课程-全新2.0版本</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/556c556806f14d7ddc81089988921ecfff2929.png">
									<p>
										共18课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">跟Alex学-用Python分分钟开发一个BBS论坛系统实战视频课程</a>
								<p class="course_price">
									<span class="first">￥29</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/d5389ed689a0a16707e89874231dcf1eef6fec.png">
									<p>
										共23课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">跟Alex学Python-开发Web实时聊天室撩妹吧</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/b14fe0584c047291e0b216fb7f99c93320793d.png">
									<p>
										共27课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">跟Alex学Python之-快速设计和开发CMDB视频教程</a>
								<p class="course_price">
									<span class="first">￥299</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/29135f16757b3ca9033250274d917ab78912ff.jpg">
									<p>
										共124课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">跟Alex学Python之Python开发基础-1</a>
								<p class="course_price">
									<span class="first">￥9</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav5"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
						target="_blank">软件研发</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/87d378f8606d82b81ab6570782ff01268f4d48.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank">自动化测试</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank">软件设计</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank">软件架构</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen6">
								热门
							</li>
							<li  class="" id="ruanjian">
								软件测试
							</li>
							<li>
								敏捷开发
							</li>
							<li>
								研发管理
							</li>
							<li>
								软件设计
							</li>
							<li>
								软件架构
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl"  style="display:block" id="data10">
							<li>
								<a
									href="http://edu.51cto.com/pack/view/id-928.html?shouyetupian"
									target="_blank"><img
										src="<%=basePath%>/itimage/9555fbc6398c5859ea18086e7418fd3dab1f79.png">
								</a>
							</li>
							<li>
								<a
									href="http://edu.51cto.com/pack/view/id-822.html?shouyetupian"
									target="_blank"><img
										src="<%=basePath%>/itimage/997eea749a7feb51fd1803e0e7b8397db4b15c.png">
								</a>
							</li>
							<li>
								<a
									href="http://edu.51cto.com/pack/view/id-1019.html?shouyetupian"
									target="_blank"><img
										src="<%=basePath%>/itimage/13fc6c382adc626c3012767713e2c394e4d9ce.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none;" id="data11">
							<li>
								<a class="course_img"
									href="http://edu.51cto.com/course/course_id-5611.html"
									target="_blank"><img
										src="https://s1.51cto.com/images/201603/c7b6b92819c9ace6e9d3073fe2dd08361a0de0.jpg">
									<p>
										共11课时
									</p>
								</a><a class="course_title"
									href="http://edu.51cto.com/course/course_id-5611.html"
									target="_blank">IT测试行业职业生涯规划精品课视频课程（新增了第二章）</a>
								<p class="course_price">
									<span class="first">￥49</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="http://edu.51cto.com/course/course_id-7565.html"
									target="_blank"><img
										src="https://s1.51cto.com/images/201611/f6504d92095d671c9f510262f554afd0b3e6fc.jpg">
									<p>
										共45课时
									</p>
								</a><a class="course_title"
									href="http://edu.51cto.com/course/course_id-7565.html"
									target="_blank">【2016版】自动化测试QuickTest视频课程-上部</a>
								<p class="course_price">
									<span class="first">￥399</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="http://edu.51cto.com/course/course_id-7578.html"
									target="_blank"><img
										src="https://s1.51cto.com/images/201611/011ca3999aabc7aea43689d2850268f5a60dc5.png">
									<p>
										共15课时
									</p>
								</a><a class="course_title"
									href="http://edu.51cto.com/course/course_id-7578.html"
									target="_blank">Selenium IDE WEB 自动化测试入门视频课程（下）</a>
								<p class="course_price">
									<span class="first">￥9</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="http://edu.51cto.com/course/course_id-6364.html"
									target="_blank"><img
										src="https://s1.51cto.com/images/201606/e8a6c5774953c07197559398258d400fea826e.jpg">
									<p>
										共9课时
									</p>
								</a><a class="course_title"
									href="http://edu.51cto.com/course/course_id-6364.html"
									target="_blank">高级性能测试工程师-Nginx性能调优视频课程</a>
								<p class="course_price">
									<span class="first">￥179</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav6"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
						target="_blank">考试认证</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/51b3d8d9259e0bfa106005f97916dbe45f48f9.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank">华为认证</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank">红帽认证</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank">信息安全</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen7">
								热门
							</li>
							<li id="ruankao">
								软考
							</li>
							<li>
								红帽认证
							</li>
							<li>
								华为认证
							</li>
							<li>
								思科认证
							</li>
							<li>
								微软认证
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl" style="display:block" id="data12">
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank"><img
										src="<%=basePath%>/itimage/6453d3262e89acd0ed8247f46b8a2ec9d7546d.png">
								</a>
							</li>
							<li class="two">
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank"><img
										src="<%=basePath%>/itimage/98c822486b60e41f9959601a42354d67d4b145.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/195ffea59936340fa7807502b044024bd9c105.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/331032a5914fe8cd7eb612a44a3e2584998da0.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" style="display: none;" id="data13">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/66c3835678fd601779c37786ebe11cf31b0a50.gif">
									<p>
										共9课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">2017年11月软考-数据库工程师之《数据库设计》视频课程</a>
								<p class="course_price">
									<span class="first">￥29</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201705/b50cb6b37c182b6ae171482b6585196bee81bc.jpg">
									<p>
										共5课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">2017软考信息系统项目管理师-考前冲刺重难点解析视频课程</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201610/d3653d924f7cbf69f3e925c9224f57966d39ed.jpg">
									<p>
										共7课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">软件评测师考试第六季视频课程-程序设计语言基础知识</a>
								<p class="course_price">
									<span class="first">￥39</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201612/f18a6d047cec76e905214079dde19e2b442fa3.jpg">
									<p>
										共37课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">2017软考信息系统项目管理师-案例分析真题解析视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201612/c39bd3a7971716eca88054398b5a2eac6657ce.jpg">
									<p>
										共30课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">2017软考系统集成项目管理工程师-基础知识（上）备考视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201703/e55f25b17c7d49356fe046ec80ec5ca33b60df.gif">
									<p>
										共14课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">2017年11月软考-数据库工程师之《数据库技术基础》</a>
								<p class="course_price">
									<span class="first">￥39</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201703/a741b9a363c350465281718acfe07968d8f5be.jpg">
									<p>
										共58课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">信息安全工程师5天修炼实战视频课程</a>
								<p class="course_price">
									<span class="first">￥518</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201703/02a658904cdbb7fd4fd24840ceda625e57834e.jpg">
									<p>
										共5课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">2017软考网络工程师-考前冲刺重、难点串讲视频</a>
								<p class="course_price">
									<span class="first">￥149</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav7"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
						target="_blank">数据库</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/7639fe0714eebeeb657289a3262cca6c535080.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank">Oracle</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
								target="_blank">MySQL</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
								target="_blank">Redis</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show"  id="remen8">
								热门
							</li>
							<li id="mysql">
								MySQL
							</li>
							<li>
								Oracle
							</li>
							<li>
								SQL Server
							</li>
							<li>
								Access
							</li>
							<li>
								NoSQL
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl" style="display:block" id="data14">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/96fdc51515b26dd8cb20547c236490514c150a.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c863cf3459952878fe79918b3b2bc9961931a6.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/2586ca174f448593920081dc34b7720a07d279.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none;" id="data15">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201705/61cff510110fd6d5da715790c27578f08a3849.jpg">
									<p>
										共17课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">201705老男孩的MySQL私房菜深入浅出精品视频第5-6章视频课程</a>
								<p class="course_price">
									<span class="first">￥49</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201603/f27bc33257273b3866a10155bead393461c74c.png">
									<p>
										共138课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">2016最新老男孩MySQL数据库DBA核心视频课程-第一到第十六部完整</a>
								<p class="course_price">
									<span class="first">￥599</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201605/d61543812cd1b554be38811a7695f4c9032e75.jpg">
									<p>
										共1课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">Mysql新手入门视频教程详解</a>
								<p class="course_price">
									<span class="first">会员免费</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201608/24128fe640a5ac3128a6387ff6b8812833c575.png">
									<p>
										共24课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">企业常见MySQL架构应用实战(高可用集群系统+调优经验)视频课程</a>
								<p class="course_price">
									<span class="first">￥299</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/d1a040308c1b285733b831fcfd5d871ebc29ae.jpg">
									<p>
										共5课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">跟王老师学MySQL MySQL的数据类型视频课程</a>
								<p class="course_price">
									<span class="first">￥10</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/a3c01940139a34fefe4270fac9970761a411b6.jpg">
									<p>
										共18课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">精通MySQL存储过程、函数和触发器视频课程（已更新高级部分）</a>
								<p class="course_price">
									<span class="first">￥9</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201609/381ef7312094d043b3c556e0ae082302f8f9c2.jpg">
									<p>
										共16课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">七日成蝶-MySQL5部署及应用（Linux与Windows双环境案例）</a>
								<p class="course_price">
									<span class="first">￥39</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201609/053469535ec499dea0d0547f5fda495fa45ead.jpg">
									<p>
										共6课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">【张彬Linux】MySQL管理与双主集群实战</a>
								<p class="course_price">
									<span class="first">￥109</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav8"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank">网络/安全</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
							target="_blank"><img
								src="<%=basePath%>/itimage/51e5163201dfa19bb770542c0047c4606df678.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
								target="_blank">Wireshark</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
								target="_blank">黑客</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
								target="_blank">防火墙</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show"  id="remen9">
								热门
							</li>
							<li id="inter">
								网络管理
							</li>
							<li>
								路由交换
							</li>
							<li>
								安全技术
							</li>
							<li>
								通信技术
							</li>
							<li>
								数据中心
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl" style="display: block;" id="data16">
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c4f1a364151db795e711635e3ef0e31554d9c3.png">
								</a>
							</li>
							<li class="two">
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/d63d8564540f5447fa6952fab860afd13b6a12.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/f78e63008c365ad4f478128166629ecdaf44b2.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/682a0e579a63b3f6f802293e174c54c2a90c42.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" style="display: none;" id="data17">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201705/648e415493fa250f0ae829fff1a113b6091db1.jpg">
									<p>
										共25课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">企业网络智慧城市物联网解决方案工程师培训实战视频课程</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs01/M02/51/5D/wKioOVLY7fGRONVcAACLfZZrjHw696.jpg">
									<p>
										共2课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">那些年一起犯过的错--大侠讲经典网络错误配置【大侠唐在飞出品】</a>
								<p class="course_price">
									<span class="first">会员免费</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M02/6C/3D/wKiom1VByIPS4uQSAACCADDiDk4355.jpg">
									<p>
										共36课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">计算机导论视频课程</a>
								<p class="course_price">
									<span class="first">会员免费</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M01/47/2C/wKiom1P3YNXTZ3NyAAFCYyiWEcg058.jpg">
									<p>
										共80课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">网康上网行为管理精讲视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M00/4D/B1/wKiom1RXQuuAWNPDAAFXA1cf7nY470.jpg">
									<p>
										共20课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">微软Forefront TMG 2010防火墙与websense整合实战视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M02/5B/26/wKioL1UA7_DTghT7AAGnUM7EguU625.jpg">
									<p>
										共4课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">微软Forefront TMG 2010 防火墙实战Part 1视频课程</a>
								<p class="course_price">
									<span class="first">会员免费</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M00/5B/9D/wKiom1UOZbvRyI1yAAKKvTYq6rI070.jpg">
									<p>
										共67课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">网络管理员实战系列视频课程【大侠唐在飞出品】</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M02/5D/FD/wKiom1Uoi4_ydn-XAAHH3dRd8us129.jpg">
									<p>
										共1课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">20个常见的中小企业组网方案讲解高清视频【大侠唐在飞】</a>
								<p class="course_price">
									<span class="first">会员免费</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav9"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
						target="_blank">人工智能</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/552efac53b924ec9c7b734e63ef8d84799a729.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank">机器学习</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
								target="_blank">机器人</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
								target="_blank">深度学习</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show"  id="remen10">
								热门
							</li>
							<li  id="study">
								深度学习
							</li>
							<li>
								计算机视觉
							</li>
							<li>
								自然语言
							</li>
							<li>
								机器人开发
							</li>
							<li>
								其他
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl"  style="display: block;" id="data18">
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/76b597c49ce594ce00b490cb041721657cfd32.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/030815791700defed279903470b1d98c54e35b.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/172db45098ca0a71a4577716c279cefe192d57.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none;" id="data19">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/44f0798a5ba68901a9fbfafa68c54db3.jpg">
									<p>
										共7课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">大型企业自然语言开发框架实战之NLTK视频课程</a>
								<p class="course_price">
									<span class="first">￥198</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/99b02d0228383dff8898564dbb99ea61e7ab4b.jpg">
									<p>
										共9课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">验证码识别 深度学习视频课程</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/086bd2677f42d1c9e2e704467e3660dc522c11.jpg">
									<p>
										共21课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">3天搞定机器学习深度学习基础-Python入门视频课程</a>
								<p class="course_price">
									<span class="first">￥48</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/582b2a7061074598c7758865020bfcf167b13a.png">
									<p>
										共16课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}"
									target="_blank">大数据:深度学习项目实战视频课程-人脸检测</a>
								<p class="course_price">
									<span class="first">￥128</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav10"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
						target="_blank">移动开发</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/63ed3542806bbe2e4857536307d75e0ae87cbf.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank">Android</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
								target="_blank">Html5</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
								target="_blank">Swift</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen11">
								热门
							</li>
							<li class="" id="html5">
								HTML5
							</li>
							<li>
								移动测试
							</li>
							<li>
								微信开发
							</li>
							<li>
								iOS
							</li>
							<li>
								Android
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl" style="display: block;" id="data20">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/e3a8853880c45b471d1609b9b54c83b8fc770d.png">
								</a>
							</li>
							<li class="two">
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/91a80e177683eda64e1951cdc9fc715c1a43aa.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/1703fe843814cce019d1330755c6ccb823bc1b.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c78a83f84514080e57d0916fc72351acc4ae0d.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" style="display: none;" id="data21">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/539f672221c04f4979a027ba1fb29c3ad4c0f0.jpg">
									<p>
										共38课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">移动端开发利器 jQuery Mobile开发实录视频课程</a>
								<p class="course_price">
									<span class="first">￥36</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/058447b292c6ccd63a1528d0eb25325da37547.png">
									<p>
										共30课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">教你轻松玩转“密室探索”类H5视频课程</a>
								<p class="course_price">
									<span class="first">￥9</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/5664e13850feadefbbc035e04ebf55f43f5a23.png">
									<p>
										共20课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">应用Ionic构建企业级Hybrid APP 基础视频教程 之JS组件篇</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/wKiom1PPHNeiFqNlAAEr7-uFxQo350.jpg">
									<p>
										共17课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">HTML5从零到实战视频教程（2017年5月1号会陆续进行更新到最新）</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/wKioL1REs3OzrJdaAAHmycKW9mw052.jpg">
									<p>
										共29课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">【李宁】征服HTML5视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/wKiom1RPK0rzVx-FAAB2IK5Et2g543.jpg">
									<p>
										共32课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">深入浅出HTML5游戏引擎视频教程</a>
								<p class="course_price">
									<span class="first">￥299</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/a840a849036ba27f6454697a4ded1228de6420.jpg">
									<p>
										共31课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">结合MUI框架完成HTML5移动端混合应用开发（微信实战）</a>
								<p class="course_price">
									<span class="first">￥669</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/046a08f320e39cedb74917a908ceb45decfe60.jpg">
									<p>
										共40课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}"
									target="_blank">HTML5开发手机App之：HTML5系统视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav11"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
						target="_blank">游戏开发</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/d214166816b2b55d2889007e456b236e2721a7.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank">Unity</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank">手游开发</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
								target="_blank">unity5</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen12">
								热门
							</li>
							<li class="" id="unity3d">
								Unity3D
							</li>
							<li>
								Cocos2d-x
							</li>
							<li>
								VR虚拟现实
							</li>
							<li>
								手游开发
							</li>
							<li>
								3D游戏
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl" style="display:block" id="data22">
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/6897e3c841f03119a862291af77281f2a460c0.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/31432fe389e89964cf3827e68172e1a8a057c8.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/336b852266eaf72165e820e9f1cab18f6a8290.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none;" id="data23">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/283a6f6925035eabfa4618da944b8fb6ac64a3.jpg">
									<p>
										共43课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">Unity客户端框架设计PureMVC篇视频课程(上)</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/3760acb23ab5578d89f259efeb8f5c4ab8ffe2.jpg">
									<p>
										共36课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">Unity3D游戏开发视频课程-飞机大战,三消游戏,Flappy
									bird等干货案例来袭</a>
								<p class="course_price">
									<span class="first">￥189</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c337eca97764d7d3ed1753cf3b5e20072b357e.png">
									<p>
										共21课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">Unity5游戏开发Mecanim高级特性项目实战视频课程</a>
								<p class="course_price">
									<span class="first">￥59</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/e3f046d520739d67fb16324d4d235a63cd716c.jpg">
									<p>
										共3课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}"
									target="_blank">Unity原生技术视频课程：iOS GameCenter 接入（ 2015版）</a>
								<p class="course_price">
									<span class="first">￥59</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav12"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
						target="_blank">嵌入式</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
							target="_blank"><img
								src="<%=basePath%>/itimage/43769ad3878597b5b3793129ed6f187f811a0b.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">单片机</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">U-Boot</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
								target="_blank">硬件设计</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen13">
								热门
							</li>
							<li class="" id="qian">
								嵌入式Linux
							</li>
							<li>
								驱动/内核开发
							</li>
							<li>
								单片机/工控
							</li>
							<li>
								物联网
							</li>
							<li>
								智能硬件
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl" style="dispay:block" id="data24">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/a7ecffb044fbc869ed2917d8bcdc8841b42916.png">
								</a>
							</li>
							<li class="two">
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c712fd61872f9fa5c160589011ca177490753d.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c1c19c777805219bc84824f286f48054b9b9d1.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/05720a351ba3f32bfe2763f5384472f0f0b38b.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" style="display: none;" id="data25">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/79f930e089ec68d43d8846dc860060769dfcac.jpg">
									<p>
										共12课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">Qt程序设计基础视频课程</a>
								<p class="course_price">
									<span class="first">￥28</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/f9090d76845dfe2aba5223b0fad909f230f620.jpg">
									<p>
										共41课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">6.小项目.图片解码播放器视频课程-嵌入式Linux核心终点站</a>
								<p class="course_price">
									<span class="first">￥299</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/25ca92697efd2129799971f4c9b2e023f9da9a.jpg">
									<p>
										共52课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">TCP/IP/UDP
									Socket通讯开发实战视频课程——适合iOS/Android/Linux</a>
								<p class="course_price">
									<span class="first">￥999</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/b9832653185c8e5e65463479fa4fb2666c6547.jpg">
									<p>
										共21课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">嵌入式Linux内核移植视频课程</a>
								<p class="course_price">
									<span class="first">￥39</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/b76b3da01cde1876ba67666cec9bf3c3442f1e.jpg">
									<p>
										共15课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">vim从入门到精通(第2季)：使用插件定制自己的IDE开发环境</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/04431a390070c8e6de10126609ce15a7c4e208.jpg">
									<p>
										共23课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">Linux教学视频从入门到精通视频课程</a>
								<p class="course_price">
									<span class="first">￥129</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/wKioL1UaabbDj5c5AAFCmvLPnPk228.jpg">
									<p>
										共57课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">嵌入式Linux C语言完全学习视频课程</a>
								<p class="course_price">
									<span class="first">￥1</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/814663647bbdca6bc71847f7f1eb2c6d12b3fb.jpg">
									<p>
										共10课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}"
									target="_blank">指针才是C的精髓-4.3.C语言高级专题第三部分视频课程</a>
								<p class="course_price">
									<span class="first">￥35</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav13"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
						target="_blank">服务器</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
							target="_blank"><img
								src="<%=basePath%>/itimage/169db43477dee8bcac75355df794fd786955ef.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">Exchange</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">集群</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">Windows Server</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen14">
								热门
							</li>
							<li class="" id="exchange">
								Exchange
							</li>
							<li>
								Windows Server
							</li>
							<li>
								Lync
							</li>
							<li>
								SharePoint
							</li>
							<li>
								Nginx
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl" style="display: block;" id="data26">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/f624b0000d45758610d6041ebfaac3d4c51fd2.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/996586a06e4cfb2d0df8864411d86260719158.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/d72d9d297219cb7e325352b795231bbc6bbd9c.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none;" id="data27">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/wKioJlL8IZXRgwY9AADKAznWvIw440.jpg">
									<p>
										共20课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Exchange 2013 管理</a>
								<p class="course_price">
									<span class="first">￥399</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/wKioOVMpNf3CwiSkAACZFuHmiRo691.jpg">
									<p>
										共44课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Exchange Server 2010 SP2企业信息平台实战视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/wKioL1NQm77yNaEVAAFCfmLdNNo848.jpg">
									<p>
										共1课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">51CTO第46期公开课:Exchange 2013会议功能详解</a>
								<p class="course_price">
									<span class="first">会员免费</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/wKiom1SOTffQH7PQAAGS6WwGdbg849.jpg">
									<p>
										共1课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Outlook 大附件解决方案视频课程</a>
								<p class="course_price">
									<span class="first">会员免费</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/wKioL1Uc2w3xAHWKAAHXXO0Aj2g750.jpg">
									<p>
										共9课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Exchange数据库灾难恢复视频课程</a>
								<p class="course_price">
									<span class="first">￥599</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/wyfs02/M02/6C/D0/wKiom1VSsjuz5FYPAAHxA_emzkA260.jpg">
									<p>
										共17课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">邮件系统-Exchange Server 2013的核心解决方案视频课程</a>
								<p class="course_price">
									<span class="first">￥499</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201510/682a2cd54a9c40cb65b137204cf7b9cc8d4810.jpg">
									<p>
										共35课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">AD&amp;Exchange 部署实战系列视频课程</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="https://s1.51cto.com/images/201702/21a057d489095fd3dc1421897cecbcaff42ad8.jpg">
									<p>
										共22课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Exchange 2013部署管理实战入门视频教程</a>
								<p class="course_price">
									<span class="first">￥98</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav14"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
						target="_blank">企业信息化</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
							target="_blank"><img
								src="<%=basePath%>/itimage/125b6e609867323428e187d6689af5e1488840.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">PMP</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">ERP</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">Project</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen15">
								热门
							</li>
							<li class="" id="man">
								项目管理
							</li>
							<li>
								ERP
							</li>
							<li>
								CRM
							</li>
							<li>
								BPM
							</li>
							<li>
								管理软件
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl" style="display: block" id="data28">
							<li>
								<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/57be34811d359c5449a3867cb9c3b7b96e58b1.png">
								</a>
							</li>
							<li class="two">
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c81821211789530877f95918c8a84684eaef1d.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c355bd150e5755ba3c1534548de0cf40580450.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/3863493928e734e5b4f19355b54d6cb3ce5a03.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" style="display: none;" id="data29">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/936ce6a465aeb84736c911b103f2c2869af376.jpg">
									<p>
										共40课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">项目质量管理实战视频课程（乔俊峰）</a>
								<p class="course_price">
									<span class="first">￥299</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c15d27f36622297259d55682afaa500aed24d5.jpg">
									<p>
										共18课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">职场拼杀必备技能之：目标管理</a>
								<p class="course_price">
									<span class="first">￥99</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/113fb85523e10ba79fc7254d83a1b728fd18ac.jpg">
									<p>
										共4课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">众学微课程： PMP 项目管理介绍及引论 （适用于PMBOK 第五版）</a>
								<p class="course_price">
									<span class="first">￥10</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/b5edd9b46c98c4f73b7907b106c8028c4199c4.JPG">
									<p>
										共9课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Project Server 2013部署和应用视频课程</a>
								<p class="course_price">
									<span class="first">￥59</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/930b611318b1d7bb199052dffc93c84b793ab8.jpg">
									<p>
										共8课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">90分钟教你做活动策划执行视频课程（论坛+展览+沙龙）</a>
								<p class="course_price">
									<span class="first">￥88</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/360980b2094ff6b8369380a95786ee1191f772.jpg">
									<p>
										共10课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">IT项目实施宝典—项目文档编写技巧规范实战视频课程</a>
								<p class="course_price">
									<span class="first">￥39</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/561cb3570543cbe38135737befc36c13cffccc.png">
									<p>
										共17课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">学会商业计划书，打破商业的封锁-视频课程</a>
								<p class="course_price">
									<span class="first">￥49</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/49babc365766de75e29012315980f432e0bf13.jpg">
									<p>
										共7课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">IT行业常见技术及专业术语讲解实战视频课程</a>
								<p class="course_price">
									<span class="first">会员免费</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav15"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
						target="_blank">Office办公</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/d71602503591fd6b1b60526332b6a8a5b47fb6.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank">Office</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">高效办公</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">表格之道</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen16">
								热门
							</li>
							<li class="" id="excel">
								Excel
							</li>
							<li>
								PPT
							</li>
							<li>
								Word
							</li>
							<li>
								其他
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl" style="display:block" id="data30">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/c5b18111424214ae2e12440e06256ab2c2ba7a.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/52e588e607f85703fff382080eda4fa7d11e17.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/17d9430057e40da8e63102d8a1fa0234176068.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none;" id="data31">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/877808654c33d9be9f2986b0bfbb68c415bce6.png">
									<p>
										共40课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Excel视频教程之Power Query M语言第2季</a>
								<p class="course_price">
									<span class="first">￥299</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/81358cd83656e09047d2639d41fc487c527bd4.png">
									<p>
										共9课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">【王佩丰】Excel 图表实战 视频教程</a>
								<p class="course_price">
									<span class="first">￥149</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/b70629212426509416520925d737810471dc0d.png">
									<p>
										共24课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">【曾贤志】Excel从零到精通视频课程第2季（函数篇）</a>
								<p class="course_price">
									<span class="first">￥169</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/9454c01910cd90e9ad5eac7d8f5435af.png">
									<p>
										共15课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">【大猫(王伟)】Excel VBA 基础编程及经典算法视频</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/72725de116884178f01441b79443584c998929.jpg">
									<p>
										共29课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Excel VBA高手之路系列视频课程之进阶篇</a>
								<p class="course_price">
									<span class="first">￥78</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/09fdbb550f23d792c8d6377dee753be8258f44.jpg">
									<p>
										共52课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Excel 2016 函数公式必修视频课程【时间、逻辑、数学函数】</a>
								<p class="course_price">
									<span class="first">￥19</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			<p id="nav16"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
						target="_blank">产品/设计</a>
					<div class="atment">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
							target="_blank"><img
								src="<%=basePath%>/itimage/7458db874b981e60c6c122ce1bcb6026e69cc2.png">
						</a>
						<div class="bottom">
							<a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">产品经理</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">互联网运营</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">设计</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen17">
								热门
							</li>
							<li class="" id="pro">
								产品经理
							</li>
							<li>
								互联网运营
							</li>
							<li>
								交互设计
							</li>
							<li>
								平面设计
							</li>
							<li>
								室内设计
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 show fl" style="display:block" id="data32">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/d18572295d6eac6551a3166db2b0b637631f81.png">
								</a>
							</li>
							<li class="two">
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/269af6c3715030d4ba9485bcb4f9b00be2475c.png">
								</a><a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/f866418034c15715a2c318ec5cce504fdfd780.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/b2497a7077043961d7e20838cc9cb72a3f7601.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 fl" style="display: none;" id="data33">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/b915fb37892d5e6d8be40870c45114b72be691.jpg">
									<p>
										共6课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">ProcessOn思维导图入门实战视频课程</a>
								<p class="course_price">
									<span class="first">￥4</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/66917c548f5082f91d9243dbcac9ff09cc005b.jpg">
									<p>
										共7课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">产品交互设计那些事儿-实战视频课程</a>
								<p class="course_price">
									<span class="first">￥1</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/b66c689794e4af96bdd038101b970c04751593.jpg">
									<p>
										共17课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">Axure部件详解与实践提升视频课程</a>
								<p class="course_price">
									<span class="first">￥10</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/69b3a7b064481d4c786928975ec80be13be154.jpg">
									<p>
										共4课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">产品系列课程之UCD设计方法视频课程</a>
								<p class="course_price">
									<span class="first">￥10</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/033bc4d5114dd46479e8256e66bbb78b5bacb0.jpg">
									<p>
										共5课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">产品设计课程—Axure入门基础及实践视频课程</a>
								<p class="course_price">
									<span class="first">￥6</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/e6780e518858bb6b7c84886200bf2cc665e5e7.jpg">
									<p>
										共3课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">产品设计系列课程—产品必备文档编写视频课程</a>
								<p class="course_price">
									<span class="first">￥5</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/d89dae117af0b9a0ca3977960af1d53ebaeb18.jpg">
									<p>
										共6课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">产品原型设计工具“墨刀”实战课程</a>
								<p class="course_price">
									<span class="first">￥4</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/815826873c70aa79b3d47025718658e6e43915.jpg">
									<p>
										共4课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">产品设计系列课程之绘制流程图视频课程</a>
								<p class="course_price">
									<span class="first">￥5</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<p id="nav17"></p>
			<div class="atment_bg course_height bgff w1160""="">
				<div class="atment_box fl">
					<a class="titleName"
						href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
						target="_blank">其它</a>
					<div class="atment atment_s">
						<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank"><img
								src="<%=basePath%>/itimage/b2bcc1d581be9d9a18c7081a1351cb8d595f09.png">
						</a>
						<div class="bottom">
							<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank">职场英语</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">看案例管理</a><a
								href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
								target="_blank">CTO修炼</a>
						</div>
					</div>
				</div>
				<div class="course_box fl">
					<div class="ititle_box fl">
						<ul class="ititle_list fl">
							<li class="show" id="remen18">
								热门
							</li>
							<li class="" id="it">
								IT职场
							</li>
							<li>
								网络营销
							</li>
							<li>
								多媒体
							</li>
							<li>
								英语四六级
							</li>
							<li>
								其他
							</li>
						</ul>
						<span class="ititle_btn fl"></span>
						<div class="clear"></div>
					</div>
					<div class="course_box_con fl">
						<ul class="course_abc course_list_01 course_list_01s show fl" style="display:block" id="data34">
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/260a51c05caed51281794128fd1b89aa5080e3.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/e9b780d18bb5ef1632d60756a49ad9a0936d8e.png">
								</a>
							</li>
							<li>
								<a
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/565884138e69b8b032d5141025452ad975e777.png">
								</a>
							</li>
						</ul>
						<ul class="course_abc course_list_02 course_list_02s fl"
							style="display: none;" id="data35">
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/249415a181561ddd25a882ea0da4747c5c1282.jpg">
									<p>
										共6课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">教师资格证面试培训视频课程</a>
								<p class="course_price">
									<span class="first">￥29</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath%>/itimage/f2ebadf292b356905c9014abdb9358929e78e3.jpg">
									<p>
										共7课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">定路线No.3 程序员职业发展路线</a>
								<p class="course_price">
									<span class="first">￥5</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/69ded706306720ef5db575aa005047c96a8d7c.jpg">
									<p>
										共5课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">定路线No.4 网管员职业发展路线</a>
								<p class="course_price">
									<span class="first">￥5</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/56f376f436d5489c16f240bdbf7aafa58cd394.jpg">
									<p>
										共8课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">转折点No.1 程序员到架构师商业画布设计</a>
								<p class="course_price">
									<span class="first">￥9</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/b9ee667831de4d233c335813c1ec623f68c4a6.jpg">
									<p>
										共8课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">转折点No.2 程序员到软件项目经理商业画布设计</a>
								<p class="course_price">
									<span class="first">￥9</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/12d69be39b380aedb59163b62ed0128834b1fd.jpg">
									<p>
										共7课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">转折点No.3 程序员转岗方式分析</a>
								<p class="course_price">
									<span class="first">￥5</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/0644a7006380075163700883348ad22fd798ce.jpg">
									<p>
										共17课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">人才去哪儿？——高级招聘面试技巧视频课程</a>
								<p class="course_price">
									<span class="first">￥199</span>
								</p>
							</li>
							<li>
								<a class="course_img"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank"><img
										src="<%=basePath %>itimage/52287f330d44b64d6d381565d74fa7cc7d68be.png">
									<p>
										共26课时
									</p>
								</a><a class="course_title"
									href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}"
									target="_blank">网络工程师面试视频课程【经典十问】（面试技巧+技术问题）</a>
								<p class="course_price">
									<span class="first">￥49</span>
								</p>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>