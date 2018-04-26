var contextPath="/Estate";
$(function(){
	$.get(contextPath+"/mission/chart?emp_id="+$("#val").val(),function(data){
		var chart = new Highcharts.Chart('container', {
		    title: {
		        text: '单个员工销量查看',
		        x: -20
		    },
		    subtitle: {
		        text: '数据来源: FangTianXia',
		        x: -20
		    },
		    xAxis: {
		        categories: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],crosshair: true
		    },
		    yAxis: {
		        title: {
		            text: '数量 (套)'
		        },
		        plotLines: [{
		            value: 0,
		            width: 1,
		            color: '#808080'
		        }]
		    },
		    tooltip: {
		        valueSuffix: '套'
		    },
		    legend: {
		        layout: 'vertical',
		        align: 'right',
		        verticalAlign: 'middle',
		        borderWidth: 0
		    },
		    series: data
		});
	},"json");

});