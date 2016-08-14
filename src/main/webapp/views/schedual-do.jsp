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
<script src="${assetsPath}/js/schedual-do.js"></script>
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
    <div id="schedual-do">
      <div class="header">
        排班管理(可调)
      </div>

      <div><button class="btn btn-primary specialB" >特殊事件选择</button></div>
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
        <tr>
          <td>线路1</td>
          <td>起点1</td>
          <td>终点1</td>
          <td>乘车人数1</td>
          <td>司机1</td>
          <td>车辆1</td>
        </tr>
        <tr>
          <td>线路1</td>
          <td>起点1</td>
          <td>终点1</td>
          <td>乘车人数1</td>
          <td>司机1</td>
          <td>车辆1</td>
        </tr>
        <tr>
          <td>线路1</td>
          <td>起点1</td>
          <td>终点1</td>
          <td>乘车人数1</td>
          <td>司机1</td>
          <td>车辆1</td>
        </tr>
        <tr>
          <td>线路1</td>
          <td>起点1</td>
          <td>终点1</td>
          <td>乘车人数1</td>
          <td>司机1</td>
          <td>车辆1</td>
        </tr>
        <tr>
          <td>线路1</td>
          <td>起点1</td>
          <td>终点1</td>
          <td>乘车人数1</td>
          <td>司机1</td>
          <td>车辆1</td>
        </tr>
        <tr>
          <td>线路1</td>
          <td>起点1</td>
          <td>终点1</td>
          <td>乘车人数1</td>
          <td>司机1</td>
          <td>车辆1</td>
        </tr>
        <tr>
          <td>线路1</td>
          <td>起点1</td>
          <td>终点1</td>
          <td>乘车人数1</td>
          <td>司机1</td>
          <td>车辆1</td>
        </tr>
        <tr>
          <td>线路1</td>
          <td>起点1</td>
          <td>终点1</td>
          <td>乘车人数1</td>
          <td>司机1</td>
          <td>车辆1</td>
        </tr>
        <tr>
          <td>线路1</td>
          <td>起点1</td>
          <td>终点1</td>
          <td>乘车人数1</td>
          <td>司机1</td>
          <td>车辆1</td>
        </tr>
        <tr>
          <td>线路1</td>
          <td>起点1</td>
          <td>终点1</td>
          <td>乘车人数1</td>
          <td>司机1</td>
          <td>车辆1</td>
        </tr>
        <tr>
          <td>线路1</td>
          <td>起点1</td>
          <td>终点1</td>
          <td>乘车人数1</td>
          <td>司机1</td>
          <td>车辆1</td>
        </tr>
        <tr>
          <td>线路1</td>
          <td>起点1</td>
          <td>终点1</td>
          <td>乘车人数1</td>
          <td>司机1</td>
          <td>车辆1</td>
        </tr>
        <tr>
          <td>线路1</td>
          <td>起点1</td>
          <td>终点1</td>
          <td>乘车人数1</td>
          <td>司机1</td>
          <td>车辆1</td>
        </tr>
        <tr>
          <td>线路1</td>
          <td>起点1</td>
          <td>终点1</td>
          <td>乘车人数1</td>
          <td>司机1</td>
          <td>车辆1</td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</script>

<script type="text/html" id="Tpopspecial">
  <div class="popspecial popwin" style="display: none">
    <div class="popheader">
      <div class="title">特殊事件</div>
      <div class="close">×</div>
      <div class="clearfix"></div>
    </div>
    <div class="popbody scroll">
      <div class="carman">
        <div class="type">
          <span class="type">司机&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><button class="btn btn-primary carman-add">+</button></span></span>
        </div>
        <div class="carman-floor">
          <div class="name">司机名称</div>
          <div class="flex-row">
            <div class="other flex-6">
              <p><strong>备注:</strong>有事请假</p>
            </div>
            <div class="operate flex-6">
              <div class="pull-right">
                <i class="fa fa-pencil"></i>
                <i class="fa fa-trash-o"></i>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>
        <div class="carman-floor">
          <div class="name">司机名称</div>
          <div class="flex-row">
            <div class="other flex-6">
              <p><strong>备注:</strong>有事请假</p>
            </div>
            <div class="operate flex-6">
              <div class="pull-right">
                <i class="fa fa-pencil"></i>
                <i class="fa fa-trash-o"></i>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>
        <div class="carman-floor">
          <div class="name">司机名称</div>
          <div class="flex-row">
            <div class="other flex-6">
              <p><strong>备注:</strong>有事请假</p>
            </div>
            <div class="operate flex-6">
              <div class="pull-right">
                <i class="fa fa-pencil"></i>
                <i class="fa fa-trash-o"></i>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="car">
        <div class="type">
          <span class="type">车辆&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><button class="btn btn-primary car-add">+</button></span></span>
        </div>


        <div class="carman-floor">
          <div class="name">车牌号</div>
          <div class="flex-row">
            <div class="other flex-6">
              <p><strong>备注:</strong>请假了</p>
            </div>
            <div class="operate flex-6">
              <div class="pull-right">
                <i class="fa fa-pencil"></i>
                <i class="fa fa-trash-o"></i>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>

        <div class="carman-floor">
          <div class="name">司机名称</div>
          <div class="flex-row">
            <div class="other flex-6">
              <p><strong>备注:</strong>有事请假</p>
            </div>
            <div class="operate flex-6">
              <div class="pull-right">
                <i class="fa fa-pencil"></i>
                <i class="fa fa-trash-o"></i>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>

        <div class="carman-floor">
          <div class="name">司机名称</div>
          <div class="flex-row">
            <div class="other flex-6">
              <p><strong>备注:</strong>有事请假</p>
            </div>
            <div class="operate flex-6">
              <div class="pull-right">
                <i class="fa fa-pencil"></i>
                <i class="fa fa-trash-o"></i>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</script>
<script type="text/html" id="Tpopcarman-add">
  <div class="popcarman-add popwin" style="display: none">
    <div class="popheader">
      <div class="title">{{title}}</div>
      <div class="close">×</div>
      <div class="clearfix"></div>
    </div>
    <div class="popbody">
      <div class="input">
        <div class="name">
          <strong>{{first}}:</strong>
          <input class="noneborder" type="text"/>
        </div>
        <div class="other">
          <strong>{{second}}</strong>
          <input class="noneborder" type="text"/>
        </div>
      </div>

      <div class="pull-right">
        <button class="zyh-button-blue">提交</button>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>
</script>

<!--美化scroll-->
<script>
  $(window).on("load",function(){
    $(".scroll").mCustomScrollbar();
  });

  $(".scroll").mCustomScrollbar({
    axis:"y", // horizontal scrollbar
    theme:"minimal-dark"
  });
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
