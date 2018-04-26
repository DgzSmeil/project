<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="SQLBean.TeacherBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="SQLBean.StudentBean"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html lang="en-US">
	<head>
		<%
			StudentBean studentbean = (StudentBean) session
					.getAttribute("bean");
			int num = Integer.parseInt(session.getAttribute("num").toString());
			float money = Float.parseFloat(session.getAttribute("mm")
					.toString());
		%>
		<meta charset="UTF-8">
		<meta name="csrf-param" content="_csrf">
		<meta name="csrf-token"
			content="a0x3MUNHVHE7OT5yBzM7Ezp7IXZ1H2ElLSFGQhR.AS4ENDtCGxZjPw==">
		<title><%=studentbean.getStudentname()%>的个人主页-IT课堂</title>
		<link rel="shortcut icon"
			href="https://static5.51cto.com/home/web/images/favicon.ico"
			type="image/x-icon">
		<link href="https://static5.51cto.com/home/web/css/public.css?v=10005"
			rel="stylesheet">
		<link href="https://static4.51cto.com/home/web/css/myzy.css?v=10002"
			rel="stylesheet">
		<script
			src="https://static5.51cto.com/home/web/js/jquery.min.js?v=10001"></script>
		<script
			src="https://static5.51cto.com/home/web/js/system/yii.js?v=10001"></script>
		<script src="https://static4.51cto.com/home/web/js/51cto.js?v=10001"></script>
		<script
			src="https://static5.51cto.com/home/web/js/jquery.message.js?v=10001"></script>
		<script src="https://static5.51cto.com/home/web/js/public.js?v=10003"></script>
		<script src="https://static3.51cto.com/home/web/js/imgscal.js?v=10001"></script>
		<script
			src="https://static1.51cto.com/home/web/js/jquery.masonry.min.js?v=10001"></script>
		<script
			src="https://static1.51cto.com/home/web/js/tip/jquery.cluetip.js?v=10001"></script>

		<link
			href="https://static5.51cto.com/home/web/css/jquery-ui.css?v=10002"
			rel="stylesheet">
		<link
			href="https://static5.51cto.com/home/web/css/datepicker.css?v=10002"
			rel="stylesheet">
		<link href="https://static5.51cto.com/home/web/css/public.css?v=10005"
			rel="stylesheet">
		<link href="https://static4.51cto.com/home/web/css/fset.css?v=10001"
			rel="stylesheet">
		<script
			src="https://static5.51cto.com/home/web/js/jquery.min.js?v=10001"></script>
		<script
			src="https://static5.51cto.com/home/web/js/system/yii.js?v=10001"></script>
		<script src="https://static4.51cto.com/home/web/js/51cto.js?v=10001"></script>
		<script
			src="https://static5.51cto.com/home/web/js/jquery.message.js?v=10001"></script>
		<script src="https://static5.51cto.com/home/web/js/public.js?v=10003"></script>
		<script src="https://static3.51cto.com/home/web/js/imgscal.js?v=10001"></script>
		<script
			src="https://static1.51cto.com/home/web/js/jquery.masonry.min.js?v=10001"></script>
		<script
			src="https://static1.51cto.com/home/web/js/tip/jquery.cluetip.js?v=10001"></script>
		<script
			src="https://static2.51cto.com/home/web/js/public/ts_common.js?v=10003"></script>
		<script
			src="https://static3.51cto.com/home/web/js/public/info.js?v=10014"></script>
		<script
			src="https://static1.51cto.com/home/web/js/public/msg.js?v=10001"></script>
		<script type="text/javascript">
			$(function(){
				$("#JsGetCity").bind("change",function(){
					$.post(
						"${pageContext.request.contextPath}/myinfoservlet",
						{
							"order":"changecity",
							"provinceid":$("#JsGetCity").val()
						},
						function(data){
							var op = "<option>请选择地区</option>";
							for(var i=0;i<data.length;i++){
								op+="<option value='"+data[i].cityid+"'>"+data[i].cityname+"</option>"
							}
							$("#cityid").html(op);
						},
						"json"
					);
				});
				
			
			});
		
		</script>
	</head>
	<!--简导航开始-->
	<body background="white">
		<!--主体开始-->
		<div class="main mb20" style="height: 980px">
			<div class="center clearfix" style="width: 980px;">
				<div class="mainindex_l center" style="width: 980px; height: 200px">
					<div class="memdatabox clearfix white_box mb20" id="Editor_num">
						<div class="portbox left">
							<div class="mb10">
								<table width="100%">
									<tr>
										<td height="100">
											<img
												src="<%=basePath%><%=studentbean.getStudentface()%>"
												alt="<%=studentbean.getStudentname()%>"
												style="width: 120px; height: 120px; margin: 3px auto; border-radius: 50%" />
										</td>
									</tr>
								</table>
							</div>
							<div class="datas clearfix">
								<div class="num left tc">
									<a href="/user-follow-fans/fans?uid=12569085"><span>100</span>
										<br /> <strong>粉丝</strong> </a>
								</div>
								<div class="line left"></div>
								<div class="num right tc">
									<a href="/user-follow-fans/follow?uid=12569085"><span>100</span>
										<br /> <strong>关注</strong> </a>
								</div>
							</div>
						</div>
						<div class="port_m_box left  ml20">
							<div class="name">
								<a
									href="<%=basePath%>loginservlet?order=loginin&name=<%=studentbean.getStudentmobile()%>"
									class="left"><%=studentbean.getStudentmobile()%></a>
								<c:if test="<%=studentbean.getVIP()!=1 %>">
									<a target="_blank" href="<%=basePath%>myinfoservlet?order=info" target=""><b >&nbsp;&nbsp;<img src="<%=basePath %>images/vip_grey2.png" style="margin-top: 0px;height:20px;width:20px;border-radius:50%"/> </b></a>
								</c:if>
								<c:if test="<%=studentbean.getVIP()==1 %>">
									<a target="_blank" href="<%=basePath%>myinfoservlet?order=info" target="">&nbsp;&nbsp;<b ><img src="<%=basePath %>images/vipred.png" style="margin-top: 0px;height:20px;width:20px;border-radius:50%"/> </b></a>
								</c:if>
							</div>
							<div class="my_messages">
								<span class="Mes_num">当前名称：<b><%=studentbean.getStudentname()%></b>
								</span>
								<c:if test="<%=studentbean.getStudentsex() == 0%>">
									<span class="Mes_num">性别：<b>男</b> </span>
								</c:if>
								<c:if test="<%=studentbean.getStudentsex() == 1%>">
									<span class="Mes_num">性别：<b>女</b> </span>
								</c:if>
								<c:if test="<%=studentbean.getLeibie() != 0%>">
									<span class="Mes_num">所属类别：<b>学生</b> </span>
								</c:if>
								<c:if test="<%=studentbean.getLeibie() == 0%>">
									<span class="Mes_num">所属类别：<b>讲师</b> </span>
								</c:if>
							</div>

							<div class="my_messages">
								<span class="Mes_num">注册日期：<b><%=studentbean.getStudentregisterdate()%>
										&nbsp;</b> </span>
							</div>
							<div class="my_messages">
								<span class="Mes_num">所在省份：<b><%=studentbean.getProvincename()%>
										&nbsp;</b> </span>
								<span class="Mes_num">所居城市：<b><%=studentbean.getCityname()%></b>
								</span>
							</div>

							<div class="my_messages">
								<span class="Mes_num">邮箱地址：<b>
									<c:if test="<%=studentbean.getStudentemail()==null%>">
										数据暂无
									</c:if>
									<c:if test="<%=studentbean.getStudentemail()!=null%>">
										<%=studentbean.getStudentemail()%>
									</c:if>
										&nbsp;</b> </span>
								<span class="Mes_num">现居城市：<b>
									<c:if test="<%=studentbean.getStudenthomeaddress()==null%>">
										数据暂缺
									</c:if>
									<c:if test="<%=studentbean.getStudenthomeaddress()!=null%>">
										<%=studentbean.getStudenthomeaddress()%>
									</c:if>
								</b>
								</span>
							</div>
						</div>
						<ul class="my_assets position_a clearfix">
							<li>
								<a href="javascript:void(0);" target="_blank"><strong>10</strong><span>无忧币</span>
								</a>
							</li>
							<li>
								<a href="javascript:void(0);" target="_blank"><strong>5</strong><span>下载豆</span>
								</a>
							</li>
							<li class="last">
								<c:if test="<%=studentbean.getLeibie() == 0%>">
									<a href="javascript:void(0);" target="_blank"><strong><%=money%></strong><span>收入</span>
									</a>
								</c:if>
								<c:if test="<%=studentbean.getLeibie() != 0%>">
									<a href="javascript:void(0);" target="_blank"><strong><%=money%></strong><span>余额</span>
									</a>
								</c:if>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- lev_secin_cur -->
			<div class="setmain_r right">
				<div class="setbox">
					<div class="Ftitle_all mb25">
						<span class="titxet t18">个人资料</span>
					</div>
					<form id="userInfoForm" method="post"
						action="<%=basePath %>studentservlet?order=updatesave">
						<input type="hidden" name="studentid" value="<%=studentbean.getStudentid() %>">
      					<input type="hidden" name="studentname" value="<%=studentbean.getStudentname() %>">
						<input name="_csrf" type="hidden" id="_csrf"
							value="Q1plLm9PbTMTHSJpFhUqCzsvDHswIwcENSMGGAs4Kn4bHCZ7OTZUbA==">
						<div class="grzl_box">

							<div class="formlist t14 validation_or">
								<dl class="formlist_dl clearfix">
									<dt class="left w_110 tr">
										昵称：
									</dt>
									<dd class="left w_325 ml10">
										<div>
											<div class="ON_change_hide">
												<span class="pr20"><%=studentbean.getStudentname()%></span>
												<span class="ON_change"><b class="mr5"></b>修改</span>
											</div>
											<span class="ON_change_show"> <input
													style="width: 190px;" name="nickname" id="nickname"
													type="text" class="input_143" placeholder="请填写昵称，4-15字符"
													url="javascript:void(0);" msg="昵称不能为空|请输入昵称"
													value="<%=studentbean.getStudentname()%>"
													datatype="limit|ajax" /> <span class=" cl_9 t12">
													180天只能修改一次</span> </span>
										</div>
									</dd>
								</dl>
								<div class="set_jy jsErrornickname">
									<span class="icon_gth"></span><em></em>
								</div>
							</div>
							<div class="formlist t14">
								<dl class="formlist_dl clearfix">
									<dt class="left w_110 tr">
										账号：
									</dt>
									<dd class="left w_325 ml10">
										<span><%=studentbean.getStudentmobile()%></span>
									</dd>
								</dl>
							</div>

							<div class="formlist t14 validation_or">
								<dl class="formlist_dl clearfix">
									<dt class="left w_110 tr">
										姓名：
									</dt>
									<dd class="left w_325 ml10">
										<span> <input require="false" class="input_325"
												datatype="limit|ajax" max="18" placeholder="请填写姓名，最多6个字"
												url="javascript:void(0);" msg="请填写姓名，最多6个字|请输入真实姓名"
												type="text"  name="studentname" value="<%=studentbean.getStudentname() %>" /> </span>
									</dd>

								</dl>
								<div class="set_jy jsErrortrueName">
									<span class="icon_gth"></span><em></em>
								</div>
							</div>
							<div class="formlist t14 validation_or">
								<dl class="formlist_dl clearfix">
									<dt class="left w_110 tr">
										性别：
									</dt>
									<dd class="left w_325 ml10">
										<c:if test="<%=studentbean.getStudentsex()==0 %>">
											<span class="mr25 pointer_c">
												<input name="studentsex" value="0"type="radio" checked  /> <label for="mail" class="pl10">男</label> 
											</span>
											<span class="mr25 pointer_c">
												<input name="studentsex" type="radio" value="1" /> <label for="femail" class="pl10">女</label> 
											</span>
										
										</c:if>
										<c:if test="<%=studentbean.getStudentsex()==1 %>">
											<span class="mr25 pointer_c">
												<input name="studentsex" value="0"type="radio" /> <label for="mail" class="pl10">男</label> 
											</span>
											<span class="mr25 pointer_c">
												<input name="studentsex" type="radio" value="1"  checked /> <label for="femail" class="pl10">女</label> 
											</span>
										
										</c:if>
									</dd>
								</dl>
							</div>
							<div class="formlist t14 validation_or">
								<dl class="formlist_dl clearfix">
									<dt class="left w_110 tr">
										联系电话：
									</dt>
									<dd class="left w_325 ml10">
										<span> <input type="text" require="false"
												datatype="phone" msg="区号-主机#分机" name="studentmobile" value="<%=studentbean.getStudentmobile() %>"
												class="input_325" /> </span>
									</dd>
								</dl>
								<div class="set_jy jsErrorphone">
									<span class="icon_gth"></span><em></em>
								</div>
							</div>
							<div class="formlist t14 validation_or">
								<dl class="formlist_dl clearfix">
									<dt class="left w_110 tr">
										电子邮箱：
									</dt>
									<dd class="left w_325 ml10">
										<span> 
											<c:if test="<%=studentbean.getStudentemail()==null%>">
												<input type="text" require="false"
													datatype="phone" msg="区号-主机#分机" name="studentemail" value="数据暂无"
													class="input_325" />
											</c:if>
											<c:if test="<%=studentbean.getStudentemail()!=null%>">
												<input type="text" require="false"
													datatype="phone" msg="区号-主机#分机" name="studentemail" value="<%=studentbean.getStudentemail()%>"
													class="input_325" />
											</c:if>
										</span>
									</dd>
								</dl>
								<div class="set_jy jsErrorphone">
									<span class="icon_gth"></span><em></em>
								</div>
							</div>
							<div class="formlist t14 validation_or">
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											现居城市：
										</dt>
										<dd class="left w_325 ml10 jsGetAddress">
											<table id="tab">
												<tr>
													<td>
														<font size="3" face="楷体"></font>
													</td>
													<td>
														<select id="JsGetCity" name="province">
															<option>
																请选择省份
															</option> 
															<c:forEach items="${sessionScope.provincelist}" var="p">
																<c:if test="${p.provinceid == studentbean.provinceid}">
												           	 		<option value="${p.provinceid}" selected="selected">${p.provinceName}</option>
												          		</c:if>
												          		<c:if test="${p.provinceid != studentbean.provinceid}">
												           	 		<option value="${p.provinceid}">${p.provinceName}</option>
												          		</c:if>
															</c:forEach>
														</select>
													</td>
													<td>
														<select style="margin-left: 10px;" name="cityid" id="cityid">
															<c:forEach  items="${citylist}" var="p">
												          		<c:if test="${p.cityid==studentbean.cityid}">
												           	 		<option value="${p.cityid}" selected="selected">${p.cityname}</option>
												          		</c:if>
												          		<c:if test="${p.cityid!=studentbean.cityid}">
												           	 		<option value="${p.cityid}">${p.cityname}</option>
												          		</c:if>
											        		</c:forEach>
														</select>
													</td>
												</tr>
											</table>

										</dd>
									</dl>
									<div class="set_jy jsErrorcity">
										<span class="icon_gth"></span><em></em>
									</div>
								</div>
							<div class="formlist t14 validation_or">
								<dl class="formlist_dl clearfix">
									<dt class="left w_110 tr">
										家庭住址：
									</dt>
									<dd class="left w_325 ml10">
										<span> 
											<c:if test="<%=studentbean.getStudenthomeaddress()==null%>">
												<input type="text" require="false"
												datatype="phone" msg="区号-主机#分机" name="teacheraddress"  value="数据暂缺"
												class="input_325" />
											</c:if>
											<c:if test="<%=studentbean.getStudenthomeaddress()!=null%>">
												<input type="text" require="false"
												datatype="phone" msg="区号-主机#分机" name="teacheraddress"  value="<%=studentbean.getStudenthomeaddress()%>"
												class="input_325" />
											</c:if>
										</span>
									</dd>
								</dl>
								<div class="set_jy jsErrorphone">
									<span class="icon_gth"></span><em></em>
								</div>
							</div>
							<input type="hidden" name="workIndex" value="">
							<input type="hidden" name="eduIndex" value="">
							<div class="grzlbox_btn">
								<input name="" type="submit" style="height:30px" value="保存修改 "
									class="setbtn_save jsSaveUserInfo">
							</div>
						</div>
					</form>
				</div>
			</div>
	</body>
	<script src="https://logs.51cto.com/rizhi/count/count.js"></script>
	<script
		src="https://static5.51cto.com/home/web/js/form_check/jquery.validator.reg.js?v=10002"></script>
	<script
		src="https://static5.51cto.com/home/web/js/form_check/jquery.corners.min.js?v=10002"></script>
	<script
		src="https://static5.51cto.com/home/web/js/WdatePicker.js?v=10002"></script>
	<script
		src="https://static5.51cto.com/home/web/js/template/guanzhu.js?v=10002"></script>
	<script
		src="https://static5.51cto.com/home/web/js/public/info_index.js?v=10002"></script>
</html>
