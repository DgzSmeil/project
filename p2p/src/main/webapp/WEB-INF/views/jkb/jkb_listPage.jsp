<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <%@include file="../master/easyui/header.jsp" %>
</head>
<body style="height:100%">
<table id="list" class="easyui-datagrid"
       data-options="
			toolbar:'#tb',
			rownumbers:true,
			border:false,
			singleSelect:true,
			pagination:true,
			pageSize:10,
			url:'<%=path %>/jkb/jkb_list',
			method:'post'">
    <thead>
    <tr>
        <th data-options="field:'baid',width:80,checkbox:true">编号</th>
        <th data-options="field:'cpname',width:100">产品名称</th>
        <th data-options="field:'rname',width:100">真实姓名</th>
        <th data-options="field:'money',width:100">申请金额（元）</th>
        <th data-options="field:'bzname',width:100">标种</th>
        <th data-options="field:'lxname',width:100">类型</th>
        <th data-options="field:'term',width:100">借款期限（个月）</th>
        <th data-options="field:'nprofit',width:100">年化收益（%）</th>
        <th data-options="field:'state',width:100,formatter:getstate">状态</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height: auto">
    <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="openLookWin('lookWin', 'list', 'lookForm')">查看详情</a>
    <shiro:hasPermission name="jkb:shenhe">
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="openEditwin('shenhe', 'list', 'shenheId')">审 核</a>
    </shiro:hasPermission>
    <div>
        <form id="searchForm">
            <input class="easyui-numberbox easyui-validatebox" data-options="prompt:'请输入最大金额',
						required:false,
						novalidate:true,
						precision:2" name="money"/>
            <input class="easyui-datetimebox" name="startTime"
                   data-options="prompt:'请选择最大支付时间',required:false,novalidate:true,showSeconds:true"/>
            <input class="easyui-datetimebox" name="endTime"
                   data-options="prompt:'请选择最大创建时间',required:false,novalidate:true,showSeconds:true"/>
            <br />
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch('list', 'searchForm');">搜索</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearchAll('list', 'searchForm');">搜索所有</a>
        </form>
    </div>
</div>

<div id="lookWin" class="easyui-window normal_win" data-options="title:'查看详细资料', closed:true" style="width: 800px;height:500px">
    <form id="lookForm">
        <table>
            <tr height="40px">
                <td width="200px">产品名称：</td>
                <td width="260px">
                    <input id="cpname" readonly="readonly"/>
                </td>
                <td width="150px">金额：</td>
                <td width="260px">
                    <input id="money" readonly="readonly"/>
                </td>
            </tr>
            <tr height="40px">
                <td width="100px">真实姓名：</td>
                <td width="260px">
                    <input id="rname" readonly="readonly"/>
                </td>
                <td width="100px">标种：</td>
                <td width="260px">
                    <input id="bzname" readonly="readonly"/>
                </td>
            </tr>
            <tr height="40px">
                <td width="100px">收益方式：</td>
                <td width="260px">
                    <input id="way" readonly="readonly"/>
                </td>
                <td width="100px">期限：</td>
                <td width="260px">
                    <input id="term" readonly="readonly"/>
                </td>
            </tr>
            <tr height="40px">
                <td width="100px">还款来源：</td>
                <td width="260px">
                    <input id="hksource" readonly="readonly"/>
                </td>
                <td width="100px">用途：</td>
                <td width="260px">
                    <input id="mpurpose" readonly="readonly"/>
                </td>
            </tr>
            <tr height="40px">
                <td width="100px">年化收益：</td>
                <td width="260px">
                    <input id="nprofit" readonly="readonly"/>
                </td>
                <td width="100px">类型：</td>
                <td width="260px">
                    <input id="lxname" readonly="readonly"/>
                </td>
            </tr>
            <br/>
            <tr height="40px">
                <td width="100px">借款人介绍：</td>
                <td width="260px">
                    <textarea id="suggest" style="width: 400px;height:130px;" readonly="readonly"></textarea>
                </td>
            </tr>
            <tr height="40px">
                <td width="100px">项目描述：</td>
                <td width="260px">
                    <textarea id="xmdescrip" style="width: 400px;height:130px;" readonly="readonly"></textarea>
                </td>
            </tr>
            <tr height="40px">
                <td width="100px">保障措施：</td>
                <td width="260px">
                    <textarea id="guarantee" style="width: 400px;height:130px;" readonly="readonly"></textarea>
                </td>
            </tr>
            <tr>
                <td>法人身份证:</td>
                <td colspan="3"><img src="" style="width: 430px;height:300px" alt="" id="fpic"></td>
            </tr>
            <tr>
                <td>执照副本:</td>
                <td colspan="3"><img src="" style="width: 430px;height:300px" alt="" id="ypic"></td>
            </tr>
            <tr>
                <td>银行账号:</td>
                <td colspan="3"><img src="" style="width: 430px;height:300px" alt="" id="qpic"></td>
            </tr>
            <tr>
                <td>其他资料:</td>
                <td colspan="3"><img src="" style="width: 430px;height:300px" alt="" id="tpic"></td>
            </tr>
        </table>
    </form>
