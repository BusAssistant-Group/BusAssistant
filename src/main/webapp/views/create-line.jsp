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
<!--<link href="//vjs.zencdn.net/5.8/video-js.min.css" rel="stylesheet">-->
<!--<link rel="stylesheet" href="./css/square/blue.css"/>-->
<!--<link rel="stylesheet" href="//cdn.bootcss.com/iCheck/1.0.2/skins/flat/blue.css"/>-->

<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="${assetsPath}/js/jquery-accordion-menu.js"></script>
<script src="${assetsPath}/js/icheck.js"></script>
<script src="${assetsPath}/js/template.js"></script>

<script src="${assetsPath}/js/scroll/jquery.mCustomScrollbar.concat.min.js"></script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=mKVc381HERXY2k81WwYCdyLoUBXdDfaW"></script>

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
<div class="mask"></div>

<div class="main flex-row">

    <jsp:include page="common/sidebar.jsp"/>

    <div class="contents flex-8" id="lineManage">
        <div class="header-all">
            <div class="header">
                <div class="path">
                    线路管理
                </div>
                <!--<div class="buttongroup">-->
                <!--<button class="btn btn-danger btn-sm">删除全部</button>-->
                <!--<button class="btn btn-info btn-sm">新增+</button>-->
                <!--</div>-->

            </div>

            <div class="map">

                <%--<div class="alldot scroll">--%>
                    <%--&lt;%&ndash;<div class="dot" longitude="118.46" latitude="32.03">南京</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="line"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="dot" longitude="113.14" latitude="23.16" id="test">广东</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="line"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="dot">上海</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="line"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="dot">厦门</div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="line"></div>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="dot">1号站点</div>&ndash;%&gt;--%>
                    <%--<c:forEach var="route" items="${routes}">--%>
                        <%--<div class="dot" dataid="${route.rouId}">${route.name}</div>--%>
                        <%--<div class="line"></div>--%>
                    <%--</c:forEach>--%>
                        <%--<div class="dot" io="create"><a href="${rootPath}/map/createline">创建新线路</a></div>--%>
                        <%--<div class="line"></div>--%>
                <%--</div>--%>
                <div id="allmap"></div>
                <!--<div id="r-result" style="width: 100%"></div>-->
                <div id="driving_way">
                    <select>
                        <option value="0">最少时间</option>
                        <option value="1">最短距离</option>
                        <option value="2">避开高速</option>
                    </select>
                    <input type="button" id="result" value="查询"/>
                </div>
                <div id="r-result"></div>

            </div>



        </div>
    </div>

    <!--<div class="clearfix"></div>-->
</div>


<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=mKVc381HERXY2k81WwYCdyLoUBXdDfaW"></script>
<%--线路显示站点--%>
<script src="${assetsPath}/js/line-map.js" charset="utf-8"></script>
<script>
    $(function(){
        var mapB = new BMap.Map("allmap");
        var map=new Map(mapB);
    })
</script>



<script type="text/javascript">
    /*    // 百度地图API功能
     var map = new BMap.Map("allmap",{minZoom:1,maxZoom:25}); // 创建Map实例,设置地图允许的最小/大级别
     map.enableScrollWheelZoom(true);
     map.addControl(new BMap.NavigationControl());

     //    map.centerAndZoom(new BMap.Point(118.46, 32.03), 12);     //设置中心点与级别

     var point=map.centerAndZoom(new BMap.Point(118.46, 32.03), 12);
     var marker = new BMap.Marker(point);
     map.addOverlay(marker);
     //添加麻点点击信息
     var opts = {
     width : 200,     // 信息窗口宽度
     height: 100,     // 信息窗口高度
     title : "海底捞王府井店" , // 信息窗口标题
     enableMessage:true,//设置允许信息窗发送短息
     message:"亲耐滴，晚上一起吃个饭吧？戳下面的链接看下地址喔~"
     }
     var infoWindow = new BMap.InfoWindow("地址：北京市东城区王府井大街88号乐天银泰百货八层", opts);  // 创建信息窗口对象
     marker.addEventListener("click", function(){
     map.openInfoWindow(infoWindow,point); //开启信息窗口
     });

     //麻点
     // 编写自定义函数,创建标注
     //    function addMarker(point){
     //        var marker = new BMap.Marker(point);
     //        map.addOverlay(marker);
     //        //添加麻点点击信息
     //        var opts = {
     //            width : 200,     // 信息窗口宽度
     //            height: 100,     // 信息窗口高度
     //            title : "海底捞王府井店" , // 信息窗口标题
     //            enableMessage:true,//设置允许信息窗发送短息
     //            message:"亲耐滴，晚上一起吃个饭吧？戳下面的链接看下地址喔~"
     //        }
     //        var infoWindow = new BMap.InfoWindow("地址：北京市东城区王府井大街88号乐天银泰百货八层", opts);  // 创建信息窗口对象
     //        marker.addEventListener("click", function(){
     //            map.openInfoWindow(infoWindow,point); //开启信息窗口
     //        });
     //    }

     //    //添加麻点点击信息
     //    var opts = {
     //        width : 200,     // 信息窗口宽度
     //        height: 100,     // 信息窗口高度
     //        title : "海底捞王府井店" , // 信息窗口标题
     //        enableMessage:true,//设置允许信息窗发送短息
     //        message:"亲耐滴，晚上一起吃个饭吧？戳下面的链接看下地址喔~"
     //    }
     //    var infoWindow = new BMap.InfoWindow("地址：北京市东城区王府井大街88号乐天银泰百货八层", opts);  // 创建信息窗口对象
     //    marker.addEventListener("click", function(){
     //        map.openInfoWindow(infoWindow,point); //开启信息窗口
     //    });*/


