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
		
			<!-- lev_secin_cur -->
			<div class="setmain_r right">
				<div class="setbox">
					<div class="Ftitle_all mb25">
						<span class="titxet t18">填写资料</span>
					</div>
					<form id="userInfoForm" method="post"
						action="<%=basePath %>studentservlet?order=teacheradd">
						<input type="hidden" name="teacherid" value="${teacherbean.teacherid}">
      					<input type="hidden" name="name" value="${requestScope.teachername}">
						<input name="_csrf" type="hidden" id="_csrf"
							value="Q1plLm9PbTMTHSJpFhUqCzsvDHswIwcENSMGGAs4Kn4bHCZ7OTZUbA==">
							<div class="formlist t14 validation_or">
								<dl class="formlist_dl clearfix">
									<dt class="left w_110 tr">
										真实姓名：
									</dt>
									<dd class="left w_325 ml10">
										<span> <input require="false" class="input_325"
												datatype="limit|ajax" max="18" placeholder="请填写姓名，最多6个字"
												url="/info/check-real-name" msg="请填写姓名，最多6个字|请输入真实姓名"
												type="text"  name="teachername"  /> </span>
									</dd>

								</dl>
								<div class="set_jy jsErrortrueName">
									<span class="icon_gth"></span><em></em>
								</div>
							</div>
							<div class="formlist t14 validation_or">
								<dl class="formlist_dl clearfix">
									<dt class="left w_110 tr">
										教龄：
									</dt>
									<dd class="left w_325 ml10">
										<span> <input require="false" class="input_325"
												datatype="limit|ajax" max="18" placeholder="请填写姓名，最多6个字"
												url="/info/check-real-name" msg="请填写姓名，最多6个字|请输入真实姓名"
												type="text"  name="teacherjiaolin"  /> </span>
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
										<span class="mr25 pointer_c">
											<input name="teachersex" value="0"type="radio" checked  /> <label for="mail" class="pl10">男</label> 
										</span>
										<span class="mr25 pointer_c">
											<input name="teachersex" type="radio" value="1" /> <label for="femail" class="pl10">女</label> 
										</span>
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
												datatype="phone" msg="区号-主机#分机" placeholder="请输入联系电话" name="teachermobile"
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
										<span> <input type="text" require="false"
												datatype="phone" msg="区号-主机#分机"  placeholder="请输入电子邮箱" name="teacheremail" 
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
										技术涉及：
									</dt>
									<dd class="left w_325 ml10 position_r">
										<span><input type="text" class="input_325  val_set_fc"
												id="val_set_fc" placeholder="请选择关注领域" name="teacherspecial" readonly="readonly" /> </span>
										<input type="hidden" id="areaId" name="areaId" value="" />
										<input type="hidden" id="areaOtherId" name="areaid_other"
											value="" />
										<div class="fc_area jsareaDiv">

										</div>
									</dd>
								</dl>
								<div class="set_jy jsErrorarea">
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
										<span> <input type="text" require="false"
												datatype="phone" msg="区号-主机#分机"  placeholder="请输入详细的家庭住址" name="teacheraddress" 
												class="input_325" /> </span>
									</dd>
								</dl>
								<div class="set_jy jsErrorphone">
									<span class="icon_gth"></span><em></em>
								</div>
							</div>
							<div class="pl40">
								<div class="Ftitle_all mb25">
									<span class="titxet t18">工作和教育经历</span>
								</div>
							</div>
							<div class="formlist t14 validation_or">
								<dl class="formlist_dl clearfix">
									<dt class="left w_110 tr">
										学历：
									</dt>
									<dd class="left w_325 ml10">
										<span> <input type="text" require="false"
												datatype="phone" msg="区号-主机#分机" placeholder="请输入你的学历" name="teacheredution" 
												class="input_325" /> </span>
									</dd>
								</dl>
								<div class="set_jy jsErrorphone">
									<span class="icon_gth"></span><em></em>
								</div>
							</div>
							<div class="formlist t14 jsformWork" index=0>
								<dl class="formlist_dl clearfix">
									<dt class="left w_110 tr">
										工作经历：
									</dt>
									<dd class="left  ml10" style="z-index: 8">
										<div class="mb20 clearfix position_r validation_or">
											<span class="left"><textarea name="teacherjianjie" placeholder="请填写工作经历，最多30个字"  rows="3" cols="6"
													require="false" datatype="limit" msg="工作单位字数在0到30之间"
													max="90" type="text" class="input_325"
													 ></textarea></span>
										</div>
									</dd>
								</dl>
							</div>
							<div class="pl40">
								<div class="Ftitle_all mb25">
									<span class="titxet t18">银行账户</span>
								</div>
							</div>
							<div class="formlist t14 validation_or">
									<dl class="formlist_dl clearfix">
										<dt class="left w_110 tr">
											银行名称：
										</dt>
										<dd class="left w_325 ml10 jsGetAddress">
											<table id="tab">
												<tr>
													<td>
														<font size="3" face="楷体"></font>
													</td>
													<td>
														<select id="JsGetCity" name="bankid">
															<option>请选择银行名称</option> 
															<c:forEach items="${banklist}" var="b">
												            	<option value="${b.bank_id}">${b.bank_name}</option>
												            </c:forEach>
														</select>
													</td>
												</tr>
											</table>

										</dd>
									</dl>
							</div>
							<div class="formlist t14 validation_or">
								<dl class="formlist_dl clearfix">
									<dt class="left w_110 tr">
										银行账户：
									</dt>
									<dd class="left w_325 ml10">
										<span> <input type="text" require="false"
												datatype="phone" msg="区号-主机#分机" placeholder="请填写银行账户" name="teacherbanknumber" 
												class="input_325" /> </span>
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
							</form>
						</div>
						<table height="82px" border="0">
							<tr><td>&nbsp;&nbsp;&nbsp;</td></tr>
						</table>
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
