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
<link href="//vjs.zencdn.net/5.8/video-js.min.css" rel="stylesheet">
<!--<link rel="stylesheet" href="./css/square/blue.css"/>-->
<!--<link rel="stylesheet" href="//cdn.bootcss.com/iCheck/1.0.2/skins/flat/blue.css"/>-->

<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="${assetsPath}/js/jquery-accordion-menu.js"></script>
<script src="${assetsPath}/js/icheck.js"></script>
<script src="${assetsPath}/js/template.js"></script>
<script src="${assetsPath}/js/edit.js"></script>

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


    <div class="contents flex-8">
        <div id="cars-mng">
            <table class="table">
               <thead>
                   <th>车牌号</th>
                   <th>品牌</th>
                   <th>座位数量</th>
                   <th>注册日期</th>
                   <th>保险日期</th>
                   <%--<th>驾驶证</th>--%>
                   <th>行驶证</th>
                   <th style="width: 150px;"></th>
               </thead>

                <c:forEach items="${cars}" var="car">
                    <tbody>
                    <td>${car.number}</td>
                    <td>${car.brand}</td>
                    <td>${car.seatnum}</td>
                    <td>${car.registdate}</td>
                    <td>${car.insurancedate}</td>
                    <%--<td>${car.drivelicense}</td>--%>
                    <td>${car.vehiclelicense}</td>

                    <td>
                        <button class="btn btn-success btn-slim btn-edit" type="button" data-toggle="modal" data-target="#edit_car_info">编辑</button>
                        <button class="btn btn-danger btn-slim deleteBt" datavalue="${car.busId}" type="button">删除</button>
                    </td>
                    </tbody>
                </c:forEach>

            </table>

            <button id="new-car" class="btn btn-primary" type="button" data-toggle="modal" data-target="#add_new_car">添加车辆</button>
        </div>
    </div>

</div>




<!-- Modal -->
<div class="modal fade" id="edit_car_info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">

         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel1">编辑车辆信息</h4>
         </div>

         <div class="modal-body">
             <form class="form-horizontal"  action="" method="POST">
                     <div class="form-group">
                         <label class="col-sm-3 control-label">车辆 : </label>
                         <div class="col-sm-9"><input type="text" class="form-control"></div>
                     </div>
                     <div class="form-group">
                         <label class="col-sm-3 control-label">品牌 : </label>
                         <div class="col-sm-9"><input type="text" class="form-control"></div>
                     </div>
                     <div class="form-group">
                         <label class="col-sm-3 control-label">座位 : </label>
                         <div class="col-sm-9"><input type="text" class="form-control"></div>
                     </div>
                     <div class="form-group">
                         <label class="col-sm-3 control-label">注册日期 : </label>
                         <div class="col-sm-9"><input type="text" class="form-control"></div>
                     </div>
                     <div class="form-group">
                         <label class="col-sm-3 control-label">保险日期 : </label>
                         <div class="col-sm-9"><input type="text" class="form-control"></div>
                     </div>
                     <div class="form-group">
                         <label class="col-sm-3 control-label">驾驶证 : </label>
                         <div class="col-sm-9"><input type="text" class="form-control"></div>
                     </div>
                     <div class="form-group">
                         <label class="col-sm-3 control-label">行驶证 : </label>
                         <div class="col-sm-9"><input type="text" class="form-control"></div>
                     </div>
                     <div class="form-group sub-btn">
                       <button type="submit" class="btn btn-primary">提交更改</button>
                     </div>
             </form>
         </div>

      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>


<!-- Modal -->
<div class="modal fade" id="add_new_car" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">

         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">添加新车辆</h4>
         </div>

          <%--String number, String brand, int seatnum, Timestamp registdate,
                         Timestamp insurancedate, String vehiclelicense--%>
         <div class="modal-body">
             <form class="form-horizontal"  action="${rootPath}/car/add" method="POST">
                 <div class="form-group">
                     <label class="col-sm-3 control-label">车牌号 : </label>
                     <div class="col-sm-9"><input type="text" name="number" class="form-control"></div>
                 </div>
                 <div class="form-group">
                     <label class="col-sm-3 control-label">品牌 : </label>
                     <div class="col-sm-9"><input type="text" name="brand" class="form-control"></div>
                 </div>
                 <div class="form-group">
                     <label class="col-sm-3 control-label">座位数量 : </label>
                     <div class="col-sm-9"><input type="text" name="seatnum" class="form-control"></div>
                 </div>
                 <div class="form-group">
                     <label class="col-sm-3 control-label">注册日期 : </label>
                     <div class="col-sm-9"><input type="text" name="registdate" class="form-control"></div>
                 </div>
                 <div class="form-group">
                     <label class="col-sm-3 control-label">保险日期 : </label>
                     <div class="col-sm-9"><input type="text" name="insurancedate" class="form-control"></div>
                 </div>
                 <%--<div class="form-group">--%>
                     <%--<label class="col-sm-3 control-label">驾驶证 : </label>--%>
                     <%--<div class="col-sm-9"><input type="text" class="form-control"></div>--%>
                 <%--</div>--%>
                 <div class="form-group">
                     <label class="col-sm-3 control-label">行驶证 : </label>
                     <div class="col-sm-9"><input type="text" name="vehiclelicense" class="form-control"></div>
                 </div>
                 <div class="form-group sub-btn">
                   <%--<button type="submit" class="btn btn-primary">提交</button>--%>
                     <input type="submit" class="btn btn-primary" value="提交">
                 </div>
             </form>
         </div>

      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>

<script type="text/javascript">
    $('.deleteBt').click(function(){
        var id=$(this).attr("datavalue");
        console.log(id);
        $.post("${rootPath}/car/delete/"+id,function(data){
            location.reload(true);
        })
    })

</script>

</body>
</html>
