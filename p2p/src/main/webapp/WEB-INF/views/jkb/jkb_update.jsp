<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>申请借款-普金资本—安全可靠专注于供应链金融的国资背景P2P理财平台</title>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/public.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/account.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/datepicker.css"/>
    <link rel="stylesheet" href="<%=path%>/static/resources/front/v01/src/css/login.css"/>
    <!-- 提示框 -->
    <script src="<%=path %>/static/js/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="<%=path %>/static/css/sweetalert.css">
</head>

<link rel="icon" href="<%=path%>/static/resources/front/v01/src/images/logo_title.jpg" type="image/x-icon" />
<body style="width: 100%;height: 1600px" onload="asda();">

<%@include file="../master/top.jsp" %>
<%@include file="../master/head.jsp" %>
<div class="regist-content"style="height: 100%">
    <div class="cash-pay" style="display: block;">
        <p class="tips-title">
            <b>温馨提示：</b>凡是在普金资本申请借款的用户，请自主遵守法律法规！<br>
            a）请认真填写详细资料。<br>
            b）我们将在1至3个工作日(国家节假日除外)之内完成审核。<br>
            c）每次借款金额至少为10000元以上。
        </p>
        <div class="pay-from">
            <form id="form1" method="post">
                <input type="hidden" name="baid" value="${jkbVO.baid }">
                <input type="hidden" name="bdid" value="${jkbVO.bdid }">
                <div class="label cl">
                    <label class="long">真实姓名：</label>
                    <input class="text" name="rname" id="rname" value="${jkbVO.rname }" readonly="readonly">
                    <span></span>
                </div>
                <div class="label cl">
                    <label class="long">申请金额：</label>
                    <input type="text" name="money" id="money" value="${jkbVO.money }" placeholder="请输入申请金额">
                    <span></span>
                </div>
                <div class="label cl label-msg">
                    <label class="long">借款标种：</label>
                    <select  id="bzid" name="bzid" style="width: 300px;height: 40px">
                        <option value="${jkbVO.bzid }">${jkbVO.bzname }</option>
                        <c:forEach items="${bzList}" var="d">
                            <option value="${d.bzid}">${d.bzname}</option>
                        </c:forEach>
                    </select>
                    <span></span>
                </div>
                <div class="label cl label-msg">
                    <label class="long">借款类型：</label>
                    <select  id="lxid" name="lxid" style="width: 300px;height: 40px">
                        <option value="${jkbVO.lxid }">${jkbVO.lxname }</option>
                        <c:forEach items="${jklxList}" var="d">
                            <option value="${d.lxid}">${d.lxname}</option>
                        </c:forEach>
                    </select>
                    <span></span>
                </div>
                <div class="label cl label-msg">
                    <label class="long">收益方式：</label>
                    <select  id="sid" name="sid" style="width: 300px;height: 40px">
                        <option value="${jkbVO.sid }">${jkbVO.way }</option>
                        <c:forEach items="${swayList}" var="d">
                            <option value="${d.sid}">${d.way}</option>
                        </c:forEach>
                    </select>
                    <span></span>
                </div>
                <div class="label cl">
                    <label class="long">借款期限：</label>
                    <input type="number" name="term" id="term" value="${jkbVO.term }" placeholder="请输入借款期限">
                    <span></span>
                </div>
                <div class="label cl" id="addpshow">
                    <label class="long">法人身份证：</label>
                    <span id="addp">
                        <img src="<%=path%>/static/upload/${jkbVO.fpic }" id="newImg" style="width:113px;height:50px" onclick="F_Open_dialog()"/>
                    </span>
                </div>
                <div class="label cl" id="addpshow1">
                    <label class="long">营业执照副本:</label>
                    <span id="addp1">
                        <img src="<%=path%>/static/upload/${jkbVO.ypic }" id="newImg1" style="width:113px;height:50px" onclick="F_Open_dialog1()"/>
                    </span>
                </div>
                <div class="label cl" id="addpshow2">
                    <label class="long">企业银行账号:</label>
                    <span id="addp2">
                        <img src="<%=path%>/static/upload/${jkbVO.qpic }" id="newImg2" style="width:113px;height:50px" onclick="F_Open_dialog2()"/>
                    </span>
                </div>
                <div class="label cl" id="addpshow3">
                    <label class="long">其他资料：</label>
                    <span id="addp3">
                        <img src="<%=path%>/static/upload/${jkbVO.tpic }" id="newImg3" style="width:113px;height:50px" onclick="F_Open_dialog3()"/>
                    </span>
                </div>
                <div class="label cl">
                    <label class="long">资金用途：</label>
                    <input type="text" name="mpurpose" id="mpurpose" value="${jkbVO.mpurpose }" placeholder="请输入资金用途">
                </div>
                <div class="label cl">
                    <label class="long">还款来源：</label>
                    <input type="text" name="hksource" id="hksource" value="${jkbVO.hksource }" placeholder="请输入还款来源">
                </div>
                <div class="label cl">
                    <label class="long">年化收益：</label>
                    <input type="number" name="nprofit" id="nprofit" value="${jkbVO.nprofit }" placeholder="请输入年化收益">
                </div>

                <div class="label cl">
                    <label class="long">借款人介绍：</label>
                    <textarea name="suggest" id="suggest" placeholder="&nbsp;&nbsp;&nbsp;请输入借款人介绍" style="width: 570px;height: 50px;">${jkbVO.suggest }</textarea>
                </div>
                <br/><br/>
                <div class="label cl">
                    <label class="long">项目描述：</label>
                    <textarea name="xmdescrip" id="xmdescrip" placeholder="&nbsp;&nbsp;&nbsp;请输入项目描述" style="width: 570px;height: 50px;">${jkbVO.xmdescrip }</textarea>
                </div>
                <br/><br/>
                <div class="label cl">
                    <label class="long">保障措施：</label>
                    <textarea name="guarantee" id="guarantee" placeholder="&nbsp;&nbsp;&nbsp;请输入保障措施" style="width: 570px;height: 50px;">${jkbVO.guarantee }</textarea>
                </div>
                <br/><br/><br/>
                <div class="label cl">
                    <button type="button" class="btn long error" id="cash-submit" onclick="update('/jkb_update', 'form1');"> 修 改 </button>
                </div>
            </form>
            <form id="form2" action="<%=path%>/jkb/jkb_addimg" style="display: none" method="post" enctype="multipart/form-data">
                <input type="hidden" id="baid" name="baid">
                <input type="file" id="fpic" name="file" onclick="addElementImg('addp')">
                <input type="file" id="ypic" name="file" onclick="addElementImg1('addp1')">
                <input type="file" id="qpic" name="file" onclick="addElementImg2('addp2')">
                <input type="file" id="tpic" name="file" onclick="addElementImg3('addp3')">
                <input type="submit" value=" 修 改 " id="btn_upate">
            </form>
        </div>
        <div id="returnHtml"></div>
    </div>
</div>


<div class="login-footer">
    <p>版权所有 © 普金资本运营（赣州）有限公司 All rights reserved 备案确认书：赣ICP备16004010号</p>
</div>
<script type="text/javascript" src="<%=path%>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/static/js/jkb_update.js"></script>

</body>
</html>