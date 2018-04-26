/**
 * Created by admin on 2015/11/6.
 */
// 基于准备好的dom，初始化echarts图表
var myChart = echarts.init(document.getElementById('usersnum'));
var myCharts = echarts.init(document.getElementById('marketsize'));

option = {
    tooltip : {
        trigger: 'axis'
    },
    toolbox: {
        show : false,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType: {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    legend: {
        data:['在线教育总用户规模（万人）','增长率'],
        y:'bottom'
    },
    xAxis : [
        {
            type : 'category',
            data : ['2008','2009','2010','2011','2012','2013','2014','2015','2016','2017'],
            position:'bottom',
            axisLine:{
                show:false,
                onZero:false
            }
        }
    ],
    yAxis : [
        {
            type : 'value',
            name : '',
            axisLabel : {
                formatter: '{value} 万人'
            },
            min:0,
            max:14000,
            axisLine:{
                show:false,
                onZero:false
            }
        },
        {
            type : 'value',
            name : '',
            axisLabel : {
                formatter: '{value} %'
            },
            min:-100,
            max:20,
            axisLine:{
                show:false,
                onZero:false
            }
        }
    ],
    axis:{
        onZero:false
    },
    series : [
        {
            name:'在线教育总用户规模（万人）',
            type:'bar',
            data:[359.1, 3889.4, 4471.8, 5189.5, 5905.6, 6720.0, 7796.9, 9099.2, 10338.1, 12032.6],

            itemStyle: {
                normal: {
                    color: '#24b6e2',
                    barBorderColor: '#fff',       // 柱条边线
                    barBorderRadius: 0,           // 柱条边线圆角，单位px，默认为0
                    barBorderWidth: 0,            // 柱条边线线宽，单位px，默认为1
                    label: {
                        show: false
                        // position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
                        //           'inside'|'left'|'right'|'top'|'bottom'
                        // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                    },
                    label: {
                        show: true,
                        textStyle: {
                            color: '#8c8c8c',
                            fontSize:6
                        }
                    }
                }
            },
            barMinHeight: 0,          // 最小高度改为0
            barWidth: 10,        // 默认自适应
            barGap: '300%',            // 柱间距离，默认为柱形宽度的30%，可设固定值
            barCategoryGap : '20%'
        },
        {
            name:'增长率',
            type:'line',
            yAxisIndex: 1,
            data:['-',8.30, 15.00, 16.10, 13.80, 13.80, 16.00, 16.70, 13.60, 16.40],
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        textStyle: {
                            color: '#8c8c8c',
                            fontSize:6
                        }
                    }
                }
            }
        }
    ]
};
option2 = {
    tooltip : {
        trigger: 'axis'
    },
    toolbox: {
        show : false,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType: {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    legend: {
        data:['市场规模（万人）','增长率'],
        y:'bottom'
    },
    xAxis : [
        {
            type : 'category',
            data : ['2008','2009','2010','2011','2012','2013','2014','2015','2016','2017'],
            position:'bottom',
            axisLine:{
                show:false,
                onZero:false
            }
        }
    ],
    yAxis : [
        {
            type : 'value',
            name : '',
            axisLabel : {
                formatter: '{value} 万人'
            },
            min:0,
            max:3000,
            axisLine:{
                show:false,
                onZero:false
            }
        },
        {
            type : 'value',
            name : '',
            axisLabel : {
                formatter: '{value} %'
            },
            min:-50,
            max:30,
            axisLine:{
                show:false,
                onZero:false
            }
        }
    ],
    series : [
        {
            name:'市场规模（万人）',
            type:'bar',
            data:[352.2, 414.6, 491.1, 575, 700.6, 839.7, 998, 1191.7, 1432.2, 1733.9],

            itemStyle: {
                normal: {
                    color: '#24b6e2',
                    barBorderColor: '#fff',       // 柱条边线
                    barBorderRadius: 0,           // 柱条边线圆角，单位px，默认为0
                    barBorderWidth: 0,            // 柱条边线线宽，单位px，默认为1
                    label: {
                        show: false
                        // position: 默认自适应，水平布局为'top'，垂直布局为'right'，可选为
                        //           'inside'|'left'|'right'|'top'|'bottom'
                        // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                    },
                    label: {
                        show: true,
                        textStyle: {
                            color: '#8c8c8c',
                            fontSize:6
                        }
                    }
                }
            },
            barMinHeight: 0,          // 最小高度改为0
            barWidth: 10,        // 默认自适应
            barGap: '300%',            // 柱间距离，默认为柱形宽度的30%，可设固定值
            barCategoryGap : '20%'
        },
        {
            name:'增长率',
            type:'line',
            yAxisIndex: 1,
            data:['-',17.70, 18.40, 17.10, 21.80, 19.90, 18.90, 19.40, 20.60, 20.70],
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        textStyle: {
                            color: '#8c8c8c',
                            fontSize:6
                        }
                    }
                }
            }
        }
    ]
};

// 为echarts对象加载数据
myChart.setOption(option);
myCharts.setOption(option2);