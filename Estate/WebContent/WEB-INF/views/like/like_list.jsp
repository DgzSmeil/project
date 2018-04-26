<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="shortcut icon" href="<%=path %>/images/favicon.png" type="image/png">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="<%=path %>/css1/font-awesome.min.css" />
  <!-- Custom CSS -->
  <link href="<%=path %>/style.css" rel="stylesheet">
  <title>个人中心</title>
  <!-- 提示框 -->
    <script src="<%=path %>/js/sweetalert-dev.js"></script>
	<link rel="stylesheet" href="<%=path %>/css/sweetalert.css">
	<link href="<%=path %>/css/style.default.css" rel="stylesheet">
	<link href="<%=path %>/css1/buildings_look.css" rel="stylesheet">
	<link href="<%=path %>/css/jquery.gritter.css" rel="stylesheet">
	<link href="<%=path %>/css/morris.css" rel="stylesheet">
	<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet" type="text/css">  
	<link href="<%=path %>/css/bootstrap-table.min.css" rel="stylesheet" type="text/css">  
	<script src="<%=path %>/js/jquery.min.js"></script>  
	<script src="<%=path %>/js/bootstrap.min.js"></script>  
	<script src="<%=path %>/js/bootstrap-table.min.js"></script>  
	<script src="<%=path %>/js/bootstrap-table-zh-CN.js"></script> 
</head>

<body class="horizontal-menu fixed">
<section>
  <div class="leftpanel">
    <div class="logopanel">
        <h1><span>[</span> 房天下 <span>]</span></h1>
    </div><!-- logopanel -->
    
    <div class="leftpanelinner">
        
        <!-- This is only visible to small devices -->
        <div class="visible-xs hidden-sm hidden-md hidden-lg">   
            <div class="media userlogged">
                <img alt="" src="images/photos/loggeduser.png" class="media-object">
                <div class="media-body">
                    <h4>${user.nickname }</h4>
                </div>
            </div>
          
            <h5 class="sidebartitle actitle">账户</h5>
            <ul class="nav nav-pills nav-stacked nav-bracket mb30">
              <li><a href="<%=path %>/user/information">个人资料</a></li>
		      <li><a href="<%=path %>/user/changePwd">修改密码</a></li>
		      <li><a href="<%=path %>/user/exited">退出</a></li>
            </ul>
        </div>

    </div><!-- leftpanelinner -->
  </div><!-- leftpanel -->
  
  <div class="mainpanel">
    
    <div class="headerbar">
      
      <div class="header-left">
        
        <div class="logopanel">
            <h1><span>[</span> <a href="<%=path%>/user/homepage">房天下</a> <span>]</span></h1>
        </div><!-- logopanel -->
        
        <div class="topnav">
            <a class="menutoggle" href=""><i class="fa fa-bars"></i></a>
            
            <ul class="nav nav-horizontal">
                <li class="active"><a href="<%=path%>/user/home">首页</a></li>
				<li><a href="<%=path%>/builds/allbuilds">所有楼盘</a></li>
				<li><a href="<%=path%>/activity/all">楼盘活动</a></li>
                <li><a href="<%=path%>/agency/all">知名房企</a></li>
				<li><a href="<%=path%>/article/all">新闻中心</a></li>
				<li><a href="<%=path%>/agency/registered" target="_blank">房地产入驻</a></li>
            </ul>
        </div><!-- topnav -->
          
      </div><!-- header-left -->
      <form>
         <input type="hidden" value="${user.id }" id="user_id" />
     </form>
      <div class="header-right">
        <ul class="headermenu">
        
          <li>
            <div class="btn-group">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                <img src="<%=path %>/upload/${user.headicon}" alt="" />
             	${user.nickname }
                <span class="caret"></span>
              </button>
              <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                <li><a href="<%=path %>/user/look">个人资料</a></li>
			    <li><a href="<%=path %>/user/changePwd">修改密码</a></li>
			    <li><a href="<%=path %>/user/exited">退出</a></li>
              </ul>
            </div> &nbsp;&nbsp;&nbsp;
          </li>
         
        </ul>
      </div><!-- header-right -->
      
    </div><!-- headerbar -->
    <div class="pageheader">
      <h2>用户中心<span>我点过的赞</span></h2>
      
    </div>    
    
    <div class="contentpanel">
	    <div class="div_left" style="margin-right: 50px;">
	      <ul class="dsa">
			<li><a href="<%=path %>/user/look">个人资料</a></li>
			<li><a href="<%=path %>/user/information">修改个人资料</a></li>
			<li><a href="<%=path %>/user/changePwd">安全设置</a></li>
			<li class="active"><a href="<%=path %>/like/all">我点过的赞</a></li>
			<li><a href="<%=path %>/message/myall">我的留言</a></li>
			<li><a href="<%=path %>/comment/myall">我的评价</a></li>
			<li><a href="<%=path %>/appointment/myall">我的预约</a></li>
			<li><a href="<%=path %>/history/myall">我的足迹</a></li>
		  </ul>
		</div>
		<div class="div_right" style="background-color: #eeeeee" >
                <div class="row">
				    <div class="col-md-9">
				        <table class="table table-hover" id="cusTable"  
						       data-pagination="true"  
						       data-show-refresh="true"  
						       data-show-toggle="true"  
						       data-toolbar="#toolbar"
						       data-search="true" 
						       data-showColumns="true">  
						       	  <colgroup>
						       		<col style="width:70px;height:100px">
						       		<col style="width:100px;height:50px">
						       		<col style="width:50px;height:50px">
						       		<col style="width:100px;height:50px">
						       		<col style="width:50px;height:50px">
						       </colgroup>
						     	<thead> 
						          <tr>
							       	  <th data-field="buildings.logo"  data-valign="middle" data-formatter="logoFormatter">楼盘封面</th>            
						       		  <th data-field="buildings.name"  data-valign="middle">楼盘名称</th>  
						       		  <th data-field="buildings.avg_price" data-valign="middle" data-formatter="logoFormatter2">楼盘均价</th>
						       		  <th data-field="created_time" data-valign="middle" >点赞时间</th>
						       		  <th data-field="" data-valign="middle"  data-formatter="logoFormatter3">操作</th>  
						          </tr>  
						       </thead>  
						       <tbody>  
						       </tbody>  
						</table>  
				       </div>                
   				</div>
		</div>
    </div>
    
  </div><!-- mainpanel -->
  
  
  
