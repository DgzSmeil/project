
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
%>
<html>
  <head>
    <title>贷款计算器</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <meta name="keywords" content="贷款 贷款计算 贷款计算器">
    <meta name="description" content="贷款 贷款计算 贷款计算器">

    
    <link rel="shortcut icon" href="favicon.ico">
    <link href="<%=path %>/LoanCalc/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="<%=path %>/LoanCalc/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="<%=path %>/LoanCalc/css/animate.min.css" rel="stylesheet">
    <link href="<%=path %>/LoanCalc/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="<%=path %>/LoanCalc/css/bootstrap-table.min.css" rel="stylesheet" type="text/css">
    <link href="<%=path %>/LoanCalc/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css">
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <h1 class="col-sm-offset-5">贷款计算</h1>
          <form id="loanForm" class="form-horizontal">
            <div class="form-group">
              <label class="col-sm-2 control-label">总金额</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="total" value="${price}"> <span class="help-block m-b-none">请输入总金额数，如1000000</span>
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-2 control-label">还款方式</label>

              <div class="col-sm-10">
                <select class="form-control" name="type">
                  <option value="ACPIM">等额本息</option>
                  <option value="ACM">等额本金</option>
                </select>
                <span class="help-block">请选择还款方式（等额本金还款方式总利息少）</span>
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-2 control-label">首付比例</label>

              <div class="col-sm-10">
                <select class="form-control" name="percent">
                  <option value="20">20%</option>
                  <option value="25">25%</option>
                  <option value="30">30%</option>
                  <option value="35">35%</option>
                  <option value="40">40%</option>
                  <option value="45">45%</option>
                  <option value="50">50%</option>
                  <option value="55">55%</option>
                  <option value="60">60%</option>
                  <option value="65">65%</option>
                  <option value="70">70%</option>
                  <option value="75">75%</option>
                  <option value="80">80%</option>
                  <option value="85">85%</option>
                  <option value="90">90%</option>
                  <option value="95">95%</option>
                </select>
                <span class="help-block">请选择首付比例</span>
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-2 control-label">贷款年利率</label>

              <div class="col-sm-10">
                <select class="form-control" name="rate">
                  <option value="4.9">4.9%</option>
                  <option value="4.75">4.75%</option>
                  <option value="4.35">4.35%</option>
                  <option value="3.25">3.25%</option>
                  <option value="2.75">2.75%</option>
                </select>
                <span class="help-block m-b-none">请选择贷款年利率</span>
              </div>
            </div>

            <div class="form-group">
              <label class="col-sm-2 control-label">还款期限</label>

              <div class="col-sm-10">
                <select class="form-control" name="year">
                  <option value="20">20年</option>
                  <option value="25">25年</option>
                  <option value="30">30年</option>
                  <option value="15">15年</option>
                  <option value="10">10年</option>
                  <option value="5">5年</option>
                </select>
                <span class="help-block">请选择还款期限</span>
              </div>
            </div>

            <div class="form-group">
              <div class="col-sm-4 col-sm-offset-2">
                <button class="btn btn-primary" type="button" onclick="calLoan();">开始计算</button>
                <br/><p class="link">
        <a href="<%=path %>/">&#9666;返回首页</a>
        <a href="javascript:history.go(-1);">&#9666;返回上一页</a>
    </p>
              </div>
            </div>

          </form>
        </div>
      </div>

      <div id="result" class="row" style="display:none;">
        <div class="col-sm-12">
          <p style="font-size:16px;font-weight:bold;">
            总贷款数：<span id="totalLoan"></span>&nbsp;
            还款期限：<span id="totalMonth"></span>&nbsp;
            总还款数：<span id="totalMoney"></span>&nbsp;
            总利息数: <span id="totalInterest"></span>&nbsp;
            首月还款数：<span id="firstMoney"></span>&nbsp;
            月均还款数: <span id="avgMoney"></span>
          </p>
            <h4>还款计划</h4>

              <table class="table table-hover" id="loanList"
                     data-pagination="true"
                     data-show-refresh="true"
                     data-showColumns="true"
                     data-height="960" >
                <thead>
                <tr>
                  <th  data-field="month" data-sortable="true">
                    期数
                  </th>
                  <th data-field="repayment" >
                    该期还款数
                  </th>
                  <th data-field="payPrincipal" >
                    该期本金
                  </th>
                  <th  data-field="interest" data-sortable="true">
                    该期利息
                  </th>
                  <th data-field="remainTotal" >
                    剩余贷款数
                  </th>
                  <th data-field="remainPrincipal" >
                    剩余本金数
                  </th>
                </tr>
                </thead>
                <tbody>
                </tbody>

              </table>
        </div>

      </div>

      <div class="row">
        <div class="col-sm-12">
          &copy;Wgssmart&nbsp;&nbsp; QQ:847315251&nbsp;&nbsp;微信：Wgssmart
        </div>
      </div>

    </div>

    <script src="<%=path %>/LoanCalc/js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=path %>/LoanCalc/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="<%=path %>/LoanCalc/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="<%=path %>/LoanCalc/js/bootstrap-table.js"></script>
    <script src="<%=path %>/LoanCalc/js/bootstrap-table-zh-CN.min.js"></script>
    <script src="<%=path%>/LoanCalc/js/bootstrap-dialog.min.js"></script>
    <script>
      var tableData = "";
      function calLoan() {
          $("#errMsg").text("");
          $.post("<%=path %>/cal.servlet",
            $("#loanForm").serialize(),
              function (data) {
                if (data.result != undefined && data.result != null) {
                    BootstrapDialog.show({
                        title: '贷款计算提醒',
                        message: '请输入或选择数据哦!'
                    });
                } else if (data.totalLoanMoney != undefined && data.totalLoanMoney != null) {
                    // 生成table
                    $("#totalLoan").text(data.totalLoanMoney);
                    $("#totalMonth").text(data.totalMonth);
                    $("#totalMoney").text(data.totalRepayment);
                    $("#totalInterest").text(data.totalInterest);
                    $("#firstMoney").text(data.firstRepayment);
                    $("#avgMoney").text(data.avgRepayment);
                    $("#result").attr("style", "display:block");
                  tableData = data.allLoans;
                  initTable();
                }
              }, "json"
          );
      }

      function initTable() {
        //先销毁表格
        $('#loanList').bootstrapTable('destroy');
        //初始化表格,动态从服务器加载数据
        $("#loanList").bootstrapTable({
          data: tableData,
          striped: false,  //表格显示条纹
          pagination: true, //启动分页
          pageSize: 10,  //每页显示的记录数
          pageNumber:1, //当前第几页
          pageList: [20, 30, 40, 50, 60],  //记录数可选列表
          search: true,  //是否启用查询
          showColumns: true,  //显示下拉框勾选要显示的列
          showRefresh: false,  //显示刷新按钮
          strictSearch: true,
          clickToSelect: true,  //是否启用点击选中行
          uniqueId: "month",                     //每一行的唯一标识，一般为主键列
          sortable: true,                     //是否启用排序
          sortOrder: "asc",                   //排序方式
          sidePagination: "client" //表示服务端请求
        });
      }

      $(document).ready(function () {
        //调用函数，初始化表格
        initTable();


        //当点击查询按钮的时候执行
        $("#search").bind("click", initTable);
      });
    </script>

  </body>
</html>
