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
<body style="width: 100%;height: 1600px">

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
                <div class="label cl">
                    <label class="long">真实姓名：</label>
                    <input class="text" name="rname" id="rname" value="${user.rname }">
                    <span></span>
                </div>
                <div class="label cl">
                    <label class="long">申请金额：</label>
                    <input type="text" name="money" id="money" placeholder="请输入申请金额">
                    <span></span>
                </div>
                <div class="label cl label-msg">
                    <label class="long">借款标种：</label>
                    <select  id="bzid" name="bzid" style="width: 300px;height: 40px">
                        <option value="">请选择标种</option>
                        <c:forEach items="${bzList}" var="d">
                            <option value="${d.bzid}">${d.bzname}</option>
                        </c:forEach>
                    </select>
                    <span></span>
                </div>
                <div class="label cl label-msg">
                    <label class="long">借款类型：</label>
                    <select  id="lxid" name="lxid" style="width: 300px;height: 40px">
                        <option value="">请选择借款类型</option>
                        <c:forEach items="${jklxList}" var="d">
                            <option value="${d.lxid}">${d.lxname}</option>
                        </c:forEach>
                    </select>
                    <span></span>
                </div>
                <div class="label cl label-msg">
                    <label class="long">收益方式：</label>
                    <select  id="sid" name="sid" style="width: 300px;height: 40px">
                        <option value="">请选择借款类型</option>
                        <c:forEach items="${swayList}" var="d">
                            <option value="${d.sid}">${d.way}</option>
                        </c:forEach>
                    </select>
                    <span></span>
                </div>
                <div class="label cl">
                    <label class="long">借款期限：</label>
                    <input type="number" name="term" id="term" placeholder="请输入借款期限">
                    <span></span>
                </div>
                <div class="label cl" style="display: none" id="addpshow">
                    <label class="long"></label>
                    <span id="addp"></span>
                </div>
                <div class="label cl">
                    <label class="long">法人身份证：</label>
                    <input type="text" placeholder="选择法人身份证图片" id="faren" readonly="readonly" onclick="F_Open_dialog()">
                </div>
                <div class="label cl" style="display: none" id="addpshow1">
                    <label class="long"></label>
                    <span id="addp1"></span>
                </div>
                <div class="label cl">
                    <label class="long">营业执照副本:</label>
                    <input type="text" placeholder="选择营业执照副本" id="yingye" readonly="readonly" onclick="F_Open_dialog1()">
                </div>
                <div class="label cl" style="display: none" id="addpshow2">
                    <label class="long"></label>
                    <span id="addp2"></span>
                </div>
                <div class="label cl">
                    <label class="long">企业银行账号:</label>
                    <input type="text" placeholder="选择企业银行账号" id="qiye" readonly="readonly" onclick="F_Open_dialog2()">
                </div>
                <div class="label cl" style="display: none" id="addpshow3">
                    <label class="long"></label>
                    <span id="addp3"></span>
                </div>
                <div class="label cl">
                    <label class="long">其他资料：</label>
                    <input type="text" placeholder="选择其他资料" id="ziliao" readonly="readonly" onclick="F_Open_dialog3()">
                </div>
                <div class="label cl">
                    <label class="long">资金用途：</label>
                    <input type="text" name="mpurpose" id="mpurpose" placeholder="请输入资金用途">
                </div>
                <div class="label cl">
                    <label class="long">还款来源：</label>
                    <input type="text" name="hksource" id="hksource" placeholder="请输入还款来源">
                </div>
                <div class="label cl">
                    <label class="long">年化收益：</label>
                    <input type="number" name="nprofit" id="nprofit" placeholder="请输入年化收益">
                </div>

                <div class="label cl">
                    <label class="long">借款人介绍：</label>
                    <textarea name="suggest" id="suggest" placeholder="&nbsp;&nbsp;&nbsp;请输入借款人介绍" style="width: 570px;height: 50px;"></textarea>
                </div>
                <br/><br/>
                <div class="label cl">
                    <label class="long">项目描述：</label>
                    <textarea name="xmdescrip" id="xmdescrip" placeholder="&nbsp;&nbsp;&nbsp;请输入项目描述" style="width: 570px;height: 50px;"></textarea>
                </div>
                <br/><br/>
                <div class="label cl">
                    <label class="long">保障措施：</label>
                    <textarea name="guarantee" id="guarantee" placeholder="&nbsp;&nbsp;&nbsp;请输入保障措施" style="width: 570px;height: 50px;"></textarea>
                </div>
                <br/><br/><br/>
                <div class="label cl">
                    <button type="button" class="btn long error" id="cash-submit" onclick="save('/jkb_save', 'form1');"> 申 请 </button>
                </div>
            </form>
            <form id="form2" action="<%=path%>/jkb/jkb_addimg" style="display: none" method="post" enctype="multipart/form-data">
                <input type="hidden" id="baid" name="baid">
                <input type="file" id="fpic" style="display:none" name="file" onclick="addElementImg('addp')">
                <input type="file" id="ypic" style="display:none" name="file" onclick="addElementImg1('addp1')">
                <input type="file" id="qpic" style="display:none" name="file" onclick="addElementImg2('addp2')">
                <input type="file" id="tpic" style="display:none" name="file" onclick="addElementImg3('addp3')">
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
<script type="text/javascript" src="<%=path%>/static/js/jkb_add.js"></script>
<c:if test="${msg!=null}">
    <script type="text/javascript">
        $(function(){
            alert("${msg}");
            window.location.href = '/user/user_home';
        })
    </script>
</c:if>
<c:if test="${msg2!=null}">
    <script type="text/javascript">
        $(function(){
            alert("${msg2}");
            window.location.href = '/user/user_home';
        })
    </script>
</c:if>
</body>
</html>