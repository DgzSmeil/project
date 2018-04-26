<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<style>
	.asd{
		margin-bottom: 10px;
		text-align: left;
		font-size: 16px;
	}
</style>

<style>
	.td{
		width: 200px;height: 32px;
		border: none;
		readonly:true;
	}
</style>


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>普金资本-后台管理</title>
	<%@include file="../master/easyui/header.jsp" %>
</head>
<body class="easyui-layout">
<div data-options="region:'north'" style="height: 60px;">
	<div id="logo"><img src="<%=path %>/static/images/logo.png" /></div>
	<div id="wel_msg">欢迎您：${huser.phone}&nbsp;&nbsp;
		<a href="javascript:void(0);" onclick="openWin('updatepwdWin')">修改密码</a>&nbsp;&nbsp;
		<a href="<%=path %>/huser/down">安全退出</a>
	</div>
	<p class="clear"></p>
</div>

<div data-options="region:'sou\th',split:true" style="height: 50px;">Copyright&copy;P2P</div>
<div data-options="region:'west',split:true" title="主菜单" style="width: 250px;">
	<div class="easyui-accordion">
		<div title="用户管理" data-options="iconCls:'icon-ok'" style="padding: 10px;">
			<ul>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>/huser/userlist_page"
					   class="site-navi-tab">用户基本信息管理</a></li>
				<shiro:hasPermission name="recommend:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/recommend/page"
						   class="site-navi-tab">推荐人管理</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="option:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/option/page"
						   class="site-navi-tab">用户反馈</a></li>
				</shiro:hasPermission>
			</ul>
		</div>
		<div title="资金管理" data-options="iconCls:'icon-ok'" style="padding: 10px;">
			<ul>
				<shiro:hasPermission name="userMoney:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/userMoney/page"
									   class="site-navi-tab">用户资金管理</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="tzb:htzb">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/tzb/htzb"
									   class="site-navi-tab">用户投资管理</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="bank:huserpage">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/bank/huserpage"
									   class="site-navi-tab">银行卡管理</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="logczz:backcz">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/logczz/backcz"
						   class="site-navi-tab">充值记录</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="ticket:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/ticket/page"
						   class="site-navi-tab">优惠券管理</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="uticket:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/uticket/page"
						   class="site-navi-tab">用户领券管理</a></li>
				</shiro:hasPermission>
				<%--<li class="asd"><a href="javascript:void(0);" src="<%=path%>/huser/huserlist_page"--%>
							<%--class="site-navi-tab">投资奖励管理</a></li>--%>
			</ul>
		</div>
		<div title="借贷管理" data-options="iconCls:'icon-ok'" style="padding: 10px;">
			<ul>
				<shiro:hasPermission name="borrowApply:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/borrowApply/page"
						   class="site-navi-tab">全部借款</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="borrowApply:hhkb_list">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/borrowApply/hhkb_list"
									   class="site-navi-tab">全部还款</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="hkb:hkb_state">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/hkb/hhkb_state"
									   class="site-navi-tab">逾期借款</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="sway:sway">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/sway/sway"
						   class="site-navi-tab">还款方式</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="bz:bz">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/bz/bz"
						   class="site-navi-tab">标种类型</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="jklx:jklx">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/jklx/jklx"
						   class="site-navi-tab">借款类型</a></li>
				</shiro:hasPermission>
			</ul>
		</div>
		<div title="宣传管理" data-options="iconCls:'icon-ok'" style="padding: 10px;">
			<ul>
				<shiro:hasPermission name="dynamic:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/dynamic/page"
									   class="site-navi-tab">公司动态</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="media:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/media/page"
									   class="site-navi-tab">媒体报道</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="home:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/home/page"
									   class="site-navi-tab">首页信息管理</a></li>
				</shiro:hasPermission>
				<%--<shiro:hasPermission name="dxModel:dxModel">--%>
					<%--<li class="asd"><a href="javascript:void(0);" src="<%=path%>/dxModel/dxModel"--%>
						   <%--class="site-navi-tab">短信模板管理</a></li>--%>
				<%--</shiro:hasPermission>--%>
				<shiro:hasPermission name="notice:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/notice/page"
									   class="site-navi-tab">公告管理</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="friend:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/friend/page"
									   class="site-navi-tab">合作伙伴</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="letter:page">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/letter/page"
									   class="site-navi-tab">站内信管理</a></li>
				</shiro:hasPermission>
				<%--<li class="asd"><a href="javascript:void(0);" src="<%=path%>"--%>
					   <%--class="site-navi-tab">活动管理</a></li>--%>
				<%--<li class="asd"><a href="javascript:void(0);" src="<%=path%>"--%>
					   <%--class="site-navi-tab">运营数据管理</a></li>--%>
			</ul>
		</div>

		<div title="审核管理" data-options="iconCls:'icon-ok'" style="padding: 10px;">
			<ul>
				<shiro:hasPermission name="jkb:jkb_listPage">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/jkb/jkb_listPage"
						   class="site-navi-tab">借款审核</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="logtx:backtxsh">
					<li class="asd"><a href="javascript:void(0);" src="<%=path%>/logtx/backtxsh"
						   class="site-navi-tab">提现审核</a></li>
				</shiro:hasPermission>
				<li class="asd"><a href="javascript:void(0);" src="<%=path%>/rzvip/checkrzVip"
								   class="site-navi-tab">用户认证审核</a></li>
			</ul>
		</div>
		<shiro:hasAnyRoles name="超级管理员,普通管理员">
			<div title="管理员管理" data-options="iconCls:'icon-ok'" style="padding: 10px;">
				<ul>
					<shiro:hasRole name="超级管理员">
							<li class="asd"><a href="javascript:void(0);" src="<%=path%>/huser/page"
								class="site-navi-tab">管理员列表</a></li>
					</shiro:hasRole>
					<shiro:hasAnyRoles name="超级管理员,普通管理员">
						<li class="asd"><a href="javascript:void(0);" src="<%=path%>/huser/page1"
										   class="site-navi-tab">员工列表</a></li>
					</shiro:hasAnyRoles>
					</ul>
			</div>
		</shiro:hasAnyRoles>

		<shiro:hasAnyRoles name="超级管理员,普通管理员">
			<div title="权限管理" data-options="iconCls:'icon-ok'" style="padding: 10px;">
				<ul>
					<shiro:hasPermission name="jur:page">
						<li class="asd"><a href="javascript:void(0);" src="<%=path%>/jur/page"
							   class="site-navi-tab">权限列表</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="role:page">
						<li class="asd"><a href="javascript:void(0);" src="<%=path%>/role/page"
							   class="site-navi-tab">角色列表</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="roleUser:page">
						<li class="asd"><a href="javascript:void(0);" src="<%=path%>/roleUser/page"
							   class="site-navi-tab">用户角色</a></li>
					</shiro:hasPermission>
				</ul>
			</div>
		</shiro:hasAnyRoles>
	</div>
