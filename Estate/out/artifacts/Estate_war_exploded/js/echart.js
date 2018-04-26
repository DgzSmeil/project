var contextPath = "/Estate";
$.get(contextPath + "/sale/chart?agency_id="+$("#val").val(), function(data) {
	$('#column').highcharts({
        title: {
            text: '月销售数量'
        },
        subtitle: {
            text: '数据来源: FangTianXia'
        },
        xAxis: {
            categories: [
                '一月',
                '二月',
                '三月',
                '四月',
                '五月',
                '六月',
                '七月',
                '八月',
                '九月',
                '十月',
                '十一月',
                '十二月'
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: '数量 (套)'
            }
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
}, "json");
