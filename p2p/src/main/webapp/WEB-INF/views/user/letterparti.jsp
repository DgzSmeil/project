<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<body>
    <div class="account-right-nav">
        <div class="sub-a-nav">
            <div>
                <a href="javascript:void(0);" class="active show-cash">消息中心</a>
            </div>
            <div class="listshow">
                <a href="<%=path %>/letter/showpage">返回列表</a>
            </div>
        </div>
        <em class="em-line"></em>
    </div>
    <div class="account-content" style="margin-top: -40px;">
        <div>
            <div class="msgTitle"></div>
            <div class="msgContent"></div>
            <div class="msgPerson">发件人: 普金资本</div>
            <div class="msgTime"></div>
        </div>
    </div>
</body></html>