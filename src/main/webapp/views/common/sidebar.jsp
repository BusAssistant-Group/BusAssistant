<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<div class="flex-2">
    <div class="nav">
        <div id="jquery-accordion-menu" class="jquery-accordion-menu white">
            <ul id="demo-list" class="nav-list">
                <div class="logo">
                    BusAssistant
                </div>

                <c:set var="class1" value=""></c:set>
                <c:if test="${activeId==1}">
                    <c:set var="class1" value="active"></c:set>
                </c:if>
                <li class="${class1}"><a href="${rootPath}/worker/list"><i class="fa fa-user-plus"></i>员工信息管理</a></li>

                <c:set var="class2" value=""></c:set>
                <c:if test="${activeId==2}">
                    <c:set var="class2" value="active"></c:set>
                </c:if>
                <li class="${class2}"><a href="${rootPath}/car/list"><i class="fa fa-bus"></i>车辆信息管理 </a></li>

                <c:set var="class3" value=""></c:set>
                <c:if test="${activeId==3}">
                    <c:set var="class3" value="active"></c:set>
                </c:if>
                <li class="${class3}"><a href="${rootPath}/schedual/list"><i class="fa fa-table"></i>排班管理</a></li>

                <c:set var="class4" value=""></c:set>
                <c:if test="${activeId==4}">
                    <c:set var="class4" value="active"></c:set>
                </c:if>
                <li class="${class4}"><a href="${rootPath}/user/linestation"><i class="fa fa-level-up"></i>线路与站点管理</a></li>

                <c:set var="class5" value=""></c:set>
                <c:if test="${activeId==5}">
                    <c:set var="class5" value="active"></c:set>
                </c:if>
                <li class="${class5}"><a href="${rootPath}/user/linemanage"><i class="fa fa-bar-chart"></i>统计分析</a></li>

                <c:set var="class6" value=""></c:set>
                <c:if test="${activeId==6}">
                    <c:set var="class6" value="active"></c:set>
                </c:if>
                <li class="${class6}"><a href="${rootPath}/user/systemmng"><i class="fa fa-cogs"></i>系统管理</a></li>
            </ul>
            <div class="jquery-accordion-menu-footer">
                Footer
            </div>
        </div>
    </div>

    <div class="clearfix"></div>
</div>