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
        <div id="workers-mng">
            <table class="table">
               <thead>
                   <tr>
                       <th>姓名</th>
                       <th>工号</th>
                       <th>部门</th>
                       <th>组别</th>
                       <th>班次</th>
                       <th>车站</th>
                       <th style="width: 130px;"></th>
                   </tr>
               </thead>

                <c:forEach items="${workers}" var="worker">
                    <tbody>
                    <tr>
                        <td>${worker.workerName}</td>
                        <td>${worker.workerId}</td>
                        <td>${worker.workerDept}</td>
                        <td>${worker.workerGroup}</td>
                        <td>${worker.rouId}</td>
                        <td>${worker.staId}</td>

                        <td>
                            <button class="btn btn-success btn-slim btn-edit" type="button" data-toggle="modal" data-target="#edit_worker_info">编辑</button>
                            <button id="delete-worker" datavalue="${worker.workerId}" class="btn btn-danger btn-slim deleteBt" type="button">删除</button>
                        </td>
                    </tr>
                    </tbody>
                </c:forEach>


            </table>

            <button id="new-worker" class="btn btn-primary" type="button" data-toggle="modal" data-target="#add_new_worker">添加新员工</button>

            <div>
                <form action="${rootPath}/worker/addByFile" method="post" enctype="multipart/form-data">
                    <input type="file" name="file">
                    <input type="submit" value="提交">
                </form>
            </div>
        </div>

    </div>

</div>


<!-- 模态框（Modal） -->
<div class="modal fade" id="edit_worker_info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">

         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">编辑员工信息</h4>
         </div>

         <div class="modal-body">
             <form class="form-horizontal" action="${rootPath}/worker/update" method="post">
                 <div class="form-group">
                     <label class="col-sm-2 control-label" >姓名 : </label>
                     <div class="col-sm-10"><input type="text" name="name" class="form-control"></div>
                 </div>
                 <div class="form-group">
                     <label class="col-sm-2 control-label">工号 : </label>
                     <div class="col-sm-10"><input type="text" name="workerId" class="form-control"></div>
                 </div>
                 <div class="form-group">
                     <label class="col-sm-2 control-label">部门 : </label>
                     <div class="col-sm-10"><input type="text" name="dept" class="form-control"></div>
                 </div>
                 <div class="form-group">
                     <label class="col-sm-2 control-label">组别 : </label>
                     <div class="col-sm-10"><input type="text" name="group" class="form-control"></div>
                 </div>
                 <div class="form-group">
                     <label class="col-sm-2 control-label">班次 : </label>
                     <div class="col-sm-10"><input type="text" name="routeId" class="form-control"></div>
                 </div>
                 <div class="form-group">
                     <label class="col-sm-2 control-label">车站 : </label>
                     <div class="col-sm-10"><input type="text" name="stationId" class="form-control"></div>
                 </div>
                 <div class="form-group">
                     <input type="hidden" name="oldId">
                 </div>
                  <div class="form-group sub-btn">
                      <input type="submit" class="btn btn-primary" value="提交更改" >
                  </div>
            </form>
         </div>

      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>


<!-- 模态框（Modal） -->
<div class="modal fade" id="add_new_worker" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">

         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel1">添加新员工</h4>
         </div>

         <div class="modal-body">
             <form class="form-horizontal" action="${rootPath}/worker/add" method="post">
                  <div class="form-group">
                      <label class="col-sm-2 control-label">姓名 : </label>
                      <div class="col-sm-10"><input type="text" name="name" class="form-control"></div>
                  </div>
                  <div class="form-group">
                      <label class="col-sm-2 control-label">工号 : </label>
                      <div class="col-sm-10"><input type="text" name="workerId" class="form-control"></div>
                  </div>
                  <div class="form-group">
                      <label class="col-sm-2 control-label">部门 : </label>
                      <div class="col-sm-10"><input type="text" name="dept" class="form-control"></div>
                  </div>
                  <div class="form-group">
                      <label class="col-sm-2 control-label">组别 : </label>
                      <div class="col-sm-10"><input type="text" name="group" class="form-control"></div>
                  </div>
                  <div class="form-group">
                      <label class="col-sm-2 control-label">班次 : </label>
                      <div class="col-sm-10"><input type="text" name="routeId" class="form-control"></div>
                  </div>
                 <div class="form-group">
                     <label class="col-sm-2 control-label">车站 : </label>
                     <div class="col-sm-10"><input type="text" name="stationId" class="form-control"></div>
                 </div>
                 <div class="form-group sub-btn">
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
        $.post("${rootPath}/worker/delete/"+id,function(data){
           location.reload(true);
        })
    })

</script>

</body>
</html>
