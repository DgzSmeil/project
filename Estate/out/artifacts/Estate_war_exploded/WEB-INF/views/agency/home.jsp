<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<%=path%>/css/style.default.css" rel="stylesheet">
<link href="<%=path%>/css/fullcalendar.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body style="background-color: white">

	<div class="pageheader">
		<h2>
			<i class="fa fa-home"></i> 首页
		</h2>
	</div>

	<div class="contentpanel">
		<!-- content goes here... -->
		<div class="row">


			<div class="col-sm-6 col-md-3">
				<div class="panel panel-success panel-stat">
					<div class="panel-heading">

						<div class="stat">
							<div class="row">
								<div class="col-xs-4">
									<img src="<%=path%>/images/is-user.png" alt="" />
								</div>
								<div class="col-xs-8">
									<small class="stat-label">今天的访问</small>
									<h1>9000人</h1>
								</div>
							</div>
							<!-- row -->

							<div class="mb15"></div>

							<div class="row">

								<div class="col-xs-6">
									<small class="stat-label"> 新访问</small>
									<h4>760人</h4>
								</div>
							</div>
							<!-- row -->
						</div>
						<!-- stat -->

					</div>
					<!-- panel-heading -->
				</div>
				<!-- panel -->
			</div>
			<!-- col-sm-6 -->

			<div class="col-sm-6 col-md-3">
				<div class="panel panel-danger panel-stat">
					<div class="panel-heading">

						<div class="stat">
							<div class="row">
								<div class="col-xs-4">
									<img src="<%=path%>/images/is-document.png" alt="" />
								</div>
								<div class="col-xs-8">
									<small class="stat-label"> 预约购房人数</small>
									<h1>54人</h1>
								</div>
							</div>
							<!-- row -->

							<div class="mb15"></div>

							<small class="stat-label">最早看房时间</small>
							<h4>8:00:00</h4>

						</div>
						<!-- stat -->

					</div>
					<!-- panel-heading -->
				</div>
				<!-- panel -->
			</div>
			<!-- col-sm-6 -->

			<div class="col-sm-6 col-md-3">
				<div class="panel panel-primary panel-stat">
					<div class="panel-heading">

						<div class="stat">
							<div class="row">
								<div class="col-xs-4">
									<img src="<%=path%>/images/is-document.png" alt="" />
								</div>
								<div class="col-xs-8">
									<small class="stat-label">网页浏览数</small>
									<h1>3000次</h1>
								</div>
							</div>
							<!-- row -->

							<div class="mb15"></div>

							<small class="stat-label"> 约束税率</small>
							<h4>34.23%</h4>

						</div>
						<!-- stat -->

					</div>
					<!-- panel-heading -->
				</div>
				<!-- panel -->
			</div>
			<!-- col-sm-6 -->

			<div class="col-sm-6 col-md-3">
				<div class="panel panel-dark panel-stat">
					<div class="panel-heading">

						<div class="stat">
							<div class="row">
								<div class="col-xs-4">
									<img src="<%=path%>/images/is-money.png" alt="" />
								</div>
								<div class="col-xs-8">
									<small class="stat-label">今天的收入</small>
									<h1>$655</h1>
								</div>
							</div>
							<!-- row -->

							<div class="mb15"></div>

							<div class="row">
								<div class="col-xs-6">
									<small class="stat-label">上周</small>
									<h4>$32,322</h4>
								</div>

								<div class="col-xs-6">
									<small class="stat-label">上个月</small>
									<h4>$503,000</h4>
								</div>
							</div>
							<!-- row -->

						</div>
						<!-- stat -->

					</div>
					<!-- panel-heading -->
				</div>
				<!-- panel -->
			</div>
			<!-- col-sm-6 -->

			<!--日历-->
			<div class="col-md-3">
				<div class="panel panel-default panel-dark panel-alt">
					<div class="panel-heading">
						<h4 class="panel-title">请把你需要做的事情拖动到日历</h4>
					</div>
					<div class="panel-body">
						<div id='external-events'>
							<div class='external-event'>有人预约看房</div>
							<div class='external-event'>开会</div>
							<div class='external-event'>放假</div>
							<div class='external-event'>请假</div>
							<div class='external-event'>待定</div>
						</div>
					</div>
				</div>
			</div>
			<!-- col-md-3 -->
			<div class="col-md-9">
				<div id="calendar"></div>
			</div>
			<!-- col-md-9 -->

		</div>
		<!-- row -->


	</div>
	<!-- contentpanel -->




	<script src="<%=path%>/js/jquery-1.11.1.min.js"></script>
	<script src="<%=path%>/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="<%=path%>/js/bootstrap.min.js"></script>
	<script src="<%=path%>/js/modernizr.min.js"></script>
	<script src="<%=path%>/js/jquery.sparkline.min.js"></script>
	<script src="<%=path%>/js/toggles.min.js"></script>
	<script src="<%=path%>/js/retina.min.js"></script>
	<script src="<%=path%>/js/jquery.cookies.js"></script>

	<script src="<%=path%>/js/jquery-ui-1.10.3.min.js"></script>
	<script src="<%=path%>/js/fullcalendar.min.js"></script>
	<script src="<%=path%>/js/jquery.ui.touch-punch.min.js"></script>

	<script src="<%=path%>/js/custom.js"></script>
</body>
<script>
	jQuery(document).ready(
			function() {

				"use strict";

				/* initialize the external events
				-----------------------------------------------------------------*/

				jQuery('#external-events div.external-event').each(function() {

					// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
					// it doesn't need to have a start or end
					var eventObject = {
						title : $.trim($(this).text())
					// use the element's text as the event title
					};

					// store the Event Object in the DOM element so we can get to it later
					jQuery(this).data('eventObject', eventObject);

					// make the event draggable using jQuery UI
					jQuery(this).draggable({
						zIndex : 999,
						revert : true, // will cause the event to go back to its
						revertDuration : 0
					//  original position after the drag
					});

				});

				/* initialize the calendar
				-----------------------------------------------------------------*/

				jQuery('#calendar').fullCalendar(
						{
							header : {
								left : 'prev,next today',
								center : 'title',
								right : 'month,agendaWeek,agendaDay'
							},
							editable : true,
							droppable : true, // this allows things to be dropped onto the calendar !!!
							drop : function(date, allDay) { // this function is called when something is dropped

								// retrieve the dropped element's stored Event Object
								var originalEventObject = jQuery(this).data(
										'eventObject');

								// we need to copy it, so that multiple events don't have a reference to the same object
								var copiedEventObject = $.extend({},
										originalEventObject);

								// assign it the date that was reported
								copiedEventObject.start = date;
								copiedEventObject.allDay = allDay;

								// render the event on the calendar
								// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
								jQuery('#calendar').fullCalendar('renderEvent',
										copiedEventObject, true);

								// is the "remove after drop" checkbox checked?
								if (jQuery('#drop-remove').is(':checked')) {
									// if so, remove the element from the "Draggable Events" list
									jQuery(this).remove();
								}

							}
						});

			});
</script>
</html>