<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<link rel="stylesheet" href="${assetsPath}/css/app.min.css"/>


<link rel="stylesheet" href="//cdn.bootcss.com/iCheck/1.0.1/skins/square/blue.css"/>
<!--<link rel="stylesheet" href="./css/square/blue.css"/>-->
<!--<link rel="stylesheet" href="//cdn.bootcss.com/iCheck/1.0.2/skins/flat/blue.css"/>-->

<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="${assetsPath}/js/jquery-accordion-menu.js"></script>
<script src="${assetsPath}/js/icheck.js"></script>
<script src="${assetsPath}/js/template.js"></script>
<script src="${assetsPath}/js/edit.js"></script>
<!--<script src="js/schedual-mng.js"></script>-->
<!--美化滚动条-->
<script src="${assetsPath}/js/scroll/jquery.mCustomScrollbar.concat.min.js"></script>
<!--hcharts-->
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>

<style type="text/css">
    *{box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;}
    body{background:#f0f0f0;}
    /*.content{width:260px;margin:100px auto;}*/
    .filterinput{
        background-color:rgba(249, 244, 244, 0);
        border-radius:15px;
        width:90%;
        height:30px;
        border:thin solid #FFF;
        text-indent:0.5em;
        font-weight:bold;
        color:#FFF;
    }
    #demo-list a{
        overflow:hidden;
        text-overflow:ellipsis;
        -o-text-overflow:ellipsis;
        white-space:nowrap;
        width:100%;
    }
</style>


<script type="text/javascript">
    jQuery(document).ready(function () {
        jQuery("#jquery-accordion-menu").jqueryAccordionMenu();   //启用插件   jQuery等同于$

    });

    $(function(){
        //顶部导航切换
        $("#demo-list li").click(function(){
            $("#demo-list li.active").removeClass("active")
            $(this).addClass("active");
        })
    })
</script>

<body>
<!--<div class="mask"></div>-->

<div class="main flex-row">
    <div class="flex-2">
        <div class="nav">
            <div id="jquery-accordion-menu" class="jquery-accordion-menu white">
                <ul id="demo-list" class="nav-list">
                    <div class="logo">
                        BusAssistant
                    </div>
                    <li><a href="workers-mng.html"><i class="fa fa-user-plus"></i>员工信息管理</a></li>
                    <li><a href="cars-mng.html"><i class="fa fa-bus"></i>车辆信息管理 </a><span class="jquery-accordion-menu-label">
                12 </span></li>
                    <li class="active"><a href="schedual-mng.html"><i class="fa fa-table"></i>排班管理</a>
                        <ul class="submenu">
                            <li><a href="#">服务1 </a></li>
                            <li><a href="#">服务2 </a></li>
                            <li><a href="#">服务3 </a>
                                <ul class="submenu">
                                    <li><a href="#">服务4 </a></li>
                                    <li><a href="#">服务5 </a></li>
                                    <li><a href="#">服务6 </a></li>
                                    <li><a href="#">服务7 </a></li>
                                </ul>
                            </li>
                            <li><a href="#">服务8 </a></li>
                        </ul>
                    </li>
                    <li><a href="file-shared.html"><i class="fa fa-level-up"></i>线路与站点管理</a></li>
                    <li><a href="statistics.html"><i class="fa fa-bar-chart"></i>统计分析</a></li>
                    <li><a href="system-mng.html"><i class="fa fa-cogs"></i>系统管理</a></li>
                </ul>
                <div class="jquery-accordion-menu-footer">
                    Footer
                </div>
            </div>
        </div>

        <div class="clearfix"></div>
    </div>

    <div class="contents flex-8">
        <div id="schedual-mng">
            <div class="header">
                系统管理
            </div>
            <div class="time-head">
                <div id="container1" class="stationGraph" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                <div id="container2" class="lineGraph" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

            </div>
        </div>
    </div>

</div>


