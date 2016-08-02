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
<link href="//vjs.zencdn.net/5.8/video-js.min.css" rel="stylesheet">
<!--<link rel="stylesheet" href="./css/square/blue.css"/>-->
<!--<link rel="stylesheet" href="//cdn.bootcss.com/iCheck/1.0.2/skins/flat/blue.css"/>-->

<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="${assetsPath}/js/jquery-accordion-menu.js"></script>
<script src="${assetsPath}/js/icheck.js"></script>
<script src="${assetsPath}/js/template.js"></script>

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
                    <li><a href="schedual-mng.html"><i class="fa fa-table"></i>排班管理</a>
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
                    <li class="active"><a href="file-shared.html"><i class="fa fa-level-up"></i>线路与站点管理</a></li>
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
        <div class="header-all">
            <div class="header flex-row">
                <div class="flex-7 path">
                    根目录
                </div>
                <!--<div class="flex-3 search">-->
                    <!--<div class="input-group">-->
                        <!--<input type="text" class="form-control" placeholder="搜索内容...">-->
                              <!--<span class="input-group-btn">-->
                                <!--<button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>-->
                              <!--</span>-->
                    <!--</div>-->
                <!--</div>-->
            </div>
            <!--<div class="line"></div>-->
            <div class="file-body">
                <!--<input type="checkbox"/>-->

                <div class="first-floor flex-row">
                    <div class="flex-3">
                        <div>
                            <input type="checkbox"/>
                            <span class="filename">名称</span>
                        </div>
                    </div>
                    <div class="flex-3">
                        大小
                    </div>
                    <div class="flex-3">
                        创建者
                    </div>
                    <div class="flex-3">
                        更新日期
                    </div>
                </div>
                <div class="line"></div>

                <div class="body-floor flex-row">
                    <div class="flex-3 flex-row">
                        <div class="flex-1 checkbox"><input type="checkbox"/></div>
                        <!--<div class="flex-1 file-image"><i class="fa fa-folder-o fa-3x"></i></div>-->
                        <div class="flex-1 file-image"><i class="iconfont icon-word"></i></div>
                        <div class="file-name flex-4"><span><a href="#">一号分类内容测试内容测试内容测试内容测试内容测试内容测试内容测试内容测试</a></span></div>
                    </div>
                    <div class="flex-3 file-size">
                        <span>1.27MB</span>
                    </div>
                    <div class="flex-3 file-creator">
                        MR.Z
                    </div>
                    <div class="flex-3 file-time">
                        2013.12.06
                    </div>
                </div>
                <div class="line"></div>

                <div class="body-floor flex-row">
                    <div class="flex-3 flex-row">
                        <div class="flex-1 checkbox"><input type="checkbox"/></div>
                        <div class="flex-1 file-image"><i class="iconfont icon-ppt"></i></div>
                        <div class="file-name flex-4"><span><a href="#">一号分类</a></span></div>
                    </div>
                    <div class="flex-3 file-size">
                        <span>1.27MB</span>
                    </div>
                    <div class="flex-3 file-creator">
                        MR.Z
                    </div>
                    <div class="flex-3 file-time">
                        2013.12.06
                    </div>
                </div>
                <div class="line"></div>

                <div class="body-floor flex-row">
                    <div class="flex-3 flex-row">
                        <div class="flex-1 checkbox"><input type="checkbox"/></div>
                        <div class="flex-1 file-image"><i class="iconfont icon-xls"></i></div>
                        <div class="file-name flex-4"><span><a href="#">一号分类</a></span></div>
                    </div>
                    <div class="flex-3 file-size">
                        <span>1.27MB</span>
                    </div>
                    <div class="flex-3 file-creator">
                        MR.Z
                    </div>
                    <div class="flex-3 file-time">
                        2013.12.06
                    </div>
                </div>
                <div class="line"></div>

                <div class="body-floor flex-row">
                    <div class="flex-3 flex-row">
                        <div class="flex-1 checkbox"><input type="checkbox"/></div>
                        <div class="flex-1 file-image"><i class="iconfont icon-txt"></i></div>
                        <div class="file-name flex-4"><span><a href="#">一号分类</a></span></div>
                    </div>
                    <div class="flex-3 file-size">
                        <span>1.27MB</span>
                    </div>
                    <div class="flex-3 file-creator">
                        MR.Z
                    </div>
                    <div class="flex-3 file-time">
                        2013.12.06
                    </div>
                </div>
                <div class="line"></div>

                <div class="body-floor flex-row">
                    <div class="flex-3 flex-row">
                        <div class="flex-1 checkbox"><input type="checkbox"/></div>
                        <div class="flex-1 file-image"><i class="fa fa-folder-o fa-3x"></i></div>
                        <div class="file-name flex-4"><span><a href="#">一号分类</a></span></div>
                    </div>
                    <div class="flex-3 file-size">
                        <span>1.27MB</span>
                    </div>
                    <div class="flex-3 file-creator">
                        MR.Z
                    </div>
                    <div class="flex-3 file-time">
                        2013.12.06
                    </div>
                </div>
                <div class="line"></div>

                <nav>
                    <ul class="pagination pull-right">
                        <li><a href="#">上一页</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#">下一页</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <!--<div class="clearfix"></div>-->
