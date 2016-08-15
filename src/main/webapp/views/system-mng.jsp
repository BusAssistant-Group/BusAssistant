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
<link href="//vjs.zencdn.net/5.8/video-js.min.css" rel="stylesheet"/>
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

    <jsp:include page="common/sidebar.jsp" />

    <div class="contents flex-8">
        <div id="workers-mng">
           
            <table class="table">
                <thead>
                <tr>
                    <th>用户名</th>
                    <th>权限</th>
                    <th style="width: 130px;"></th>
                </tr>
                </thead>

                <c:forEach items="${users}" var="user">
                    <tbody>
                    <tr>
                        <td>${user.username}</td>
                        <c:if test="${user.authority==0}"><td>普通用户</td></c:if>
                        <c:if test="${user.authority==1}"><td>HR</td></c:if>
                        <c:if test="${user.authority==2}"><td>线路管理员</td></c:if>
                        <c:if test="${user.authority==3}"><td>超级管理员</td></c:if>

                        <td>
                            <button id="hr" datavalue="${user.adminId}" class="btn btn-danger btn-slim deleteHR" type="button">成为HR</button>
                        </td>>
                        <td>
                            <button id="line-manager" datavalue="${user.adminId}" class="btn btn-danger btn-slim deleteBt" type="button">成为线路管理员</button>
                        </td>
                    </tr>
                    </tbody>
                </c:forEach>


            </table>
        </div>

    </div>

</div>




<script type="text/javascript">
    $('.deleteBt').click(function(){
        var id=$(this).attr("datavalue");
        console.log(id);
        $.post("${rootPath}/user/become/"+id+"/2",function(data){
            location.reload(true);
        })
    })

    $('.deleteHR').click(function(){
        var id=$(this).attr("datavalue");
        console.log(id);
        $.post("${rootPath}/user/become/"+id+"/1",function(data){
            location.reload(true);
        })
    })

</script>

</body>
</html>
