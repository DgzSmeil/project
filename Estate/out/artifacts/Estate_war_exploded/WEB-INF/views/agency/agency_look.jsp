<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%
    	String path = request.getContextPath();
    %>
    
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8">
        <title>房产营销平台</title>
        <meta name="description" content="">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="author" content="">
        <meta name="keywords" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Mobile Specific Meta  -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="shortcut icon" href="<%=path %>/images/favicon.png" type="image/png">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="<%=path %>/css1/font-awesome.min.css" />
        <!-- Custom CSS -->
        <link href="<%=path %>/style.css" rel="stylesheet">
        <!-- 提示框 -->
	  	<script src="<%=path %>/js/sweetalert-dev.js"></script>
	  	<link rel="stylesheet" href="<%=path %>/css/sweetalert.css">
	  	
      	<link rel="stylesheet" href="<%=path %>/css1/buildings_look.css">
      	
      	<link href="<%=path %>/css/jquery.gritter.css" rel="stylesheet">
		<link href="<%=path %>/css/morris.css" rel="stylesheet">
		<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet" type="text/css">  
		<link href="<%=path %>/css/bootstrap-table.min.css" rel="stylesheet" type="text/css">  
		<script src="<%=path %>/js/jquery.min.js"></script>  
		<script src="<%=path %>/js/bootstrap.min.js"></script>  
		<script src="<%=path %>/js/bootstrap-table.min.js"></script>  
		<script src="<%=path %>/js/bootstrap-table-zh-CN.js"></script>
      	
    </head>

    <body>

        <header>
            <div class="header-top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-sm-12 hidden-xs">
                            <div class="header-top-left">
                                <div class="welcome-msg">
                                    <span class="default-msg hidden-xs">欢迎光临!</span>
                                    <span class="phone">免费电话: <span class="number">01234-567890</span></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 col-sm-12">
                            <div class="header-top-right">
                                <div class="currency language">
                                	<s:if test="#request.user!=null">
                                		<div class="current">
                                        <span>
                                        	<img alt="头像" src="<%=path %>/upload/${user.headicon}" style="width:40px;height:30px;border-radius:300px;">
                                        	${user.nickname}
                                        </span>
	                                    </div>
	                                    <ul class="lang">
	                                        <li><a href="<%=path %>/user/information">个人资料</a></li>
										    <li><a href="<%=path %>/user/changePwd">修改密码</a></li>
										    <li><a href="<%=path %>/user/exited">退出</a></li>
	                                    </ul>
                                	</s:if>
                                	<s:else>
                                		<div class="">
                                        	<a class="login" href="<%=path %>/user/loginPage" style="color:white">登录</a>
                                    	</div>
                                	</s:else>
                                </div>
                                <s:if test="#request.user==null">
	                                <div class="language">
	                                    <div class="">
	                                        <a class="checkout" href="<%=path %>/user/registeredpage" style="color:white">注册</a>
	                                    </div>
	                                    
	                                </div>
                                </s:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-middle">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4 col-sm-12 col-xs-8">
                            <div class="logo">
                            	<s:if test="#request.user!=null">
                            		<a href="<%=path%>/user/homepage"><img src="<%=path %>/img/logo2.jpg" alt="房天下" /></a>
                            	</s:if>
                                <s:else>
                                	<a href="<%=path%>/user/home"><img src="<%=path %>/img/logo2.jpg" alt="房天下" /></a>
                                </s:else>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-6 hidden-xs">
                            <div class="search-box">
                                <form action="">
                                    <input class="form-control search-form" id="search-buildings" type="text" placeholder="点击这里搜索楼盘" />
                                    <input type="hidden" id="user_id" name="user.id" value="${user.id }">
                                    <input type="hidden" id="agency_id" value="${agency.id }">
                                    <button class="search-button" value="Search" type="button" onclick="btn_search();"><i class="fa fa-search"></i></button>
                                </form>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="main-menu-area hidden-xs hidden-sm">
                <div class="container">
                    <div class="row">
                        <div class="colo-md-12">
                            <div class="main-menu">
                                <nav>
                                    <ul class="ul1">
                                   		<li><a href="<%=path%>/user/home">首页</a></li>
										<li><a href="<%=path%>/builds/allbuilds">所有楼盘</a></li>
										<li><a href="<%=path%>/activity/all">楼盘活动</a></li>
                                        <li class="active"><a href="<%=path%>/agency/all">知名房企</a></li>
										<li><a href="<%=path%>/article/all">新闻中心</a></li>
										<li><a href="<%=path%>/agency/registered" target="_blank">房地产入驻</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- mobile-menu-area-start -->
            <div class="mobile-menu-area visible-xs visible-sm">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mobile_menu">
                                <nav id="mobile_menu_active">
                                    <ul class="ul1">
                                   		<li><a href="<%=path%>/user/home">首页</a></li>
										<li><a href="<%=path%>/builds/allbuilds">所有楼盘</a></li>
										<li><a href="<%=path%>/activity/all">楼盘活动</a></li>
                                        <li class="active"><a href="<%=path%>/agency/all">知名房企</a></li>
										<li><a href="<%=path%>/article/all">新闻中心</a></li>
										<li><a href="<%=path%>/agency/registered" target="_blank">房地产入驻</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- mobile-menu-area-end -->
        </header>
        <!-- header-end -->
        
        <!-- about-us-area-start -->
        <div class="about-us" style="padding-bottom:0px;">
            <div class="container">
                <div class="row">
               		<h1>${agency.name }</h1>
               		<div class="col-md-6 col-sm-12 col-xs-12 ">
                        <div class="about-img wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                            <img src="<%=path %>/upload/${agency.logo}" alt="" />
                        </div>
                   	</div>
                    <div class="col-md-6 col-sm-12 col-xs-12 div_border">
                        <div class="about-text wow fadeIn" data-wow-duration=".5s" data-wow-delay=".5s">
                            <div class="single-product-content">
                                <div class="avg_price">
                                    <label>负责人姓名：</label>
                                    <span class="">${agency.leader}</span>
                                    <span class="riqi"></span>
                                </div>
                                <div class="avg_price">
                                    <label>邮箱地址：</label>
                                    <span class="small">${agency.email }</span>
                                </div>
                              	<div class="avg_price">
                                    <label>手机号码：</label>
                                    <span class="small">${agency.phone}</span>
                                </div>
                                <div class="avg_price">
                                    <label>固定电话：</label>
                                    <span class="small">${agency.tel}</span>
                                </div>
                                <div class="avg_price">
                                    <label>公司地址：</label>
                                    <span class="small">${agency.address}</span>
                                </div>
                                <div class="avg_price">
                                    <label>创办时间：</label>
                                    <span class="small">${agency.created_time}</span>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                	<div class="col-md-12">
                		<label>公司简介：</label><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${agency.intro }</p>
                	</div>
                </div>
            </div>
        </div>
        <!-- about-us-area-end -->
        <div class="about-us" style="padding-top: 20px;">
            <div class="container">
		        <div class="row">
		        	<h1>所有楼盘</h1>
		        	<div class="col-md-12">
				        <table class="table table-hover" id="cusTable"  
						       data-pagination="true"  
						       data-show-refresh="true"  
						       data-show-toggle="true"  
						       data-toolbar="#toolbar"
						       data-search="true" 
						       data-showColumns="true">  
						     	<thead> 
						          <tr>
							       	  <th data-field="logo"  data-valign="middle" data-formatter="logoFormatter"></th>
							       	  <th data-field="logo"  data-valign="middle" data-formatter="logoFormatter2"></th>                        
						          </tr>  
						       </thead>  
						       <tbody>  
						       </tbody>  
						</table>  
				       </div>      
		        </div>
		    </div>
		</div>
        
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
        
        <script src="<%=path %>/js/myJS/addhistory.js"></script>
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
		        url: basePath+"/builds/lookagency2", //获取数据的Servlet地址  
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
		              agency_id: $("#agency_id").val(),
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
				return "<a href='"+basePath+"/builds/lookbuildings?builds.id="+row.id+" 'target='_blank' onclick='addhistory(\""+row.id+"\");'><img src='"+basePath+"/upload/"+row.logo+"' width='200' height='150' style='margin-right:8%;'  alt='头像'></a><label style='margin-right:8%;'>"+row.name+"</label><label style='margin-right:8%'>"+row.open_date+" 开盘</label><span class='piea'>￥"+row.avg_price+"/平方米</span>";
		  }
		  function logoFormatter2(value,row,index){
				return "<a href='"+basePath+"/builds/lookbuildings?builds.id="+row.id+" 'target='_blank' onclick='addhistory(\""+row.id+"\");'>查看详情</a>";
		  }
		  function btn_search(){
				if($("#search-buildings").val()==""){
					window.open(basePath+"/builds/allbuilds"); 
				}else{
					window.open(basePath+"/builds/findbuildings?builds.name="+$("#search-buildings").val()); 
				}
				
			}
	</script>
    </body>

</html>

