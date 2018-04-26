<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = request.getContextPath();
%>
<html>
<head>
	<title>普金资本平台</title>
</head>

<div class="account-right-nav">
	<div class="sub-a-nav">
		<a href="javascript:void(0);" class="active" >安全保障</a>
		<a href="javascript:void(0);" class="" >操作流程</a>
		<a href="javascript:void(0);" class="" >充值提现</a>
		<a href="javascript:void(0);" class="" >投资理财</a>
		<a href="javascript:void(0);" class="" >注册认证</a>
	</div>
	<em class="em-line"></em>
</div>
<div class="account-content" style="padding-top:0;">
	<div class="content">
		<p class="text-que">本金和收益是否可以得到保障？</p>
		<p class="text-ans">普金资本推荐的产品中包含的借款项目，以及多金宝项目均是通过多重审核机构审核，外加借款方连带担保责任，充分保障投资人本金及投资收益。</p>
		<p class="text-que">普金资本是合法的运营网站吗？</p>
		<p class="text-ans">
			普金资本是由国资委牵头参股搭建的互联网金融平台，属于合法运营的网站。<br>
			<a href="http://www.gzctgroup.cn">赣州城投发展有限公司</a><br>
			<a href="https://credit.szfw.org/CX20160720023638001698.html">诚信网站认证</a><br>
			<a href="http://gsxt.saic.gov.cn/">工商企业信用信息查询：全国企业信用信息网</a>。查询时请输入公司名称“普金资本运营（赣州）有限公司”<br>
		</p>
		<p class="text-que">如何保障我资金安全？</p>
		<p class="text-ans">
			1、数据安全： 三层防火墙隔离系统的访问层、应用层和数据层集群；有效的入侵防范及容灾备份，确保交易数据安全无虞；<br>
			2、隐私安全：普金资本在任何情况下都绝不会出售、出租或以任何其他形式泄漏您的信息。您的信息按照《普金资本投资咨询服务协议》中的规定被严格保护。
		</p>
		<p class="text-que">网上交易保障中心是什么？</p>
		<p class="text-ans">投资成功之后，也是由第三方支付公司汇付天下把钱打给借款人，资金从保管账户转入借款人账户后会在网上交易保障中心生成一份电子回单。这份电子回单类似于银行转账汇款单一样，有”电子签名“和“时间戳”，保障并确认资金的最终流向，让投资人对自己的每笔资金都能清楚了解在什么时间，转给了谁。</p>
		<p class="text-que">隐私和资料安全如何保障？</p>
		<p class="text-ans">尊重用户个人隐私是本网站的一项基本原则，普金资本郑重承诺在任何情况下都绝不会出售、出租或以任何其他形式泄露您的信息。同时，普金资本在数据加密及操作流程上对用户的隐私信息进行严密的保护。普金资本是一个实名认证平台，用户在平台上交流的过程中，也需要时刻注意保护个人隐私，截图注意覆盖个人信息，不要随意透露真实姓名与住址等，以防信息被盗造成损失。
		</p>
		<p class="text-que">在普金资本投资是否受到法律保护？</p>
		<p class="text-ans">投资人在普金资本的投资理财受到法律保护，普金资本提供的是居间服务，通俗的说，普金资本提供的是平台服务，法律根据有《合同法》和《关于人民法院审理借贷案件的若干意见》。</p>
	</div>
	<div class="content">
		<p class="text-que">充值流程</p>
		<p class="text-ans">
			先登录账户，可自由选择多个入口进行充值，登录后在首页上方点击“充值”→快速进入充值界面；或者登录后在首页直接点击“我的账户”，也可直接进入充值界面。<br>
			<img alt="充值图片" src="<%=path%>/static/resources/front/v01/src/images/help/common/flow_01.png"><br>
			进入充值界面，输入“充值金额”→点击“立即充值”，根据界面所示，选择相应的充值方式及银行卡,即可完成充值。<br>
			<img alt="充值图片" src="<%=path%>/static/resources/front/v01/src/images/help/common/flow_02.png">
		</p>

		<p class="text-que">提现操作</p>
		<p class="text-ans">
			1、登录个人账户，进入“我的账户”，点击“提现”；如下图界面所示<br>
			<img alt="提现图片" src="<%=path%>/static/resources/front/v01/src/images/help/common/flow_03.png"><br>
			2、确认提现银行帐号、用户真实姓名、等信息；<br>
			3、输入提现金额和交易密码；<br>
			4、点击“获取验证码”按钮获取手机验证码，并在获取后输入手机验证码；<br>
			5、确认所有信息无误后，点击“立即提现”，完成提现；
		</p>

		<p class="text-que">投资流程</p>
		<p class="text-ans">
			步骤一：登录www.pujinziben.com，选择要购买的项目，输入购买金额，点击【立即投标】<br>
			<img alt="投资图片" src="<%=path%>/static/resources/front/v01/src/images/help/common/flow_04.png"><br>
			步骤二，确认购买信息，如信息无误，请点击【确认】完成购买
		</p>

		<p class="text-que">银行卡绑定</p>
		<p class="text-ans">
			1、登录个人账户，进入“我的账户”，点击“我的银行卡”→“添加银行卡”；进入界面<br>
			<img alt="银行卡绑定图片" src="<%=path%>/static/resources/front/v01/src/images/help/common/flow_05.png"><br>
			2、确认用户真实姓名；<br>
			3、选择所属银行及银行卡所属地；<br>
			4、填写银行卡号汇付交易密码；<br>
			5、确认所有信息无误后，点击“确定”，完成银行卡绑定；
		</p>

		<p class="text-que">账户安全设置</p>
		<p class="text-ans">
			1、登录个人账户，进入“我的账户”，左下角点击“安全设置”；如下图界面所示<br>
			<img alt="账户安全设置" src="<%=path%>/static/resources/front/v01/src/images/help/common/flow_06.png"><br>
			2、根据提示完善邮箱绑定、身份认证、及交易密码设置。
		</p>

		<p class="text-que">忘记登录密码怎么办？</p>
		<p class="text-ans">
			在登录页面选择“忘记密码”进行重置，通过用户已经绑定的手机号码进行找回。<br>
			<img alt="忘记登录密码" src="<%=path%>/static/resources/front/v01/src/images/help/common/flow_07.png"><br>
		</p>

		<p class="text-que">注册流程</p>
		<p class="text-ans">
			登录www.pujinziben.com，进入普金资本首页，点击首页右上方的【注册】，进入注册页面,根据提示输入用户名、登录密码→获取验证码→同意注册条款，然后点击【注册】<br>
			<img alt="注册流程" src="<%=path%>/static/resources/front/v01/src/images/help/common/flow_08.png"><br>
		</p>

		<p class="text-que">转让操作</p>
		<p class="text-ans">
			1、登录个人账户，进入“我的账户”→左侧菜单栏选择“债权管理”→“可转让”；如下图如示：<br>
			<img alt="转让操作" src="<%=path%>/static/resources/front/v01/src/images/help/common/flow_09.png"><br>
			2、点击“债权转让”进入转让设置<br>
			<img alt="债权转让" src="<%=path%>/static/resources/front/v01/src/images/help/common/flow_10.png"><br>
			3、按要求选择转让期限、填写转让价格、交易密码及转让描述，点击“转让”。
		</p>


	</div>
	<div class="content">
		<p class="text-que">充值时开户不成功应该如何解决？</p>
		<p class="text-ans">
			根据汇付天下方面的反馈，开户不成功，通常有三种情况：<br>
			（1）根据页面提示的报错信息,对自己填写的姓名、身份证号码、银行卡号码、手机号（与银行卡预留手机号保持一致）进行校对,确认填写无误。<br>
			（2）银行卡问题： 您输入的银行卡没有开通网上银行业务。<br>
			（3）用户开户时填写的信息与银行已有用户的信息重复。
		</p>

		<p class="text-que">充值收费吗？</p>
		<p class="text-ans">
			暂不收取，普金资本将为客户垫付充值手续费，实现客户充值零费用。
		</p>

		<p class="text-que">如何充值？普金资本支持信用卡充值吗？</p>
		<p class="text-ans">
			普金资本网是一个中立的交易平台，并不实际存放投资者和借款人的资金。您的资金被存放在汇付天下电子账户。<br>
			（1）登录账户，进入“我的账户”页面，点击充值按钮。<br>
			（2）输入充值金额。<br>
			（3）充值后，显示成功付款，等待5秒钟，页面成功跳转到普金资本网页面，充值成功。<br>
			（4）您可以通过“我的账户” -“资金记录”查看充值的金额及交易记录。<br>
			普金资本暂不支持信用卡充值。
		</p>

		<p class="text-que">提现失败是什么原因？</p>
		<p class="text-ans">
			（1）账户未绑定银行卡。<br>
			（2）提现金额超过账户可用余额。<br>
			（3）大额提现时输错开户行号。
		</p>

		<p class="text-que">提现收费吗？提现的额度有限制吗？</p>
		<p class="text-ans">
			普金资本充值未投标的资金，15天内提现收取本金的0.5%提现服务费，15天后提现免费。<br>
			另汇付天下支付平台会收取用户每笔2元的提现手续费。<br>
			普金资本对于客户的充值没有金额和次数限制，但客户在充值时的单笔限额取决于充值银行。<br>
			最低的提现金额必须要在100元或以上，最高的提现金额为个人账户内可用余额。
		</p>

		<p class="text-que">提现需要多久到账？</p>
		<p class="text-ans">
			实时提现，T+1个工作日到账。
		</p>

		<p class="text-que">提现需要注意哪些问题？</p>
		<p class="text-ans">
			（1）进入我的账户-我的银行卡，绑定银行卡，提现金额将汇入此银行卡<br>
			（2）确保绑定的银行卡的开户人姓名和身份证号与平台实名登记信息保持一致
		</p>

		<p class="text-que">为什么我的账户资金不能投资也不能提现？</p>
		<p class="text-ans">
			如果您的账户资金不能投资和提现，可能存在以下三种情况：<br>
			1、由于网络问题导致操作延时，请您刷新网页后重新操作；<br>
			2、由于平台故障引起您暂时无法投资和提现，请及时联系在线客服或致电400-606-2079为您服务；<br>
			3、由于您的账户存在异常，账户资金被“冻结”，届时请您配合客服的核查工作；排除异常后，您的资金将立即“解冻”，您可以自主选择投资或提现。
		</p>

		<p class="text-que">为什么银行已扣款，但平台账户余额没有增加？</p>
		<p class="text-ans">
			（1）由于网络不稳定造成的显示不同步；<br>
			（2）在无提示关闭或交易成功的情况下关闭页面，导致充值资金延迟到账或掉单；<br>
			（3）同一时间使用同一个第三方充值端口的用户较多，第三方支付平台偶有延迟，造成网银显示与平台账户金额不同步。<br>
			如出现充值未到账情况，请保留网银充值截图，稍后刷新网页；如还未到账，请致电客服：400-606-2079为您服务。
		</p>

	</div>

	<div class="content">
		<p class="text-que">等额本息的还款方式有哪些优点？</p>
		<p class="text-ans">
			等额本息是业内普遍采用的还款方式，具有如下优点：<br>
			（1）有助于减轻借款人阶段性还款压力，降低借款人违约风险；<br>
			（2）每月都有收益和本金回款，大幅提升出借人资金流动性；<br>
			（3）借款人需按月持续还款，若其经济情况恶化，则会从当期逾期得到体现，还款风险立即暴露，我方可及时采取措施挽回损失。
		</p>

		<p class="text-que">借款项目出现逾期或坏账怎么处理？</p>
		<p class="text-ans">
			担保公司为本合同项下借款的本金以及利息提供不可撤销的连带保证。如借款期限届满之日<br>
			借款企业不能偿还投资人本金及利息，担保公司将于债权届满七个工作日内按照本合同约定<br>
			向投资人偿付借款的本金和利息。如在借款期限内借款企业不能按照约定向投资人支付利息，<br>
			则担保公司将于借款企业违约后七个工作日内按照约定向借款人支付利息。
		</p>

		<p class="text-que">普金资本目前产品有哪几类？收益率为多少？</p>
		<p class="text-ans">
			<b>恒金保（预期年化收益6%-10%）</b><br>
			以保理公司持有的大型知名企业签发并承兑的商业承兑汇票为还款保障的金融产品，借款到<br>
			期时，保理公司以承兑企业无条件支付的票面资金用于归还借款本息。该产品充分发挥了大<br>
			型企业的信用价值，在为借款中小微企业解决融资问题的同时，还为投资人提供了风险可控<br>
			的金融产品。<br>
			<b>普金保（预期年化收益8%-12%）</b><br>
			基于供应链上下游的采购贸易，为采购方或项目方提供融资，融资方以应收账款质押、保证<br>
			金担保等形式为借款提供担保。<br>
			<b>多金宝（预期年化收益9%-15%）</b><br>
			企业由于生产经营周转或项目投资需要资金，提供足值的不动产或动产作为抵质押物申请借<br>
			款。
		</p>

		<p class="text-que">普金资本目前的还款方式有哪些？</p>
		<p class="text-ans">
			还款方式根据项目种类不同，现分为如下三种：<br>
			1、等额本息还款：在还款期内，每月偿还同等数额的本金和利息。<br>
			2、先息后本：每月还利息，到期后一次性还本金。<br>
			3、一次还本付息：到期后一次性归还本金和利息。
		</p>

		<p class="text-que">投资成功后什么时候开始计息？</p>
		<p class="text-ans">
			满标审核后开始计息。
		</p>

		<p class="text-que">投资成功后是否可以撤销？</p>
		<p class="text-ans">
			所有项目在购买成功后均不可以撤销。
		</p>

		<p class="text-que">投资的起始金额为多少？</p>
		<p class="text-ans">
			普金资本项目最低投资金额为100元。
		</p>

		<p class="text-que">投资资金有限制吗？</p>
		<p class="text-ans">
			普金资本目前在售项目投资起点金额为100元，上限不超过项目借款总金额。
		</p>
	</div>

	<div class="content">
		<p class="text-que">为什么实名认证通不能通过？</p>
		<p class="text-ans">
			以下三种情况可能会导致实名认证无法通过：<br>
			（1）军人身份；<br>
			（2）港澳台同胞以及国外户口；<br>
			（3）户口办理过迁移没有落户成功或落户时信息未做变更，无法通过审核。
		</p>

		<p class="text-que">为什么要进行实名登记？</p>
		<p class="text-ans">
			为了提高账户安全等级，保障资金的安全性和合同的有效性，客户需在首次充值前完成实名<br>
			登记，普金资本承诺会对所有客户资料严格保密。
		</p>

		<p class="text-que">一个手机号可以注册几个账号？</p>
		<p class="text-ans">
			手机号、邮箱和客户的身份信息都具有唯一性，故一个手机号只能注册绑定一个账户。
		</p>

		<p class="text-que">注册成功后用户名可以修改吗？</p>
		<p class="text-ans">
			普金资本平台用户名注册成功后不可以修改，建议您注册时不要使用真实姓名作为用户名。
		</p>

		<p class="text-que">注册时手机收不到验证码怎么办？</p>
		<p class="text-ans">
			（1）确认短信是否被手机软件拦截或过滤<br>
			（2）确认手机是否能正常接收短信（信号问题、欠费、停机等）<br>
			（3）短信收发过程中可能会有延时，请耐心等候<br>
			（4）若仍然收不到验证码，请联系客服。
		</p>
	</div>
</div>
