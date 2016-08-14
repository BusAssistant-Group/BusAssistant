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
<!--<link href="//vjs.zencdn.net/5.8/video-js.min.css" rel="stylesheet">-->
<!--<link rel="stylesheet" href="./css/square/blue.css"/>-->
<!--<link rel="stylesheet" href="//cdn.bootcss.com/iCheck/1.0.2/skins/flat/blue.css"/>-->

<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="${assetsPath}/js/jquery-accordion-menu.js"></script>
<script src="${assetsPath}/js/icheck.js"></script>
<script src="${assetsPath}/js/template.js"></script>

<script src="${assetsPath}/js/scroll/jquery.mCustomScrollbar.concat.min.js"></script>

<!--<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=mKVc381HERXY2k81WwYCdyLoUBXdDfaW"></script>-->

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
                <div class="buttongroup">
                    <button class="btn btn-danger btn-sm">删除全部</button>
                    <button class="btn btn-info btn-sm">新增+</button>
                </div>
            </div>

            <div class="linebody">
                <div class="first-floor flex-row">
                    <div class="flex-3">
                        <div>
                            <!--<input type="checkbox"/>-->
                            <span class="first-name">线路名称</span>
                        </div>
                    </div>
                    <div class="flex-3">
                        <span class="first-sites">
                            站点
                        </span>

                    </div>
                    <div class="flex-3">
                        <span class="first-operate">操作</span>
                    </div>
                </div>

                <div class="line"></div>


                <c:forEach var="route" items="${routes}">
                <div class="body-floor flex-row">
                    <div class="flex-3 flex-row">
                        <div class="flex-1 checkbox"><input type="checkbox"/></div>
                        <!--<div class="flex-1 file-image"><i class="fa fa-folder-o fa-3x"></i></div>-->
                        <div class="line-name flex-4"><span><a href="#">${route.name}</a></span></div>
                    </div>
                    <div class="flex-3 line-dot">
                        <span>${route.distance}</span>
                        <div class="all-block">
                            <span class="block">...</span>
                        </div>
                    </div>
                    <div class="flex-3 line-operate">
                        <button type="button" class="btn btn-danger btn-sm">删除</button>
                        <button type="button" class="btn btn-warning btn-sm">修改</button>
                        <a href="${rootPath}/user/linestation" class="btn btn-default btn-sm">地图展示</a>
                    </div>
                </div>
                <div class="line"></div>
                </c:forEach>

                <%--<div class="body-floor flex-row">--%>
                    <%--<div class="flex-3 flex-row">--%>
                        <%--<div class="flex-1 checkbox"><input type="checkbox"/></div>--%>
                        <%--<!--<div class="flex-1 file-image"><i class="fa fa-folder-o fa-3x"></i></div>-->--%>
                        <%--<div class="line-name flex-4"><span><a href="#">1号线路</a></span></div>--%>
                    <%--</div>--%>
                    <%--<div class="flex-3 line-dot">--%>
                        <%--<span>1</span>--%>
                        <%--<span>2</span>--%>
                        <%--<div class="all-block">--%>
                            <%--<span class="block">...</span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="flex-3 line-operate">--%>
                        <%--<button type="button" class="btn btn-danger btn-sm">删除</button>--%>
                        <%--<button type="button" class="btn btn-warning btn-sm">修改</button>--%>
                        <%--<button type="button" class="btn btn-default btn-sm">地图展示</button>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="line"></div>--%>

                <%--<div class="body-floor flex-row">--%>
                    <%--<div class="flex-3 flex-row">--%>
                        <%--<div class="flex-1 checkbox"><input type="checkbox"/></div>--%>
                        <%--<!--<div class="flex-1 file-image"><i class="fa fa-folder-o fa-3x"></i></div>-->--%>
                        <%--<div class="line-name flex-4"><span><a href="#">1号线路</a></span></div>--%>
                    <%--</div>--%>
                    <%--<div class="flex-3 line-dot">--%>
                        <%--<span>1</span>--%>
                        <%--<span>2</span>--%>
                        <%--<div class="all-block">--%>
                            <%--<span class="block">...</span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="flex-3 line-operate">--%>
                        <%--<button type="button" class="btn btn-danger btn-sm">删除</button>--%>
                        <%--<button type="button" class="btn btn-warning btn-sm">修改</button>--%>
                        <%--<button type="button" class="btn btn-default btn-sm">地图展示</button>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="line"></div>--%>

                <%--<div class="body-floor flex-row">--%>
                    <%--<div class="flex-3 flex-row">--%>
                        <%--<div class="flex-1 checkbox"><input type="checkbox"/></div>--%>
                        <%--<!--<div class="flex-1 file-image"><i class="fa fa-folder-o fa-3x"></i></div>-->--%>
                        <%--<div class="line-name flex-4"><span><a href="#">1号线路</a></span></div>--%>
                    <%--</div>--%>
                    <%--<div class="flex-3 line-dot">--%>
                        <%--<span>1</span>--%>
                        <%--<span>2</span>--%>
                        <%--<div class="all-block">--%>
                            <%--<span class="block">...</span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="flex-3 line-operate">--%>
                        <%--<button type="button" class="btn btn-danger btn-sm">删除</button>--%>
                        <%--<button type="button" class="btn btn-warning btn-sm">修改</button>--%>
                        <%--<button type="button" class="btn btn-default btn-sm">地图展示</button>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="line"></div>--%>

                <%--<div class="body-floor flex-row">--%>
                    <%--<div class="flex-3 flex-row">--%>
                        <%--<div class="flex-1 checkbox"><input type="checkbox"/></div>--%>
                        <%--<!--<div class="flex-1 file-image"><i class="fa fa-folder-o fa-3x"></i></div>-->--%>
                        <%--<div class="line-name flex-4"><span><a href="#">1号线路</a></span></div>--%>
                    <%--</div>--%>
                    <%--<div class="flex-3 line-dot">--%>
                        <%--<span>1</span>--%>
                        <%--<span>2</span>--%>
                        <%--<div class="all-block">--%>
                            <%--<span class="block">...</span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="flex-3 line-operate">--%>
                        <%--<button type="button" class="btn btn-danger btn-sm">删除</button>--%>
                        <%--<button type="button" class="btn btn-warning btn-sm">修改</button>--%>
                        <%--<button type="button" class="btn btn-default btn-sm">地图展示</button>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="line"></div>--%>
            </div>



            <div id="allmap"></div>

        </div>
    </div>

    <!--<div class="clearfix"></div>-->