//    添加麻点
//    var map = new BMap.Map("allmap");
//    map.enableScrollWheelZoom(true);        //允许鼠标滚轮
//    map.addControl(new BMap.NavigationControl());     //添加缩放控件
//    addMarker(118.46, 32.03);
//
//    function addMarker(longitude,latitude){
//        var point = new BMap.Point(longitude, latitude);
//        var marker = new BMap.Marker(point);  // 创建标注
//        map.addOverlay(marker);              // 将标注添加到地图中
//        map.centerAndZoom(point, 15);
//        var opts = {
//            width : 200,     // 信息窗口宽度
//            height: 100,     // 信息窗口高度
//            title : "海底捞王府井店" , // 信息窗口标题
//            enableMessage:true,//设置允许信息窗发送短息
//            message:"亲耐滴，晚上一起吃个饭吧？戳下面的链接看下地址喔~"
//        }
//        var infoWindow = new BMap.InfoWindow("地址：北京市东城区王府井大街88号乐天银泰百货八层", opts);  // 创建信息窗口对象
//        marker.addEventListener("click", function(){
//            map.openInfoWindow(infoWindow,point); //开启信息窗口
//        });
//    }


/*    //添加平移效果

    $("#test").click(function(){
        var longgitude=$(this).attr("longitude");
        var latitude=$(this).attr("latitude");
        addMarker(longgitude,latitude);
        map.panTo(new BMap.Point(longgitude,latitude));   //两秒后移动到广州
    })

    //给定两个点给出驾车路线
    var start = "天安门";
    var end = "百度大厦";

    var p1 = new BMap.Point(116.301934,39.977552);          //!!!!!经纬度极度相关
    var p2 = new BMap.Point(116.508328,39.919141);

    //三种驾车策略：最少时间，最短距离，避开高速
    var routePolicy = [BMAP_DRIVING_POLICY_LEAST_TIME,BMAP_DRIVING_POLICY_LEAST_DISTANCE,BMAP_DRIVING_POLICY_AVOID_HIGHWAYS];

    $("#result").click(function(){
        map.clearOverlays();
        var i=$("#driving_way select").val();
        search(p1,p2,routePolicy[i]);           //起点和终点与路径的权值
        function search(start,end,route){
            var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true},policy: route});
            driving.search(start,end);
        }
    });*/
</script>
<!--美化滚动条-->
<script>
    (function($){
        $(window).on("load",function(){
            $(".scroll").mCustomScrollbar();
        });

        $(".scroll").mCustomScrollbar({
            axis:"y", // horizontal scrollbar
            theme:"minimal-dark"
        });
    })(jQuery);
</script>

<!--//动态创建搜索表单-->
<script type="text/javascript">
    (function($) {

        //@header 头部元素
        //@list 无需列表
        //创建一个搜素表单
        function filterList(header, list) {
            var form = $("<form>").attr({
                "class":"filterform",
                action:"#"
            }), input = $("<input>").attr({
                "class":"filterinput",
                type:"text"
            });
            $(form).append(input).appendTo(header);
            $(input).change(function() {              //过滤器的具体效果
                var filter = $(this).val();
                if (filter) {
                    $matches = $(list).find("a:Contains(" + filter + ")").parent();
                    $("li", list).not($matches).slideUp();
                    $matches.slideDown();
                } else {
                    $(list).find("li").slideDown();
                }
                return false;
            }).keyup(function() {           //用来监听键盘的效果的
                $(this).change();
            });
        }

        $(function() {                     //最先运行
            filterList($("#form"), $("#demo-list"));
        });

    })(jQuery);
</script>

<!--icheck    radio不能正常使用-->
<script>
    $(document).ready(function(){
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>

<script>
    $("#create").click(function(){
        var longgitude=$(this).attr("longitude");
        var latitude=$(this).attr("latitude");
        addMarker(longgitude,latitude);
        map.panTo(new BMap.Point(longgitude,latitude));   //两秒后移动到广州
    })

</script>


</body>
</html>