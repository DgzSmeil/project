<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>

<!-- content type -->
<meta content="text/html; charset=gb2312" http-equiv="Content-Type">

<!-- viewport -->
<meta content="width=device-width,initial-scale=1" name="viewport">
   
<!-- title -->
<title>IT课堂宣传册</title>
			
<!-- add css -->
<link type="text/css" href="<%=basePath %>it/css/style.css" rel="stylesheet">



<!-- add js -->
<script src="<%=basePath %>it/js/jquery.js"></script>
<script src="<%=basePath %>it/js/turn.js"></script>              
<script src="<%=basePath %>it/js/jquery.fullscreen.js"></script>
<script src="<%=basePath %>it/js/jquery.address-1.6.min.js"></script>
<script src="<%=basePath %>it/js/onload.js"></script>


<style>
html, body {
	margin: 0;
	padding: 0;
	overflow:auto !important;
}
</style> 
  
</head>

<body>  
  
<!-- BEGIN FLIPBOOK STRUCTURE -->   
<div data-template="true" data-cat="book7" id="fb7-ajax">  
  

         
    <!-- BEGIN HTML BOOK -->     
    <div data-current="book7" class="fb7" id="fb7">      
    
        <!-- preloader -->
        <div class="fb7-preloader">
            <div id="wBall_1" class="wBall">
            <div class="wInnerBall">
            </div>
            </div>
            <div id="wBall_2" class="wBall">
            <div class="wInnerBall">
            </div>
            </div>
            <div id="wBall_3" class="wBall">
            <div class="wInnerBall">
            </div>
            </div>
            <div id="wBall_4" class="wBall">
            <div class="wInnerBall">
            </div>
            </div>
            <div id="wBall_5" class="wBall">
            <div class="wInnerBall">
            </div>
            </div>
        </div>
              
        <!-- background for book -->  
        <div class="fb7-bcg-book"></div>               
      
        <!-- BEGIN CONTAINER BOOK -->
        <div id="fb7-container-book">
     
           <!-- BEGIN deep linking -->  
           <section id="fb7-deeplinking">
             <ul>
                 <li data-address="page1" data-page="1"></li>
                 <li data-address="page2-page3" data-page="2"></li>
                 <li data-address="page2-page3" data-page="3"></li>
                 <li data-address="page4-5" data-page="4"></li>
                 <li data-address="page4-5" data-page="5"></li>
                 <li data-address="page6-page7" data-page="6"></li>
                 <li data-address="page6-page7" data-page="7"></li>
                 <li data-address="page8-page9" data-page="8"></li>
                 <li data-address="page8-page9" data-page="9"></li>
                 <li data-address="end" data-page="10"></li>  
             </ul>
           </section>
           <!-- END deep linking -->  
        
            
           <!-- BEGIN ABOUT -->
           <section id="fb7-about"><h1><strong><font size="6" color="black">IT课堂</font></strong></h1>
                   <p ><font size="5">随着时代的发展，教育行业迅速的发展，催生了平台教育网站的兴起</font></p>
                   <h1><font size="6" color="black">IT <strong>课堂角色的展示</strong>?</font></h1>
                   <ul style="font-family:微软雅黑;font-size:18;color:black">
					<ol>学生对课程的所有操作</ol>
					<ol>讲师对课程的所有操作</ol>
				    <ol>平台对课程的所有操作</ol>
				   </ul>
                   <h1><font size="6" color="black">IT <strong>课堂的好处</strong>?</font></h1>
                   <ul style="font-family:微软雅黑;font-size:18;color:black">
					<ol>让学生时时学习，促进对学习的热爱</ol>
					<ol>让学生对时代的科技认同</ol>
				    <ol>促动讲师和学生的交流</ol>
					<ol>充分赶上时代的潮流</ol>
					<ol>平台的收入</ol>
				   </ul>
				   
           </section>
           <!-- END ABOUT -->
    
    
            <!-- BEGIN PAGES -->
            <div id="fb7-book">       
              
            
                    <!-- BEGIN PAGE 1 -->          
                    <div style="background-image:url(images/1.jpg)" class="fb7-noshadow">
                           
                         <!-- begin container page book --> 
                         <div class="fb7-cont-page-book">
                           
                            <!-- description for page --> 
                            <div class="fb7-page-book">
                        
                            </div> 
                            
                            
                         </div>
                        <!-- end container page book --> 
                            
                    </div>
                    <!-- END PAGE 1 -->
                      
                    
                    
                    <!-- BEGIN PAGE 2 -->         
                    <div style="background-image:url()" >
                           
                         <!-- begin container page book -->
                         <div class="fb7-cont-page-book">
                           
                             <!-- description for page  --> 
                            <div class="fb7-page-book">
                                    <h1>学生的操作</h1>
                                    <h6>个人资料管理</h6>
                                    <ol>
										<li><a href="javascript:setPage(4)">查询个人资料</a></li>
										<li><a href="javascript:setPage(4)">更改资料</a></li>
										<li><a href="javascript:setPage(4)">更改注册地点</a></li>
										<li><a href="javascript:setPage(4)">修改头像</a></li>
										<li><a href="javascript:setPage(4)">修改登录密码</a></li>
										<li><a href="javascript:setPage(4)">申请成为讲师</a></li>
                                    </ol>
                                    <h6>课程管理</h6>
                                    <ol>
										<li><a href="javascript:setPage(4)">查询相关课程</a></li>
										<li><a href="javascript:setPage(4)">购买课程	</a></li>
										<li><a href="javascript:setPage(4)">加入购物车	</a></li>
										<li><a href="javascript:setPage(4)">试看免费视频</a></li>
										<li><a href="javascript:setPage(4)">查看购买记录 </a></li>
										<li><a href="javascript:setPage(4)">对课程和讲师进行评价	</a></li>
										<li><a href="javascript:setPage(4)">向老师提问	</a></li>
									</ol>
                                    <h6>金额管理</h6>
                                    <ol>
										<li><a href="javascript:setPage(4)">查看余额</a></li>
										<li><a href="javascript:setPage(4)">充值</a></li>
										<li><a href="javascript:setPage(4)">资金去向</a></li>
										<li><a href="javascript:setPage(4)">设置和修改支付密码</a></li>
										<li><a href="javascript:setPage(4)">绑定银行卡</a></li>
                                    </ol>
                                    <h6>参与活动</h6>
                                    <ol>
										<li><a href="javascript:setPage(4)">查看最新公告</a></li>
										<li><a href="javascript:setPage(4)">了解平台最新政策</a></li>
										<li><a href="javascript:setPage(4)">查看讲师动态</a></li>                    
									</ol>
									<h6>优惠奖券</h6>
                                    <ol>
										<li><a href="javascript:setPage(4)">领取优惠券</a></li>
										<li><a href="javascript:setPage(4)">使用优惠券</a></li>
	
									</ol>
                            
                            </div>                     
                                  
                                      
                            <!-- begin number page -->                
                            <div class="fb7-meta">                        
                                    <span class="fb7-num">2</span>                         
                            </div>
                            <!-- end number page --> 
                             
                            
                            
                          </div>
                          <!-- end container page book -->
                            
                    </div>
                     <!-- END PAGE 2 -->
                      
                    
                    <!-- BEGIN PAGE 3 -->          
                    <div style="background-image:url(images/3.jpg)" >
                           
                         <!-- begin container page book -->
                         <div class="fb7-cont-page-book">
                           
                                <!-- description for page--> 
                                <div class="fb7-page-book">
                                                 
                                </div>                           
                                      
                                          
                                <!-- begin number page  -->                
                                <div class="fb7-meta">
                                    
                                        <span class="fb7-num">3</span>
                                     
                                </div>
                                <!-- end number page  -->                    
                            
                            
                          </div> 
                          <!-- end container page book -->
                            
                    </div>
                    <!-- END PAGE 3 -->
                      
                    
                    <!-- BEGIN PAGE 4-5 -->           
                    <div style="background-image:url(images/4_5.jpg)" class="fb7-double fb7-first fb7-noshadow">
                           
                         <!-- begin container page book -->
                         <div class="fb7-cont-page-book">
                           
                                <!-- description for page --> 
                                <div class="fb7-page-book">
                                                 
                                </div> 
                                   
                          </div> 
                          <!-- end container page book --> 
                            
                    </div>
                    
                           
                    <div style="background-image:url(images/4_5.jpg)" class="fb7-double fb7-second fb7-noshadow">
                           
                         <!-- begin container page book --> 
                         <div class="fb7-cont-page-book">
                           
                                <!-- description for page --> 
                                <div class="fb7-page-book">
                                                 
                                </div> 
                             
                          </div> 
                          <!-- end container page book -->
                            
                    </div>
                    <!-- END PAGE 4-5 -->
                      
                    
                    <!-- BEGIN PAGE 6 -->          
                    <div style="background-image:url(images/6.jpg)">
                           
                         <!-- begin container page book --> 
                         <div class="fb7-cont-page-book">
                           
                                <!-- description for page --> 
                                <div class="fb7-page-book">
                                                 
                                </div> 
                                                                
                                          
                                <!-- begin number page  -->                 
                                <div class="fb7-meta">
                                    
                                        <span class="fb7-num">6</span>
                                     
                                </div>
                                <!-- end number page  --> 
                          
                          </div>
                          <!-- end container page book --> 
                            
                    </div>
                     <!-- END PAGE 6 -->
                      
                    
                    <!-- BEGIN PAGE 7 -->          
                    <div style="background-image:url()">
                           
                         <!-- begin container page book -->
                         <div class="fb7-cont-page-book">
                           
                             <!-- description for page  --> 
                            <div class="fb7-page-book">
                                <h1>讲师的操作</h1>
                                    <h6>个人资料管理</h6>
                                    <ol>
										<li>查询个人资料	      </li>
										<li>更改资料	          </li>
										<li>更改注册地点	      </li>
										<li>修改头像	          </li>
										<li>修改登录密码	      </li>
										<li>申请讲师级别	      </li>
										<li>查看我的积分和级别	</li>
										<li>查看评价	          </li>
                                    </ol>
                                    <h6>课程管理</h6>
                                    <ol>
										<li>查询我发布课程	       </li>
										<li>购买课程	           </li>
										<li>加入购物车	           </li>
										<li>试看免费视频	       </li>
										<li>观看已经购买的视频	   </li>
										<li>查看购买记录	       </li>
										<li>修改我的课程	       </li>
										<li>对课程和讲师进行评价  </li>
										<li>向老师提问	           </li>
										<li>查看课程是否通过	   </li>
										<li>修改我的课程	       </li>
										<li>销售或停售课程	   </li>
										<li>回答学生的问题	   </li>
									</ol>
                                    <h6>金额管理</h6>
                                    <ol>
										<li>查看余额/收入</li>
										<li>申请提现</li>
									
                                    </ol>
                                    <h6>参与活动</h6>
                                    <ol>
										<li>设置和修改支付密码	   </li>
										<li>参与活动	           </li>
										<li>查看最新公告	       </li>
										<li>了解平台最新政策	   </li>
										<li>发布公告	           </li>
										<li>查看我的公告	       </li>
										<li>修改公告	           </li>
									</ol>
									<h6>优惠奖券</h6>
									<ol>
								
										<li>发布优惠券	           </li>
										<li>管理优惠券	           </li>
										<li>查看我发布优惠券	   </li>
										<li>查看优惠券领取情况	</li>
										<li>停止或允许使用优惠券</li>
									</ol>
                            </div> 
                                  
                                  
                                      
                            <!-- begin number page  -->                 
                            <div class="fb7-meta">
                                
                                    <span class="fb7-num">7</span>
                                 
                            </div>
                            <!-- end number page  -->  
                             
                            
                            
                          </div>
                          <!-- end container page book -->
                            
                    </div>
                    <!-- END PAGE 7 -->
                      
                    
                    <!-- BEGIN PAGE 8 -->          
                    <div style="background-image:url()">
                           
                         <!-- begin container page book -->
                         <div class="fb7-cont-page-book">
                           
                             <!-- description for page --> 
                            <div class="fb7-page-book">
                                <h1>后台的管理</h1>
                                    <h6>个人资料管理</h6>
                                    <ol>
										<li>启用和禁用管理员</li>
										<li>审核课程	       </li>
										<li>审核视频	       </li>
										<li>审核提现申请	   </li>
										<li>审核讲师申请	   </li>
                                    </ol>
                                    <h6>管理操作</h6>
                                    <ol>
										<li>启用和禁用管理员</li>
										<li>管理课程	       </li>
										<li>管理讲师级别	   </li>
										<li>管理管理员	       </li>
									</ol>
                              
                                    <h6>参与活动</h6>
                                    <ol>
										<li>设置和修改支付密码	   </li>
										<li>参与活动	           </li>
										<li>查看最新公告	       </li>
										<li>了解平台最新政策	   </li>
										<li>发布公告	           </li>
										<li>查看我的公告	       </li>
										<li>修改公告	           </li>
									</ol>
									<h6>其他操作</h6>
                                    <ol>
										<li>查看平台收入</li>
										<li>申请提现</li>
									
                                    </ol>
								
                            
                            </div> 
                                  
                                  
                                      
                            <!-- begin number page -->                
                            <div class="fb7-meta">                        
                                    <span class="fb7-num">8</span>
                                 
                            </div>
                            <!-- end number page --> 
                             
                            
                            
                          </div> 
                          <!-- end container page book -->
                            
                    </div>
                     <!-- END PAGE 8 -->
                      
                    
                    
                    
                    <!-- BEGIN PAGE 9 -->          
                    <div style="background-image:url(images/9.jpg)">
                           
                         <!-- begin container page book --> 
                         <div class="fb7-cont-page-book">
                           
                             <!-- description for page --> 
                            <div class="fb7-page-book">
                                             
                            </div>                           
                                  
                                      
                            <!-- begin number page -->               
                            <div class="fb7-meta">
                                
                                    <span class="fb7-num">9</span>
                                 
                            </div>
                            <!-- end number page -->
                            
                             
                            
                            
                          </div>
                          <!-- end container page book -->
                           
                            
                    </div>
                     <!-- END PAGE 9 -->
                      
                    
                    <!-- BEGIN PAGE 10 -->          
                    <div style="background-image:url()">
                           
                         <!-- begin container page book --> 
                         <div class="fb7-cont-page-book">
                           
                                <!-- description for page--> 
                                <div class="fb7-page-book">
									<p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <h1 style="padding-left: 200px;">谢</h1>
                                    <h1 style="padding-left: 200px;">谢</h1>
                                    <h1 style="padding-left: 200px;">聆</h1>
                                    <h1 style="padding-left: 200px;">听</h1>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    
                                    <h1 style="padding-left: 150px;">&nbsp;</h1>                    
                                </div> 
                                    
                         </div>
                         <!-- end container page book -->
                            
                    </div>
                  <div style="background-image:url(images/9.jpg)">
                           
                         <!-- begin container page book --> 
                         <div class="fb7-cont-page-book">
                           
                             <!-- description for page --> 
                            <div class="fb7-page-book">
                                             
                            </div>                           
                                  
                                      
                            <!-- begin number page -->               
                            <div class="fb7-meta">
                                
                                    <span class="fb7-num">10</span>
                                 
                            </div>
                            <!-- end number page -->
                            
                             
                            
                            
                          </div>
                          <!-- end container page book -->
                           
                            
                    </div>
					 <div style="background-image:url(images/9.jpg)">
                           
                         <!-- begin container page book --> 
                         <div class="fb7-cont-page-book">
                           
                             <!-- description for page --> 
                            <div class="fb7-page-book">
                                             
                            </div>                           
                                  
                                      
                            <!-- begin number page -->               
                            <div class="fb7-meta">
                                
                                    <span class="fb7-num">11</span>
                                 
                            </div>
                            <!-- end number page -->
                            
                             
                            
                            
                          </div>
                          <!-- end container page book -->
                           
                            
                    </div>
           
            
            </div>
            <!-- END PAGES -->
                       
            
            <!-- arrows -->
            <a class="fb7-nav-arrow prev"></a>
            <a class="fb7-nav-arrow next"></a>
                    
            <!-- shadow -->
            <div class="fb7-shadow"></div>
    
        </div>
        <!-- END CONTAINER BOOK -->
    
        <!-- BEGIN FOOTER -->
        <div id="fb7-footer">
        
            <div class="fb7-bcg-tools"></div>
            
            <div class="fb7-menu" id="fb7-center">
                <ul>
                
                    <!-- margin left -->
                    <li></li>
                            
                    <!-- icon download -->
                    <li>
                        <a title="登录" class="fb7-download" href="<%=basePath %>datainfo/login.jsp"></a>
                    </li>
                                            
                    
                    <!-- icon_zoom_in -->                         
                    <li>
                        <a title="放大" class="fb7-zoom-in"></a>
                    </li>
                                    
                    
                    <!-- icon_zoom_out -->                 
                    <li>
                        <a title="缩小" class="fb7-zoom-out"></a>
                    </li>
                                    
                    
                    <!-- icon_zoom_auto -->
                    <li>
                        <a title="最小" class="fb7-zoom-auto"></a>
                    </li>
                                    
                    
                    <!-- icon_zoom_original -->
                    <li>
                        <a title="最大" class="fb7-zoom-original"></a>
                    </li>
                                     
                    
                    <!-- icon_allpages -->
                    <li>
                        <a title="展示所有页面 " class="fb7-show-all"></a>
                    </li>
                                                    
                    
                    <!-- icon_home -->
                    <li>
                        <a title="回到主页" class="fb7-home"></a>
                    </li>
                                    
                    <!-- icon fullscreen -->                 
                    <li>
                        <a title="全屏" class="fb7-fullscreen"></a>
                    </li>
                            
                    <!-- margin right -->                 
                    <li></li>
                    
                </ul>
            </div>
            
            <div class="fb7-menu" id="fb7-right">
                <ul>                              
                    <!-- icon page manager -->                 
                    <li class="fb7-goto">
                        <label for="fb7-page-number" id="fb7-label-page-number"></label>
                        <input type="text" id="fb7-page-number">
                        <button type="button">Go</button>
                    </li>
         
                </ul>
            </div>     
                
        </div>
        <!-- END FOOTER -->
    
        <!-- BEGIN THUMBS -->
        <div id="fb7-all-pages" class="fb7-overlay">
    
          <section class="fb7-container-pages">
    
            <div id="fb7-menu-holder">
    
                <ul id="fb7-slider">
                
                         <!-- PAGE 1 - THUMB -->
                         <li class="1">
                           <img alt="" src="images/1_.jpg">
                         </li>
                         
                         <!-- PAGE 2 - THUMB -->
                         <li class="2">
                           <img alt="" src="images/2_.jpg">
                         </li>
                         
                         <!-- PAGE 3 - THUMB -->
                         <li class="3">
                           <img alt="" src="images/3_.jpg">
                         </li>
                         
                         <!-- PAGE 4-5 - THUMB -->
                         <li class="5">
                           <img alt="" src="images/4_5_.jpg">
                         </li>
                         
                         <!-- PAGE 6 - THUMB -->
                         <li class="6">
                           <img alt="" src="images/6_.jpg">
                         </li>
                         
                         <!-- PAGE 7 - THUMB -->
                         <li class="7">
                           <img alt="" src="images/7_.jpg">
                         </li>
                         
                         <!-- PAGE 8 - THUMB -->
                         <li class="8">
                           <img alt="" src="images/8_.jpg">
                         </li>
                         
                         <!-- PAGE 9 - THUMB -->
                         <li class="9">
                           <img alt="" src="images/9_.jpg">
                         </li>
						  <!-- PAGE 9 - THUMB -->
                         <li class="10">
                           <img alt="" src="images/9_.jpg">
                         </li>
                         
                         <!-- PAGE 10S - THUMB -->
                         <li class="11">
                           <img alt="" src="images/end_.jpg">
                         </li>
          
                </ul>
            
            </div>
    
        </section>
    
       </div>
        <!-- END THUMBS -->

   </div>
    <!-- END HTML BOOK -->    
    
    
</div>
<!-- END FLIPBOOK STRUCTURE --> 


<!-- CONFIGURATION FLIPBOOK -->    
<script>
jQuery('#fb7-ajax').data('config',
    {
		"page_width":"640",
		"page_height":"920",
		"go_to_page":"Page",
		"gotopage_width":"45",
		"zoom_double_click":"1",
		"zoom_step":"0.06",
		"tooltip_visible":"true",
		"toolbar_visible":"true",
		"deeplinking_enabled":"true",
		"double_click_enabled":"true",
		"rtl":"false"
     })
</script>
<div style="text-align:center;">
</div>

</body>
</html>
