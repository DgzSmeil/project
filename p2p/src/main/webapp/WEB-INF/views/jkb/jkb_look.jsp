<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/4
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>我要投资—普金资本-安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/public.css">
    <link rel="stylesheet" href="<%=path %>/static/resources/front/v01/src/css/index.css">
    <link rel="icon" href="https://www.pujinziben.com/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon">
    <!-- 提示框 -->
    <script src="<%=path %>/static/js/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="<%=path %>/static/css/sweetalert.css">
    <style>

        .small_img,.big_img {
            cursor: pointer;
        }
        .black_overlay{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.8;
            opacity:.80;
            filter: alpha(opacity=80);
        }
        .big_img {
            display: none;
            position: absolute;
            width: 800px;
            height: 550px;
            left: 25%;
            top: 16%;
            margin: -60px 0px 0px -60px;
            z-index:1002;
            overflow: auto;
        }
    </style>
</head>
<body>
<%@include file="../master/top.jsp" %>
<%@include file="../master/head.jsp" %>
<div class="subject">
    <div class="subject-submit">
        <div class="subject-submit-l" style="display: block;">
            <div class="subject-submit-title">
                <p id="borrowWayName">${jkb.bzname}</p>
                <h3 id="borrowTitle">${jkb.cpname}</h3>
            </div>
            <div class="subject-submit-detail">
                <div class="subject-submit-rate">
                    <p>预期年化收益</p>
                    <p class="text color"><span class="color" id="rate">${jkb.nprofit}</span>%</p>
                </div>
                <div class="subject-submit-date">
                    <p>项目期限</p>
                    <p class="text" id="date"><span>${jkb.term}</span>个月</p>
                </div>
                <div class="subject-submit-amt">
                    <p class="title_amt">募集总金额</p>
                    <p class="text"><span id="amt">${jkb.money}</span>元</p>
                </div>
            </div>
            <div class="subject-submit-bottom">
                <div class="subject-submit-b-l">
                    <p>还款方式：<span id="paymentMode">${jkb.way}</span></p>
                    <p>最小投标金额：<span id="minTenderedSum">100.00元</span></p>
                </div>
                <div class="subject-submit-b-l">
                    <p>已投标金额：<span id="investNum">${jkb.ytmoney}元</span></p>
                    <p>最大投标金额：<span id="maxTenderedSum">${jkb.money-jkb.ytmoney}元</span></p>
                </div>
                <div class="subject-submit-b-r">
                    <div class="line">
                        <p>投资进度：</p><p class="progress"><em style="width: ${(jkb.ytmoney/jkb.money)*100}%;"></em></p><p class="progress-text">${(jkb.ytmoney/jkb.money)*100}%</p>
                    </div>
                    <p>可投标时间：
                        <span id="publishTime">
                            <fmt:formatDate value="${jkb.deadline}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                        </span>
                    </p>
                </div>
            </div>
        </div>
        <div class="subject-submit-r" style="display: block;">
            <div class="subject-s-r-u">

            </div>
            <div class="subject-s-r-c">
                <p>可用余额：<span id="canUseSum">
                    <c:if test="${userMoney !=null}">
                        ${userMoney.kymoney}元
                    </c:if>
                    <c:if test="${userMoney ==null}">
                       0.00元
                    </c:if>
                </span></p>
                <p class="rate">预期收益：<span class="color" id="reckon">0.00</span></p>
            </div>
            <div class="subject-s-r-c">
                <p>剩余可投：<span id="investAmount">${jkb.money-jkb.ytmoney}元</span></p>
                <p class="rate active" id="increaseP">加息收益：<span class="color" id="increase">0.00</span></p>
            </div>
            <div class="input">
                <input type="text" style="display: none" id="kymoney" value="${userMoney.kymoney}">
                <input type="text" style="display: none" id="ktmoney" value="${jkb.money-jkb.ytmoney}">
                <input type="text" style="display: none" id="nprofit" value="${jkb.nprofit}">
                <input type="text" style="display: none" id="uid" value="${jkb.uid}">
                <input type="text" style="display: none" id="term" value="${jkb.term}">
                <input type="text" style="display: none" id="sid" value="${jkb.sid}">
                <input type="text" style="display: none" id="pwd" value="${user.zpwd}">
                <input type="text" style="display: none" id="cpname" value="${jkb.cpname}">
                <input type="text" style="display: none" id="ytmoney" value="${jkb.ytmoney}">
                <input type="text" style="display: none" id="baid" value="${jkb.baid}">
                <input type="text" placeholder="请输入投资金额" id="amount" onkeyup="reckon()">
                <button type="button" id="pushAll">全投</button>
            </div>
            <div class="quan">
                <select id="selectQuan">
                    <c:if test="${userTicketVOList.size() == 0}">
                        <option value="0">当前没有可用的优惠券</option>
                    </c:if>
                    <c:if test="${userTicketVOList.size() != 0}">
                        <c:forEach items="${userTicketVOList}" var="utl">
                            <c:if test="${utl.type==1}">
                                <option value="${utl.kid}">代金券-满1000元抵${utl.tkmoney}元</option>
                            </c:if>
                            <c:if test="${utl.type==2}">
                                <option value="${utl.kid}">现金券-${utl.tkmoney}元</option>
                            </c:if>
                            <c:if test="${utl.type==3}">
                                <option value="${utl.kid}">加息券-${utl.tkmoney}元</option>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </select>
                <a href="<%=path%>/jkb/calc" class="icon icon-cal" id="calculator">详细收益明细</a>
            </div>
            <c:if test="${jkb.ytmoney<jkb.money}">
                <button class="btn" id="investBtn" type="button">立即投标</button>
            </c:if>
            <c:if test="${jkb.ytmoney==jkb.money}">
                <button class="btn disabled" id="investBtn" type="button">
                    <c:if test="${jkb.state==4}">还款中</c:if>
                    <c:if test="${jkb.state==5}">已还完</c:if>
                </button>
            </c:if>
            <div id="productJump"></div>
        </div>
    </div>