<script src="${assetsPath}/js/system-mng.js"></script>
<script type="text/html" id="Tpopstationgraph">
    <div class="popstationgraph popwin" style="display: none">
        <div class="popheader">
            <div class="title">站点统计</div>
            <div class="close">×</div>
            <div class="clearfix"></div>
        </div>
        <div class="popbody scroll">
            <div class="button-group">
                <div class="clearfix"></div>
                <button class="dayB zyh-button-blue pull-left">按日查看</button>
                <button class="weekB zyh-button-blue pull-left">按周查看</button>
                <button class="monthB zyh-button-blue pull-left">按月查看</button>
            </div>
            <div class="clearfix"></div>
            <div class="allGraph"></div>
        </div>
    </div>
</script>




<!--<script>-->
<!--(function($){-->
<!--var startScroll=function(){-->
<!--$(window).on("load",function(){-->
<!--$(".scroll").mCustomScrollbar();-->
<!--});-->

<!--$(".scroll").mCustomScrollbar({-->
<!--axis:"y", // horizontal scrollbar-->
<!--theme:"minimal-dark"-->
<!--});-->
<!--}-->
<!--})(jQuery);-->
<!--</script>-->

<!--美化option-->
<script>
    $(function(){
        $('select').selectOrDie();
    });
</script>
<script src="${assetsPath}/js/select/selectordie.js"></script>


<script type="text/javascript">
    $(function () {
        $('#container1').highcharts({
            chart: { zoomType: 'xy' },
            title: { text: '站点乘坐情况' },
            xAxis: [{
                categories: ['A', 'B', 'C', 'D', 'E', 'F','G', 'H', 'I', 'J', 'K', 'L'],
                crosshair: true
            }],
            yAxis: [{ // Primary yAxis
                labels: {
                    format: '{value}%',
                    style: {
                        color: Highcharts.getOptions().colors[2]
                    }
                },
                title: {
                    text: '乘坐率',
                    style: {
                        color: Highcharts.getOptions().colors[2]
                    }
                },
                opposite: true

            }, { // Secondary yAxis
                gridLineWidth: 0,
                title: {
                    text: '乘坐人数',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                labels: {
                    format: '{value} 人',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                }
            }],
            tooltip: {
                shared: true
            },
            legend: {
                layout: 'vertical',
                align: 'left',
                x: 80,
                verticalAlign: 'top',
                y: 55,
                floating: true,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
            },
            series: [{
                name: '乘坐人数',
                type: 'column',
                yAxis: 1,
                data: [49, 71, 106, 129, 144, 176, 135, 148, 216, 194, 95, 54],
                tooltip: {
                    valueSuffix: ' 人'
                }
            }, {
                name: '乘坐率',
                type: 'spline',
                data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6],
                tooltip: {
                    valueSuffix: ' %'
                }
            }]
        });
        $('#container2').highcharts({
            chart: { zoomType: 'xy' },
            title: { text: '线路乘坐情况' },
            xAxis: [{
                categories: ['A', 'B', 'C', 'D', 'E', 'F','G', 'H', 'I', 'J', 'K', 'L'],
                crosshair: true
            }],
            yAxis: [{ // Primary yAxis
                labels: {
                    format: '{value}%',
                    style: {
                        color: Highcharts.getOptions().colors[2]
                    }
                },
                title: {
                    text: '乘坐率',
                    style: {
                        color: Highcharts.getOptions().colors[2]
                    }
                },
                opposite: true

            }, { // Secondary yAxis
                gridLineWidth: 0,
                title: {
                    text: '乘坐人数',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                labels: {
                    format: '{value} 人',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                }
            }],
            tooltip: {
                shared: true
            },
            legend: {
                layout: 'vertical',
                align: 'left',
                x: 80,
                verticalAlign: 'top',
                y: 55,
                floating: true,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
            },
            series: [{
                color: '#8B6792',
                name: '乘坐人数',
                type: 'column',
                yAxis: 1,
                data: [49, 71, 106, 129, 144, 176, 135, 148, 216, 194, 95, 54],
                tooltip: {
                    valueSuffix: ' 人'
                }
            }, {
                name: '乘坐率',
                type: 'spline',
                data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6],
                tooltip: {
                    valueSuffix: ' %'
                }
            }]
        });
    });
</script>

</body>
</html>