</section>
<!-- footer-start -->
        <footer>
            <div class="footer-area wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                <div class="footer-middle">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="row">
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <h4> 网站信息</h4>
                                        <ul class="toggle-footer">
                                            <li><a title="特刊" href="#">特刊</a></li>
                                            <li><a title="新品上架" href="#">新品上架</a></li>
                                            <li><a title="热销楼盘" href="#">热销楼盘</a></li>
                                            <li><a title="我们的商店" href="#">我们的商店</a></li>
                                            <li><a title="联系我们" href="#">联系我们</a></li>
                                            <li><a title="网站地图" href="#">网站地图</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <h4>我的帐号</h4>
                                        <ul class="toggle-footer">
                                            <li><a title="我的订单" href="#">我的订单</a></li>
                                            <li><a title="我的信用卡" href="#"> 我的信用卡</a></li>
                                            <li><a title="我的地址" href="#">我的地址</a></li>
                                            <li><a title="我的个人信息" href="#">我的个人信息</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3 col-sm-3 col-xs-12">
                                        <h4>友情链接</h4>
                                        <ul class="toggle-footer">
                                            <li><a href="http://www.jiajumi.com/" target="_blank">家具迷</a></li>
											<li><a href="http://nn.zxdyw.com/" target="_blank">南宁装修</a></li>
											<li><a href="http://8.fang.com/" target="_blank">北京贷款</a></li>
											<li><a href="http://pinpai.jieju.cn/" target="_blank">卫浴十大品牌榜</a></li>
											<li><a href="https://www.hjsk100.com/" target="_blank">娱乐新闻</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-3  col-sm-3 col-xs-12">
                                        <h4>房天下营销平台</h4>
                                        <div class="footer-contact">
                                            <p class="description">近几年购房人群逐渐年轻化，80、90后已经成为购房的主力军，每个人都对手机非常熟悉，在购房之前都会自己先查阅相关的资料辅助自己选择合适的房子，此平台正好符合年轻购房人群的需求，此平台拥有丰富的房屋信息，并还能为购房用户提供最方便的贷款计算。
                                            </p>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer-bottom">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12 footer-link"><font color="white">
                                免责声明：本站旨在为用户提供更多楼盘信息，所载内容仅供参考，最终信息以售楼处为准。如该楼盘信息有误，您可以投诉或拨打举报电话： 0791-86751253</font>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- footer-end -->
	<script type="text/javascript">
		var localObj = window.location;
		var contextPath = localObj.pathname.split("/")[1];
		var basePath = localObj.protocol + "//" + localObj.host + "/"+ contextPath;
		function initTable() {  
		    //先销毁表格  
		    $('#cusTable').bootstrapTable('destroy');  
		    //初始化表格,动态从服务器加载数据  
		    $("#cusTable").bootstrapTable({  
		        method: "get",  //使用get请求到服务器获取数据  
		        url: basePath+"/like/all2", //获取数据的Servlet地址  
		        striped: false,  //表格显示条纹
		        striped: true, //是否显示行间隔色
		        pagination: true, //启动分页  
		        pageSize: 5,  //每页显示的记录数  
		        pageNumber:1, //当前第几页  
		        pageList: [5, 10, 15, 20, 25],  //记录数可选列表
		        clickToSelect: false, //是否启用点击选中行
		        search: true,  //是否启用查询  
		        showColumns: true,  //显示下拉框勾选要显示的列  
		        showRefresh: true,  //显示刷新按钮  
		        sidePagination: "server", //表示服务端请求  
		        //设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder  
		        //设置为limit可以获取limit, offset, search, sort, order  
		        queryParamsType : "undefined", 
		        formatter: function (value, row, index) {  
		            return index+1;  
		        },
		        queryParams: function queryParams(params) {   //设置查询参数  
		          var param = {    
		        	  
		        	  pageNumber: params.pageNumber,    
		              pageSize: params.pageSize,
		              user_id: $("#user_id").val(),
		              searchText: params.searchText,
		          };    
		          return param;                   
		        }
		      });  
		  }  

		  $(document).ready(function () {          
		      //调用函数，初始化表格  
		      initTable();  
		
		      //当点击查询按钮的时候执行  
		      $("#search").bind("click", initTable);  
		  });  
		  
		  function logoFormatter(value,row,index){
				return "<a href='"+basePath+"/builds/lookbuildings?builds.id="+row.buildings_id+" 'target='_blank'><img src='"+basePath+"/upload/"+row.buildings.logo+"' width='100' height='70'  alt='头像'></a>";
		  }
		  function logoFormatter2(value,row,index){
				return "￥"+row.buildings.avg_price+"/平方米";
		  }
		  function logoFormatter3(value,row,index){
				return "<a href='javascript:void(0);' onclick='dele(\""+row.id+"\");'>取消点赞</a>";
		  }
		  function dele(id){
			  swal({   
				  title: "您确定要取消点赞？",   
				  text: "",
				  type: "warning",   
				  showCancelButton: true,   
				  confirmButtonColor: "#DD6B55",
				  confirmButtonText: "确定取消点赞", 
				  cancelButtonText: " 不  取  消 ",
				  closeOnConfirm: false }, 
				  function(isConfirm){   
					  if (isConfirm) {     
						  var url=basePath+"/like/del";
		        			$.post(url,{
		            			"like.id":id
		            			},
		            			function(data){
		            				swal(data.msg, "","success");
		            				$('#cusTable').bootstrapTable(('refresh'), url);
		            			},
		            			"json"
		            		);
						  } else {     
							     
			  			} 
					  });
			  
			  
			  
			  
			
		  }
		  
	</script>
</body>
</html>