</div>

<!--<i class="iconfont icon-face"></i>-->

<!--<img src="images/02.jpg" alt=""/>-->

<!--文件第一次弹窗-->
<!--<div class="file-out" style="display: none;" >
        <div class="pre-btn"></div>
        &lt;!&ndash;<div class="clearfix"></div>&ndash;&gt;
        <div class="file-body">
            <div class="content">
                <div class="file">
                    <div class="file-thumbnails">
                        <div class="file-name">SQLdb_ilearn_3</div>
                        <div class="file-class">文件类型SQL</div>
                    </div>
                    <div class="file-size">
                        <button class="download">查看文件(4MB)</button>
                    </div>
                </div>
            </div>
            &lt;!&ndash;<div class="clearfix"></div>&ndash;&gt;
            <div class="attribute">
                <div class="a-info">
                    <div class="a-first">
                        <div class="file-from">所属文件夹:数据库</div>
                        <div class="a-close">×</div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="file-name">SQLdb_ilearn_3</div>
                    <div class="collected">收藏量&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2333</div>
                    <div class="a-third">
                        <div class="file-uptime"><i class="fa fa-clock-o"></i>2013-12-12</div>
                        <div class="file-people"><i class="fa fa-user"></i>上传人-MR.Z</div>
                    </div>
                </div>
                <div class="line"></div>
                <div class="a-operate">
                    <ul>
                        <li><a href="#"><i class="fa fa-download"></i>&nbsp;&nbsp;下载</a></li>
                        <li><a href="#"><i class="fa fa-star"></i>&nbsp;&nbsp;收藏</a></li>
                    </ul>
                </div>
                <div class="line"></div>
                <div class="a-related">
                    <ul>
                        <li><a href="#"><i class="fa fa-link"></i>&nbsp;&nbsp;&nbsp;关联内容</a></li>
                        <li><a href="#"><i class="fa fa-tag"></i>&nbsp;&nbsp;&nbsp;标签</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="next-btn"></div>
        &lt;!&ndash;<div class="clearfix"></div>&ndash;&gt;
    </div>-->

<!--fiel-watch二次弹窗窗口模板-->
<!--@依赖于文件弹窗-->
<script id="file-watch-template" type="text/html" charset="utf-8">
    <div class="file-watch" style="display: block;">
        <div class="close-circle">×</div>
        <div class="video">
            <video id="really-cool-video" class="video-js vjs-default-skin" controls
                   preload="auto" poster="really-cool-video-poster.jpg"
                   data-setup='{}'>
                <source src="http://7xpl2y.com1.z0.glb.clouddn.com/asdf.mp4" type="video/mp4">
                <source src="really-cool-video.webm" type="video/webm">
                <p class="vjs-no-js">
                    To view this video please enable JavaScript, and consider upgrading to a web browser
                    that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
                </p>
            </video>
        </div>
    </div>
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


</body>
</html>
