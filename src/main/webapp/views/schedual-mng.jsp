<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>BusAssistant</title>
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
<script src="${assetsPath}/js/schedual-mng.js"></script>
<!--美化滚动条-->
<script src="${assetsPath}/js/scroll/jquery.mCustomScrollbar.concat.min.js"></script>

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
    <jsp:include page="common/sidebar.jsp"/>

    <div class="contents flex-8">
        <div id="schedual-mng">
            <div class="header">
                排班管理
            </div>
            <div class="time-head flex-row">
                <div class="flex-2">
                    <select class="form-control" id="year">
                        <option selected value="">2016</option>
                        <option selected value="">2015</option>
                        <option selected value="">2014</option>
                        <option selected value="">2013</option>
                    </select>
                </div>
                <div class="flex-3">
                    <select class="form-control" id="month">
                        <option selected value="">8月</option>
                        <option selected value="">7月</option>
                        <option selected value="">6月</option>
                        <option selected value="">5月</option>
                    </select>
                </div>
                <div class="flex-3">
                    <button class="btn btn-primary">确定</button>
                    <form action="${rootPath}/schedual/addshow" method="get">
                        <input class="btn btn-primary" type="submit" value="安排下周计划"/>
                    </form>
                </div>

            </div>
            <div id="my_date"></div>            <!--这里是挺好的一个日历-->
        </div>
    </div>

</div>

<!--模板文件-->
<script type="text/html" id="time">
    <p>
        <label id="pre_date"><</label>
        <span id="watchtime">{{year}}年{{month}}月</span>
        <label id="n_date">></label>
    </p>
    <table border="1" id="table-time">
        <thead>
        <tr>
            <td>日</td>
            <td>一</td>
            <td>二</td>
            <td>三</td>
            <td>四</td>
            <td>五</td>
            <td>六</td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        </tbody>
    </table>
</script>
<script type="text/html" id="Tpopstation">
    <div class="schedual-mng-popStation" style="display: none">
        <div class="popheader">
            <div class="title">{{yearmonth}}{{day}}日</div>
            <div class="close">×</div>
            <div class="clearfix"></div>
        </div>

        <div class="popbody scroll">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>线路</th>
                    <th>起点</th>
                    <th>终点</th>
                    <th>乘车人数</th>
                    <th>司机</th>
                    <th>车辆</th>
                </tr>
                </thead>

                <tbody>
                {{each list}}
                    <tr>
                        <td>{{$value.routeName}}</td>
                        <td>{{$value.startStation}}</td>
                        <td>{{$value.startStation}}</td>
                        <td>{{$value.seatNum}}</td>
                        <td>{{$value.driverName}}</td>
                        <td>{{$value.busNumber}}</td>
                    </tr>
                {{/each}}
                <%--<tr>--%>
                    <%--<td>线路1</td>--%>
                    <%--<td>起点1</td>--%>
                    <%--<td>终点1</td>--%>
                    <%--<td>乘车人数1</td>--%>
                    <%--<td>司机1</td>--%>
                    <%--<td>车辆1</td>--%>
                <%--</tr>--%>
                </tbody>
            </table>
        </div>
    </div>
</script>


<!--美化option-->
<script>
    $(function(){
        $('select').selectOrDie();
    });
</script>
<script src="${assetsPath}/js/select/selectordie.js"></script>
</body>
</html>