</div>
<div class="sub-about">
    <div class="sub-a-nav">
        <a href="javascript:void(0);" class="" onclick="getDetail(this)" class="active">项目详情</a>
        <a href="javascript:void(0);" onclick="getFile(this)" id="getFile">相关文件</a>
        <input type="text" style="display:none;" id="state" value="${jkb.state}"/>
        <c:if test="${jkb.state==4}">
            <a href="javascript:void(0);" onclick="getPlan(this)" id="getPlan">还款计划</a>
        </c:if>

        <a href="javascript:void(0);" onclick="getInvest(this)" id="getInvest" class="">投资记录</a>
        <a href="javascript:void(0);" onclick="dangger(this)" class="">风险提示</a>
    </div>
    <em class="em-line" style="left: 40px;"></em>
    <div class="sub-a-box" id="project" style="display: block;">
        <div class="detail cl">
            <p class="title">产品名称：</p><p class="content" id="projectTitle">${jkb.cpname}</p>
        </div>
        <div class="detail cl">
            <p class="title">募集资金：</p><p class="content" id="projectAmount">${jkb.money}元</p>
        </div>
        <div class="detail cl">
            <p class="title">预期年化收益：</p><p class="content" id="projectRate">${jkb.nprofit}</p>
        </div>
        <div class="detail cl">
            <p class="title">起息日期：</p><p class="content">满标计息</p>
        </div>
        <div class="detail cl">
            <p class="title">资金用途：</p><p class="content" id="moneyPurposes">${jkb.mpurpose}</p>
        </div>
        <div class="detail cl">
            <p class="title">收益方式：</p><p class="content" id="projectType">${jkb.way}</p>
        </div>
        <!-- <div class="detail cl">
            <p class="title">截止日期：</p><p class="content"></p>
        </div> -->
        <div class="detail cl">
            <p class="title">还款来源：</p><p class="content" id="retsource">${jkb.hksource}</p>
        </div>
        <div class="detail cl">
            <p class="title">借款人介绍：</p><p class="content" id="projectIntro">${jkb.suggest}</p>
        </div>
        <div class="detail cl">
            <p class="title">项目描述：</p><p class="content" id="projectDetail">${jkb.xmdescrip}</p>
        </div>
        <div class="detail cl">
            <p class="title">保障措施：</p><p class="content" id="safeMeasures">${jkb.guarantee}<br></p>
        </div>
    </div>
    <div class="sub-a-box files" id="files" style="display: none;">
        <p class="icon icon-danger files-title">普金资本将以客观、公正的原则，最大程度地核实借入者信息的真实性，但不保证审核信息100%真实。如果借入者长期逾期，其提供的信息将被公布。</p>
        <ul class="files-box">
            <li class="img1">
                <img alt="" width="320" height="200" src="<%=path%>/static/upload/${jkb.fpic}">
                <p><span class="icon icon-true">法人身份认证</span>
                </p>
                <a href="javascript:;" id="a1" onclick="showBigImg(1);" style="display: none;">点击查看大图</a>
            </li>
            <li class="img2">
                <img alt="" width="320" height="200" src="<%=path%>/static/upload/${jkb.ypic}">
                <p><span class="icon icon-true">营业执照正副本</span></p>
                <a href="javascript:;" id="a2" onclick="showBigImg(2);" style="display: none;">点击查看大图</a>
            </li>
            <li class="nomargin">
                <img alt="" width="320" height="200" src="<%=path%>/static/upload/${jkb.qpic}">
                <p><span class="icon icon-true">企业银行账号</span></p>
                <a href="javascript:;" id="a3" onclick="showBigImg(3);" style="display: none;">点击查看大图</a>
            </li>
            <li class="img4">
                <img alt="" width="320" height="200" src="<%=path%>/static/upload/${jkb.tpic}">
                <p><span class="icon icon-true">其他资料</span></p>
                <a href="javascript:void(0);" id="a4" onclick="showBigImg(4);" style="display: none;">点击查看大图</a>
            </li>
        </ul>
        <img id="1" class="big_img" src ="<%=path%>/static/upload/${jkb.fpic}" onclick ="closeBigImg(1)">
        <img id="2" class="big_img" src ="<%=path%>/static/upload/${jkb.ypic}" onclick ="closeBigImg(2)">
        <img id="3" class="big_img" src ="<%=path%>/static/upload/${jkb.qpic}" onclick ="closeBigImg(3)">
        <img id="4" class="big_img" src ="<%=path%>/static/upload/${jkb.tpic}" onclick ="closeBigImg(4)">
    </div>
    <div class="sub-a-box plan" id="plan" style="display: none;">
        <ul class="">
            <li class="title">
                <div class="children0">序号</div>
                <div class="children1">计划还款日期</div>
                <div class="children2">实际还款日期</div>
                <div class="children3">已还本息</div>
                <div class="children4">待还本息</div>
                <div class="children5">已付罚息</div>
                <div class="children6">待还罚息</div>
                <div class="children7">状态</div>
            </li>
        </ul>
        <ul class="listData">
        </ul>
    </div>
    <div class="sub-a-box invest" id="invest" style="display: none;">
        <ul class="">
            <li class="title"><div class="children0">投资人</div><div class="children1">金额</div><div class="children2">投资时间</div><div class="children3">状态</div></li>
        </ul>
        <ul class="listData">

        </ul>
        <ul class="paging" style="width: 260px; margin: 30px auto 0px;">
        </ul>
    </div>
    <div class="sub-a-box dangger" id="tips" style="display: none;">
        <p class="icon icon-danger tips-title"><b>普金资本郑重提示：</b>用户应自行对交易风险进行全面了解、充分认识、谨慎决策，用户应对其决策承担全部责任并承担全部风险。如用户通过普金资本平
            台进行下一步操作，即表示已经认真阅读本提示书并完全了解与接受。</p>
        <div class="content">
            <p class="title">一、政策风险</p>
            <p>因国家宏观政策和相关法律法规发生变化，可能引起价格方面的异常波动，用户可能因此遭受损失。</p>
            <p class="title">二、信用风险</p>
            <p> 普金资本不对本金和收益提供任何保证或承诺。若平台项目发生逾期还款，由平台合作机构保理公司或担保公司在 30 个工作日内进行债权回购。合作机构在发生
                最不利情况下（可能但并不一定发生），项目进入司法程序，可能不利于用户实现项目的预期收益甚至本金遭受损失。</p>
            <p class="title">三、信息传递风险</p>
            <p>普金资本将按协议约定进行信息披露，用户应充分关注并及时主动查询交易信息，如未及时查询，或由于通讯故障、系统故障以及其他不可抗力等因素的影响使得
                无法及时了解交易信息，由此产生责任和风险应由用户承担。</p>
            <p class="title">四、不可抗力及意外事件风险</p>
            <p>包括但不限于自然灾害、金融市场危机、战争、黑客攻击、病毒感染等不能预见、不能避免、不能克服的不可抗力事件，对于由于不可抗力及意外事件风险导致的
                任何损失，客户须自行承担。</p>
            <p class="title">五、流动性风险</p>
            <p>用户提以债权转让方式通过普金资本平台进行转让的，普金资本不对债权转让完成的时间以及债权转让能否全部成功实现做出任何承诺，债权未成功转让的，用户
                面临资金不能变现、丧失其他投资机会的风险。</p>
            <p class="icon icon-danger"><span>特别提示：</span>本风险提示书不能穷尽全部风险及市场的全部情形。</p>
        </div>

    </div>
</div>
<div class="files-more">
    <p class="title">其他资料</p>
    <a href="javascript:void(0);" class="close icon icon-close"></a>
    <ul class="files-more-list">

    </ul>
</div>
<div class="popup hasPWD">
    <p class="title left">输入投标密码</p>
    <a href="javascript:void(0);" class="close icon icon-close"></a>
    <div class="popup-from">
        <div class="label cl">
            <label>投标密码</label><input type="password" id="password" maxlength="30" placeholder="请输入交易密码">
        </div>
        <button type="button" class="btn" id="haspwd-submit">立即投标</button>
    </div>
</div>
<div id="fade" class="black_overlay"></div>
<%@include file="../master/foot.jsp" %>
</body>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script src="<%=path%>/static/js/jkb_look.js"></script>
<script src="<%=path%>/static/js/publlic.js"></script>
<script>

</script>
</html>