</div>

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

<!--绑定动画-->
<script>
    $(function(){
        $(".block").click(function(){
            console.log("点击了");
            var str=['<div class="angle-scroll">',
                '                                <div class="angle">',
                '                                    <div class="angle-up"></div>',
                '                                    <div class="angle-down"></div>',
                '                                </div>',
                '                                <div class="scroll">',
                    '<div>',
                '                                    <div class="line-site">1号站点</div>',
                '                                    <div class="line-site">2号站点</div>',
                '                                    <div class="line-site">3号站点</div>',
                '                                    <div class="line-site">4号站点</div>',
                '                                    <div class="line-site">5号站点</div>',
                '                                    <div class="line-site">6号站点</div>',
                '                                    <div class="line-site">7号站点</div>',
                '                                    <div class="line-site">8号站点</div>',
                '                                    <div class="line-site">9号站点</div>',
                    '</div>',
                '                                </div>',
                '                            </div>'].join("");
//            $(this).parent().append(str);
            $(this).parent().append(str);

            $(window).on("load",function(){
                $(".scroll").mCustomScrollbar();
            });

            $(".scroll").mCustomScrollbar({
                axis:"y", // horizontal scrollbar
                theme:"minimal-dark"
            });

            var $menu = $(this).parent().find(".angle-scroll");

//            $menu.fadeIn(100);
            $menu.addClass("slideInDownFast animated");
            $menu.one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(e) {

                var $menu = $(this).parent().find(".angle-scroll");
                $(document).click(function(e) {
                    if(!(e.target == $menu[0] || $.contains($menu[0], e.target))) {
                        $menu.addClass("slideOutUp animated");
                        $menu.fadeOut(300);
                    }
                });

            });
        })

//        $("#lineManage").click(function(){
//            $(this).parent().find(".angle-scroll").addClass("slideOutUp animated");
//        })
    })

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

<!--<script type="text/javascript">-->
    <!--// 百度地图API功能-->
    <!--var map = new BMap.Map("allmap",{minZoom:4,maxZoom:8}); // 创建Map实例,设置地图允许的最小/大级别-->
    <!--map.centerAndZoom(new BMap.Point(116.4035,39.915),8);-->
    <!--map.enableScrollWheelZoom(true);-->
<!--</script>-->


</body>
</html>