</div>

<div id="shenhe" class="easyui-window normal_win" data-options="title:'审核', closed:true">
    <form id="shenheId">
        <input type="hidden" id="baid" name="baid">
        <table>
            <tr>
                <td>状态：</td>
                <td>
                    <select name="state" id="state" style="width: 170px;height: 40px">
                        <option value="3">审核通过</option>
                        <option value="2">审核不通过</option>
                    </select>
                </td>
            </tr>
            <tr id="asdf" style="display: none;">
                <td>审核理由：</td>
                <td>
                    <textarea id="excuse" style="width: 200px;height:100px;" name="excuse"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <a class="easyui-linkbutton" onclick="save('/jkb/shenhe', 'shenheId', 'shenhe', 'list');">确认</a>
                </td>
            </tr>
        </table>


    </form>
</div>




</body>
<%@include file="../master/easyui/footer.jsp" %>

<script>
    $(function() {
        setPagination("list");
        $("#state").bind("change",function(){
            if($("#state").val()==2){
                $("#asdf").show();
            }else{
                $("#asdf").hide();
            }
        })

    });

    function openLookWin(winId, listId, formId) {
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            row.cashTime = formatDate(row.cashTime);
            $("#" + formId).form("load", row); // 考虑时间字符串
            $("#cpname").val(row.cpname);$("#money").val(row.money+"元");$("#rname").val(row.rname);
            $("#bzname").val(row.bzname);$("#baid").val(row.baid);$("#lxname").val(row.lxname);
            $("#term").val(row.term+"个月");$("#mpurpose").val(row.mpurpose);$("#hksource").val(row.hksource);
            $("#nprofit").val(row.nprofit+"%");$("#way").val(row.way);$("#suggest").val(row.suggest);
            $("#xmdescrip").val(row.xmdescrip);$("#guarantee").val(row.guarantee);
            var fpic = document.getElementById("fpic");
            fpic.src = "../static/upload/"+row.fpic;
            var ypic = document.getElementById("ypic");
            ypic.src = "../static/upload/"+row.ypic;
            var qpic = document.getElementById("qpic");
            qpic.src = "../static/upload/"+row.qpic;
            var tpic = document.getElementById("tpic");
            tpic.src = "../static/upload/"+row.tpic;
            openWin(winId);
        } else {
            showInfoAlert("请选择需要查看的数据");
        }
    }
    function getstate(state){
        var str = "";
        if (state==1){
            str += "未审核";
        }else if(state==2){
            str += "审核失败";
        }else if(state==3){
            str += "招标中";
        }else if(state==4){
            str += "还款中";
        }else if(state==5){
            str += "还款成功";
        }
        return str;
    }

    function openEditwin(winId, listId,formId){
        var row = $("#" + listId).datagrid("getSelected");
        if (row) {
            row.cashTime = formatDate(row.cashTime);
            $("#" + formId).form("load", row); // 考虑时间字符串
            $("#baid").val(row.baid);
            openWin(winId);
        } else {
            showInfoAlert("请选择需要审核的数据");
        }
    }
</script>

</html>