</div>
<div id="tabs" class="easyui-tabs" data-options="region:'center'">
	<div title="管理员基本信息管理" style="padding: 10px">
		<div class="easyui-panel my-panel" title="" style="height: 100%">
			<table id="list" class="easyui-datagrid" >
				<thead>
				<tr>
					<form id="form1">
						<input type="hidden" name="huid" id="huid" value="${requestScope.hUser.huid}">
						<table>
							<tr>
								<td width="100px">用户名:</td>
								<td>
									<input name="huname" id="huname" class="td" value="${requestScope.hUser.huname}"/>
								</td>
							</tr>
							<tr>
								<td width="100px">手机号:</td>
								<td>
									<input name="phone" id="phone" class="td" value="${requestScope.hUser.phone}"/>
								</td>
							</tr>
							<tr>
								<td width="100px">真实姓名:</td>
								<td>
									<input name="rname" class="td" id="rname" value="${requestScope.hUser.rname}"/>
								</td>
							</tr>
							<tr>
								<td width="100px">性别:</td>
								<td  >
									<c:if test="${hUser.sex == 0}">
										<select id="sex" name="sex" class="" style="height: 32px;width: 150px;border: none">
											<option value="0" selected>男</option>
											<option value="1">女</option>
										</select>
									</c:if>
									<c:if test="${hUser.sex == 1}">
										<select id="sex" name="sex" class="" style="height: 32px;width: 150px;border: none">
											<option value="0" >男</option>
											<option value="1" selected>女</option>
										</select>
									</c:if>
								</td>
							</tr>
							<tr>
								<td width="100px">邮箱:</td>
								<td>
									<input name="email" id="email" class="td" value="${requestScope.hUser.email}"/>
								</td>
							</tr>
							<tr style="display: none" id="tr1">
								<td colspan="2">
									<div style="margin:10px 0;"></div>
									<a class="easyui-linkbutton" onclick="updatehuser('/huser/update', 'form1');">确认</a>
								</td>
							</tr>
						</table>
					</form>
				</tr>
				</thead>
			</table>
		</div>
	</div>
</div>

<div id="updatepwdWin" class="easyui-window normal_win" data-options="title:'用户修改密码', closed:true">
	<form id="updatepwdForm">
		<table>
			<tr>
				<td>旧密码:</td>
				<td>
					<input name="oldpwd" type="password" class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入旧密码',
                               required:true,
                        novalidate:true" id="oldpwd"/>
				</td>
			</tr>
			<tr>
				<td>新密码:</td>
				<td>
					<input name="newpwd" type="password" class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入新密码',
                                   required:true,
                            novalidate:true" id="newpwd"/>
				</td>
			</tr>
			<tr>
				<td>确认密码:</td>
				<td>
					<input name="newpwd1" type="password" class="easyui-textbox easyui-validatebox" data-options="prompt:'请输入确认密码',
                               required:true,
                        novalidate:true" id="newpwd1"/>
				</td>
			</tr>
			<tr>
				<td><a class="easyui-linkbutton" onclick="updatepwd()">确认</a></td>
			</tr>
		</table>
	</form>
</div>

<div id="mm" class="easyui-menu">
	<div id="mm-tabupdate">刷新</div>
	<div class="menu-sep"></div>
	<div id="mm-tabclose">关闭</div>
	<div id="mm-tabcloseother">关闭其他</div>
	<div id="mm-tabcloseall">关闭全部</div>
</div>
</body>
<%@include file="../master/easyui/footer.jsp" %>
<script>
    $(function () {
        $("#sex").change(function(){
            $("#tr1").show();
        })
        $(".td").change(function(){
            $("#tr1").show();
        })
//        $("#sex").click(function(){
//            $("#td2").show();
//            $("#td1").hide();
//        });
    });

    function updatehuser(url, formId) {
		var huid = $('#huid').val();
        var huname = $('#huname').val();
        var phone = $('#phone').val();
        var rname = $('#rname').val();
        var sex = $('#sex').val();
        var email = $('#email').val();
		$.post(contextPath + url,
			{
				huid:huid,
				huname:huname,
				phone:phone,
				rname:rname,
				sex:sex,
				email:email
			},
			function (data) {
				if (data.result === "ok") {
					showInfoAlert(data.message);
				} else {
					showInfoAlert(data.message);
				}
			},
			'json'
		);
	}

</script>
</html>
